Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61A372D3F
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:48:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DF2D3C585B
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:48:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D5223C582E
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:48:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A9EC01A007E6
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:48:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAADDAF0E
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:48:35 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 17:48:30 +0200
Message-Id: <20210504154835.24881-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/6] Add SAFE_REALLOC() helper function to LTP
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---

Changes since v1: None

 include/tst_safe_macros.h |  5 +++++
 lib/tst_safe_macros.c     | 15 +++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index b9d9baa1a..d6f32ef4c 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -67,6 +67,11 @@ int safe_dup2(const char *file, const int lineno, int oldfd, int newfd);
 #define SAFE_MALLOC(size) \
 	safe_malloc(__FILE__, __LINE__, NULL, (size))
 
+void *safe_realloc(const char *file, const int lineno, void *ptr, size_t size);
+
+#define SAFE_REALLOC(ptr, size) \
+	safe_realloc(__FILE__, __LINE__, (ptr), (size))
+
 #define SAFE_MKDIR(pathname, mode) \
 	safe_mkdir(__FILE__, __LINE__, NULL, (pathname), (mode))
 
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index 182b690bb..fd5f1704b 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -5,6 +5,7 @@
 
 #define _GNU_SOURCE
 #include <unistd.h>
+#include <stdlib.h>
 #include <errno.h>
 #include <sched.h>
 #include <sys/ptrace.h>
@@ -433,6 +434,20 @@ int safe_dup2(const char *file, const int lineno, int oldfd, int newfd)
 	return rval;
 }
 
+void *safe_realloc(const char *file, const int lineno, void *ptr, size_t size)
+{
+	void *ret;
+
+	ret = realloc(ptr, size);
+
+	if (!ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"realloc(%p, %zu) failed", ptr, size);
+	}
+
+	return ret;
+}
+
 sighandler_t safe_signal(const char *file, const int lineno,
 	int signum, sighandler_t handler)
 {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
