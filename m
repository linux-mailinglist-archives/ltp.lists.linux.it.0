Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11049179343
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:24:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCF8B3C6635
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 16:24:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 75D0C3C6610
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:24:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1E3B61401265
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 16:24:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD11CAE6F
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 15:24:02 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2020 16:24:01 +0100
Message-Id: <20200304152401.7432-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200304152401.7432-1-chrubis@suse.cz>
References: <20200304152401.7432-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 02/12] include/tst_safe_clocks.h: Make use of
 tst_clock_name()
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
 include/tst_safe_clocks.h | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/tst_safe_clocks.h b/include/tst_safe_clocks.h
index 34ed953b4..27e8bda45 100644
--- a/include/tst_safe_clocks.h
+++ b/include/tst_safe_clocks.h
@@ -11,6 +11,7 @@
 #include <time.h>
 #include <sys/timex.h>
 #include "tst_test.h"
+#include "tst_clocks.h"
 #include "lapi/syscalls.h"
 #include "lapi/posix_clocks.h"
 
@@ -20,10 +21,11 @@ static inline void safe_clock_getres(const char *file, const int lineno,
 	int rval;
 
 	rval = clock_getres(clk_id, res);
-	if (rval != 0)
+	if (rval != 0) {
 		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_getres() failed", file, lineno);
-
+			"%s:%d clock_getres(%s) failed",
+			file, lineno, tst_clock_name(clk_id));
+	}
 }
 
 static inline void safe_clock_gettime(const char *file, const int lineno,
@@ -32,9 +34,11 @@ static inline void safe_clock_gettime(const char *file, const int lineno,
 	int rval;
 
 	rval = clock_gettime(clk_id, tp);
-	if (rval != 0)
+	if (rval != 0) {
 		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_gettime() failed", file, lineno);
+			"%s:%d clock_gettime(%s) failed",
+			file, lineno, tst_clock_name(clk_id));
+	}
 }
 
 
@@ -44,9 +48,11 @@ static inline void safe_clock_settime(const char *file, const int lineno,
 	int rval;
 
 	rval = clock_settime(clk_id, tp);
-	if (rval != 0)
+	if (rval != 0) {
 		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_gettime() failed", file, lineno);
+			"%s:%d clock_gettime(%s) failed",
+			file, lineno, tst_clock_name(clk_id));
+	}
 }
 
 static inline int safe_clock_adjtime(const char *file, const int lineno,
@@ -55,9 +61,11 @@ static inline int safe_clock_adjtime(const char *file, const int lineno,
 	int rval;
 
 	rval = tst_syscall(__NR_clock_adjtime, clk_id, txc);
-	if (rval < 0)
+	if (rval < 0) {
 		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_adjtime() failed %i", file, lineno, rval);
+			"%s:%d clock_adjtime(%s) failed %i",
+			file, lineno, tst_clock_name(clk_id), rval);
+	}
 
 	return rval;
 }
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
