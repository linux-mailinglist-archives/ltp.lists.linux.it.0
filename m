Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188927D1B7
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 16:47:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D0373C2A9F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 16:47:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 089083C04C3
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 16:47:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9961D1A00EC7
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 16:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601390819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=br65jzwLU5ear0/x/h/Fjap1ss8tjZ7+zLA2Z+tPDPM=;
 b=n1ufTZnqIElt04KU2U+socbDALGKvbn0qGggH6n+idrUhYBP6vitYNYm5JovVbbHB26c1T
 aIe+NdoWGbXjGNeAUtamt+IqR5AlPicx6s3dT9marfXiRdQO5dPLNvmarutKx2IpnExHe8
 sru9BfRo6s3eXxLf5k689/6WGRhGMFo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B89B3AD77;
 Tue, 29 Sep 2020 14:46:59 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Tue, 29 Sep 2020 15:46:35 +0100
Message-Id: <20200929144635.28874-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] utimensat01: Test all available FS and handle FS with
 no attributes
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: chrubis@suse.com, Richard Palethorpe <rpalethorpe@suse.com>,
 viresh.kumar@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If tmpdir is mounted on tmpfs then the test will fail with ENOTTY as
this FS apparently does not support file attributes (inode
flags). Instead we can test with all the available filesystems, some
of which may support file attributes.

Also if we now get ENOTTY then it is assumed the file system does not
support attributes (or at least the attribute we want to test) and the
test fails with TCONF. However the underlying FS could return some
other errno, but it is not clear what else to expect, if anything.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 .../kernel/syscalls/utimensat/utimensat01.c      | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index fe490f441..5410c345a 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -21,8 +21,9 @@
 #include "time64_variants.h"
 #include "tst_timer.h"
 
-#define TEST_FILE	"test_file"
-#define TEST_DIR	"test_dir"
+#define MNTPOINT 	"mntpoint"
+#define TEST_FILE	MNTPOINT"/test_file"
+#define TEST_DIR	MNTPOINT"/test_dir"
 
 static void *bad_addr;
 
@@ -182,7 +183,12 @@ static void change_attr(struct test_case *tc, int fd, int set)
 	if (!tc->attr)
 		return;
 
-	SAFE_IOCTL(fd, FS_IOC_GETFLAGS, &attr);
+	if (ioctl(fd, FS_IOC_GETFLAGS, &attr)) {
+		if (errno == ENOTTY)
+			tst_brk(TCONF | TERRNO, "Attributes not supported by FS");
+		else
+			tst_brk(TBROK | TERRNO, "ioctl(fd, FS_IOC_GETFLAGS, &attr) failed");
+	}
 
 	if (set)
 		attr |= tc->attr;
@@ -305,5 +311,7 @@ static struct tst_test test = {
 	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.needs_root = 1,
-	.needs_tmpdir = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
 };
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
