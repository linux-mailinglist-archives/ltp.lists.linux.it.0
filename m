Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0E1BBC82
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 13:35:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E0323C2838
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 13:35:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 32D153C20DE
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 13:35:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A41A160078E
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 13:35:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CEAFFACF1;
 Tue, 28 Apr 2020 11:35:06 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Apr 2020 13:35:00 +0200
Message-Id: <20200428113501.24711-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] fanotify: Move safe_fanotify_init() + safe macro
 into fanotify.h
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

Fanotify code is used only in testcases/kernel/syscalls/fanotify/, which
justify breaking rule of having safe function and macro outside of
library. This will be further cleaned in next commit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

patchset is based on Amir's patchset [1], which I'd prefer to have
merged before.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?series=171631&state=*

 include/tst_safe_macros.h                     |  5 ----
 lib/tst_safe_macros.c                         | 24 -----------------
 testcases/kernel/syscalls/fanotify/fanotify.h | 27 ++++++++++++++++++-
 3 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index c39d8768b..edaeef461 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -520,11 +520,6 @@ int safe_mincore(const char *file, const int lineno, void *start,
 #define SAFE_MINCORE(start, length, vec) \
 	safe_mincore(__FILE__, __LINE__, (start), (length), (vec))
 
-int safe_fanotify_init(const char *file, const int lineno,
-	unsigned int flags, unsigned int event_f_flags);
-#define SAFE_FANOTIFY_INIT(fan, mode)  \
-	safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
-
 int safe_personality(const char *filename, unsigned int lineno,
 		    unsigned long persona);
 #define SAFE_PERSONALITY(persona) safe_personality(__FILE__, __LINE__, persona)
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index dbdfcc5be..9a9c73d06 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -45,29 +45,6 @@ pid_t safe_getpgid(const char *file, const int lineno, pid_t pid)
 	return pgid;
 }
 
-int safe_fanotify_init(const char *file, const int lineno,
-	unsigned int flags, unsigned int event_f_flags)
-{
-	int rval;
-
-#ifdef HAVE_SYS_FANOTIFY_H
-	rval = fanotify_init(flags, event_f_flags);
-
-	if (rval == -1) {
-		if (errno == ENOSYS) {
-			tst_brk(TCONF,
-				"fanotify is not configured in this kernel.");
-		}
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: fanotify_init() failed", file, lineno);
-	}
-#else
-	tst_brk(TCONF, "Header <sys/fanotify.h> is not present");
-#endif /* HAVE_SYS_FANOTIFY_H */
-
-	return rval;
-}
-
 int safe_personality(const char *filename, unsigned int lineno,
 		    unsigned long persona)
 {
@@ -96,7 +73,6 @@ int safe_setregid(const char *file, const int lineno,
 	return rval;
 }
 
-
 int safe_setreuid(const char *file, const int lineno,
 		  uid_t ruid, uid_t euid)
 {
diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index a05f4a372..f74171c15 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2012 Linux Test Project.  All Rights Reserved.
+ * Copyright (c) 2012-2020 Linux Test Project.  All Rights Reserved.
  * Author: Jan Kara, November 2013
  */
 
@@ -38,6 +38,31 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 
 #endif /* HAVE_SYS_FANOTIFY_H */
 
+int safe_fanotify_init(const char *file, const int lineno,
+	unsigned int flags, unsigned int event_f_flags)
+{
+	int rval;
+
+#ifdef HAVE_SYS_FANOTIFY_H
+	rval = fanotify_init(flags, event_f_flags);
+
+	if (rval == -1) {
+		if (errno == ENOSYS) {
+			tst_brk(TCONF,
+				"fanotify is not configured in this kernel.");
+		}
+		tst_brk(TBROK | TERRNO,
+			"%s:%d: fanotify_init() failed", file, lineno);
+	}
+#else
+	tst_brk(TCONF, "Header <sys/fanotify.h> is not present");
+#endif /* HAVE_SYS_FANOTIFY_H */
+
+	return rval;
+}
+#define SAFE_FANOTIFY_INIT(fan, mode)  \
+	safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
+
 #ifndef FAN_REPORT_TID
 #define FAN_REPORT_TID		0x00000100
 #endif
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
