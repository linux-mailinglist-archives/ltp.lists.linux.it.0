Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B802B1949
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:45:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 931463C5FD3
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:45:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 431823C2F1A
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5DB662010FF
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7DA7AF06
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 10:44:35 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 11:44:27 +0100
Message-Id: <20201113104431.17808-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113104431.17808-1-mdoucha@suse.cz>
References: <20201113104431.17808-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/7] Unify error handling in lib/safe_file_ops.c
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

Changes since v1:
- Dropped return type changes in safe_file_scanf() and safe_file_printf()
- Code style fixes

 include/safe_file_ops_fn.h |   4 +-
 lib/safe_file_ops.c        | 187 +++++++++++++++++++++----------------
 2 files changed, 106 insertions(+), 85 deletions(-)

diff --git a/include/safe_file_ops_fn.h b/include/safe_file_ops_fn.h
index 052fb1b9a..ed7d978dd 100644
--- a/include/safe_file_ops_fn.h
+++ b/include/safe_file_ops_fn.h
@@ -55,7 +55,7 @@ void safe_file_printf(const char *file, const int lineno,
 /*
  * Safe function to copy files, no more system("cp ...") please.
  */
-void safe_cp(const char *file, const int lineno,
+int safe_cp(const char *file, const int lineno,
              void (*cleanup_fn)(void),
 	     const char *src, const char *dst);
 
@@ -71,7 +71,7 @@ void safe_cp(const char *file, const int lineno,
  * times is a timespec[2] (as for utimensat(2)). If times is NULL then
  * the access/modification times of the file is set to the current time.
  */
-void safe_touch(const char *file, const int lineno,
+int safe_touch(const char *file, const int lineno,
 		void (*cleanup_fn)(void),
 		const char *pathname,
 		mode_t mode, const struct timespec times[2]);
diff --git a/lib/safe_file_ops.c b/lib/safe_file_ops.c
index e06d399fa..0ec2ff8fe 100644
--- a/lib/safe_file_ops.c
+++ b/lib/safe_file_ops.c
@@ -84,9 +84,8 @@ int file_scanf(const char *file, const int lineno,
 	f = fopen(path, "r");
 
 	if (f == NULL) {
-		tst_resm(TWARN,
-			"Failed to open FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN, "Failed to open FILE '%s'",
+			path);
 		return 1;
 	}
 
@@ -97,23 +96,21 @@ int file_scanf(const char *file, const int lineno,
 	va_end(va);
 
 	if (ret == EOF) {
-		tst_resm(TWARN,
-			 "The FILE '%s' ended prematurely at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN,
+			"The FILE '%s' ended prematurely", path);
 		goto err;
 	}
 
 	if (ret != exp_convs) {
-		tst_resm(TWARN,
-			"Expected %i conversions got %i FILE '%s' at %s:%d",
-			 exp_convs, ret, path, file, lineno);
+		tst_resm_(file, lineno, TWARN,
+			"Expected %i conversions got %i FILE '%s'",
+			exp_convs, ret, path);
 		goto err;
 	}
 
 	if (fclose(f)) {
-		tst_resm(TWARN,
-			 "Failed to close FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN, "Failed to close FILE '%s'",
+			path);
 		return 1;
 	}
 
@@ -121,10 +118,10 @@ int file_scanf(const char *file, const int lineno,
 
 err:
 	if (fclose(f)) {
-		tst_resm(TWARN,
-			 "Failed to close FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN, "Failed to close FILE '%s'",
+			path);
 	}
+
 	return 1;
 }
 
@@ -139,9 +136,8 @@ void safe_file_scanf(const char *file, const int lineno,
 	f = fopen(path, "r");
 
 	if (f == NULL) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			 "Failed to open FILE '%s' for reading at %s:%d",
-			 path, file, lineno);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to open FILE '%s' for reading", path);
 		return;
 	}
 
@@ -152,23 +148,21 @@ void safe_file_scanf(const char *file, const int lineno,
 	va_end(va);
 
 	if (ret == EOF) {
-		tst_brkm(TBROK, cleanup_fn,
-			 "The FILE '%s' ended prematurely at %s:%d",
-			 path, file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"The FILE '%s' ended prematurely", path);
 		return;
 	}
 
 	if (ret != exp_convs) {
-		tst_brkm(TBROK, cleanup_fn,
-			 "Expected %i conversions got %i FILE '%s' at %s:%d",
-			 exp_convs, ret, path, file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"Expected %i conversions got %i FILE '%s'",
+			exp_convs, ret, path);
 		return;
 	}
 
 	if (fclose(f)) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			 "Failed to close FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to close FILE '%s'", path);
 		return;
 	}
 }
@@ -190,16 +184,14 @@ int file_lines_scanf(const char *file, const int lineno,
 	va_list ap;
 
 	if (!fmt) {
-		tst_brkm(TBROK, cleanup_fn, "pattern is NULL, %s:%d",
-			file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn, "pattern is NULL");
 		return 1;
 	}
 
 	fp = fopen(path, "r");
 	if (fp == NULL) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			"Failed to open FILE '%s' for reading at %s:%d",
-			path, file, lineno);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to open FILE '%s' for reading", path);
 		return 1;
 	}
 
@@ -216,8 +208,9 @@ int file_lines_scanf(const char *file, const int lineno,
 	fclose(fp);
 
 	if (strict && ret != arg_count) {
-		tst_brkm(TBROK, cleanup_fn, "Expected %i conversions got %i"
-			" FILE '%s' at %s:%d", arg_count, ret, path, file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"Expected %i conversions got %i FILE '%s'",
+			arg_count, ret, path);
 		return 1;
 	}
 
@@ -233,27 +226,24 @@ int file_printf(const char *file, const int lineno,
 	f = fopen(path, "w");
 
 	if (f == NULL) {
-		tst_resm(TWARN,
-			 "Failed to open FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN, "Failed to open FILE '%s'",
+			path);
 		return 1;
 	}
 
 	va_start(va, fmt);
 
 	if (vfprintf(f, fmt, va) < 0) {
-		tst_resm(TWARN,
-			"Failed to print to FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN, "Failed to print to FILE '%s'",
+			path);
 		goto err;
 	}
 
 	va_end(va);
 
 	if (fclose(f)) {
-		tst_resm(TWARN,
-			 "Failed to close FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN, "Failed to close FILE '%s'",
+			path);
 		return 1;
 	}
 
@@ -261,10 +251,10 @@ int file_printf(const char *file, const int lineno,
 
 err:
 	if (fclose(f)) {
-		tst_resm(TWARN,
-			 "Failed to close FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_resm_(file, lineno, TWARN, "Failed to close FILE '%s'",
+			path);
 	}
+
 	return 1;
 }
 
@@ -278,33 +268,30 @@ void safe_file_printf(const char *file, const int lineno,
 	f = fopen(path, "w");
 
 	if (f == NULL) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			 "Failed to open FILE '%s' for writing at %s:%d",
-			 path, file, lineno);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to open FILE '%s' for writing", path);
 		return;
 	}
 
 	va_start(va, fmt);
 
 	if (vfprintf(f, fmt, va) < 0) {
-		tst_brkm(TBROK, cleanup_fn,
-			 "Failed to print to FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"Failed to print to FILE '%s'", path);
 		return;
 	}
 
 	va_end(va);
 
 	if (fclose(f)) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			 "Failed to close FILE '%s' at %s:%d",
-			 path, file, lineno);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to close FILE '%s'", path);
 		return;
 	}
 }
 
 //TODO: C implementation? better error condition reporting?
-void safe_cp(const char *file, const int lineno,
+int safe_cp(const char *file, const int lineno,
 	     void (*cleanup_fn) (void), const char *src, const char *dst)
 {
 	size_t len = strlen(src) + strlen(dst) + 16;
@@ -316,10 +303,12 @@ void safe_cp(const char *file, const int lineno,
 	ret = system(buf);
 
 	if (ret) {
-		tst_brkm(TBROK, cleanup_fn,
-			 "Failed to copy '%s' to '%s' at %s:%d",
-			 src, dst, file, lineno);
+		tst_brkm_(file, lineno, TBROK, cleanup_fn,
+			"Failed to copy '%s' to '%s'", src, dst);
+		return ret;
 	}
+
+	return 0;
 }
 
 #ifndef HAVE_UTIMENSAT
@@ -342,7 +331,7 @@ static void set_time(struct timeval *res, const struct timespec *src,
 
 #endif
 
-void safe_touch(const char *file, const int lineno,
+int safe_touch(const char *file, const int lineno,
 		void (*cleanup_fn)(void),
 		const char *pathname,
 		mode_t mode, const struct timespec times[2])
@@ -353,28 +342,41 @@ void safe_touch(const char *file, const int lineno,
 	defmode = S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH;
 
 	ret = open(pathname, O_CREAT | O_WRONLY, defmode);
+
 	if (ret == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			"Failed to open file '%s' at %s:%d",
-			pathname, file, lineno);
-		return;
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to open file '%s'", pathname);
+		return ret;
+	} else if (ret < 0) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Invalid open(%s) return value %d", pathname, ret);
+		return ret;
 	}
 
 	ret = close(ret);
+
 	if (ret == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			"Failed to close file '%s' at %s:%d",
-			pathname, file, lineno);
-		return;
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to close file '%s'", pathname);
+		return ret;
+	} else if (ret) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Invalid close('%s') return value %d", pathname, ret);
+		return ret;
 	}
 
 	if (mode != 0) {
 		ret = chmod(pathname, mode);
+
 		if (ret == -1) {
-			tst_brkm(TBROK | TERRNO, cleanup_fn,
-				"Failed to chmod file '%s' at %s:%d",
-				pathname, file, lineno);
-			return;
+			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+				"Failed to chmod file '%s'", pathname);
+			return ret;
+		} else if (ret) {
+			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+				"Invalid chmod('%s') return value %d",
+				pathname, ret);
+			return ret;
 		}
 	}
 
