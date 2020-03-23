Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92318F199
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:19:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FDE83C4E45
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 10:19:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0246E3C4E3D
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:19:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4DE14600A1F
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 10:19:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE751AD61;
 Mon, 23 Mar 2020 09:18:59 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 23 Mar 2020 10:18:51 +0100
Message-Id: <20200323091852.29106-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] lib: Implement SAFE_RUN() macro (new API only)
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
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
Fixes errors reported by Xu:
* Fixed params

 doc/test-writing-guidelines.txt |  3 +++
 include/tst_safe_macros.h       | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index b56f1a0f2..b8330801b 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1282,6 +1282,9 @@ return value is '255' if 'execvp()' failed with 'ENOENT' and '254' otherwise.
 'stdout_path' and 'stderr_path' determine where to redirect the program
 stdout and stderr I/O streams.
 
+The 'SAFE_RUNCMD()' macro can be used automatic handling non zero exits (exits
+with 'TBROK') or 'ENOENT' (exits with 'TCONF').
+
 .Example
 [source,c]
 -------------------------------------------------------------------------------
diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 80c4d9cb9..dea101a8e 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -547,4 +547,24 @@ int safe_personality(const char *filename, unsigned int lineno,
 void safe_unshare(const char *file, const int lineno, int flags);
 #define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
 
+static inline void safe_run_cmd(const char *file, const int lineno,
+							   const char *const argv[],
+			      const char *stdout_path,
+			      const char *stderr_path)
+{
+	int rval;
+
+	switch ((rval = tst_run_cmd(argv, stdout_path, stderr_path, 1))) {
+	case 0:
+		break;
+	case 255:
+		tst_brk(TCONF, "%s:%d: %s not found in $PATH", file, lineno, argv[0]);
+		break;
+	default:
+		tst_brk(TBROK, "%s:%d: %s failed (%d)", file, lineno, argv[0], rval);
+	}
+}
+#define SAFE_RUNCMD(argv, stdout_path, stderr_path) \
+	safe_run_cmd(__FILE__, __LINE__, (argv), (stdout_path), (stderr_path))
+
 #endif /* SAFE_MACROS_H__ */
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
