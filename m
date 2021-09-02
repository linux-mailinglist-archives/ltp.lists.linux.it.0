Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1D13FEB59
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 11:37:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70CD43C3016
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 11:37:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C4743C2926
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 11:37:06 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 431A36008C3
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 11:37:06 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id D94D29F66D;
 Thu,  2 Sep 2021 09:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1630575425; bh=OeKF2zj6xPvOIT4VxKZMhcZ5FsmorDH3yogaI4ZmO2M=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=f85wQdIOWfHJUi0dg5wXwHzUt6ymCgjNkK2WQM2eOxuo9x9gVOIAPIdJmvduvqGMM
 /7WvsxEKQLk7YfORGts7sQDANZZ5LXA0ylpywdiqzGcTRN0NmAm73pnDOgfvKNv2uZ
 nJWd/cAR9t19fANLRX+l7wx54dVMfzpimtZ/i2Rk=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	viresh.kumar@linaro.org
Date: Thu,  2 Sep 2021 11:36:55 +0200
Message-Id: <20210902093655.6104-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] syscalls/aarch64: Remove 32 bit only syscalls
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

These syscalls are not available in 64 bit builds of linux.
See: <linux>/include/uapi/asm-generic/unistd.h

With the syscall defined, the test clock_gettim04 fails with
../../../../include/tst_timer.h:216: TCONF: syscall(403) __NR_clock_gettime64 not supported

Fixes: 59d278d61ed90117607f389326e0816a14dbf53c ("lapi/syscalls: Update syscall numbers")
Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---

I am not 100% sure, how the syscall table for aarch64 is generated.
There are also compat version for some of the 32 bit only 64 bit syscalls,
but I think they are only available, when running an 32 bit arm application.

 include/lapi/syscalls/aarch64.in | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 5a2816099..a47185954 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -278,26 +278,6 @@ statx 291
 io_pgetevents 292
 rseq 293
 kexec_file_load 294
-clock_gettime64 403
-clock_settime64 404
-clock_adjtime64 405
-clock_getres_time64 406
-clock_nanosleep_time64 407
-timer_gettime64 408
-timer_settime64 409
-timerfd_gettime64 410
-timerfd_settime64 411
-utimensat_time64 412
-pselect6_time64 413
-ppoll_time64 414
-io_pgetevents_time64 416
-recvmmsg_time64 417
-mq_timedsend_time64 418
-mq_timedreceive_time64 419
-semtimedop_time64 420
-rt_sigtimedwait_time64 421
-futex_time64 422
-sched_rr_get_interval_time64 423
 pidfd_send_signal 424
 io_uring_setup 425
 io_uring_enter 426
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
