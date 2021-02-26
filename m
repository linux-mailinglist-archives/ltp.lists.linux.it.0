Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 51560325FA0
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 10:07:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B3483C5856
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 10:07:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 08D6C3C4E08
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 10:06:59 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B77A9600790
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 10:06:58 +0100 (CET)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dn3dJ0bGZzlQ9Y
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 17:04:52 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Feb 2021 17:06:46 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 26 Feb 2021 17:06:15 +0800
Message-ID: <20210226090615.231970-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
---
 lib/tst_supported_fs_types.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/tst_supported_fs_types.c b/lib/tst_supported_fs_types.c
index 00ede549d..696b6731e 100644
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
@@ -55,8 +60,8 @@ static int has_kernel_support(const char *fs_type, int flags)
 	if (!tmpdir)
 		tmpdir = "/tmp";

-	mount("/dev/zero", tmpdir, fs_type, 0, NULL);
-	if (errno != ENODEV) {
+	ret = mount("/dev/zero", tmpdir, fs_type, 0, NULL);
+	if (!ret) {
 		tst_res(TINFO, "Kernel supports %s", fs_type);
 		return 1;
 	}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
