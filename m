Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8131E685
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 07:58:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1675A3C65FB
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 07:58:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7D7573C54E9
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 07:58:52 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1B13F6019A8
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 07:58:50 +0100 (CET)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dh59m6nbSzjPMV
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 14:57:16 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Feb 2021 14:58:38 +0800
From: zhao gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 18 Feb 2021 14:57:58 +0800
Message-ID: <20210218065758.230880-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_mkfs: bugfix for lib/tst_mkfs.c
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

Tmpfs is the only one filesystem in many embedded system, so
LTP_DEV_FS_TYPE should be set to tmpfs in many testcases, for
example syscalls/chown04, and in these cases, tests will be failed
because there is no mkfs tool for tmpfs.

Signed-off-by: zhao gongyi <zhaogongyi@huawei.com>
---
 lib/tst_mkfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/tst_mkfs.c b/lib/tst_mkfs.c
index 45dd83ad3..40141fead 100644
--- a/lib/tst_mkfs.c
+++ b/lib/tst_mkfs.c
@@ -44,6 +44,11 @@ void tst_mkfs_(const char *file, const int lineno, void (cleanup_fn)(void),
 		return;
 	}

+	if (!strcmp(fs_type, "tmpfs")) {
+		tst_resm_(file, lineno, TINFO, "Need not fomat for TMPFS filesystem");
+		return;
+	}
+
 	snprintf(mkfs, sizeof(mkfs), "mkfs.%s", fs_type);

 	if (fs_opts) {
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
