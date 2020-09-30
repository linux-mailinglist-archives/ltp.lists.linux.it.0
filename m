Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E327E7C1
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:41:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64FC63C4C11
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:41:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E1C9D3C297E
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:41:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1DA961A00F37
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601466077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ji/w4NMZFLhY2Wtk0CtZcy2Pc/Ptv58aRkXbstglphc=;
 b=q34gT5RgFC7t1PJxtt8Wdx5If7HJzGrjmaDjqXl8a32KKkL3fok2iFZfo/vWqzKYIV8x4q
 Xlk+699hbtqMcpaJX2/7qInHjH7w19f0YBONU9LKN2AS7iV5d9lfs7XL3n5Z/84CjMAId4
 Q1ckb7fd0xsh+kQwW/l3Zf04O5p6ye0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6D48AB286;
 Wed, 30 Sep 2020 11:41:17 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 12:40:58 +0100
Message-Id: <20200930114058.5860-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] utimensat01: Use FS (default ext2) with timestamps
 and attributes
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

If tmpdir is mounted on tmpfs then the test will fail with ENOTTY as
this FS apparently does not support file attributes (inode
flags). Instead we can test on the default FS which is ext2, but may
be changed by the user.

We can not set all_filesystems because utimensat will fail to reset
the timestamp to zero on at least exFAT and NTFS (FUSE and kernel
versions). It is not clear yet what the expected behavior is or how
the test could fail gracefully and requires investigation.

Also if we now get ENOTTY then it is assumed the file system does not
support attributes and the test fails with TCONF. However the
underlying FS could return some other errno (e.g. EINVAL on FUSE
NTFS), but it is not clear what to expect, if anything and also
requires further investigation.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V3: Use default FS

 .../kernel/syscalls/utimensat/utimensat01.c   | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index fe490f441..ac267e7d9 100644
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
@@ -198,7 +204,11 @@ static void reset_time(char *pathname, int dfd, int flags, int i)
 	struct stat sb;
 
 	memset(&ts, 0, sizeof(ts));
-	tv->utimensat(dfd, pathname, &ts, flags);
+	TEST(tv->utimensat(dfd, pathname, &ts, flags));
+	if (TST_RET) {
+		tst_res(TINFO | TTERRNO, "%2d: utimensat(%d, %s, {0, 0}, %d) failed",
+			i, dfd, pathname, flags);
+	}
 
 	TEST(stat(pathname, &sb));
 	if (TST_RET) {
@@ -305,5 +315,6 @@ static struct tst_test test = {
 	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.needs_root = 1,
-	.needs_tmpdir = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
 };
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
