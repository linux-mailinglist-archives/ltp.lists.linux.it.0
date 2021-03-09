Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3742E3325F7
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:01:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC0143C555F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:01:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0348E3C4B96
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:01:53 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0297D200C30
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:01:51 +0100 (CET)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DvwK04rLBzmVBJ
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 20:59:32 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 21:01:37 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 9 Mar 2021 21:01:15 +0800
Message-ID: <20210309130115.9693-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

In many embedded system, we need add tmpfs to filesystem whitelist since
there is only tmpfs can be used to test.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>

---------------
v2->v3:
1)skipping mkfs for tmpfs gracefully.
2)replace sprintf with snprintf.
3)remove __func__ in the message
4)replace rmdir with SAFE_RMDIR
---------------
---
 lib/tst_supported_fs_types.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 00ede549d..b5e3cbe85 100644
--- a/lib/tst_supported_fs_types.c
+++ b/lib/tst_supported_fs_types.c
@@ -22,6 +22,7 @@ static const char *const fs_type_whitelist[] = {
 	"vfat",
 	"exfat",
 	"ntfs",
+	"tmpfs",
 	NULL
 };

@@ -32,6 +33,11 @@ static int has_mkfs(const char *fs_type)
 	char buf[128];
 	int ret;

+	if (strstr(fs_type, "tmpfs")) {
+		tst_res(TINFO, "mkfs is not needed for tmpfs");
+		return 1;
+	}
+
 	sprintf(buf, "mkfs.%s >/dev/null 2>&1", fs_type);

 	ret = tst_system(buf);
@@ -50,17 +56,28 @@ static int has_kernel_support(const char *fs_type, int flags)
 	static int fuse_supported = -1;
 	const char *tmpdir = getenv("TMPDIR");
 	char buf[128];
+	char template[PATH_MAX];
 	int ret;

 	if (!tmpdir)
 		tmpdir = "/tmp";

-	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
-	if (errno != ENODEV) {
+	snprintf(template, sizeof(template), "%s/mountXXXXXX", tmpdir);
+	if (mkdtemp(template) == NULL) {
+		tst_brk(TBROK | TERRNO , "mkdtemp(%s) failed", template);
+	}
+
+	ret = mount("/dev/zero", template, fs_type, 0, NULL);
+	if ((ret && errno != ENODEV) || !ret) {
+		if (!ret)
+			tst_umount(template);
 		tst_res(TINFO, "Kernel supports %s", fs_type);
+		SAFE_RMDIR(template);
 		return 1;
 	}

+	SAFE_RMDIR(template);
+
 	/* Is FUSE supported by kernel? */
 	if (fuse_supported == -1) {
 		ret = open("/dev/fuse", O_RDWR);
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
