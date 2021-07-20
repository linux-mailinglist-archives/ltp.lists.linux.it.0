Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD53CF636
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 10:37:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED64E3C8251
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 10:37:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5D6F43C22F1
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:37:23 +0200 (CEST)
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 575EA60091D
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 10:37:19 +0200 (CEST)
X-QQ-mid: bizesmtp47t1626770233t3sbj9qk
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 20 Jul 2021 16:37:10 +0800 (CST)
X-QQ-SSF: 01400000008000206000000D0000000
X-QQ-FEAT: St3bwald4opMahNGARHvsivOBK/NmmQHoaWP7Qit2QsJlskX0A7QsssXZmsKF
 SfDuPir+f/AhY9/IcO19VqIoldFYm/u2X5LgJlgrfeHF5wANbKfJrTNPV0Xw49UcQu9DbLq
 48aaWqUhuVT+xUd/OwRoDOY127NEdNECYb/vR/pd/qUbcSL/OhVfxbzgLOcB6ELaZObzW8y
 S339uH4kW8oHuKJbtJ7TnNrmqAfzDZLCEUiQJ2OYBqvvJcKuvJLCTA2gkptFOzfdMTNXc2g
 RmTe71U47D4NWyUFgFtcb2rNv39TxCf3Zscw/dYPQeD0sPCXLwyMQRE7Mhy85UjziI82n7p
 VXNiU30YmPZlvxgMH0JQb44l0/hhw==
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:37:08 +0800
Message-Id: <20210720083708.13281-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] stime: Only o32 system calls require 32-bit
 programs on mips
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

The stime() system call is only o32, not n32 and n64. If you do not
specify that the current program is compiled to 32-bit when compiling
the program on mips, the stime() system call will fail when the
program is running.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
---
 testcases/kernel/syscalls/stime/stime_var.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/kernel/syscalls/stime/stime_var.h b/testcases/kernel/syscalls/stime/stime_var.h
index 708b80573..c5bafac99 100644
--- a/testcases/kernel/syscalls/stime/stime_var.h
+++ b/testcases/kernel/syscalls/stime/stime_var.h
@@ -25,7 +25,11 @@ static int do_stime(time_t *ntime)
 #endif
 	break;
 	case 1:
+#if !defined(__mips__) ||  _MIPS_SZLONG == 32
 		return tst_syscall(__NR_stime, ntime);
+#else
+		tst_brk(TCONF, "the stime() syscall only o32 ABI in mips, make sure the current program is 32-bit");
+#endif
 	case 2: {
 		struct __kernel_old_timeval tv;

--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
