Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6F5F7661
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Oct 2022 11:39:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2340C3CAE1D
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Oct 2022 11:39:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E12C3C3030
 for <ltp@lists.linux.it>; Fri,  7 Oct 2022 11:39:37 +0200 (CEST)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 76B5F2011AF
 for <ltp@lists.linux.it>; Fri,  7 Oct 2022 11:39:34 +0200 (CEST)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 2979dQL9027864;
 Fri, 7 Oct 2022 17:39:26 +0800 (+08)
 (envelope-from randolph@andestech.com)
Received: from atcsi01.andestech.com (10.0.15.167) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 7 Oct 2022
 17:39:23 +0800
From: Randolph Lin <randolph@andestech.com>
To: <ltp@lists.linux.it>, <rpalethorpe@suse.de>, <chrubis@suse.cz>
Date: Fri, 7 Oct 2022 17:39:14 +0800
Message-ID: <20221007093914.4151199-1-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1.390.g2ae0a9cb82
MIME-Version: 1.0
X-Originating-IP: [10.0.15.167]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 2979dQL9027864
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.4 required=7.0 tests=PDS_RDNS_DYNAMIC_FP,
 RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] syscalls: Fix tst_res() format string for 64-bit
 offset
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
Cc: Mina <minachou@andestech.com>, kester.tw@gmail.com, alankao@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Randolph <randolph@andestech.com>

When compiling format string contains off_t type, to print off_t
correctly is cast it to (long long int) type and change the format
string to %lld.
Fix format string for type block_size using cast to (long long int)
and change the format string to %lld .

Co-developed-by: Randolph <randolph@andestech.com>
Signed-off-by: Mina <minachou@andestech.com>
---
 testcases/kernel/syscalls/lseek/lseek01.c       | 17 +++++++++--------
 testcases/kernel/syscalls/lseek/lseek07.c       | 17 +++++++++--------
 testcases/kernel/syscalls/lseek/lseek11.c       | 11 ++++++-----
 testcases/kernel/syscalls/sendfile/sendfile05.c |  3 ++-
 4 files changed, 26 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/lseek/lseek01.c b/testcases/kernel/syscalls/lseek/lseek01.c
index dcf0e11c5..b4749c58b 100644
--- a/testcases/kernel/syscalls/lseek/lseek01.c
+++ b/testcases/kernel/syscalls/lseek/lseek01.c
@@ -46,25 +46,26 @@ static void verify_lseek(unsigned int n)
 
 	TEST(lseek(fd, tc->off, tc->whence));
 	if (TST_RET == (off_t) -1) {
-		tst_res(TFAIL | TTERRNO, "lseek(%s, %ld, %s) failed", TFILE,
-			tc->off, tc->wname);
+		tst_res(TFAIL | TTERRNO, "lseek(%s, %lld, %s) failed", TFILE,
+			(long long int)tc->off, tc->wname);
 		return;
 	}
 
 	if (TST_RET != tc->exp_off) {
-		tst_res(TFAIL, "lseek(%s, %ld, %s) returned %ld, expected %ld",
-			TFILE, tc->off, tc->wname, TST_RET, tc->exp_off);
+		tst_res(TFAIL, "lseek(%s, %lld, %s) returned %ld, expected %lld",
+			TFILE, (long long int)tc->off, tc->wname, TST_RET,
+			(long long int)tc->exp_off);
 		return;
 	}
 
 	SAFE_READ(1, fd, read_buf, tc->exp_size);
 
 	if (tc->exp_data && strcmp(read_buf, tc->exp_data)) {
-		tst_res(TFAIL, "lseek(%s, %ld, %s) read incorrect data",
-			TFILE, tc->off, tc->wname);
+		tst_res(TFAIL, "lseek(%s, %lld, %s) read incorrect data",
+			TFILE, (long long int)tc->off, tc->wname);
 	} else {
-		tst_res(TPASS, "lseek(%s, %ld, %s) read correct data",
-			TFILE, tc->off, tc->wname);
+		tst_res(TPASS, "lseek(%s, %lld, %s) read correct data",
+			TFILE, (long long int)tc->off, tc->wname);
 	}
 }
 
