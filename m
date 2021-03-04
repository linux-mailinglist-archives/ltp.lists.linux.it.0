Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342632CA57
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 03:09:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5CA13C5A77
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Mar 2021 03:09:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 329CB3C5687
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 03:09:20 +0100 (CET)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D35441401100
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 03:09:18 +0100 (CET)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DrZ4z026bz7rsq
 for <ltp@lists.linux.it>; Thu,  4 Mar 2021 10:07:31 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 4 Mar 2021 10:09:04 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 4 Mar 2021 10:08:38 +0800
Message-ID: <20210304020838.259422-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to filesystem
 whitelist
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

In many Embedded system, we need add tmpfs wo filesystem whitelist since
there is only tmpfs can be used to test.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>

---------------
v1->v2:
1)create a unique temporary directory under TMPDIR and use it as a mount
point in the has_kernel_support() function.
2)add tst_umount after mount.
---------------

---
 lib/tst_supported_fs_types.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 00ede549d..964efb659 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -22,6 +22,7 @@ static const char *const fs_type_whitelist[] = {
 	"vfat",
 	"exfat",
 	"ntfs",
+	"tmpfs",
 	NULL
 };

@@ -34,6 +35,10 @@ static int has_mkfs(const char *fs_type)

 	sprintf(buf, "mkfs.%s >/dev/null 2>&1", fs_type);

+	if (strstr(buf, "mkfs.tmpfs")) {
+		return 1;
+	}
+
 	ret = tst_system(buf);

 	if (WEXITSTATUS(ret) == 127) {
@@ -50,17 +55,30 @@ static int has_kernel_support(const char *fs_type, int flags)
 	static int fuse_supported = -1;
 	const char *tmpdir = getenv("TMPDIR");
 	char buf[128];
+	char template[PATH_MAX];
 	int ret;

 	if (!tmpdir)
 		tmpdir = "/tmp";

-	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
-	if (errno != ENODEV) {
+	sprintf(template, "%s/mountXXXXXX", tmpdir);
+	if (mkdtemp(template) == NULL) {
+		tst_res(TWARN | TERRNO , "%s: mkdtemp(%s) failed", __func__, template);
+	}
+
+	ret = mount("/dev/zero", template, fs_type, 0, NULL);
+	if ((ret && errno != ENODEV) || !ret) {
+		if (!ret)
+			tst_umount(template);
 		tst_res(TINFO, "Kernel supports %s", fs_type);
+		if (rmdir(template) == -1)
+			tst_res(TWARN | TERRNO, "rmdir %s failed", template);
 		return 1;
 	}

+	if (rmdir(template) == -1)
+		tst_res(TWARN | TERRNO, "rmdir %s failed", template);
+
 	/* Is FUSE supported by kernel? */
 	if (fuse_supported == -1) {
 		ret = open("/dev/fuse", O_RDWR);
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
