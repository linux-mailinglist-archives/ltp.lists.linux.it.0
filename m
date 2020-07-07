Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DDD216C54
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 13:53:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 242783C29DD
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 13:53:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D3A1F3C29B5
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 13:53:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 43B4D1A00880
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 13:53:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CFFBAE35;
 Tue,  7 Jul 2020 11:53:13 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  7 Jul 2020 13:53:31 +0200
Message-Id: <20200707115331.15806-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] lib/tst_clocks: Fix syscall detection
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

We have call raw syscall() instead of the tst_syscall() because
tst_sycall() exit the test with TCONF when kernel returned ENOSYS.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Tested-by: Li Wang <liwang@redhat.com>
---
 lib/tst_clocks.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index bc0bef273..7b465b1f6 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -14,11 +14,11 @@
 
 typedef int (*mysyscall)(clockid_t clk_id, void *ts);
 
-int syscall_supported_by_kernel(mysyscall func)
+int syscall_supported_by_kernel(long sysnr)
 {
 	int ret;
 
-	ret = func(0, NULL);
+	ret = syscall(sysnr, 0, NULL);
 	if (ret == -1 && errno == ENOSYS)
 		return 0;
 
@@ -32,13 +32,13 @@ int tst_clock_getres(clockid_t clk_id, struct timespec *res)
 	int ret;
 
 #if (__NR_clock_getres_time64 != __LTP__NR_INVALID_SYSCALL)
-	if (!func && syscall_supported_by_kernel(sys_clock_getres64)) {
+	if (!func && syscall_supported_by_kernel(__NR_clock_getres_time64)) {
 		func = sys_clock_getres64;
 		tts.type = TST_KERN_TIMESPEC;
 	}
 #endif
 
-	if (!func && syscall_supported_by_kernel(sys_clock_getres)) {
+	if (!func && syscall_supported_by_kernel(__NR_clock_getres)) {
 		func = sys_clock_getres;
 		tts.type = TST_KERN_OLD_TIMESPEC;
 	}
@@ -62,13 +62,13 @@ int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
 	int ret;
 
 #if (__NR_clock_gettime64 != __LTP__NR_INVALID_SYSCALL)
-	if (!func && syscall_supported_by_kernel(sys_clock_gettime64)) {
+	if (!func && syscall_supported_by_kernel(__NR_clock_gettime64)) {
 		func = sys_clock_gettime64;
 		tts.type = TST_KERN_TIMESPEC;
 	}
 #endif
 
-	if (!func && syscall_supported_by_kernel(sys_clock_gettime)) {
+	if (!func && syscall_supported_by_kernel(__NR_clock_gettime)) {
 		func = sys_clock_gettime;
 		tts.type = TST_KERN_OLD_TIMESPEC;
 	}
@@ -91,13 +91,13 @@ int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
 	static mysyscall func;
 
 #if (__NR_clock_settime64 != __LTP__NR_INVALID_SYSCALL)
-	if (!func && syscall_supported_by_kernel(sys_clock_settime64)) {
+	if (!func && syscall_supported_by_kernel(__NR_clock_settime64)) {
 		func = sys_clock_settime64;
 		tts.type = TST_KERN_TIMESPEC;
 	}
 #endif
 
-	if (!func && syscall_supported_by_kernel(sys_clock_settime)) {
+	if (!func && syscall_supported_by_kernel(__NR_clock_settime)) {
 		func = sys_clock_settime;
 		tts.type = TST_KERN_OLD_TIMESPEC;
 	}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
