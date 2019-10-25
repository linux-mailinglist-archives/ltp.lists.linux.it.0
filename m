Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E3FE4236
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 05:53:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D2213C2357
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Oct 2019 05:53:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9E32C3C2152
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 05:53:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9019010014B3
 for <ltp@lists.linux.it>; Fri, 25 Oct 2019 05:53:39 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,227,1569254400"; d="scan'208";a="77454344"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 11:53:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id D7A4E4B6EC86;
 Fri, 25 Oct 2019 11:45:42 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 25 Oct 2019 11:53:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 25 Oct 2019 11:53:45 +0800
Message-ID: <1571975625-6322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190911124714.GA21670@rei.lan>
References: <20190911124714.GA21670@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: D7A4E4B6EC86.A10C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

stx_attributes_mask shows what's supported in stx_attributes.
Set supp_{append,compr,immutable,nodump} attributes only on filesystems
which actually support it.

Also merge duplicate code.

---------------
v2->v3:
1.add kernel version check for stx_attributes_mask
2. use test_flag(int) instead of test_flagged and test_unflagged
---------------

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/statx/statx04.c | 158 +++++++++++++---------
 1 file changed, 93 insertions(+), 65 deletions(-)

diff --git a/testcases/kernel/syscalls/statx/statx04.c b/testcases/kernel/syscalls/statx/statx04.c
index 71de734f5..c0fa06d46 100644
--- a/testcases/kernel/syscalls/statx/statx04.c
+++ b/testcases/kernel/syscalls/statx/statx04.c
@@ -34,85 +34,70 @@
 #define TESTDIR_UNFLAGGED MOUNT_POINT"/test_dir2"
 
 static int fd, clear_flags;
+static int supp_compr;
+static int supp_append;
+static int supp_immutable;
+static int supp_nodump;
 
-static void test_flagged(void)
+static void test_flag(int flag)
 {
 	struct statx buf;
 
-	TEST(statx(AT_FDCWD, TESTDIR_FLAGGED, 0, 0, &buf));
-	if (TST_RET == 0)
-		tst_res(TPASS,
-			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)", TESTDIR_FLAGGED);
-	else
-		tst_brk(TFAIL | TTERRNO,
-			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)", TESTDIR_FLAGGED);
-
-	if (buf.stx_attributes & STATX_ATTR_COMPRESSED)
-		tst_res(TPASS, "STATX_ATTR_COMPRESSED flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_COMPRESSED flag is not set");
-
-	if (buf.stx_attributes & STATX_ATTR_APPEND)
-		tst_res(TPASS, "STATX_ATTR_APPEND flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_APPEND flag is not set");
-
-	if (buf.stx_attributes & STATX_ATTR_IMMUTABLE)
-		tst_res(TPASS, "STATX_ATTR_IMMUTABLE flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_IMMUTABLE flag is not set");
-
-	if (buf.stx_attributes & STATX_ATTR_NODUMP)
-		tst_res(TPASS, "STATX_ATTR_NODUMP flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_NODUMP flag is not set");
-}
-
-static void test_unflagged(void)
-{
-	struct statx buf;
-
-	TEST(statx(AT_FDCWD, TESTDIR_UNFLAGGED, 0, 0, &buf));
+	TEST(statx(AT_FDCWD, flag ? TESTDIR_FLAGGED : TESTDIR_UNFLAGGED, 0, 0, &buf));
 	if (TST_RET == 0)
 		tst_res(TPASS,
 			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)",
-			TESTDIR_UNFLAGGED);
+			flag ? TESTDIR_FLAGGED : TESTDIR_UNFLAGGED);
 	else
 		tst_brk(TFAIL | TTERRNO,
 			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)",
