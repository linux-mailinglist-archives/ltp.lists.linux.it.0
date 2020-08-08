Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B623F5B8
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Aug 2020 03:02:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 921133C31FB
	for <lists+linux-ltp@lfdr.de>; Sat,  8 Aug 2020 03:02:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C4EBB3C260D
 for <ltp@lists.linux.it>; Sat,  8 Aug 2020 03:02:08 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id AF47A1400DF7
 for <ltp@lists.linux.it>; Sat,  8 Aug 2020 03:02:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,447,1589212800"; d="scan'208";a="97823063"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Aug 2020 09:02:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0BF844CE34E8;
 Sat,  8 Aug 2020 09:02:02 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sat, 8 Aug 2020 09:02:03 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <liwang@redhat.com>
Date: Sat, 8 Aug 2020 09:02:14 +0800
Message-ID: <1596848534-1901-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0BF844CE34E8.AF781
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib/tst_cgroup: Reset cgroup.clone_children value
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When running cgroup test cases(like cpuset01 or oom05) about cpuset subsystem
firstly, then cpuset_inherit case will fail because the value of
cgroup.clone_children has been changed into 1 on cgroup-v1. Reset this value
when calling tst_cgroupN_umount.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v1->v2
1. only restore cpuset subsystem clone_children value
 lib/tst_cgroup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
index 9459f7ea0..ba413d874 100644
--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -9,6 +9,8 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/mount.h>
+#include <fcntl.h>
+#include <unistd.h>
 
 #include "tst_test.h"
 #include "tst_safe_macros.h"
@@ -17,6 +19,7 @@
 #include "tst_device.h"
 
 static enum tst_cgroup_ver tst_cg_ver;
+static int clone_children;
 
 static int tst_cgroup_check(const char *cgroup)
 {
@@ -88,6 +91,7 @@ static void tst_cgroup1_mount(const char *name, const char *option,
 	 */
 	if (strcmp(option, "cpuset") == 0) {
 		sprintf(knob_path, "%s/cgroup.clone_children", mnt_path);
+		SAFE_FILE_SCANF(knob_path, "%d", &clone_children);
 		SAFE_FILE_PRINTF(knob_path, "%d", 1);
 	}
 out:
@@ -123,6 +127,7 @@ static void tst_cgroupN_umount(const char *mnt_path, const char *new_path)
 	FILE *fp;
 	int fd;
 	char s_new[BUFSIZ], s[BUFSIZ], value[BUFSIZ];
+	char knob_path[PATH_MAX];
 
 	if (!tst_is_mounted(mnt_path))
 		return;
@@ -151,6 +156,13 @@ static void tst_cgroupN_umount(const char *mnt_path, const char *new_path)
 			    != (ssize_t)strlen(value) - 1)
 				tst_res(TWARN | TERRNO, "write %s", s);
 	}
+	if (tst_cg_ver & TST_CGROUP_V1) {
+		sprintf(knob_path, "%s/cpuset.cpus", mnt_path);
+		if (!access(knob_path, F_OK)) {
+			sprintf(knob_path, "%s/cgroup.clone_children", mnt_path);
+			SAFE_FILE_PRINTF(knob_path, "%d", clone_children);
+		}
+	}
 	if (fd != -1)
 		close(fd);
 	if (fp != NULL)
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
