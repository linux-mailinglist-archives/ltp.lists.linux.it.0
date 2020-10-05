Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F028368F
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 301823C4AD3
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:31:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 091E03C268B
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 91C121A00E60
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:30:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32356AFC4;
 Mon,  5 Oct 2020 13:30:36 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  5 Oct 2020 15:30:49 +0200
Message-Id: <20201005133054.23587-7-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005133054.23587-1-chrubis@suse.cz>
References: <20201005133054.23587-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 06/11] syscalls: Move needs_drivers inside of the
 tst_test struct
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/fsetxattr/fsetxattr02.c | 10 ++++------
 testcases/kernel/syscalls/ioctl/ioctl08.c         |  9 ++++-----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c b/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c
index 205e80c95..3aea4b59e 100644
--- a/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c
+++ b/testcases/kernel/syscalls/fsetxattr/fsetxattr02.c
@@ -241,11 +241,6 @@ static void cleanup(void)
 	}
 }
 
-static const char *const needed_drivers[] = {
-	"brd",
-	NULL,
-};
-
 static struct tst_test test = {
 	.setup = setup,
 	.test = verify_fsetxattr,
@@ -254,7 +249,10 @@ static struct tst_test test = {
 	.needs_devfs = 1,
 	.mntpoint = MNTPOINT,
 	.needs_root = 1,
-	.needs_drivers = needed_drivers,
+	.needs_drivers = (const char *const[]) {
+		"brd",
+		NULL,
+	},
 };
 
 #else /* HAVE_SYS_XATTR_H */
diff --git a/testcases/kernel/syscalls/ioctl/ioctl08.c b/testcases/kernel/syscalls/ioctl/ioctl08.c
index dca898a65..f7d11815d 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl08.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl08.c
@@ -112,10 +112,6 @@ static void setup(void)
 			sizeof(struct file_dedupe_range_info));
 }
 
-static const char *const needed_drivers[] = {
-	"btrfs",
-	NULL,
-};
 
 static struct tst_test test = {
 	.test = verify_ioctl,
@@ -127,7 +123,10 @@ static struct tst_test test = {
 	.mount_device = 1,
 	.mntpoint = MNTPOINT,
 	.dev_fs_type = "btrfs",
-	.needs_drivers = needed_drivers,
+	.needs_drivers = (const char *const[]) {
+		"btrfs",
+		NULL,
+	},
 };
 #else
 	TST_TEST_TCONF(
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
