Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7AA2CDA1C
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 16:27:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC9B13C4CA3
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Dec 2020 16:27:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D2BAD3C246E
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 16:27:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 65185201010
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 16:27:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08773ACC0
 for <ltp@lists.linux.it>; Thu,  3 Dec 2020 15:27:11 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Dec 2020 16:28:03 +0100
Message-Id: <20201203152804.846-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201203152804.846-1-chrubis@suse.cz>
References: <20201203152804.846-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] libnewipc: Add get_ipc_timestamp()
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

That returns timestamps that should return values comparable to the
stime/rtime/ctime.

From Thomas Gleixner:

> Due to the internal implementation of ktime_get_real_seconds(), which is
> a 2038 safe replacement for the former get_seconds() function, this
> accumulation issue can be observed. (time(2) via syscall and newer
> versions of VDSO use the same mechanism).
>
>      clock_gettime(CLOCK_REALTIME, &ts);
>      sec = time();
>      assert(sec >= ts.tv_sec);
>
> That assert can trigger for two reasons:
>
>  1) Clock was set between the clock_gettime() and time().
>
>  2) The clock has advanced far enough that:
>
>     timekeeper.tv_nsec + (clock_now_ns() - last_update_ns) > NSEC_PER_SEC
> The same problem exists for CLOCK_XXX vs. CLOCK_XXX_COARSE
>
>      clock_gettime(CLOCK_XXX, &ts);
>      clock_gettime(CLOCK_XXX_COARSE, &tc);
>      assert(tc.tv_sec >= ts.tv_sec);
>
> The _COARSE variants return their associated timekeeper.tv_sec,tv_nsec
> pair without reading the clock. Same as #2 above just extended to clock
> MONOTONIC.

Which means the timestamps in the structure we get from msg* calls can
be 1 second smaller that timestamps returned from realtime timers.

However it also means that the _COARSE timers should be the same as the
SysV timestamps and could be used for these tests instead. Also these
timers should be available since 2.6.32 which is old enough to assume
that they are present.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/libnewipc.h           |  3 +++
 libs/libltpnewipc/libnewipc.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/libnewipc.h b/include/libnewipc.h
index 30288cd68..075364f85 100644
--- a/include/libnewipc.h
+++ b/include/libnewipc.h
@@ -22,6 +22,7 @@
 #ifndef __LIBNEWIPC_H
 #define __LIBNEWIPC_H	1
 
+#include <time.h>
 #include <sys/types.h>
 
 #define MSG_RD	0400
@@ -56,4 +57,6 @@ void *probe_free_addr(const char *file, const int lineno);
 #define PROBE_FREE_ADDR() \
 	probe_free_addr(__FILE__, __LINE__)
 
+time_t get_ipc_timestamp(void);
+
 #endif /* newlibipc.h */
diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
index 3734040b7..d0974bbe0 100644
--- a/libs/libltpnewipc/libnewipc.c
+++ b/libs/libltpnewipc/libnewipc.c
@@ -23,6 +23,7 @@
 #include "libnewipc.h"
 #include "tst_safe_stdio.h"
 #include "tst_safe_sysv_ipc.h"
+#include "tst_clocks.h"
 
 #define BUFSIZE 1024
 
@@ -86,3 +87,15 @@ void *probe_free_addr(const char *file, const int lineno)
 
 	return addr;
 }
+
+time_t get_ipc_timestamp(void)
+{
+	struct timespec ts;
+	int ret;
+
+	ret = tst_clock_gettime(CLOCK_REALTIME_COARSE, &ts);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "clock_gettime(CLOCK_REALTIME_COARSE)");
+
+	return ts.tv_sec;
+}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
