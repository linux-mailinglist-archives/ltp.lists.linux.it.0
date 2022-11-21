Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA8D632B0A
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Nov 2022 18:31:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CACC93CCBFA
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Nov 2022 18:31:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 662953CCBCD
 for <ltp@lists.linux.it>; Mon, 21 Nov 2022 18:31:10 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A706594FEB3
 for <ltp@lists.linux.it>; Mon, 21 Nov 2022 18:31:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A0751FB;
 Mon, 21 Nov 2022 09:31:15 -0800 (PST)
Received: from e129169.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26D493F587;
 Mon, 21 Nov 2022 09:31:07 -0800 (PST)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Mon, 21 Nov 2022 17:30:52 +0000
Message-Id: <20221121173052.346670-3-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121173052.346670-1-tudor.cretu@arm.com>
References: <20221121173052.346670-1-tudor.cretu@arm.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/prctl: Fix number of arguments
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

prctl accepts maximum five arguments, so remove the sixth argument.

Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
---
 testcases/kernel/syscalls/prctl/prctl02.c |  2 +-
 testcases/kernel/syscalls/prctl/prctl07.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl02.c b/testcases/kernel/syscalls/prctl/prctl02.c
index fa9206232..b9c36f308 100644
--- a/testcases/kernel/syscalls/prctl/prctl02.c
+++ b/testcases/kernel/syscalls/prctl/prctl02.c
@@ -180,7 +180,7 @@ static void setup(void)
 	if (TST_ERR == EINVAL)
 		thpdisable_nsup = 1;
 
-	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0, 0));
+	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0));
 	if (TST_ERR == EINVAL)
 		capambient_nsup = 1;
 
diff --git a/testcases/kernel/syscalls/prctl/prctl07.c b/testcases/kernel/syscalls/prctl/prctl07.c
index 8b1f32e6f..dd1d2c064 100644
--- a/testcases/kernel/syscalls/prctl/prctl07.c
+++ b/testcases/kernel/syscalls/prctl/prctl07.c
@@ -45,7 +45,7 @@
 
 static inline void check_cap_raise(unsigned int cap, char *message, int fail_flag)
 {
-	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, cap, 0, 0, 0));
+	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, cap, 0, 0));
 	switch (fail_flag) {
 	case 0:
 	if (TST_RET == 0)
@@ -71,7 +71,7 @@ static inline void check_cap_raise(unsigned int cap, char *message, int fail_fla
 
 static inline void check_cap_is_set(unsigned int cap, char *message, int val)
 {
-	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_IS_SET, cap, 0, 0, 0));
+	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_IS_SET, cap, 0, 0));
 	if (TST_RET == 1)
 		tst_res(val ? TPASS : TFAIL,
 			"PR_CAP_AMBIENT_IS_SET %s in AmbientCap", message);
@@ -84,7 +84,7 @@ static inline void check_cap_is_set(unsigned int cap, char *message, int val)
 
 static inline void check_cap_lower(unsigned int cap, char *message)
 {
-	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_LOWER, cap, 0, 0, 0));
+	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_LOWER, cap, 0, 0));
 	if (TST_RET == -1)
 		tst_res(TFAIL | TTERRNO,
 			"PR_CAP_AMBIENT_LOWER %s failed", message);
@@ -139,9 +139,9 @@ static void verify_prctl(void)
 	tst_res(TINFO, "After PR_CAP_AMBIENT_LORWER");
 	TST_ASSERT_FILE_STR(PROC_STATUS, "CapAmb", ZERO_STRING);
 
-	prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, CAP_NET_BIND_SERVICE, 0, 0, 0);
+	prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, CAP_NET_BIND_SERVICE, 0, 0);
 	tst_res(TINFO, "raise cap for clear");
-	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0, 0));
+	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0));
 	if (TST_RET == 0)
 		tst_res(TPASS, "PR_CAP_AMBIENT_CLEAR ALL succeeded");
 	else
@@ -158,7 +158,7 @@ static void verify_prctl(void)
 
 static void setup(void)
 {
-	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0, 0));
+	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0));
 	if (TST_RET == 0) {
 		tst_res(TINFO, "kernel supports PR_CAP_AMBIENT");
 		return;
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
