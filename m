Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0902333C02F
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 16:42:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B38ED3C6460
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 16:42:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 12D443C6441
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 16:41:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 44887600779
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 16:41:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B7B4AE3C;
 Mon, 15 Mar 2021 15:41:54 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: xuyang2018.jy@cn.fujitsu.com,
	ltp@lists.linux.it
Date: Mon, 15 Mar 2021 16:41:52 +0100
Message-Id: <20210315154153.912-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315154153.912-1-mdoucha@suse.cz>
References: <20210315154153.912-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] Add FS quota availability check functions
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

Changes since v1:
- Change quotafile argument from const char* to char*

 include/tst_fs.h             | 15 +++++++++++++++
 lib/tst_supported_fs_types.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/tst_fs.h b/include/tst_fs.h
index 4f7dd68d2..cc5cc2c0c 100644
--- a/include/tst_fs.h
+++ b/include/tst_fs.h
@@ -180,6 +180,21 @@ int tst_fs_is_supported(const char *fs_type, int flags);
  */
 const char **tst_get_supported_fs_types(int flags);
 
+/*
+ * Check whether device supports FS quotas. Negative return value means that
+ * quotas appear to be broken.
+ */
+int tst_check_quota_support(const char *device, int format, char *quotafile);
+
+/*
+ * Check for quota support and terminate the test with appropriate exit status
+ * if quotas are not supported or broken.
+ */
+#define tst_require_quota_support(dev, fmt, qfile) \
+	tst_require_quota_support_(__FILE__, __LINE__, (dev), (fmt), (qfile))
+void tst_require_quota_support_(const char *file, const int lineno,
+	const char *device, int format, char *quotafile);
+
 /*
  * Creates and writes to files on given path until write fails with ENOSPC
  */
diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 00ede549d..fa9bc56ad 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -8,6 +8,7 @@
 #include <stdlib.h>
 #include <sys/mount.h>
 #include <sys/wait.h>
+#include <sys/quota.h>
 
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
@@ -109,3 +110,33 @@ const char **tst_get_supported_fs_types(int flags)
 
 	return fs_types;
 }
+
+int tst_check_quota_support(const char *device, int format, char *quotafile)
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
+	const char *device, int format, char *quotafile)
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
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