@@ -389,19 +391,28 @@ void safe_touch(const char *file, const int lineno,
 		struct timeval cotimes[2];
 
 		ret = stat(pathname, &sb);
+
 		if (ret == -1) {
-			tst_brkm(TBROK | TERRNO, cleanup_fn,
-				"Failed to stat file '%s' at %s:%d",
-				pathname, file, lineno);
-			return;
+			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+				"Failed to stat file '%s'", pathname);
+			return ret;
+		} else if (ret) {
+			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+				"Invalid stat('%s') return value %d",
+				pathname, ret);
+			return ret;
 		}
 
 		ret = gettimeofday(cotimes, NULL);
+
 		if (ret == -1) {
-			tst_brkm(TBROK | TERRNO, cleanup_fn,
-				"Failed to gettimeofday() at %s:%d",
-				file, lineno);
-			return;
+			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+				"Failed to gettimeofday()");
+			return ret;
+		} else if (ret) {
+			tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+				"Invalid gettimeofday() return value %d", ret);
+			return ret;
 		}
 
 		cotimes[1] = cotimes[0];
@@ -415,8 +426,18 @@ void safe_touch(const char *file, const int lineno,
 	}
 #endif
 	if (ret == -1) {
-		tst_brkm(TBROK | TERRNO, cleanup_fn,
-			"Failed to update the access/modification time on file"
-			" '%s' at %s:%d", pathname, file, lineno);
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+			"Failed to update the access/modification time on file '%s'",
+			pathname);
+	} else if (ret) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, cleanup_fn,
+#ifdef HAVE_UTIMENSAT
+			"Invalid utimensat('%s') return value %d",
+#else
+			"Invalid utimes('%s') return value %d",
+#endif
+			pathname, ret);
 	}
+
+	return ret;
 }
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
