Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDC0189FB6
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:34:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BCD553C554B
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 16:34:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9749A3C5512
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B4E9B6009FD
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 16:34:16 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86293AE2B;
 Wed, 18 Mar 2020 15:34:16 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Mar 2020 16:37:55 +0100
Message-Id: <20200318153801.3529-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200318153801.3529-1-chrubis@suse.cz>
References: <20200318153801.3529-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/9] safe_macros: Add SAFE_SETNS()
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
Cc: Cyril Hrubis <metan@ucw.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cyril Hrubis <metan@ucw.cz>

Signed-off-by: Cyril Hrubis <metan@ucw.cz>
---
 include/tst_safe_macros.h |  4 ++++
 lib/tst_safe_macros.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 80c4d9cb9..291f2a722 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -547,4 +547,8 @@ int safe_personality(const char *filename, unsigned int lineno,
 void safe_unshare(const char *file, const int lineno, int flags);
 #define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
 
+
+void safe_setns(const char *file, const int lineno, int fd, int nstype);
+#define SAFE_SETNS(fd, nstype) safe_setns(__FILE__, __LINE__, (fd), (nstype));
+
 #endif /* SAFE_MACROS_H__ */
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index f5413a18e..353ef5b1d 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -6,6 +6,7 @@
 #define _GNU_SOURCE
 #include <unistd.h>
 #include <errno.h>
+#include "lapi/setns.h"
 #include <sched.h>
 #include "config.h"
 #ifdef HAVE_SYS_FANOTIFY_H
@@ -202,3 +203,14 @@ void safe_unshare(const char *file, const int lineno, int flags)
 		}
 	}
 }
+
+void safe_setns(const char *file, const int lineno, int fd, int nstype)
+{
+	int ret;
+
+	ret = setns(fd, nstype);
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO, "setns(%i, %i) failed",
+		         fd, nstype);
+	}
+}
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
