Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF71197C28
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:44:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B7303C3130
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 14:44:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0F0BA3C312E
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 975A41A00F7C
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:43:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE306AECE;
 Mon, 30 Mar 2020 12:43:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 14:43:37 +0200
Message-Id: <20200330124338.6764-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330124338.6764-1-pvorel@suse.cz>
References: <20200330124338.6764-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/5] lib: Implement SAFE_CMD() macro (new API only)
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

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt |  3 +++
 include/tst_safe_macros.h       | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 7069d3c8f..6f1eee490 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1283,6 +1283,9 @@ return value is '255' if 'execvp()' failed with 'ENOENT' and '254' otherwise.
 'stdout_path' and 'stderr_path' determine where to redirect the program
 stdout and stderr I/O streams.
 
+The 'SAFE_CMD()' macro can be used automatic handling non zero exits (exits
+with 'TBROK') or 'ENOENT' (exits with 'TCONF').
+
 .Example
 [source,c]
 -------------------------------------------------------------------------------
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index d95d26219..38eb67d1d 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -21,6 +21,7 @@
 #include <grp.h>
 
 #include "safe_macros_fn.h"
+#include "tst_cmd.h"
 
 #define SAFE_BASENAME(path) \
 	safe_basename(__FILE__, __LINE__, NULL, (path))
@@ -534,4 +535,21 @@ int safe_personality(const char *filename, unsigned int lineno,
 void safe_unshare(const char *file, const int lineno, int flags);
 #define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
 
+void safe_cmd(const char *file, const int lineno, const char *const argv[],
+				  const char *stdout_path, const char *stderr_path)
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
+#define SAFE_CMD(argv, stdout_path, stderr_path) \
+	safe_cmd(__FILE__, __LINE__, (argv), (stdout_path), (stderr_path))
+
 #endif /* SAFE_MACROS_H__ */
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
