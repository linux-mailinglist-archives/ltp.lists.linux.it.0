Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D943EA1AFF
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 15:10:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACB813C2018
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 15:10:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 44AC93C1C6D
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 15:10:37 +0200 (CEST)
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9B009600C7D
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 15:10:35 +0200 (CEST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
 [147.11.189.41])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7TD9w2k030063
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Thu, 29 Aug 2019 06:10:09 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.468.0; Thu, 29 Aug 2019 06:09:47 -0700
From: <zhe.he@windriver.com>
To: <ltp@lists.linux.it>, <jstancek@redhat.com>, <chrubis@suse.cz>
Date: Thu, 29 Aug 2019 21:09:46 +0800
Message-ID: <1567084186-417234-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscall: rt_sigtimedwait01: Fix wrong sigset
 length for mips
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

From: He Zhe <zhe.he@windriver.com>

rt_sigtimedwait01 fails as follow on MIPS arches
rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
(.../sigwaitinfo01.c: 148): Unexpected failure:
TEST_ERRNO=EINVAL(22): Invalid argument

As this case purposely bypasses glibc, it should align with the size of kernel
definition of sigset_t which is different from other arches.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/signal.h#n15

This patch turns to use _NSIG which is always right for all arches.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2: Use _NSIG/8 instead of fixed numbers

 testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
index 5a32ce1..6a30c27 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
@@ -128,9 +128,8 @@ static int my_sigtimedwait(const sigset_t * set, siginfo_t * info,
 static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
 			      struct timespec *timeout)
 {
-
-	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64 and 8, resp. */
-	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, 8);
+	/* _NSIG is always the right number of bits of signal map for all arches */
+	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, _NSIG/8);
 }
 #endif
 
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
