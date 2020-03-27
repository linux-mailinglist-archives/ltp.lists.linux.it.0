Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B75451956F5
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 13:16:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E8FB3C3305
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 13:16:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9CDA83C32DC
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 13:16:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 138971A016FF
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 13:16:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57589AC22
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 12:16:13 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 13:16:10 +0100
Message-Id: <20200327121611.1566-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Add SAFE_PTRACE() to LTP library
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

The function treats any non-zero return value as error. Requests which may
return non-zero values on success are not supported and need to be handled
manually.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Split off from CVE 2018-1000199 patch
- Changed the req parameter type to int
- Moved SAFE_PTRACE() declaration from tst_safe_ptrace.h to tst_safe_macros.h

 include/tst_safe_macros.h | 10 ++++++++++
 lib/tst_safe_macros.c     | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index d95d26219..c018497b9 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -534,4 +534,14 @@ int safe_personality(const char *filename, unsigned int lineno,
 void safe_unshare(const char *file, const int lineno, int flags);
 #define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
 
+/*
+ * SAFE_PTRACE() treats any non-zero return value as error. Don't use it
+ * for requests like PTRACE_PEEK* or PTRACE_SECCOMP_GET_FILTER which use
+ * the return value to pass arbitrary data.
+ */
+long tst_safe_ptrace(const char *file, const int lineno, int req, pid_t pid,
+	void *addr, void *data);
+#define SAFE_PTRACE(req, pid, addr, data) \
+	tst_safe_ptrace(__FILE__, __LINE__, req, pid, addr, data)
+
 #endif /* SAFE_MACROS_H__ */
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index f5413a18e..68431fe24 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -7,6 +7,7 @@
 #include <unistd.h>
 #include <errno.h>
 #include <sched.h>
+#include <sys/ptrace.h>
 #include "config.h"
 #ifdef HAVE_SYS_FANOTIFY_H
 # include <sys/fanotify.h>
@@ -202,3 +203,21 @@ void safe_unshare(const char *file, const int lineno, int flags)
 		}
 	}
 }
+
+long tst_safe_ptrace(const char *file, const int lineno, int req, pid_t pid,
+	void *addr, void *data)
+{
+	long ret;
+
+	errno = 0;
+	ret = ptrace(req, pid, addr, data);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO, "ptrace() failed");
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid ptrace() return value %ld", ret);
+	}
+
+	return ret;
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
