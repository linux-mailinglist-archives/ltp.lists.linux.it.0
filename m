Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F20532DBE26
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5C4D3C3358
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 11:02:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0BB713C2B06
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:02:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7F772200C2F
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 11:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1608112920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HRcgagY52skCFUm+/zxuV63Ddux/4fI+SYmWujSMKM=;
 b=JVQzozNLTHIjO/wOTsE8YBMUG3PfrbOXCZWvkLAQLjR09AY31/cH0xGbkg6PjriOfyqkbY
 Vrr1M96S57PIXmRFkon5Txlz4tz5vRvp3QxWHy0sowZ2L9lgwoH634U2Mnf0HM1bGrjSx6
 plexGNfDC2uSQJB+1IWVyoT4euYm4+o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4026ACBD;
 Wed, 16 Dec 2020 10:02:00 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 16 Dec 2020 10:01:17 +0000
Message-Id: <20201216100121.16683-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216100121.16683-1-rpalethorpe@suse.com>
References: <20201216100121.16683-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/5] safe_file_ops: Introduce openat and printfat
 API
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

Create safe wrappers for the *at commands. This allows us to print to
files in a directory without constructing the full file path using
sprintf.
---
 include/tst_safe_file_ops.h |  38 +++++++++++
 lib/tst_safe_file_ops.c     | 126 ++++++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 lib/tst_safe_file_ops.c

diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h
index 894c16123..fb3510557 100644
--- a/include/tst_safe_file_ops.h
+++ b/include/tst_safe_file_ops.h
@@ -46,4 +46,42 @@
 #define TST_MOUNT_OVERLAY() \
 	(mount_overlay(__FILE__, __LINE__, 0) == 0)
 
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
+
+int safe_openat(const char *file, const int lineno,
+		int dirfd, const char *path, int oflags, ...);
+
+ssize_t safe_file_readat(const char *file, const int lineno,
+			 int dirfd, const char *path, char *buf, size_t nbyte);
+
+int tst_file_vprintfat(int dirfd, const char *path, const char *fmt, va_list va);
+int tst_file_printfat(int dirfd, const char *path, char *fmt, ...)
+			__attribute__ ((format (printf, 3, 4)));
+
+int safe_file_vprintfat(const char *file, const int lineno,
+			int dirfd, const char *path,
+			const char *fmt, va_list va);
+
+int safe_file_printfat(const char *file, const int lineno,
+		       int dirfd, const char *path, char *fmt, ...)
+			__attribute__ ((format (printf, 5, 6)));
+
+int safe_unlinkat(const char *file, const int lineno,
+		  int dirfd, const char *path, int flags);
+
 #endif /* TST_SAFE_FILE_OPS */
diff --git a/lib/tst_safe_file_ops.c b/lib/tst_safe_file_ops.c
new file mode 100644
index 000000000..e857bdd14
--- /dev/null
+++ b/lib/tst_safe_file_ops.c
@@ -0,0 +1,126 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include "lapi/fcntl.h"
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
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
+
+	if (fd < 0) {
+		tst_brk(TBROK | TERRNO, "%s:%d: openat(%d, \"%s\", O_RDONLY)",
+			file, lineno, dirfd, path);
+	}
+
+	return fd;
+}
+
+ssize_t safe_file_readat(const char *file, const int lineno,
+			 int dirfd, const char *path, char *buf, size_t nbyte)
+{
+	int fd = safe_openat(file, lineno, dirfd, path, O_RDONLY);
+	ssize_t rval = safe_read(file, lineno, NULL, 0, fd, buf, nbyte - 1);
+
+	close(fd);
+	buf[rval] = '\0';
+
+	if (rval >= (ssize_t)nbyte - 1) {
+		tst_brk(TBROK,
+			"%s:%d: Buffer length %zu too small to read (%d)/%s",
+			file, lineno, nbyte, dirfd, path);
+	}
+
+	return rval;
+}
+
+int tst_file_vprintfat(int dirfd, const char *path, const char *fmt, va_list va)
+{
+	int fd = openat(dirfd, path, O_WRONLY);
+
+	if (fd < 0) {
+		tst_res(TINFO | TERRNO,
+			"openat(%d, %s, O_WRONLY)", dirfd, path);
+		return fd;
+	}
+
+	TEST(vdprintf(fd, fmt, va));
+	close(fd);
+
+	if (TST_RET < 0)
+		tst_res(TINFO | TTERRNO, "vdprintf(%d, %s, ...)", fd, fmt);
+	errno = TST_ERR;
+
+	return TST_RET;
+}
+
+int tst_file_printfat(int dirfd, const char *path, char *fmt, ...)
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
+	int rval, fd = safe_openat(file, lineno, dirfd, path, O_WRONLY);
+
+	if (fd < 1)
+		return fd;
+
+	rval = vdprintf(fd, fmt, va);
+
+	if (rval > -1)
+		return rval;
+
+	tst_brk(TBROK | TERRNO, "%s:%d: printfat((%d)/%s, %s, ...)",
+		file, lineno, dirfd, path, fmt);
+
+	return 0;
+}
+
+int safe_file_printfat(const char *file, const int lineno,
+		       int dirfd, const char *path, char *fmt, ...)
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
+	if (rval < 0) {
+		tst_brk(TBROK | TERRNO,
+			"%s:%d: unlinkat(%d, %s, %s)", file, lineno,
+			dirfd, path,
+			flags == AT_REMOVEDIR ? "AT_REMOVEDIR" :
+						(flags ? "?" : "0"));
+	}
+
+	return rval;
+}
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
