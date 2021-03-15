Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 891FD33AA15
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 04:43:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19A753C4E2A
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Mar 2021 04:43:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8877F3C2E31
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 04:43:15 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F09CA10006CD
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 04:43:13 +0100 (CET)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzMdW0vfGzNmLv
 for <ltp@lists.linux.it>; Mon, 15 Mar 2021 11:40:47 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 11:43:00 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 15 Mar 2021 11:42:42 +0800
Message-ID: <20210315034242.27545-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] SPDX-License-Identifier: Remove redundancy lines
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

Remove redundancy lines of "SPDX-License-Identifier".

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/memfd_create/memfd_create03.c | 1 -
 testcases/kernel/syscalls/memfd_create/memfd_create04.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/testcases/kernel/syscalls/memfd_create/memfd_create03.c b/testcases/kernel/syscalls/memfd_create/memfd_create03.c
index 16d168525..ea846626a 100644
--- a/testcases/kernel/syscalls/memfd_create/memfd_create03.c
+++ b/testcases/kernel/syscalls/memfd_create/memfd_create03.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-License-Identifier: GPL-2.0-or-later

 /*
  *  Copyright (c) Zilogic Systems Pvt. Ltd., 2018
diff --git a/testcases/kernel/syscalls/memfd_create/memfd_create04.c b/testcases/kernel/syscalls/memfd_create/memfd_create04.c
index 659431cd9..52cc9b1ac 100644
--- a/testcases/kernel/syscalls/memfd_create/memfd_create04.c
+++ b/testcases/kernel/syscalls/memfd_create/memfd_create04.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-// SPDX-License-Identifier: GPL-2.0-or-later

 /*
  *  Copyright (c) Zilogic Systems Pvt. Ltd., 2018
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
