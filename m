Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B5F2C425C
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 15:47:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4945F3C4E33
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 15:47:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 3F34E3C2451
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 15:47:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 339331000BFA
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 15:47:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6F90BACC0
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:47:26 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Nov 2020 15:48:18 +0100
Message-Id: <20201125144818.24542-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] lib: Fix SAFE_MACROS() redirection to new
 library
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

Previously the redirection into the newlib tst_brk_() in the test
library was defined only for tst_brkm() so after the changes to call
tst_brkm_() in the test library we ended up hitting abort() in the
tst_brkm_() in tst_res.c when SAFE_MACRO() has failed.

This commit adds redirection for tst_brkm_() as well so that the
messages are properly routed to the new library as well.

Fixes: f63b8afc24b8 (Unify error handling in lib/safe_macros.c)
Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/old/test.h        | 13 ++++++++++---
 lib/newlib_tests/test02.c |  4 ++--
 lib/tst_res.c             |  8 +++-----
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/include/old/test.h b/include/old/test.h
index 604254eea..2ae7dba71 100644
--- a/include/old/test.h
+++ b/include/old/test.h
@@ -129,7 +129,7 @@ void tst_resm_hexd_(const char *file, const int lineno, int ttype,
 	tst_resm_hexd_(__FILE__, __LINE__, (ttype), (buf), (size), \
 		       (arg_fmt), ##__VA_ARGS__)
 
-void tst_brkm_(const char *file, const int lineno, int ttype,
+void tst_brkm__(const char *file, const int lineno, int ttype,
 	void (*func)(void), const char *arg_fmt, ...)
 	__attribute__ ((format (printf, 5, 6))) LTP_ATTRIBUTE_NORETURN;
 
@@ -139,11 +139,18 @@ void tst_brkm_(const char *file, const int lineno, int ttype,
 	if (tst_test) \
 		tst_brk_(__FILE__, __LINE__, flags, fmt, ##__VA_ARGS__); \
 	else \
-		tst_brkm_(__FILE__, __LINE__, flags, cleanup, fmt, ##__VA_ARGS__); \
+		tst_brkm__(__FILE__, __LINE__, flags, cleanup, fmt, ##__VA_ARGS__); \
+	} while (0)
+
+#define tst_brkm_(file, lineno, flags, cleanup, fmt, ...) do { \
+	if (tst_test) \
+		tst_brk_(file, lineno, flags, fmt, ##__VA_ARGS__); \
+	else \
+		tst_brkm__(file, lineno, flags, cleanup, fmt, ##__VA_ARGS__); \
 	} while (0)
 #else
 # define tst_brkm(flags, cleanup, fmt, ...) do { \
-		tst_brkm_(__FILE__, __LINE__, flags, cleanup, fmt, ##__VA_ARGS__); \
+		tst_brkm__(__FILE__, __LINE__, flags, cleanup, fmt, ##__VA_ARGS__); \
 	} while (0)
 #endif
 
diff --git a/lib/newlib_tests/test02.c b/lib/newlib_tests/test02.c
index f1b6a7ca4..ec2a1d13d 100644
--- a/lib/newlib_tests/test02.c
+++ b/lib/newlib_tests/test02.c
@@ -10,7 +10,7 @@
 #include "tst_test.h"
 
 void tst_resm_(char *, int, int, char *);
-void tst_brkm_(char *, int, int, void (*)(void), char *);
+void tst_brkm__(char *, int, int, void (*)(void), char *);
 
 static void cleanup(void)
 {
@@ -24,7 +24,7 @@ static void do_test(unsigned int i)
 		tst_resm_(__FILE__, __LINE__, TPASS, "passed message");
 	break;
 	case 1:
-		tst_brkm_(__FILE__, __LINE__, TCONF, cleanup, "Non-NULL cleanup");
+		tst_brkm__(__FILE__, __LINE__, TCONF, cleanup, "Non-NULL cleanup");
 	break;
 	}
 }
diff --git a/lib/tst_res.c b/lib/tst_res.c
index c35f41b74..c9ba0fa66 100644
--- a/lib/tst_res.c
+++ b/lib/tst_res.c
@@ -575,7 +575,7 @@ void tst_resm_hexd_(const char *file, const int lineno, int ttype,
 	}
 }
 
-void tst_brkm_(const char *file, const int lineno, int ttype,
+void tst_brkm__(const char *file, const int lineno, int ttype,
 	void (*func)(void), const char *arg_fmt, ...)
 {
 	char tmesg[USERMESG];
@@ -587,12 +587,10 @@ void tst_brkm_(const char *file, const int lineno, int ttype,
 			tst_brk_(file, lineno, TBROK,
 			         "Non-NULL cleanup in newlib!");
 		}
-
-		tst_brk_(file, lineno, ttype, "%s", tmesg);
-	} else {
-		tst_brk__(file, lineno, ttype, func, "%s", tmesg);
 	}
 
+	tst_brk__(file, lineno, ttype, func, "%s", tmesg);
+
 	/* Shouldn't be reached, but fixes build time warnings about noreturn. */
 	abort();
 }
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
