Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF8F36F944
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 13:27:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E940C3C5E87
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Apr 2021 13:27:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AA093C2A5F
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 13:27:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A1CBE60207B
 for <ltp@lists.linux.it>; Fri, 30 Apr 2021 13:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1619782026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VnaxMsVVdSlsJyClGRJIJv2+iHnApwSq2BUVWrVqtA=;
 b=dqXTNEDyPDyvf0Cd4JMKkfGyd7NeDyrYJxx4ws6Wt1NlAbYRJ1d6GVOCMpkCc0qdH8HPoT
 MhAkBNLpx6L+vs2lZqoz1LnaTRjOyamaola6WW7nNRisF+KfDLVPOA7qq4F6nCZyX8oGoP
 5XnoNLsDm0sN8hMKcwztbm/34Arg+3g=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26ED1B02A;
 Fri, 30 Apr 2021 11:27:06 +0000 (UTC)
To: ltp@lists.linux.it
Date: Fri, 30 Apr 2021 12:26:43 +0100
Message-Id: <20210430112649.16302-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430112649.16302-1-rpalethorpe@suse.com>
References: <20210430112649.16302-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/7] API: Add safe openat, printfat,
 readat and unlinkat
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add 'at' variants for a number of system calls and LTP SAFE API
functions. This avoids using sprintf everywhere to build paths.

Also adds tst_decode_fd which allows us to retrieve the path for an FD
for debugging purposes without having to store it ourselves. However
the proc symlink may not be available on some systems.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_safe_file_at.h |  51 +++++++++++
 lib/tst_safe_file_at.c     | 176 +++++++++++++++++++++++++++++++++++++
 2 files changed, 227 insertions(+)
 create mode 100644 include/tst_safe_file_at.h
 create mode 100644 lib/tst_safe_file_at.c

