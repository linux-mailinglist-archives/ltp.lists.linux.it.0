Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30695757
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 08:35:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB2F23C1D18
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 08:35:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8FC3F3C1C95
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 08:34:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 82CB0600496
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 08:34:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,407,1559491200"; d="scan'208";a="73931374"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Aug 2019 14:34:48 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 017744CE03D3;
 Tue, 20 Aug 2019 14:34:49 +0800 (CST)
Received: from localhost.localdomain (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 20 Aug 2019 14:34:45 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Tue, 20 Aug 2019 14:33:58 +0800
Message-ID: <1566282838-2980-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20190802115046.GB27727@rei>
References: <20190802115046.GB27727@rei>
MIME-Version: 1.0
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 017744CE03D3.AD72E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/statx04: use stx_attributes_mask before
 test
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
we should check four attrbutes whether supports on tested filesystem
and only test supported flags on tested filesystem.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/statx/statx04.c | 124 ++++++++++++++++------
 1 file changed, 91 insertions(+), 33 deletions(-)

diff --git a/testcases/kernel/syscalls/statx/statx04.c b/testcases/kernel/syscalls/statx/statx04.c
index 71de734f5..7b462c3f9 100644
--- a/testcases/kernel/syscalls/statx/statx04.c
+++ b/testcases/kernel/syscalls/statx/statx04.c
@@ -34,6 +34,10 @@
 #define TESTDIR_UNFLAGGED MOUNT_POINT"/test_dir2"
 
 static int fd, clear_flags;
+static int supp_compr;
+static int supp_append;
+static int supp_immutable;
+static int supp_nodump;
 
 static void test_flagged(void)
 {
@@ -47,25 +51,33 @@ static void test_flagged(void)
 		tst_brk(TFAIL | TTERRNO,
 			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)", TESTDIR_FLAGGED);
 
-	if (buf.stx_attributes & STATX_ATTR_COMPRESSED)
-		tst_res(TPASS, "STATX_ATTR_COMPRESSED flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_COMPRESSED flag is not set");
+	if (supp_compr) {
+		if (buf.stx_attributes & STATX_ATTR_COMPRESSED)
+			tst_res(TPASS, "STATX_ATTR_COMPRESSED flag is set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_COMPRESSED flag is not set");
+	}
 
-	if (buf.stx_attributes & STATX_ATTR_APPEND)
-		tst_res(TPASS, "STATX_ATTR_APPEND flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_APPEND flag is not set");
+	if (supp_append) {
+		if (buf.stx_attributes & STATX_ATTR_APPEND)
+			tst_res(TPASS, "STATX_ATTR_APPEND flag is set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_APPEND flag is not set");
+	}
 
-	if (buf.stx_attributes & STATX_ATTR_IMMUTABLE)
-		tst_res(TPASS, "STATX_ATTR_IMMUTABLE flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_IMMUTABLE flag is not set");
+	if (supp_immutable) {
+		if (buf.stx_attributes & STATX_ATTR_IMMUTABLE)
+			tst_res(TPASS, "STATX_ATTR_IMMUTABLE flag is set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_IMMUTABLE flag is not set");
+	}
 
-	if (buf.stx_attributes & STATX_ATTR_NODUMP)
-		tst_res(TPASS, "STATX_ATTR_NODUMP flag is set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_NODUMP flag is not set");
+	if (supp_nodump) {
+		if (buf.stx_attributes & STATX_ATTR_NODUMP)
+			tst_res(TPASS, "STATX_ATTR_NODUMP flag is set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_NODUMP flag is not set");
+	}
 }
 
 static void test_unflagged(void)
@@ -82,25 +94,33 @@ static void test_unflagged(void)
 			"sys_statx(AT_FDCWD, %s, 0, 0, &buf)",
 			TESTDIR_UNFLAGGED);
 
-	if ((buf.stx_attributes & STATX_ATTR_COMPRESSED) == 0)
-		tst_res(TPASS, "STATX_ATTR_COMPRESSED flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_COMPRESSED flag is set");
+	if (supp_compr) {
+		if ((buf.stx_attributes & STATX_ATTR_COMPRESSED) == 0)
+			tst_res(TPASS, "STATX_ATTR_COMPRESSED flag is not set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_COMPRESSED flag is set");
+	}
 
-	if ((buf.stx_attributes & STATX_ATTR_APPEND) == 0)
-		tst_res(TPASS, "STATX_ATTR_APPEND flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_APPEND flag is set");
+	if (supp_append) {
+		if ((buf.stx_attributes & STATX_ATTR_APPEND) == 0)
+			tst_res(TPASS, "STATX_ATTR_APPEND flag is not set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_APPEND flag is set");
+	}
 
-	if ((buf.stx_attributes & STATX_ATTR_IMMUTABLE) == 0)
-		tst_res(TPASS, "STATX_ATTR_IMMUTABLE flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_IMMUTABLE flag is set");
+	if (supp_immutable) {
+		if ((buf.stx_attributes & STATX_ATTR_IMMUTABLE) == 0)
+			tst_res(TPASS, "STATX_ATTR_IMMUTABLE flag is not set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_IMMUTABLE flag is set");
+	}
 
-	if ((buf.stx_attributes & STATX_ATTR_NODUMP) == 0)
-		tst_res(TPASS, "STATX_ATTR_NODUMP flag is not set");
-	else
-		tst_res(TFAIL, "STATX_ATTR_NODUMP flag is set");
+	if (supp_nodump) {
+		if ((buf.stx_attributes & STATX_ATTR_NODUMP) == 0)
+			tst_res(TPASS, "STATX_ATTR_NODUMP flag is not set");
+		else
+			tst_res(TFAIL, "STATX_ATTR_NODUMP flag is set");
+	}
 }
 
 struct test_cases {
@@ -135,7 +155,14 @@ static void caid_flags_setup(void)
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
@@ -149,12 +176,43 @@ static void caid_flags_setup(void)
 
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
 
 	if (!strcmp(tst_device->fs_type, "btrfs") && tst_kvercmp(4, 13, 0) < 0)
 		tst_brk(TCONF, "Btrfs statx() supported since 4.13");
 
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
+
 	caid_flags_setup();
 }
 
-- 
2.18.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
