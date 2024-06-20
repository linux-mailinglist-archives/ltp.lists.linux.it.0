Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A2B912015
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:06:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FA593D0F9E
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2024 11:06:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E9A7B3CB74E
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 18:25:14 +0200 (CEST)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org;
 receiver=lists.linux.it)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0D0FA609694
 for <ltp@lists.linux.it>; Thu, 20 Jun 2024 18:25:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76773621EF;
 Thu, 20 Jun 2024 16:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27D5C2BD10;
 Thu, 20 Jun 2024 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718900712;
 bh=DmBAxbeYTBncX5bl/HvCmLsEpHQvV2w2CK/NjV0qTMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mmS8IYAQWW69dqUsoOQK9VgMXj75HkeXssxpRMqHnXS7IEXYdB8lDpuV539MnmBAh
 s5gbZn3TjHFYOMff/qbOKiB91FcdJJ/B1yEBb87oOBGhFSSYAdGQ2TItgY+Uw8EkGX
 g3gJpNwiRu+JLbhJ7yhZWxOK3wGEsIi6ljHwvnrJ2xTSutwPldayRZs/di4mcOMrbT
 llX1acIQCyrfixIxAG/jVId1PA68MhgRz9IalJBS/cPw2/WhuLizVaP4BajooQVYtC
 /KGI86ltLy3bRQy9J9vDepyHlhzcDRFgo8sX9ImC4EISDALjAc1kQaLDqQ5ZoGgC1c
 GJtOFr4c9ZTEA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu, 20 Jun 2024 18:23:15 +0200
Message-Id: <20240620162316.3674955-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620162316.3674955-1-arnd@kernel.org>
References: <20240620162316.3674955-1-arnd@kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Fri, 21 Jun 2024 11:00:08 +0200
Subject: [LTP] [PATCH 14/15] asm-generic: unistd: fix time32 compat syscall
 handling
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>,
 Guo Ren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 linux-sh@vger.kernel.org, linux-csky@vger.kernel.org,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 musl@lists.openwall.com, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, ltp@lists.linux.it,
 Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 stable@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Arnd Bergmann <arnd@arndb.de>

arch/riscv/ appears to have accidentally enabled the compat time32
syscalls in 64-bit kernels even though the native 32-bit ABI does
not expose those.

Address this by adding another level of indirection, checking for both
the target ABI (32 or 64) and the __ARCH_WANT_TIME32_SYSCALLS macro.

The macro arguments are meant to follow the syscall.tbl format, the idea
here is that by the end of the series, all other syscalls are changed
to the same format to make it possible to move all architectures over
to generating the system call table consistently.
Only this patch needs to be backported though.

Cc: stable@vger.kernel.org # v5.19+
Fixes: 7eb6369d7acf ("RISC-V: Add support for rv32 userspace via COMPAT")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/asm-generic/unistd.h | 146 +++++++++++++++++++-----------
 1 file changed, 94 insertions(+), 52 deletions(-)

diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 3fdaa573d661..e47c966557d0 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -16,10 +16,32 @@
 #define __SYSCALL(x, y)
 #endif
 
+#ifndef __SC
+#define __SC(_cond, _nr, _sys) __SYSCALL_ ## _cond (_nr, _sys)
+#endif
+
+#ifndef __SCC
+#ifdef __SYSCALL_COMPAT
+#define __SCC(_cond, _nr, _sys, _comp) __SC(_cond, _nr, _comp)
+#else
+#define __SCC(_cond, _nr, _sys, _comp) __SC(_cond, _nr, _sys)
+#endif
+#endif
+
 #if __BITS_PER_LONG == 32 || defined(__SYSCALL_COMPAT)
 #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _32)
+#define __SYSCALL_32(_nr, _sys)		__SYSCALL(__NR_ ## _nr, _sys)
+#define __SYSCALL_64(_nr, _sys)
 #else
 #define __SC_3264(_nr, _32, _64) __SYSCALL(_nr, _64)
