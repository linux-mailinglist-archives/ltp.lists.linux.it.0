Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823C2EF2AC
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 13:53:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD0C83C3184
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 13:53:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 84B103C2673
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 13:53:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CE3AD200D47
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 13:53:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC75CAD62
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 12:53:14 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  8 Jan 2021 13:54:10 +0100
Message-Id: <20210108125410.13178-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] syscalls/finit_module: Check for module
 existence
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

+ use tst_tmpdir so that we do not create directories in $PWD

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---

I've missed this during the review, sorry.

 testcases/kernel/syscalls/finit_module/finit_module01.c | 9 +++++++--
 testcases/kernel/syscalls/finit_module/finit_module02.c | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/finit_module/finit_module01.c b/testcases/kernel/syscalls/finit_module/finit_module01.c
index c31c0c2dc..d215fc0ff 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module01.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module01.c
@@ -19,12 +19,17 @@
 
 #define MODULE_NAME	"finit_module.ko"
 
-int fd;
+static int fd;
+
+static char *mod_path;
 
 static void setup(void)
 {
 	finit_module_supported_by_kernel();
-	fd = SAFE_OPEN(MODULE_NAME, O_RDONLY|O_CLOEXEC);
+
+	tst_module_exists(MODULE_NAME, &mod_path);
+
+	fd = SAFE_OPEN(mod_path, O_RDONLY|O_CLOEXEC);
 }
 
 static void run(void)
diff --git a/testcases/kernel/syscalls/finit_module/finit_module02.c b/testcases/kernel/syscalls/finit_module/finit_module02.c
index 109de9482..96aec4591 100644
--- a/testcases/kernel/syscalls/finit_module/finit_module02.c
+++ b/testcases/kernel/syscalls/finit_module/finit_module02.c
@@ -22,6 +22,8 @@
 #define MODULE_NAME	"finit_module.ko"
 #define TEST_DIR	"test_dir"
 
+static char *mod_path;
+
 static int fd, fd_zero, fd_invalid = -1, fd_dir;
 
 static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
@@ -79,6 +81,9 @@ static void setup(void)
 	unsigned long int i;
 
 	finit_module_supported_by_kernel();
+
+	tst_module_exists(MODULE_NAME, &mod_path);
+
 	SAFE_MKDIR(TEST_DIR, 0700);
 	fd_dir = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
 
@@ -91,14 +96,13 @@ static void setup(void)
 static void cleanup(void)
 {
 	SAFE_CLOSE(fd_dir);
-	SAFE_RMDIR(TEST_DIR);
 }
 
 static void run(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	fd = SAFE_OPEN(MODULE_NAME, tc->open_flags);
+	fd = SAFE_OPEN(mod_path, tc->open_flags);
 
 	if (tc->cap)
 		tst_cap_action(&cap_drop);
@@ -127,5 +131,6 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.setup = setup,
 	.cleanup = cleanup,
+	.needs_tmpdir = 1,
 	.needs_root = 1,
 };
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
