Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 611826E7E0
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 17:19:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E66E63C1D2F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 17:19:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0F66E3C180C
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 14:48:27 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D9C3A1A002EF
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 14:48:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3C65337;
 Fri, 19 Jul 2019 05:48:24 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 437443F71A;
 Fri, 19 Jul 2019 05:48:24 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: ltp@lists.linux.it
Date: Fri, 19 Jul 2019 13:48:17 +0100
Message-Id: <20190719124817.5140-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Fri, 19 Jul 2019 17:19:30 +0200
Subject: [LTP] [PATCH] ustat02: Fix EFAULT in 32bit compatibility mode
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
Cc: Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The size of dev_t is larger than 32 bits which causes the dev argument
to be passed incorrectly. On Arm this means that the EFAULT test case
actually returns EINVAL because the device number isn't recognised.

Signed-off-by: Steven Price <steven.price@arm.com>
---
This is the same fix as 989bcfc7544d ("ustat: Fix EFAULT in 32bit
compatability mode") applied to ustat02. Originally it was justified[1]
that this doesn't affect ustat02 as the test works on x86, however it
does affect Arm.

I believe this only affects Arm and not x86 because only Arm requires a
64 bit argument to be aligned in registers. This means the test is
currently passing the dev number in r2/r3 and leaving junk in r1 which
is then being treated as the device number.

However even on x86 the pointer value is actually the upper bits of
root_dev rather than the expected (void*)-1.

[1] http://lists.linux.it/pipermail/ltp/2019-February/010752.html
---
 testcases/kernel/syscalls/ustat/ustat02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
index 9bbe4f3f5..1a0e9e059 100644
--- a/testcases/kernel/syscalls/ustat/ustat02.c
+++ b/testcases/kernel/syscalls/ustat/ustat02.c
@@ -36,7 +36,7 @@ int TST_TOTAL = ARRAY_SIZE(tc);
 
 void run(unsigned int test)
 {
-	TEST(tst_syscall(__NR_ustat, *tc[test].dev, tc[test].buf));
+	TEST(tst_syscall(__NR_ustat, (unsigned int)*tc[test].dev, tc[test].buf));
 
 	if ((TST_RET == -1) && (TST_ERR == tc[test].exp_errno))
 		tst_res(TPASS | TTERRNO, "ustat(2) expected failure");
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
