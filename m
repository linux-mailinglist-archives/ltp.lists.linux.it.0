Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DAE196097
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:40:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A63BF3C3321
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 22:40:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B55C03C32D4
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E46B5140052E
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 22:39:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BDCBBAD57;
 Fri, 27 Mar 2020 21:39:30 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 27 Mar 2020 22:39:23 +0100
Message-Id: <20200327213924.18816-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200327213924.18816-1-pvorel@suse.cz>
References: <20200327213924.18816-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 5/6] lib: Implement SAFE_RUN_CMD() macro (new API only)
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

Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Li Wang <liwang@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Renamed: s/SAFE_RUNCMD()/SAFE_RUN_CMD()/

 doc/test-writing-guidelines.txt |  3 +++
 include/tst_safe_macros.h       | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 51eba6e39..4b195a002 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1283,6 +1283,9 @@ return value is '255' if 'execvp()' failed with 'ENOENT' and '254' otherwise.
 'stdout_path' and 'stderr_path' determine where to redirect the program
 stdout and stderr I/O streams.
 
+The 'SAFE_RUN_CMD()' macro can be used automatic handling non zero exits (exits
+with 'TBROK') or 'ENOENT' (exits with 'TCONF').
+
 .Example
 [source,c]
 -------------------------------------------------------------------------------
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index d95d26219..af45bc51d 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -21,6 +21,7 @@
 #include <grp.h>
 
 #include "safe_macros_fn.h"
+#include "tst_cmd.h"
 
 #define SAFE_BASENAME(path) \
 	safe_basename(__FILE__, __LINE__, NULL, (path))
@@ -534,4 +535,23 @@ int safe_personality(const char *filename, unsigned int lineno,
 void safe_unshare(const char *file, const int lineno, int flags);
 #define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
 
+static inline void safe_run_cmd(const char *file, const int lineno,
+							   const char *const argv[],
+			      const char *stdout_path,
+			      const char *stderr_path)
+{
+	int rval;
+
+	switch ((rval = tst_run_cmd(argv, stdout_path, stderr_path,
+				    TST_RUN_CMD_PASS_EXIT_VAL |
+				    TST_RUN_CMD_CHECK_CMD))) {
+	case 0:
+		break;
+	default:
+		tst_brk(TBROK, "%s:%d: %s failed (%d)", file, lineno, argv[0], rval);
+	}
+}
+#define SAFE_RUN_CMD(argv, stdout_path, stderr_path) \
+	safe_run_cmd(__FILE__, __LINE__, (argv), (stdout_path), (stderr_path))
+
 #endif /* SAFE_MACROS_H__ */
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
