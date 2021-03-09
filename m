Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAB332CE8
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 18:11:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BE523C60B5
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 18:11:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B91C13C554B
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 18:11:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 489C9140110E
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 18:11:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 928B0AEC4
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 17:11:05 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  9 Mar 2021 18:11:04 +0100
Message-Id: <20210309171104.30821-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210309171104.30821-1-mdoucha@suse.cz>
References: <20210309171104.30821-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/quotactl: Skip tests if FS quota is not
 supported
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
 .../kernel/syscalls/quotactl/quotactl01.c     |  2 ++
 .../kernel/syscalls/quotactl/quotactl04.c     | 26 +++++++++++++++++--
 .../kernel/syscalls/quotactl/quotactl06.c     |  2 ++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/quotactl/quotactl01.c b/testcases/kernel/syscalls/quotactl/quotactl01.c
index 7b3649fa5..e5fa02acb 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl01.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
@@ -172,6 +172,8 @@ static void setup(void)
 	if (access(GRPPATH, F_OK) == -1)
 		tst_brk(TFAIL | TERRNO, "group quotafile didn't exist");
 
+	tst_require_quota_support(tst_device->dev, fmt_id, USRPATH);
+
 	TEST(quotactl(QCMD(Q_GETNEXTQUOTA, USRQUOTA), tst_device->dev,
 		test_id, (void *) &res_ndq));
 	if (TST_ERR == EINVAL || TST_ERR == ENOSYS)
diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
index c8fa916b2..fd3afc888 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl04.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
@@ -28,6 +28,7 @@
 #include <unistd.h>
 #include <stdio.h>
 #include <sys/stat.h>
+#include <sys/mount.h>
 #include "config.h"
 #include "lapi/quotactl.h"
 #include "tst_safe_stdio.h"
@@ -103,6 +104,28 @@ static struct tcase {
 
 };
 
+static void do_mount(const char *source, const char *target,
+	const char *filesystemtype, unsigned long mountflags,
+	const void *data)
+{
+	TEST(mount(source, target, filesystemtype, mountflags, data));
+
+	if (TST_RET == -1 && TST_ERR == ESRCH)
+		tst_brk(TCONF, "Kernel or device does not support FS quotas");
+
+	if (TST_RET == -1) {
+		tst_brk(TBROK | TTERRNO, "mount(%s, %s, %s, %lu, %p) failed",
+			source, target, filesystemtype, mountflags, data);
+	}
+
+	if (TST_RET) {
+		tst_brk(TBROK | TTERRNO, "mount(%s, %s, %s, %lu, %p) failed",
+			source, target, filesystemtype, mountflags, data);
+	}
+
+	mount_flag = 1;
+}
+
 static void setup(void)
 {
 	FILE *f;
@@ -118,8 +141,7 @@ static void setup(void)
 		tst_brk(TCONF, "Test needs mkfs.ext4 >= 1.43 for quota,project option, test skipped");
 	pclose(f);
 	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
-	SAFE_MOUNT(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
-	mount_flag = 1;
+	do_mount(tst_device->dev, MNTPOINT, tst_device->fs_type, 0, "quota");
 }
 
 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/quotactl/quotactl06.c b/testcases/kernel/syscalls/quotactl/quotactl06.c
index 2818a4dc4..6288f5fa2 100644
--- a/testcases/kernel/syscalls/quotactl/quotactl06.c
+++ b/testcases/kernel/syscalls/quotactl/quotactl06.c
@@ -153,6 +153,8 @@ static void setup(void)
 	if (access(USRPATH, F_OK) == -1)
 		tst_brk(TFAIL | TERRNO, "user quotafile didn't exist");
 
+	tst_require_quota_support(tst_device->dev, fmt_id, USRPATH);
+
 	SAFE_MKDIR(TESTDIR1, 0666);
 	test_id = geteuid();
 	test_invalid = test_id + 1;
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
