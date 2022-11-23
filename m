Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CFB636244
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Nov 2022 15:48:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DFA93CCA26
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Nov 2022 15:48:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3906D3CCA0C
 for <ltp@lists.linux.it>; Wed, 23 Nov 2022 15:48:07 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4E75614004F9
 for <ltp@lists.linux.it>; Wed, 23 Nov 2022 15:48:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C85123A;
 Wed, 23 Nov 2022 06:48:11 -0800 (PST)
Received: from e129169.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41EF03F73B;
 Wed, 23 Nov 2022 06:48:04 -0800 (PST)
From: Tudor Cretu <tudor.cretu@arm.com>
To: ltp@lists.linux.it
Date: Wed, 23 Nov 2022 14:47:45 +0000
Message-Id: <20221123144746.590890-3-tudor.cretu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123144746.590890-1-tudor.cretu@arm.com>
References: <20221123144746.590890-1-tudor.cretu@arm.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] safe_openat: Fix undefined behaviour in vararg
 handling
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

Accessing elements in an empty va_list is undefined behaviour.
Therefore, remove the variadicness from safe_openat as it always calls
openat with the mode argument included.

Adapt the SAFE_OPENAT macro to handle the change by passing a default
argument of 0 to mode if it's omitted.

Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
---
 include/tst_safe_file_at.h | 10 ++++++----
 lib/tst_cgroup.c           |  2 +-
 lib/tst_safe_file_at.c     | 11 +++--------
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/include/tst_safe_file_at.h b/include/tst_safe_file_at.h
index a1aa19fad..dd43d8f65 100644
--- a/include/tst_safe_file_at.h
+++ b/include/tst_safe_file_at.h
@@ -11,9 +11,11 @@
 #include <unistd.h>
 #include <stdarg.h>
 
-#define SAFE_OPENAT(dirfd, path, oflags, ...)			\
-	safe_openat(__FILE__, __LINE__,				\
-		    (dirfd), (path), (oflags), ## __VA_ARGS__)
+#define __SAFE_OPENAT(dirfd, path, oflags, mode, ...)			\
+	safe_openat(__FILE__, __LINE__, (dirfd), (path), (oflags), (mode))
+
+#define SAFE_OPENAT(dirfd, path, oflags, ...)				\
+	__SAFE_OPENAT((dirfd), (path), (oflags), ##__VA_ARGS__, 0)
 
 #define SAFE_FILE_READAT(dirfd, path, buf, nbyte)			\
 	safe_file_readat(__FILE__, __LINE__,				\
@@ -38,7 +40,7 @@ const char *tst_decode_fd(const int fd)
 			  __attribute__((warn_unused_result));
 
 int safe_openat(const char *const file, const int lineno, const int dirfd,
-                const char *const path, const int oflags, ...)
+                const char *const path, const int oflags, const mode_t mode)
 		__attribute__((nonnull, warn_unused_result));
 
 ssize_t safe_file_readat(const char *const file, const int lineno,
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 50699bc63..9831bc336 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -1345,7 +1345,7 @@ int safe_cg_open(const char *const file, const int lineno,
 		if (!alias)
 			continue;
 
-		fds[i++] = safe_openat(file, lineno, (*dir)->dir_fd, alias, flags);
+		fds[i++] = safe_openat(file, lineno, (*dir)->dir_fd, alias, flags, 0);
 	}
 
 	return i;
diff --git a/lib/tst_safe_file_at.c b/lib/tst_safe_file_at.c
index f530dc349..9b8944f01 100644
--- a/lib/tst_safe_file_at.c
+++ b/lib/tst_safe_file_at.c
@@ -33,15 +33,10 @@ const char *tst_decode_fd(const int fd)
 }
 
 int safe_openat(const char *const file, const int lineno,
-		const int dirfd, const char *const path, const int oflags, ...)
+		const int dirfd, const char *const path, const int oflags,
+		const mode_t mode)
 {
-	va_list ap;
 	int fd;
-	mode_t mode;
-
-	va_start(ap, oflags);
-	mode = va_arg(ap, int);
-	va_end(ap);
 
 	fd = openat(dirfd, path, oflags, mode);
 	if (fd > -1)
@@ -58,7 +53,7 @@ ssize_t safe_file_readat(const char *const file, const int lineno,
 			 const int dirfd, const char *const path,
 			 char *const buf, const size_t nbyte)
 {
-	int fd = safe_openat(file, lineno, dirfd, path, O_RDONLY);
+	int fd = safe_openat(file, lineno, dirfd, path, O_RDONLY, 0);
 	ssize_t rval;
 
 	if (fd < 0)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
