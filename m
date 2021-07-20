Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D5A3CF4A2
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 08:39:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5BC53C6366
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 08:39:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F7EA3C2174
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 08:39:15 +0200 (CEST)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A70D6002BB
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 08:39:12 +0200 (CEST)
X-QQ-mid: bizesmtp49t1626763140tiwne51q
Received: from localhost.localdomain (unknown [58.240.82.166])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 20 Jul 2021 14:38:53 +0800 (CST)
X-QQ-SSF: 01400000008000106000B00D0000000
X-QQ-FEAT: 4I5p1PuRj8Y70jkPt8oN4peNXOEyTV1PTX87Ob6dJqVKOWRnTz/JqpnxAP9xO
 2y0dmX9+53JDa9V44XkWkFU+fKc/rQhf2W0M2WP7in1t8LYLBkbbMHkHVfF09py8VoAV/C6
 ZkbwPnD3ugnSE8ir2mCPcIkQrZJBBrgLhl6w0zBxHqm1R7mkxblYbyWzz3heGlExbkF0DCW
 ZcroIvAhuzdd4o869zh+LOPValBECipnB2VaG6mBphYmxmn3+KGyam3EN5gVyIID5iA7y5I
 w8JQ5wFc+0Lkc46QeZ4Vc/rQjLygoQe7jJCmZk7wr41mKEZ0bEbyFKJTfBxZGB6IraKN3W8
 OwIyoowdFCMkoAiQac=
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 14:38:52 +0800
Message-Id: <20210720063852.1883-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] stime: Only o32 system calls require 32-bit programs
 on mips
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
+#if defined(__mips__) && _MIPS_SZLONG == 32
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
