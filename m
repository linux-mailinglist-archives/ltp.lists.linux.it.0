Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCAB2992E8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04BCC3C25D8
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 606A33C23BF
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8DA38600A76
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D92A1ADB3
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:50 +0100
Message-Id: <20201026164756.30556-14-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 13/19] Move executable code out of tst_safe_macros.h
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_safe_macros.h | 44 +++++----------------------------------
 lib/tst_safe_macros.c     | 44 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 42d923370..29ac72568 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -45,19 +45,8 @@ int safe_chroot(const char *file, const int lineno, const char *path);
 #define SAFE_DIRNAME(path) \
 	safe_dirname(__FILE__, __LINE__, NULL, (path))
 
-static inline int safe_dup(const char *file, const int lineno,
-			   int oldfd)
-{
-	int rval;
-
-	rval = dup(oldfd);
-	if (rval == -1) {
-		tst_brk_(file, lineno, TBROK | TERRNO,
-			 "dup(%i) failed", oldfd);
-	}
+int safe_dup(const char *file, const int lineno, int oldfd);
 
-	return rval;
-}
 #define SAFE_DUP(oldfd) \
 	safe_dup(__FILE__, __LINE__, (oldfd))
 
@@ -407,21 +396,8 @@ static inline int safe_setrlimit(const char *file, const int lineno,
 	safe_setrlimit(__FILE__, __LINE__, (resource), (rlim))
 
 typedef void (*sighandler_t)(int);
-static inline sighandler_t safe_signal(const char *file, const int lineno,
-				       int signum, sighandler_t handler)
-{
-	sighandler_t rval;
-
-	rval = signal(signum, handler);
-
-	if (rval == SIG_ERR) {
-		tst_brk_(file, lineno, TBROK | TERRNO,
-			"signal(%d,%p) failed",
-			signum, handler);
-	}
-
-	return rval;
-}
+sighandler_t safe_signal(const char *file, const int lineno,
+	int signum, sighandler_t handler);
 
 #define SAFE_SIGNAL(signum, handler) \
 	safe_signal(__FILE__, __LINE__, (signum), (handler))
@@ -569,19 +545,9 @@ int safe_unshare(const char *file, const int lineno, int flags);
 int safe_setns(const char *file, const int lineno, int fd, int nstype);
 #define SAFE_SETNS(fd, nstype) safe_setns(__FILE__, __LINE__, (fd), (nstype))
 
-static inline void safe_cmd(const char *file, const int lineno, const char *const argv[],
-				  const char *stdout_path, const char *stderr_path)
-{
-	int rval;
+void safe_cmd(const char *file, const int lineno, const char *const argv[],
+	const char *stdout_path, const char *stderr_path);
 
-	switch ((rval = tst_cmd(argv, stdout_path, stderr_path,
-				TST_CMD_PASS_RETVAL | TST_CMD_TCONF_ON_MISSING))) {
-	case 0:
-		break;
-	default:
-		tst_brk(TBROK, "%s:%d: %s failed (%d)", file, lineno, argv[0], rval);
-	}
-}
 #define SAFE_CMD(argv, stdout_path, stderr_path) \
 	safe_cmd(__FILE__, __LINE__, (argv), (stdout_path), (stderr_path))
 /*
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index dd7f604eb..5c51e0872 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -397,3 +397,47 @@ int safe_pipe2(const char *file, const int lineno, int fildes[2], int flags)
 
 	return ret;
 }
+
+int safe_dup(const char *file, const int lineno, int oldfd)
+{
+	int rval;
+
+	rval = dup(oldfd);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			 "dup(%i) failed", oldfd);
+	}
+
+	return rval;
+}
+
+sighandler_t safe_signal(const char *file, const int lineno,
+	int signum, sighandler_t handler)
+{
+	sighandler_t rval;
+
+	rval = signal(signum, handler);
+
+	if (rval == SIG_ERR) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"signal(%d,%p) failed",
+			signum, handler);
+	}
+
+	return rval;
+}
+
+void safe_cmd(const char *file, const int lineno, const char *const argv[],
+	const char *stdout_path, const char *stderr_path)
+{
+	int rval;
+
+	switch ((rval = tst_cmd(argv, stdout_path, stderr_path,
+		TST_CMD_PASS_RETVAL | TST_CMD_TCONF_ON_MISSING))) {
+	case 0:
+		break;
+	default:
+		tst_brk(TBROK, "%s:%d: %s failed (%d)", file, lineno, argv[0],
+			rval);
+	}
+}
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