diff --git a/include/tst_safe_file_at.h b/include/tst_safe_file_at.h
new file mode 100644
index 000000000..fbb63b4a8
--- /dev/null
+++ b/include/tst_safe_file_at.h
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+#ifndef TST_SAFE_FILE_AT_H
+#define TST_SAFE_FILE_AT_H
+
+#include <sys/types.h>
+#include <stdarg.h>
+
+#define SAFE_OPENAT(dirfd, path, oflags, ...)			\
+	safe_openat(__FILE__, __LINE__,				\
+		    (dirfd), (path), (oflags), ## __VA_ARGS__)
+
+#define SAFE_FILE_READAT(dirfd, path, buf, nbyte)			\
+	safe_file_readat(__FILE__, __LINE__,				\
+			 (dirfd), (path), (buf), (nbyte))
+
+
+#define SAFE_FILE_PRINTFAT(dirfd, path, fmt, ...)			\
+	safe_file_printfat(__FILE__, __LINE__,				\
+			   (dirfd), (path), (fmt), __VA_ARGS__)
+
+#define SAFE_UNLINKAT(dirfd, path, flags)				\
+	safe_unlinkat(__FILE__, __LINE__, (dirfd), (path), (flags))
+
+char *tst_decode_fd(int fd);
+
+int safe_openat(const char *file, const int lineno,
+		int dirfd, const char *path, int oflags, ...);
+
+ssize_t safe_file_readat(const char *file, const int lineno,
+			 int dirfd, const char *path, char *buf, size_t nbyte);
+
+int tst_file_vprintfat(int dirfd, const char *path, const char *fmt, va_list va);
+int tst_file_printfat(int dirfd, const char *path, const char *fmt, ...)
+			__attribute__ ((format (printf, 3, 4)));
+
+int safe_file_vprintfat(const char *file, const int lineno,
+			int dirfd, const char *path,
+			const char *fmt, va_list va);
+
+int safe_file_printfat(const char *file, const int lineno,
+		       int dirfd, const char *path, const char *fmt, ...)
+			__attribute__ ((format (printf, 5, 6)));
+
+int safe_unlinkat(const char *file, const int lineno,
+		  int dirfd, const char *path, int flags);
+
+#endif
diff --git a/lib/tst_safe_file_at.c b/lib/tst_safe_file_at.c
new file mode 100644
index 000000000..43372998e
--- /dev/null
+++ b/lib/tst_safe_file_at.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include "lapi/fcntl.h"
+#include "tst_safe_file_at.h"
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+char fd_path[PATH_MAX];
+
+char *tst_decode_fd(int fd)
+{
+	ssize_t ret;
+	char proc_path[32];
+
+	if (fd < 0)
+		return "!";
+
+	sprintf(proc_path, "/proc/self/fd/%d", fd);
+	ret = readlink(proc_path, fd_path, sizeof(fd_path));
+
+	if (ret < 0)
+		return "?";
+
+	fd_path[ret] = '\0';
+
+	return fd_path;
+}
+
+int safe_openat(const char *file, const int lineno,
+		int dirfd, const char *path, int oflags, ...)
+{
+	va_list ap;
+	int fd;
+	mode_t mode;
+
+	va_start(ap, oflags);
+	mode = va_arg(ap, int);
+	va_end(ap);
+
+	fd = openat(dirfd, path, oflags, mode);
+	if (fd > -1)
+		return fd;
+
+	tst_brk_(file, lineno, TBROK | TERRNO,
+		 "openat(%d<%s>, '%s', %o, %o)",
+		 dirfd, tst_decode_fd(dirfd), path, oflags, mode);
+
+	return fd;
+}
+
+ssize_t safe_file_readat(const char *file, const int lineno,
+			 int dirfd, const char *path, char *buf, size_t nbyte)
+{
+	int fd = safe_openat(file, lineno, dirfd, path, O_RDONLY);
+	ssize_t rval;
+
+	if (fd < 0)
+		return -1;
+
+	rval = safe_read(file, lineno, NULL, 0, fd, buf, nbyte - 1);
+	if (rval < 0)
+		return -1;
+
+	close(fd);
+	buf[rval] = '\0';
+
+	if (rval >= (ssize_t)nbyte - 1) {
+		tst_brk_(file, lineno, TBROK,
+			"Buffer length %zu too small to read %d<%s>/%s",
+			nbyte, dirfd, tst_decode_fd(dirfd), path);
+	}
+
+	return rval;
+}
+
+int tst_file_vprintfat(int dirfd, const char *path, const char *fmt, va_list va)
+{
+	int fd = openat(dirfd, path, O_WRONLY);
+
+	if (fd < 0)
+		return -1;
+
+	TEST(vdprintf(fd, fmt, va));
+	close(fd);
+
+	if (TST_RET < 0) {
+		errno = TST_ERR;
+		return -2;
+	}
+
+	return TST_RET;
+}
+
+int tst_file_printfat(int dirfd, const char *path, const char *fmt, ...)
+{
+	va_list va;
+	int rval;
+
+	va_start(va, fmt);
+	rval = tst_file_vprintfat(dirfd, path, fmt, va);
+	va_end(va);
+
+	return rval;
+}
+
+int safe_file_vprintfat(const char *file, const int lineno,
+			int dirfd, const char *path,
+			const char *fmt, va_list va)
+{
+	char buf[16];
+	va_list vac;
+	int rval;
+
+	va_copy(vac, va);
+
+	TEST(tst_file_vprintfat(dirfd, path, fmt, va));
+
+	if (TST_RET == -2) {
+		rval = vsnprintf(buf, sizeof(buf), fmt, vac);
+		va_end(vac);
+
+		if (rval >= (ssize_t)sizeof(buf))
+			strcpy(buf + sizeof(buf) - 5, "...");
+
+		tst_brk_(file, lineno, TBROK | TTERRNO,
+			 "vdprintf(%d<%s>, '%s', '%s'<%s>)",
+			 dirfd, tst_decode_fd(dirfd), path, fmt,
+			 rval > 0 ? buf : "???");
+		return -1;
+	}
+
+	va_end(vac);
+
+	if (TST_RET == -1) {
+		tst_brk_(file, lineno, TBROK | TTERRNO,
+			"openat(%d<%s>, '%s', O_WRONLY)",
+			dirfd, tst_decode_fd(dirfd), path);
+	}
+
+	return TST_RET;
+}
+
+int safe_file_printfat(const char *file, const int lineno,
+		       int dirfd, const char *path,
+		       const char *fmt, ...)
+{
+	va_list va;
+	int rval;
+
+	va_start(va, fmt);
+	rval = safe_file_vprintfat(file, lineno, dirfd, path, fmt, va);
+	va_end(va);
+
+	return rval;
+}
+
+int safe_unlinkat(const char *file, const int lineno,
+		  int dirfd, const char *path, int flags)
+{
+	int rval = unlinkat(dirfd, path, flags);
+
+	if (rval > -1)
+		return rval;
+
+	tst_brk_(file, lineno, TBROK | TERRNO,
+		 "unlinkat(%d<%s>, '%s', %s)", dirfd, tst_decode_fd(dirfd), path,
+		 flags == AT_REMOVEDIR ? "AT_REMOVEDIR" : (flags ? "?" : "0"));
+
+	return rval;
+}
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
