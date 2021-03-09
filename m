Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DAE332CE7
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 18:11:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCB3D3C6A95
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 18:11:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AFCB23C4BF0
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 18:11:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3E66B1A0111F
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 18:11:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83763AEBD
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 17:11:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  9 Mar 2021 18:11:03 +0100
Message-Id: <20210309171104.30821-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add FS quota availability check functions
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
---
 include/tst_fs.h             | 16 ++++++++++++++++
 lib/tst_supported_fs_types.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index 4f7dd68d2..acf31d0e1 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -180,6 +180,22 @@ int tst_fs_is_supported(const char *fs_type, int flags);
  */
 const char **tst_get_supported_fs_types(int flags);
 
+/*
+ * Check whether device supports FS quotas. Negative return value means that
+ * quotas appear to be broken.
+ */
+int tst_check_quota_support(const char *device, int format,
+	const char *quotafile);
+
+/*
+ * Check for quota support and terminate the test with appropriate exit status
+ * if quotas are not supported or broken.
+ */
+#define tst_require_quota_support(dev, fmt, qfile) \
+	tst_require_quota_support_(__FILE__, __LINE__, (dev), (fmt), (qfile))
+void tst_require_quota_support_(const char *file, const int lineno,
+	const char *device, int format, const char *quotafile);
+
 /*
  * Creates and writes to files on given path until write fails with ENOSPC
  */
diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 00ede549d..d9d310fd7 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -8,6 +8,7 @@
 #include <stdlib.h>
 #include <sys/mount.h>
 #include <sys/wait.h>
+#include <sys/quota.h>
 
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
@@ -109,3 +110,34 @@ const char **tst_get_supported_fs_types(int flags)
 
 	return fs_types;
 }
+
+int tst_check_quota_support(const char *device, int format,
+	const char *quotafile)
+{
+	TEST(quotactl(QCMD(Q_QUOTAON, USRQUOTA), device, format, quotafile));
+
+	/* Not supported */
+	if (TST_RET == -1 && TST_ERR == ESRCH)
+		return 0;
+
+	/* Broken */
+	if (TST_RET)
+		return -1;
+
+	quotactl(QCMD(Q_QUOTAOFF, USRQUOTA), device, 0, 0);
+	return 1;
+}
+
+void tst_require_quota_support_(const char *file, const int lineno,
+	const char *device, int format, const char *quotafile)
+{
+	int status = tst_check_quota_support(device, format, quotafile);
+
+	if (!status) {
+		tst_brk_(file, lineno, TCONF,
+			"Kernel or device does not support FS quotas");
+	}
+
+	if (status < 0)
+		tst_brk_(file, lineno, TBROK|TTERRNO, "FS quotas are broken");
+}
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