+#define __SYSCALL_32(_nr, _sys)
+#define __SYSCALL_64(_nr, _sys)		__SYSCALL(__NR_ ## _nr, _sys)
+#endif
+
+#if defined(__ARCH_WANT_TIME32_SYSCALLS)
+#define __SYSCALL_time32(_nr, _sys)	__SYSCALL_32(__NR_ ## _nr, _sys)
+#else
+#define __SYSCALL_time32(_nr, _sys)
 #endif
 
 #ifdef __SYSCALL_COMPAT
@@ -41,7 +63,8 @@ __SYSCALL(__NR_io_cancel, sys_io_cancel)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_io_getevents 4
-__SC_3264(__NR_io_getevents, sys_io_getevents_time32, sys_io_getevents)
+__SC(time32, io_getevents, sys_io_getevents_time32)
+__SC(64, io_getevents, sys_io_getevents)
 #endif
 
 #define __NR_setxattr 5
@@ -190,9 +213,11 @@ __SYSCALL(__NR3264_sendfile, sys_sendfile64)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_pselect6 72
-__SC_COMP_3264(__NR_pselect6, sys_pselect6_time32, sys_pselect6, compat_sys_pselect6_time32)
+__SCC(time32, pselect6, sys_pselect6_time32, compat_sys_pselect6_time32)
+__SC(64, pselect6, sys_pselect6)
 #define __NR_ppoll 73
-__SC_COMP_3264(__NR_ppoll, sys_ppoll_time32, sys_ppoll, compat_sys_ppoll_time32)
+__SCC(time32, ppoll, sys_ppoll_time32, compat_sys_ppoll_time32)
+__SC(64, ppoll, sys_ppoll)
 #endif
 
 #define __NR_signalfd4 74
@@ -235,16 +260,17 @@ __SYSCALL(__NR_timerfd_create, sys_timerfd_create)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_timerfd_settime 86
-__SC_3264(__NR_timerfd_settime, sys_timerfd_settime32, \
-	  sys_timerfd_settime)
+__SC(time32, timerfd_settime, sys_timerfd_settime32)
+__SC(64, timerfd_settime, sys_timerfd_settime)
 #define __NR_timerfd_gettime 87
-__SC_3264(__NR_timerfd_gettime, sys_timerfd_gettime32, \
-	  sys_timerfd_gettime)
+__SC(time32, timerfd_gettime, sys_timerfd_gettime32)
+__SC(64, timerfd_gettime, sys_timerfd_gettime)
 #endif
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_utimensat 88
-__SC_3264(__NR_utimensat, sys_utimensat_time32, sys_utimensat)
+__SC(time32, utimensat, sys_utimensat_time32)
+__SC(64, utimensat, sys_utimensat)
 #endif
 
 #define __NR_acct 89
@@ -268,7 +294,8 @@ __SYSCALL(__NR_unshare, sys_unshare)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_futex 98
-__SC_3264(__NR_futex, sys_futex_time32, sys_futex)
+__SC(time32, futex, sys_futex_time32)
+__SC(64, futex, sys_futex)
 #endif
 
 #define __NR_set_robust_list 99
