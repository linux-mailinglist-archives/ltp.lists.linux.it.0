Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272F45D4EC
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Nov 2021 07:46:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C3183C7336
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Nov 2021 07:46:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A76E3C0551
 for <ltp@lists.linux.it>; Thu, 25 Nov 2021 07:46:20 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 77D5420121C
 for <ltp@lists.linux.it>; Thu, 25 Nov 2021 07:46:17 +0100 (CET)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J07gF5vcYz90xm
 for <ltp@lists.linux.it>; Thu, 25 Nov 2021 14:45:45 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 25 Nov 2021 14:46:13 +0800
Received: from ubuntu1804.huawei.com (10.67.174.55) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 25 Nov 2021 14:46:13 +0800
To: <ltp@lists.linux.it>
Date: Thu, 25 Nov 2021 14:47:00 +0800
Message-ID: <20211125064700.90843-1-threefifteen.wangkunfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] acpi/ltp_acpi_cmds: Add kfree() and ACPI_FREE() to
 resolve memory leaks
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
From: Wang Kunfeng via ltp <ltp@lists.linux.it>
Reply-To: Wang Kunfeng <threefifteen.wangkunfeng@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1.In acpi_traverse_from_root() function,add kfree(dev_info) after using
acpi_get_object_info()
2.In acpi_test_resources() function,add  ACPI_FREE(buffer.pointer) after
using acpi_get_current_resources()
---
 testcases/kernel/device-drivers/acpi/ltp_acpi_cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/device-drivers/acpi/ltp_acpi_cmds.c b/testcases/kernel/device-drivers/acpi/ltp_acpi_cmds.c
index 0ce70c6c1..d12dd6b94 100644
--- a/testcases/kernel/device-drivers/acpi/ltp_acpi_cmds.c
+++ b/testcases/kernel/device-drivers/acpi/ltp_acpi_cmds.c
@@ -221,6 +221,7 @@ static int acpi_traverse_from_root(void)
 		if (acpi_failure(status, "acpi_object_info failed"))
 			return 1;
 		prk_info("start from %4.4s", (char *)&dev_info->name);
+		kfree(dev_info);
 	} else {
 		/* continue with the last visited child */
 		parent = start_parent;
@@ -430,6 +431,7 @@ static int acpi_test_resources(void)
 	prk_alert("TEST -- acpi_get_current_resources");
 	status = acpi_get_current_resources(res_handle, &buffer);
 	err = acpi_failure(status, "failed get_current_resources");
+	ACPI_FREE(buffer.pointer);

 #ifdef ACPI_FUTURE_USAGE
 	prk_alert("TEST -- acpi_get_possible_resources");
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
