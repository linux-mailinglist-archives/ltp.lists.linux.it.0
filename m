Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E222B1BB5
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:15:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5D6D3C5FBE
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:15:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A98223C656F
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 414B11A00987
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E05B4ABD1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 13:13:43 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 14:14:28 +0100
Message-Id: <20201113131428.13199-11-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113131428.13199-1-chrubis@suse.cz>
References: <20201113131428.13199-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 10/10] syscalls/open: Make use of TEST_MACROS
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

In the newlib testcases at least.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/open/open01.c | 11 ++++-------
 testcases/kernel/syscalls/open/open02.c | 25 ++++++-------------------
 testcases/kernel/syscalls/open/open11.c | 22 ++++++++++------------
 3 files changed, 20 insertions(+), 38 deletions(-)

diff --git a/testcases/kernel/syscalls/open/open01.c b/testcases/kernel/syscalls/open/open01.c
index c689a4b9b..74a46c36e 100644
--- a/testcases/kernel/syscalls/open/open01.c
+++ b/testcases/kernel/syscalls/open/open01.c
@@ -36,8 +36,8 @@ static struct tcase {
 	unsigned short tst_bit;
 	char *desc;
 } tcases[] = {
-	{TEST_FILE, O_RDWR | O_CREAT, 01444, S_ISVTX, "Sticky bit"},
-	{TEST_DIR, O_DIRECTORY, 0, S_IFDIR, "Directory bit"}
+	{TEST_FILE, O_RDWR | O_CREAT, 01444, S_ISVTX, "sticky bit"},
+	{TEST_DIR, O_DIRECTORY, 0, S_IFDIR, "sirectory bit"}
 };
 
 static void verify_open(unsigned int n)
@@ -45,12 +45,9 @@ static void verify_open(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	struct stat buf;
 
-	TEST(open(tc->filename, tc->flag, tc->mode));
+	TEST_FD(open(tc->filename, tc->flag, tc->mode),
+	        "open() with %s", tc->desc);
 	fd = TST_RET;
-	if (fd == -1) {
-		tst_res(TFAIL, "Cannot open a file");
-		return;
-	}
 
 	SAFE_FSTAT(fd, &buf);
 	if (!(buf.st_mode & tc->tst_bit))
diff --git a/testcases/kernel/syscalls/open/open02.c b/testcases/kernel/syscalls/open/open02.c
index 7195b1b6c..46d50894c 100644
--- a/testcases/kernel/syscalls/open/open02.c
+++ b/testcases/kernel/syscalls/open/open02.c
@@ -25,12 +25,13 @@
 #define TEST_FILE2	"test_file2"
 
 static struct tcase {
-	char *filename;
+	const char *filename;
 	int flag;
 	int exp_errno;
+	const char *desc;
 } tcases[] = {
-	{TEST_FILE, O_RDWR, ENOENT},
-	{TEST_FILE2, O_RDONLY | O_NOATIME, EPERM},
+	{TEST_FILE, O_RDWR, ENOENT, "new file without O_CREAT"},
+	{TEST_FILE2, O_RDONLY | O_NOATIME, EPERM, "unpriviledget O_RDONLY | O_NOATIME"},
 };
 
 void setup(void)
@@ -48,22 +49,8 @@ static void verify_open(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	TEST(open(tc->filename, tc->flag, 0444));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "open(%s) succeeded unexpectedly",
-			tc->filename);
-		return;
-	}
-
-	if (tc->exp_errno != TST_ERR) {
-		tst_res(TFAIL | TTERRNO,
-			"open() should fail with %s",
-			tst_strerrno(tc->exp_errno));
-		return;
-	}
-
-	tst_res(TPASS | TTERRNO, "open() failed as expected");
+	TEST_FAIL(open(tc->filename, tc->flag, 0444),
+	          tc->exp_errno, "open() %s", tc->desc);
 }
 
 void cleanup(void)
diff --git a/testcases/kernel/syscalls/open/open11.c b/testcases/kernel/syscalls/open/open11.c
index cfd04fdcd..ef5f787aa 100644
--- a/testcases/kernel/syscalls/open/open11.c
+++ b/testcases/kernel/syscalls/open/open11.c
@@ -277,21 +277,19 @@ static struct test_case {
 
 static void verify_open(unsigned int n)
 {
-	int fd;
-
-	TEST(open(tc[n].path, tc[n].flags, tc[n].mode));
-	fd = TST_RET;
-
-	if (fd > 0)
-		SAFE_CLOSE(fd);
-
-	if (tc[n].err == -1 || TST_ERR == tc[n].err) {
+	if (tc[n].err > 0) {
+		TEST_FAIL(open(tc[n].path, tc[n].flags, tc[n].mode),
+		          tc[n].err, "%s", tc[n].desc);
+	} else if (tc[n].err == 0) {
+		TEST_FD(open(tc[n].path, tc[n].flags, tc[n].mode),
+		        "%s", tc[n].desc);
+	} else {
+		TEST(open(tc[n].path, tc[n].flags, tc[n].mode));
 		tst_res(TPASS, "%s", tc[n].desc);
-		return;
 	}
 
-	tst_res(TFAIL | TTERRNO, "%s - expected %s",
-			tc[n].desc, tst_strerrno(tc[n].err));
+	if (TST_RET > 0)
+		SAFE_CLOSE(TST_RET);
 }
 
 static void setup(void)
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
