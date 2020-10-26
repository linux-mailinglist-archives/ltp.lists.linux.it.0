Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A652992E2
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 913FF3C2647
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 17:50:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 16DD23C2482
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BC442600A75
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 17:48:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 099B6ADBE
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:48:06 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 17:47:52 +0100
Message-Id: <20201026164756.30556-16-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026164756.30556-1-mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 15/19] Unify error handling in
 include/tst_safe_macros.h
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

- Pedantically check invalid syscall return values

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_safe_macros.h | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 29ac72568..ee3df4142 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -245,10 +245,14 @@ static inline int safe_ftruncate(const char *file, const int lineno,
 	int rval;
 
 	rval = ftruncate(fd, length);
+
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			 "ftruncate(%d,%ld) failed",
-			 fd, (long)length);
+			"ftruncate(%d,%ld) failed", fd, (long)length);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid ftruncate(%d,%ld) return value %d", fd,
+			(long)length, rval);
 	}
 
 	return rval;
@@ -262,10 +266,14 @@ static inline int safe_truncate(const char *file, const int lineno,
 	int rval;
 
 	rval = truncate(path, length);
+
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			 "truncate(%s,%ld) failed",
-			 path, (long)length);
+			"truncate(%s,%ld) failed", path, (long)length);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid truncate(%s,%ld) return value %d", path,
+			(long)length, rval);
 	}
 
 	return rval;
@@ -282,7 +290,11 @@ static inline int safe_stat(const char *file, const int lineno,
 
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			 "stat(%s,%p) failed", path, buf);
+			"stat(%s,%p) failed", path, buf);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid stat(%s,%p) return value %d", path, buf,
+			rval);
 	}
 
 	return rval;
@@ -300,6 +312,9 @@ static inline int safe_fstat(const char *file, const int lineno,
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"fstat(%d,%p) failed", fd, buf);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid fstat(%d,%p) return value %d", fd, buf, rval);
 	}
 
 	return rval;
@@ -317,6 +332,10 @@ static inline int safe_lstat(const char *file, const int lineno,
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"lstat(%s,%p) failed", path, buf);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid lstat(%s,%p) return value %d", path, buf,
+			rval);
 	}
 
 	return rval;
@@ -333,7 +352,11 @@ static inline int safe_statfs(const char *file, const int lineno,
 
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-		         "statfs(%s,%p) failed", path, buf);
+			"statfs(%s,%p) failed", path, buf);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid statfs(%s,%p) return value %d", path, buf,
+			rval);
 	}
 
 	return rval;
@@ -350,8 +373,11 @@ static inline off_t safe_lseek(const char *file, const int lineno,
 
 	if (rval == (off_t) -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			"lseek(%d,%ld,%d) failed",
-			fd, (long)offset, whence);
+			"lseek(%d,%ld,%d) failed", fd, (long)offset, whence);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid lseek(%d,%ld,%d) return value %ld", fd,
+			(long)offset, whence, (long)rval);
 	}
 
 	return rval;
@@ -368,8 +394,11 @@ static inline int safe_getrlimit(const char *file, const int lineno,
 
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			"getrlimit(%d,%p) failed",
-			resource, rlim);
+			"getrlimit(%d,%p) failed", resource, rlim);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid getrlimit(%d,%p) return value %d", resource,
+			rlim, rval);
 	}
 
 	return rval;
@@ -386,8 +415,11 @@ static inline int safe_setrlimit(const char *file, const int lineno,
 
 	if (rval == -1) {
 		tst_brk_(file, lineno, TBROK | TERRNO,
-			 "setrlimit(%d,%p) failed",
-			 resource, rlim);
+			"setrlimit(%d,%p) failed", resource, rlim);
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid setrlimit(%d,%p) return value %d", resource,
+			rlim, rval);
 	}
 
 	return rval;
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