@@ -280,7 +307,8 @@ __SC_COMP(__NR_get_robust_list, sys_get_robust_list, \
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_nanosleep 101
-__SC_3264(__NR_nanosleep, sys_nanosleep_time32, sys_nanosleep)
+__SC(time32, nanosleep, sys_nanosleep_time32)
+__SC(64, nanosleep, sys_nanosleep)
 #endif
 
 #define __NR_getitimer 102
@@ -298,7 +326,8 @@ __SC_COMP(__NR_timer_create, sys_timer_create, compat_sys_timer_create)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_timer_gettime 108
-__SC_3264(__NR_timer_gettime, sys_timer_gettime32, sys_timer_gettime)
+__SC(time32, timer_gettime, sys_timer_gettime32)
+__SC(64, timer_gettime, sys_timer_gettime)
 #endif
 
 #define __NR_timer_getoverrun 109
@@ -306,7 +335,8 @@ __SYSCALL(__NR_timer_getoverrun, sys_timer_getoverrun)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_timer_settime 110
-__SC_3264(__NR_timer_settime, sys_timer_settime32, sys_timer_settime)
+__SC(time32, timer_settime, sys_timer_settime32)
+__SC(64, timer_settime, sys_timer_settime)
 #endif
 
 #define __NR_timer_delete 111
@@ -314,14 +344,17 @@ __SYSCALL(__NR_timer_delete, sys_timer_delete)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_clock_settime 112
-__SC_3264(__NR_clock_settime, sys_clock_settime32, sys_clock_settime)
+__SC(time32, clock_settime, sys_clock_settime32)
+__SC(64, clock_settime, sys_clock_settime)
 #define __NR_clock_gettime 113
-__SC_3264(__NR_clock_gettime, sys_clock_gettime32, sys_clock_gettime)
+__SC(time32, clock_gettime, sys_clock_gettime32)
+__SC(64, clock_gettime, sys_clock_gettime)
 #define __NR_clock_getres 114
-__SC_3264(__NR_clock_getres, sys_clock_getres_time32, sys_clock_getres)
+__SC(time32, clock_getres, sys_clock_getres_time32)
+__SC(64, clock_getres, sys_clock_getres)
 #define __NR_clock_nanosleep 115
-__SC_3264(__NR_clock_nanosleep, sys_clock_nanosleep_time32, \
-	  sys_clock_nanosleep)
+__SC(time32, clock_nanosleep, sys_clock_nanosleep_time32)
+__SC(64, clock_nanosleep, sys_clock_nanosleep)
 #endif
 
 #define __NR_syslog 116
@@ -351,8 +384,8 @@ __SYSCALL(__NR_sched_get_priority_min, sys_sched_get_priority_min)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_sched_rr_get_interval 127
-__SC_3264(__NR_sched_rr_get_interval, sys_sched_rr_get_interval_time32, \
-	  sys_sched_rr_get_interval)
+__SC(time32, sched_rr_get_interval, sys_sched_rr_get_interval_time32)
+__SC(64, sched_rr_get_interval, sys_sched_rr_get_interval)
 #endif
 
 #define __NR_restart_syscall 128
@@ -376,8 +409,8 @@ __SC_COMP(__NR_rt_sigpending, sys_rt_sigpending, compat_sys_rt_sigpending)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_rt_sigtimedwait 137
-__SC_COMP_3264(__NR_rt_sigtimedwait, sys_rt_sigtimedwait_time32, \
-	  sys_rt_sigtimedwait, compat_sys_rt_sigtimedwait_time32)
+__SCC(time32, rt_sigtimedwait, sys_rt_sigtimedwait_time32, compat_sys_rt_sigtimedwait_time32)
+__SC(64, rt_sigtimedwait, sys_rt_sigtimedwait)
 #endif
 
 #define __NR_rt_sigqueueinfo 138
@@ -451,11 +484,14 @@ __SYSCALL(__NR_getcpu, sys_getcpu)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_gettimeofday 169
-__SC_COMP(__NR_gettimeofday, sys_gettimeofday, compat_sys_gettimeofday)
+__SCC(time32, gettimeofday, sys_gettimeofday, compat_sys_gettimeofday)
+__SC(64, gettimeofday, sys_gettimeofday)
 #define __NR_settimeofday 170
-__SC_COMP(__NR_settimeofday, sys_settimeofday, compat_sys_settimeofday)
+__SCC(time32, settimeofday, sys_settimeofday, compat_sys_settimeofday)
+__SC(64, settimeofday, sys_settimeofday)
 #define __NR_adjtimex 171
-__SC_3264(__NR_adjtimex, sys_adjtimex_time32, sys_adjtimex)
+__SC(time32, adjtimex, sys_adjtimex_time32)
+__SC(64, adjtimex, sys_adjtimex)
 #endif
 
 #define __NR_getpid 172
@@ -481,10 +517,11 @@ __SYSCALL(__NR_mq_unlink, sys_mq_unlink)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_mq_timedsend 182
-__SC_3264(__NR_mq_timedsend, sys_mq_timedsend_time32, sys_mq_timedsend)
+__SC(time32, mq_timedsend, sys_mq_timedsend_time32)
+__SC(64, mq_timedsend, sys_mq_timedsend)
 #define __NR_mq_timedreceive 183
-__SC_3264(__NR_mq_timedreceive, sys_mq_timedreceive_time32, \
-	  sys_mq_timedreceive)
+__SC(time32, mq_timedreceive, sys_mq_timedreceive_time32)
+__SC(64, mq_timedreceive, sys_mq_timedreceive)
 #endif
 
 #define __NR_mq_notify 184
@@ -506,7 +543,8 @@ __SC_COMP(__NR_semctl, sys_semctl, compat_sys_semctl)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_semtimedop 192
-__SC_3264(__NR_semtimedop, sys_semtimedop_time32, sys_semtimedop)
+__SC(time32, semtimedop, sys_semtimedop_time32)
+__SC(64, semtimedop, sys_semtimedop)
 #endif
 
 #define __NR_semop 193
@@ -618,7 +656,8 @@ __SYSCALL(__NR_accept4, sys_accept4)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_recvmmsg 243
-__SC_COMP_3264(__NR_recvmmsg, sys_recvmmsg_time32, sys_recvmmsg, compat_sys_recvmmsg_time32)
+__SCC(time32, recvmmsg, sys_recvmmsg_time32, compat_sys_recvmmsg_time32)
+__SC(64, recvmmsg, sys_recvmmsg)
 #endif
 
 /*
@@ -629,7 +668,8 @@ __SC_COMP_3264(__NR_recvmmsg, sys_recvmmsg_time32, sys_recvmmsg, compat_sys_recv
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_wait4 260
-__SC_COMP(__NR_wait4, sys_wait4, compat_sys_wait4)
+__SCC(time32, wait4, sys_wait4, compat_sys_wait4)
+__SC(64, wait4, sys_wait4)
 #endif
 
 #define __NR_prlimit64 261
@@ -645,7 +685,8 @@ __SYSCALL(__NR_open_by_handle_at, sys_open_by_handle_at)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_clock_adjtime 266
-__SC_3264(__NR_clock_adjtime, sys_clock_adjtime32, sys_clock_adjtime)
+__SC(time32, clock_adjtime, sys_clock_adjtime32)
+__SC(64, clock_adjtime, sys_clock_adjtime)
 #endif
 
 #define __NR_syncfs 267
@@ -701,7 +742,8 @@ __SYSCALL(__NR_statx,     sys_statx)
 
 #if defined(__ARCH_WANT_TIME32_SYSCALLS) || __BITS_PER_LONG != 32
 #define __NR_io_pgetevents 292
-__SC_COMP_3264(__NR_io_pgetevents, sys_io_pgetevents_time32, sys_io_pgetevents, compat_sys_io_pgetevents)
+__SCC(time32, io_pgetevents, sys_io_pgetevents_time32, compat_sys_io_pgetevents)
+__SC(64, io_pgetevents, sys_io_pgetevents)
 #endif
 
 #define __NR_rseq 293
@@ -713,45 +755,45 @@ __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
 
 #if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
 #define __NR_clock_gettime64 403
-__SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
+__SC(32, clock_gettime64, sys_clock_gettime)
 #define __NR_clock_settime64 404
-__SYSCALL(__NR_clock_settime64, sys_clock_settime)
+__SC(32, clock_settime64, sys_clock_settime)
 #define __NR_clock_adjtime64 405
-__SYSCALL(__NR_clock_adjtime64, sys_clock_adjtime)
+__SC(32, clock_adjtime64, sys_clock_adjtime)
 #define __NR_clock_getres_time64 406
-__SYSCALL(__NR_clock_getres_time64, sys_clock_getres)
+__SC(32, clock_getres_time64, sys_clock_getres)
 #define __NR_clock_nanosleep_time64 407
-__SYSCALL(__NR_clock_nanosleep_time64, sys_clock_nanosleep)
+__SC(32, clock_nanosleep_time64, sys_clock_nanosleep)
 #define __NR_timer_gettime64 408
-__SYSCALL(__NR_timer_gettime64, sys_timer_gettime)
+__SC(32, timer_gettime64, sys_timer_gettime)
 #define __NR_timer_settime64 409
-__SYSCALL(__NR_timer_settime64, sys_timer_settime)
+__SC(32, timer_settime64, sys_timer_settime)
 #define __NR_timerfd_gettime64 410
-__SYSCALL(__NR_timerfd_gettime64, sys_timerfd_gettime)
+__SC(32, timerfd_gettime64, sys_timerfd_gettime)
 #define __NR_timerfd_settime64 411
-__SYSCALL(__NR_timerfd_settime64, sys_timerfd_settime)
+__SC(32, timerfd_settime64, sys_timerfd_settime)
 #define __NR_utimensat_time64 412
-__SYSCALL(__NR_utimensat_time64, sys_utimensat)
+__SC(32, utimensat_time64, sys_utimensat)
 #define __NR_pselect6_time64 413
-__SC_COMP(__NR_pselect6_time64, sys_pselect6, compat_sys_pselect6_time64)
+__SCC(32, pselect6_time64, sys_pselect6, compat_sys_pselect6_time64)
 #define __NR_ppoll_time64 414
-__SC_COMP(__NR_ppoll_time64, sys_ppoll, compat_sys_ppoll_time64)
+__SCC(32, ppoll_time64, sys_ppoll, compat_sys_ppoll_time64)
 #define __NR_io_pgetevents_time64 416
-__SYSCALL(__NR_io_pgetevents_time64, sys_io_pgetevents, compat_sys_io_pgetevents_time64)
+__SCC(32, io_pgetevents_time64, sys_io_pgetevents, compat_sys_io_pgetevents_time64)
 #define __NR_recvmmsg_time64 417
-__SC_COMP(__NR_recvmmsg_time64, sys_recvmmsg, compat_sys_recvmmsg_time64)
+__SCC(32, recvmmsg_time64, sys_recvmmsg, compat_sys_recvmmsg_time64)
 #define __NR_mq_timedsend_time64 418
-__SYSCALL(__NR_mq_timedsend_time64, sys_mq_timedsend)
+__SC(32, mq_timedsend_time64, sys_mq_timedsend)
 #define __NR_mq_timedreceive_time64 419
-__SYSCALL(__NR_mq_timedreceive_time64, sys_mq_timedreceive)
+__SC(32, mq_timedreceive_time64, sys_mq_timedreceive)
 #define __NR_semtimedop_time64 420
-__SYSCALL(__NR_semtimedop_time64, sys_semtimedop)
+__SC(32, semtimedop_time64, sys_semtimedop)
 #define __NR_rt_sigtimedwait_time64 421
-__SC_COMP(__NR_rt_sigtimedwait_time64, sys_rt_sigtimedwait, compat_sys_rt_sigtimedwait_time64)
+__SCC(32, rt_sigtimedwait_time64, sys_rt_sigtimedwait, compat_sys_rt_sigtimedwait_time64)
 #define __NR_futex_time64 422
-__SYSCALL(__NR_futex_time64, sys_futex)
+__SC(32, futex_time64, sys_futex)
 #define __NR_sched_rr_get_interval_time64 423
-__SYSCALL(__NR_sched_rr_get_interval_time64, sys_sched_rr_get_interval)
+__SC(32, sched_rr_get_interval_time64, sys_sched_rr_get_interval)
 #endif
 
 #define __NR_pidfd_send_signal 424
-- 
2.39.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