diff --git a/testcases/kernel/syscalls/lseek/lseek07.c b/testcases/kernel/syscalls/lseek/lseek07.c
index c258a33a8..b83869fa2 100644
--- a/testcases/kernel/syscalls/lseek/lseek07.c
+++ b/testcases/kernel/syscalls/lseek/lseek07.c
@@ -43,14 +43,15 @@ static void verify_lseek(unsigned int n)
 
 	TEST(lseek(*tc->fd, tc->off, SEEK_SET));
 	if (TST_RET == (off_t) -1) {
-		tst_res(TFAIL | TTERRNO, "lseek(%s, %ld, SEEK_SET) failed",
-			tc->fname, tc->off);
+		tst_res(TFAIL | TTERRNO, "lseek(%s, %lld, SEEK_SET) failed",
+			tc->fname, (long long int)tc->off);
 		return;
 	}
 
 	if (TST_RET != tc->exp_off) {
-		tst_res(TFAIL, "lseek(%s, %ld, SEEK_SET) returned %ld, expected %ld",
-			tc->fname, tc->off, TST_RET, tc->exp_off);
+		tst_res(TFAIL, "lseek(%s, %lld, SEEK_SET) returned %ld, expected %lld",
+			tc->fname, (long long int)tc->off, TST_RET,
+			(long long int)tc->exp_off);
 		return;
 	}
 
@@ -63,11 +64,11 @@ static void verify_lseek(unsigned int n)
 	SAFE_READ(1, *tc->fd, read_buf, tc->exp_size);
 
 	if (strcmp(read_buf, tc->exp_data)) {
-		tst_res(TFAIL, "lseek(%s, %ld, SEEK_SET) wrote incorrect data %s",
-			tc->fname, tc->off, read_buf);
+		tst_res(TFAIL, "lseek(%s, %lld, SEEK_SET) wrote incorrect data %s",
+			tc->fname, (long long int)tc->off, read_buf);
 	} else {
-		tst_res(TPASS, "lseek(%s, %ld, SEEK_SET) wrote correct data %s",
-			tc->fname, tc->off, read_buf);
+		tst_res(TPASS, "lseek(%s, %lld, SEEK_SET) wrote correct data %s",
+			tc->fname, (long long int)tc->off, read_buf);
 	}
 }
 
diff --git a/testcases/kernel/syscalls/lseek/lseek11.c b/testcases/kernel/syscalls/lseek/lseek11.c
index ea51bae3a..6dba932d2 100644
--- a/testcases/kernel/syscalls/lseek/lseek11.c
+++ b/testcases/kernel/syscalls/lseek/lseek11.c
@@ -159,7 +159,7 @@ static void setup(void)
 	fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0666);
 
 	get_blocksize();
-	tst_res(TINFO, "The block size is %lu", block_size);
+	tst_res(TINFO, "The block size is %lld", (long long int)block_size);
 
 	/*
 	 * truncate to the expected file size directly, to keep away the effect
@@ -202,14 +202,15 @@ static void test_lseek(unsigned int n)
 
 	if (rc != 0) {
 		tst_res(TFAIL,
-		        "The %uth test failed: %s from startblock %ld offset %ld, expect \'%s\' return \'%s\'",
+		        "The %uth test failed: %s from startblock %lld offset %lld, expect \'%s\' return \'%s\'",
 		        n, (tp->whence == SEEK_DATA) ? "SEEK_DATA" : "SEEK_HOLE",
-		        tp->startblock, tp->offset, tp->data ? tp->data : "", buf);
+		        (long long int)tp->startblock, (long long int)tp->offset,
+		        tp->data ? tp->data : "", buf);
 	} else {
 		tst_res(TPASS,
-		        "The %uth test passed: %s from startblock %ld offset %ld",
+		        "The %uth test passed: %s from startblock %lld offset %lld",
 		        n, (tp->whence == SEEK_DATA) ? "SEEK_DATA" : "SEEK_HOLE",
-		        tp->startblock, tp->offset);
+		        (long long int)tp->startblock, (long long int)tp->offset);
 	}
 }
 
diff --git a/testcases/kernel/syscalls/sendfile/sendfile05.c b/testcases/kernel/syscalls/sendfile/sendfile05.c
index e271a47d4..691ed9730 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile05.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile05.c
@@ -39,7 +39,8 @@ static void run(void)
 	off_t offset = -1;
 
 	TST_EXP_FAIL(sendfile(out_fd, in_fd, &offset, 1), EINVAL,
-		     "sendfile(out, in, &offset, ..) with offset=%ld", offset);
+		     "sendfile(out, in, &offset, ..) with offset=%lld",
+		     (long long int)offset);
 }
 
 static struct tst_test test = {
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
