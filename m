Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F622C19B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 11:04:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56E0E3C4D30
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 11:04:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 7F7533C1CB8
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 11:04:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 961492013C2
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 11:04:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88663AC2D
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 09:04:44 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 Jul 2020 11:05:00 +0200
Message-Id: <20200724090500.2958-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] safe_macros: Move sig*set() functions to
 C file
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

This fixes the compilation since the tst_strsig() is defined in
tst_test.h after we include tst_safe_macros.h.

Fixes my changes in: 719b8a5df410 (libs: sigwait: Add SAFE_SIG*() macros)

Sorry for the breakage.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_safe_macros.h | 42 ++++++---------------------------------
 lib/tst_safe_macros.c     | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index f3f83cddd..79f11b5c6 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -431,48 +431,18 @@ int safe_sigaction(const char *file, const int lineno,
 #define SAFE_SIGACTION(signum, act, oldact) \
 	safe_sigaction(__FILE__, __LINE__, (signum), (act), (oldact))
 
-static inline void safe_sigaddset(const char *file, const int lineno,
-				  sigset_t *sigs, int signo)
-{
-	int rval;
-
-	rval = sigaddset(sigs, signo);
-	if (rval == -1) {
-		tst_brk_(file, lineno, TBROK | TERRNO,
-		         "sigaddset() %s (%i) failed",
-			 tst_strsig(signo), signo);
-	}
-}
-
+void safe_sigaddset(const char *file, const int lineno,
+                    sigset_t *sigs, int signo);
 #define SAFE_SIGADDSET(sigs, signo) \
 	safe_sigaddset(__FILE__, __LINE__, (sigs), (signo))
 
-static inline void safe_sigdelset(const char *file, const int lineno,
-				  sigset_t *sigs, int signo)
-{
-	int rval;
-
-	rval = sigdelset(sigs, signo);
-	if (rval == -1) {
-		tst_brk_(file, lineno, TBROK | TERRNO,
-		         "sigdelset() %s (%i) failed",
-			 tst_strsig(signo), signo);
-	}
-}
-
+void safe_sigdelset(const char *file, const int lineno,
+                    sigset_t *sigs, int signo);
 #define SAFE_SIGDELSET(sigs, signo) \
 	safe_sigdelset(__FILE__, __LINE__, (sigs), (signo))
 
-static inline void safe_sigemptyset(const char *file, const int lineno,
-				    sigset_t *sigs)
-{
-	int rval;
-
-	rval = sigemptyset(sigs);
-	if (rval == -1)
-		tst_brk_(file, lineno, TBROK | TERRNO, "sigemptyset() failed");
-}
-
+void safe_sigemptyset(const char *file, const int lineno,
+                      sigset_t *sigs);
 #define SAFE_SIGEMPTYSET(sigs) \
 	safe_sigemptyset(__FILE__, __LINE__, (sigs))
 
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index dbdfcc5be..3b44eeafa 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -130,6 +130,42 @@ int safe_sigaction(const char *file, const int lineno,
 	return rval;
 }
 
+void safe_sigaddset(const char *file, const int lineno,
+                    sigset_t *sigs, int signo)
+{
+	int rval;
+
+	rval = sigaddset(sigs, signo);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+		         "sigaddset() %s (%i) failed",
+			 tst_strsig(signo), signo);
+	}
+}
+
+void safe_sigdelset(const char *file, const int lineno,
+                    sigset_t *sigs, int signo)
+{
+	int rval;
+
+	rval = sigdelset(sigs, signo);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+		         "sigdelset() %s (%i) failed",
+			 tst_strsig(signo), signo);
+	}
+}
+
+void safe_sigemptyset(const char *file, const int lineno,
+                      sigset_t *sigs)
+{
+	int rval;
+
+	rval = sigemptyset(sigs);
+	if (rval == -1)
+		tst_brk_(file, lineno, TBROK | TERRNO, "sigemptyset() failed");
+}
+
 struct group *safe_getgrnam(const char *file, const int lineno,
 			    const char *name)
 {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
