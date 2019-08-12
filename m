Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 988458A159
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69F7F3C1CF4
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3C0F83C1D2D
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B1F40200DFE
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54833AD1E
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 14:39:47 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 16:39:38 +0200
Message-Id: <20190812143941.8119-9-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812143941.8119-1-chrubis@suse.cz>
References: <20190812143941.8119-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 08/11] syscalls/adjtimex: Make use of guarded
 buffers.
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
 .../kernel/syscalls/adjtimex/adjtimex01.c     | 23 ++++++-----
 .../kernel/syscalls/adjtimex/adjtimex02.c     | 39 +++++++++++--------
 2 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex01.c b/testcases/kernel/syscalls/adjtimex/adjtimex01.c
index 51d75f3e0..60b3544a8 100644
--- a/testcases/kernel/syscalls/adjtimex/adjtimex01.c
+++ b/testcases/kernel/syscalls/adjtimex/adjtimex01.c
@@ -12,14 +12,14 @@
 #define SET_MODE (ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
 	ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK)
 
-static struct timex tim_save;
-static struct timex buff;
+static struct timex *tim_save;
+static struct timex *buf;
 
 void verify_adjtimex(void)
 {
-	buff = tim_save;
-	buff.modes = SET_MODE;
-	TEST(adjtimex(&buff));
+	*buf = *tim_save;
+	buf->modes = SET_MODE;
+	TEST(adjtimex(buf));
 	if ((TST_RET >= TIME_OK) && (TST_RET <= TIME_ERROR)) {
 		tst_res(TPASS, "adjtimex() with mode 0x%x ", SET_MODE);
 	} else {
@@ -27,8 +27,8 @@ void verify_adjtimex(void)
 				SET_MODE);
 	}
 
-	buff.modes = ADJ_OFFSET_SINGLESHOT;
-	TEST(adjtimex(&buff));
+	buf->modes = ADJ_OFFSET_SINGLESHOT;
+	TEST(adjtimex(buf));
 	if ((TST_RET >= TIME_OK) && (TST_RET <= TIME_ERROR)) {
 		tst_res(TPASS, "adjtimex() with mode 0x%x ",
 				ADJ_OFFSET_SINGLESHOT);
@@ -41,10 +41,10 @@ void verify_adjtimex(void)
 
 static void setup(void)
 {
-	tim_save.modes = 0;
+	tim_save->modes = 0;
 
 	/* Save current parameters */
-	if ((adjtimex(&tim_save)) == -1) {
+	if ((adjtimex(tim_save)) == -1) {
 		tst_brk(TBROK | TERRNO,
 			"adjtimex(): failed to save current params");
 	}
@@ -54,4 +54,9 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.setup = setup,
 	.test_all = verify_adjtimex,
+	.bufs = (struct tst_buffers []) {
+		{&buf, .size = sizeof(*buf)},
+		{&tim_save, .size = sizeof(*tim_save)},
+		{},
+	}
 };
diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex02.c b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
index 2c0031992..19ee97158 100644
--- a/testcases/kernel/syscalls/adjtimex/adjtimex02.c
+++ b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
@@ -16,14 +16,14 @@
 
 static int hz;			/* HZ from sysconf */
 
-static struct timex tim_save;
-static struct timex buff;
+static struct timex *tim_save;
+static struct timex *buf;
 
 static struct passwd *ltpuser;
 
 static void verify_adjtimex(unsigned int nr)
 {
-	struct timex *buffp;
+	struct timex *bufp;
 	int expected_errno = 0;
 
 	/*
@@ -39,20 +39,20 @@ static void verify_adjtimex(unsigned int nr)
 		return;
 	}
 
-	buff = tim_save;
-	buff.modes = SET_MODE;
-	buffp = &buff;
+	*buf = *tim_save;
+	buf->modes = SET_MODE;
+	bufp = buf;
 	switch (nr) {
 	case 0:
-		buffp = (struct timex *)-1;
+		bufp = (struct timex *)-1;
 		expected_errno = EFAULT;
 		break;
 	case 1:
-		buff.tick = 900000 / hz - 1;
+		buf->tick = 900000 / hz - 1;
 		expected_errno = EINVAL;
 		break;
 	case 2:
-		buff.tick = 1100000 / hz + 1;
+		buf->tick = 1100000 / hz + 1;
 		expected_errno = EINVAL;
 		break;
 	case 3:
@@ -62,18 +62,18 @@ static void verify_adjtimex(unsigned int nr)
 		expected_errno = EPERM;
 		break;
 	case 4:
-		buff.offset = 512000L + 1;
+		buf->offset = 512000L + 1;
 		expected_errno = EINVAL;
 		break;
 	case 5:
-		buff.offset = (-1) * (512000L) - 1;
+		buf->offset = (-1) * (512000L) - 1;
 		expected_errno = EINVAL;
 		break;
 	default:
 		tst_brk(TFAIL, "Invalid test case %u ", nr);
 	}
 
-	TEST(adjtimex(buffp));
+	TEST(adjtimex(bufp));
 	if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
 		tst_res(TPASS | TTERRNO,
 				"adjtimex() error %u ", expected_errno);
@@ -90,23 +90,23 @@ static void verify_adjtimex(unsigned int nr)
 
 static void setup(void)
 {
-	tim_save.modes = 0;
+	tim_save->modes = 0;
 
 	/* set the HZ from sysconf */
 	hz = SAFE_SYSCONF(_SC_CLK_TCK);
 
 	/* Save current parameters */
-	if ((adjtimex(&tim_save)) == -1)
+	if ((adjtimex(tim_save)) == -1)
 		tst_brk(TBROK | TERRNO,
-				"adjtimex(): failed to save current params");
+			"adjtimex(): failed to save current params");
 }
 
 static void cleanup(void)
 {
-	tim_save.modes = SET_MODE;
+	tim_save->modes = SET_MODE;
 
 	/* Restore saved parameters */
-	if ((adjtimex(&tim_save)) == -1)
+	if ((adjtimex(tim_save)) == -1)
 		tst_res(TWARN, "Failed to restore saved parameters");
 }
 
@@ -116,4 +116,9 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_adjtimex,
+	.bufs = (struct tst_buffers []) {
+		{&buf, .size = sizeof(*buf)},
+		{&tim_save, .size = sizeof(*tim_save)},
+		{},
+	}
 };
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
