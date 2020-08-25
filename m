Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DBF251CF1
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:08:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8D8E3C3004
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:08:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0565A3C1A4E
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4BD1A600774
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35D9AB039
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 16:08:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Aug 2020 18:07:32 +0200
Message-Id: <20200825160735.24602-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825160735.24602-1-mdoucha@suse.cz>
References: <20200825160735.24602-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] Add SAFE_SYSINFO() macro
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

Changes since v1: New patch

 include/tst_safe_macros.h |  5 +++++
 lib/safe_macros.c         | 20 ++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 000381c4f..053c3bcf9 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -12,6 +12,7 @@
 #include <sys/resource.h>
 #include <sys/stat.h>
 #include <sys/vfs.h>
+#include <sys/sysinfo.h>
 #include <fcntl.h>
 #include <libgen.h>
 #include <signal.h>
@@ -598,4 +599,8 @@ long tst_safe_ptrace(const char *file, const int lineno, int req, pid_t pid,
 #define SAFE_PTRACE(req, pid, addr, data) \
 	tst_safe_ptrace(__FILE__, __LINE__, req, pid, addr, data)
 
+int safe_sysinfo(const char *file, const int lineno, struct sysinfo *info);
+#define SAFE_SYSINFO(info) \
+	safe_sysinfo(__FILE__, __LINE__, (info))
+
 #endif /* SAFE_MACROS_H__ */
diff --git a/lib/safe_macros.c b/lib/safe_macros.c
index dde9b7b5e..5ef9ee1c5 100644
--- a/lib/safe_macros.c
+++ b/lib/safe_macros.c
@@ -11,6 +11,7 @@
 #include <sys/wait.h>
 #include <sys/mount.h>
 #include <sys/xattr.h>
+#include <sys/sysinfo.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <libgen.h>
@@ -1088,3 +1089,22 @@ int safe_mincore(const char *file, const int lineno, void *start,
 
 	return rval;
 }
+
+int safe_sysinfo(const char *file, const int lineno, struct sysinfo *info)
+{
+	int ret;
+
+	errno = 0;
+	ret = sysinfo(info);
+
+	if (ret == -1) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
+			"sysinfo() failed");
+	} else if (ret) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
+			"Invalid sysinfo() return value %d", ret);
+
+	}
+
+	return ret;
+}
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
