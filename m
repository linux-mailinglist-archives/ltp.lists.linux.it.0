Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 759D267119
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 16:15:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EEDDF3C1D09
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 16:15:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2B19D3C03AD
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 16:15:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4E1CE1A027A5
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 16:15:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3958AF40
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 14:15:31 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 12 Jul 2019 16:15:29 +0200
Message-Id: <20190712141530.22195-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190712141530.22195-1-chrubis@suse.cz>
References: <20190712141530.22195-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] safe_macros: Add SAFE_STATFS()
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
 include/tst_safe_macros.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 53a888c80..80c4d9cb9 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -24,6 +24,7 @@
 #include <sys/time.h>
 #include <sys/resource.h>
 #include <sys/stat.h>
+#include <sys/vfs.h>
 #include <fcntl.h>
 #include <libgen.h>
 #include <signal.h>
@@ -340,6 +341,23 @@ static inline int safe_lstat(const char *file, const int lineno,
 #define SAFE_LSTAT(path, buf) \
 	safe_lstat(__FILE__, __LINE__, (path), (buf))
 
+static inline int safe_statfs(const char *file, const int lineno,
+                              const char *path, struct statfs *buf)
+{
+	int rval;
+
+	rval = statfs(path, buf);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+		         "statfs(%s,%p) failed", path, buf);
+	}
+
+	return rval;
+}
+#define SAFE_STATFS(path, buf) \
+        safe_statfs(__FILE__, __LINE__, (path), (buf))
+
 static inline off_t safe_lseek(const char *file, const int lineno,
                                int fd, off_t offset, int whence)
 {
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