-			TESTDIR_UNFLAGGED);
-
-	if ((buf.stx_attributes & STATX_ATTR_COMPRESSED) == 0)
-		tst_res(TPASS, "STATX_ATTR_COMPRESSED flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_COMPRESSED flag is set");
-
-	if ((buf.stx_attributes & STATX_ATTR_APPEND) == 0)
-		tst_res(TPASS, "STATX_ATTR_APPEND flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_APPEND flag is set");
-
-	if ((buf.stx_attributes & STATX_ATTR_IMMUTABLE) == 0)
-		tst_res(TPASS, "STATX_ATTR_IMMUTABLE flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_IMMUTABLE flag is set");
-
-	if ((buf.stx_attributes & STATX_ATTR_NODUMP) == 0)
-		tst_res(TPASS, "STATX_ATTR_NODUMP flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_NODUMP flag is set");
+			flag ? TESTDIR_FLAGGED : TESTDIR_UNFLAGGED);
+
+	if (supp_compr) {
+		if (buf.stx_attributes & STATX_ATTR_COMPRESSED)
+			tst_res(flag ? TPASS : TFAIL,
+				"STATX_ATTR_COMPRESSED flag is set");
+		else
+			tst_res(flag ? TFAIL : TPASS,
+				"STATX_ATTR_COMPRESSED flag is not set");
+	}
+	if (supp_append) {
+		if (buf.stx_attributes & STATX_ATTR_APPEND)
+			tst_res(flag ? TPASS : TFAIL,
+				"STATX_ATTR_APPEND flag is set");
+		else
+			tst_res(flag ? TFAIL : TPASS,
+				"STATX_ATTR_APPEND flag is not set");
+	}
+	if (supp_immutable) {
+		if (buf.stx_attributes & STATX_ATTR_IMMUTABLE)
+			tst_res(flag ? TPASS : TFAIL,
+				"STATX_ATTR_IMMUTABLE flag is set");
+		else
+			tst_res(flag ? TFAIL : TPASS,
+				"STATX_ATTR_IMMUTABLE flag is not set");
+	}
+	if (supp_nodump) {
+		if (buf.stx_attributes & STATX_ATTR_NODUMP)
+			tst_res(flag ? TPASS : TFAIL,
+				"STATX_ATTR_NODUMP flag is set");
+		else
+			tst_res(flag ? TFAIL : TPASS,
+				"STATX_ATTR_NODUMP flag is not set");
+	}
 }
 
 struct test_cases {
-	void (*tfunc)(void);
+	void (*tfunc)(int);
+	int set_flag;
 } tcases[] = {
-	{&test_flagged},
-	{&test_unflagged},
+	{&test_flag, 1},
+	{&test_flag, 0},
 };
 
 static void run(unsigned int i)
 {
-	tcases[i].tfunc();
+	tcases[i].tfunc(tcases[i].set_flag);
 }
 
 static void caid_flags_setup(void)
@@ -135,12 +120,17 @@ static void caid_flags_setup(void)
 		tst_brk(TBROK | TERRNO, "ioctl(%i, FS_IOC_GETFLAGS, ...)", fd);
 	}
 
-	attr |= FS_COMPR_FL | FS_APPEND_FL | FS_IMMUTABLE_FL | FS_NODUMP_FL;
+	if (supp_compr)
+		attr |= FS_COMPR_FL;
+	if (supp_append)
+		attr |= FS_APPEND_FL;
+	if (supp_immutable)
+		attr |= FS_IMMUTABLE_FL;
+	if (supp_nodump)
+		attr |= FS_NODUMP_FL;
 
 	ret = ioctl(fd, FS_IOC_SETFLAGS, &attr);
 	if (ret < 0) {
-		if (errno == EOPNOTSUPP)
-			tst_brk(TCONF, "Flags not supported");
 		tst_brk(TBROK | TERRNO, "ioctl(%i, FS_IOC_SETFLAGS, %i)", fd, attr);
 	}
 
@@ -149,11 +139,49 @@ static void caid_flags_setup(void)
 
 static void setup(void)
 {
+	struct statx buf;
+
+	supp_compr = 1;
+	supp_append = 1;
+	supp_immutable = 1;
+	supp_nodump = 1;
 	SAFE_MKDIR(TESTDIR_FLAGGED, 0777);
 	SAFE_MKDIR(TESTDIR_UNFLAGGED, 0777);
 
+	// don't check ext4 because ext4 supports statx since 4.11.
 	if (!strcmp(tst_device->fs_type, "btrfs") && tst_kvercmp(4, 13, 0) < 0)
-		tst_brk(TCONF, "Btrfs statx() supported since 4.13");
+		tst_brk(TCONF, "Btrfs statx() stx_attributes_mask supported since 4.13");
+
+	if (!strcmp(tst_device->fs_type, "xfs") && tst_kvercmp(5, 1, 0) < 0)
+		tst_brk(TCONF, "xfs statx() stx_attributes_mask supported since 5.1");
+
+	if (!strcmp(tst_device->fs_type, "ext2") && tst_kvercmp(5, 1, 0) < 0)
+		tst_brk(TCONF, "ext2 statx() stx_attributes_mask supported since 5.1");
+
+	TEST(statx(AT_FDCWD, TESTDIR_FLAGGED, 0, 0, &buf));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO,
+			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)", TESTDIR_FLAGGED);
+
+	if ((buf.stx_attributes_mask & FS_COMPR_FL) == 0) {
+		supp_compr = 0;
+		tst_res(TCONF, "filesystem doesn't support FS_COMPR_FL");
+	}
+	if ((buf.stx_attributes_mask & FS_APPEND_FL) == 0) {
+		supp_append = 0;
+		tst_res(TCONF, "filesystem doesn't support FS_APPEND_FL");
+	}
+	if ((buf.stx_attributes_mask & FS_IMMUTABLE_FL) == 0) {
+		supp_immutable = 0;
+		tst_res(TCONF, "filesystem doesn't support FS_IMMUTABLE_FL");
+	}
+	if ((buf.stx_attributes_mask & FS_NODUMP_FL) == 0) {
+		supp_nodump = 0;
+		tst_res(TCONF, "filesystem doesn't support FS_NODUMP_FL");
+	}
+	if (!(supp_compr || supp_append || supp_immutable || supp_nodump))
+		tst_brk(TCONF,
+			"filesystem doesn't support the above any attr, skip it");
 
 	caid_flags_setup();
 }
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
