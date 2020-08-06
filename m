Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CBA23D870
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 11:19:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3B533C322F
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 11:19:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 44B2F3C13E1
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 11:19:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 75E811001F24
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 11:19:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2340EADE2
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 09:19:36 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  6 Aug 2020 11:19:39 +0200
Message-Id: <20200806091939.9394-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] safe_macros: Add SAFE_SIGPROCMASK() and
 SAFE_SIGWAIT()
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
 include/tst_safe_macros.h | 10 ++++++++++
 lib/tst_safe_macros.c     | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 79f11b5c6..45fd0500a 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -446,6 +446,16 @@ void safe_sigemptyset(const char *file, const int lineno,
 #define SAFE_SIGEMPTYSET(sigs) \
 	safe_sigemptyset(__FILE__, __LINE__, (sigs))
 
+void safe_sigprocmask(const char *file, const int lineno,
+                      int how, sigset_t *set, sigset_t *oldset);
+#define SAFE_SIGPROCMASK(how, set, oldset) \
+	safe_sigprocmask(__FILE__, __LINE__, (how), (set), (oldset))
+
+void safe_sigwait(const char *file, const int lineno,
+                  sigset_t *set, int *sig);
+#define SAFE_SIGWAIT(set, sig) \
+	safe_sigwait(__FILE__, __LINE__, (set), (sig))
+
 #define SAFE_EXECLP(file, arg, ...) do {                   \
 	execlp((file), (arg), ##__VA_ARGS__);              \
 	tst_brk_(__FILE__, __LINE__, TBROK | TERRNO,       \
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index 3b44eeafa..f18cb4625 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -166,6 +166,44 @@ void safe_sigemptyset(const char *file, const int lineno,
 		tst_brk_(file, lineno, TBROK | TERRNO, "sigemptyset() failed");
 }
 
+static const char *strhow(int how)
+{
+	switch (how) {
+	case SIG_BLOCK:
+		return "SIG_BLOCK";
+	case SIG_UNBLOCK:
+		return "SIG_UNBLOCK";
+	case SIG_SETMASK:
+		return "SIG_SETMASK";
+	default:
+		return "???";
+	}
+}
+
+void safe_sigprocmask(const char *file, const int lineno,
+                      int how, sigset_t *set, sigset_t *oldset)
+{
+	int rval;
+
+	rval = sigprocmask(how, set, oldset);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+		         "sigprocmask(%s, %p, %p)", strhow(how), set, oldset);
+	}
+}
+
+void safe_sigwait(const char *file, const int lineno,
+                  sigset_t *set, int *sig)
+{
+	int rval;
+
+	rval = sigwait(set, sig);
+	if (rval != 0) {
+		errno = rval;
+		tst_brk_(file, lineno, TBROK, "sigwait(%p, %p)", set, sig);
+	}
+}
+
 struct group *safe_getgrnam(const char *file, const int lineno,
 			    const char *name)
 {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
