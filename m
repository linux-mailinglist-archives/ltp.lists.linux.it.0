Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47B2992EB
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C77F43C27E6
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 74C443C23EC
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7F19E600A6D
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9401ADA8
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:49 +0100
Message-Id: <20201026164756.30556-13-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 12/19] Unify error handling in
 include/tst_safe_clocks.h
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

- Properly format caller file:line location
- Pedantically check invalid syscall return values
- Always return success/failure value so that all SAFE_*() functions can be
  called in test cleanup

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_safe_clocks.h | 48 +++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/include/tst_safe_clocks.h b/include/tst_safe_clocks.h
index 5909f4083..5661ce57b 100644
--- a/include/tst_safe_clocks.h
+++ b/include/tst_safe_clocks.h
@@ -15,44 +15,62 @@
 #include "lapi/syscalls.h"
 #include "lapi/posix_clocks.h"
 
-static inline void safe_clock_getres(const char *file, const int lineno,
+static inline int safe_clock_getres(const char *file, const int lineno,
 	clockid_t clk_id, struct timespec *res)
 {
 	int rval;
 
 	rval = clock_getres(clk_id, res);
-	if (rval != 0) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_getres(%s) failed",
-			file, lineno, tst_clock_name(clk_id));
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"clock_getres(%s) failed", tst_clock_name(clk_id));
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid clock_getres(%s) return value %d",
+			tst_clock_name(clk_id), rval);
 	}
+
+	return rval;
 }
 
-static inline void safe_clock_gettime(const char *file, const int lineno,
+static inline int safe_clock_gettime(const char *file, const int lineno,
 	clockid_t clk_id, struct timespec *tp)
 {
 	int rval;
 
 	rval = clock_gettime(clk_id, tp);
-	if (rval != 0) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_gettime(%s) failed",
-			file, lineno, tst_clock_name(clk_id));
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"clock_gettime(%s) failed", tst_clock_name(clk_id));
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid clock_gettime(%s) return value %d",
+			tst_clock_name(clk_id), rval);
 	}
+
+	return rval;
 }
 
 
-static inline void safe_clock_settime(const char *file, const int lineno,
+static inline int safe_clock_settime(const char *file, const int lineno,
 	clockid_t clk_id, struct timespec *tp)
 {
 	int rval;
 
 	rval = clock_settime(clk_id, tp);
-	if (rval != 0) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_gettime(%s) failed",
-			file, lineno, tst_clock_name(clk_id));
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"clock_gettime(%s) failed", tst_clock_name(clk_id));
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid clock_gettime(%s) return value %d",
+			tst_clock_name(clk_id), rval);
 	}
+
+	return rval;
 }
 
 static inline int safe_timer_create(const char *file, const int lineno,
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
