Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E84B833067A
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 04:35:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A2DD3C55AF
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 04:35:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id DAAB63C1B60
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 04:35:19 +0100 (CET)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DE41620033A
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 04:35:17 +0100 (CET)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dv3pH1nqGzrS0c
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 11:33:27 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 8 Mar 2021 11:35:02 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Mon, 8 Mar 2021 11:34:28 +0800
Message-ID: <20210308033428.20924-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] proc01: Add /proc/dirty/dirty_list to known_issues
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

When we open the file /proc/dirty/dirty_list directly, it will return -1 and
set the errno to ENOMEM.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/fs/proc/proc01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/fs/proc/proc01.c b/testcases/kernel/fs/proc/proc01.c
index 96441d153..5ccac9c4d 100644
--- a/testcases/kernel/fs/proc/proc01.c
+++ b/testcases/kernel/fs/proc/proc01.c
@@ -85,6 +85,7 @@ static const struct mapping known_issues[] = {
 	{"open", "/proc/sal/init/data", EBUSY},
 	{"open", "/proc/sal/mca/data", EBUSY},
 	{"open", "/proc/fs/nfsd/pool_stats", ENODEV},
+	{"open", "/proc/dirty/dirty_list", ENOMEM},
 	{"read", "/proc/fs/nfsd/clients/*/ctl", EINVAL},
 	{"read", "/proc/acpi/event", EAGAIN},
 	{"read", "/proc/kmsg", EAGAIN},
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
