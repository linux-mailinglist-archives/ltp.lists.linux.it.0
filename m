Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E67653514B4
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 14:05:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C64B3C77BC
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 14:05:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D2FEC3C22A1
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 14:05:39 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CE80A1000F5A
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 14:05:37 +0200 (CEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FB1zf6kqkz93L5
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 20:03:26 +0800 (CST)
Received: from hulk-robot-4.huawei.com (10.175.124.27) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 20:05:25 +0800
From: Wang Xin <wangxin410@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 1 Apr 2021 12:51:27 +0000
Message-ID: <20210401125127.45600-1-wangxin410@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] ltp_tpci.c: Add release operation before allocation
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
Cc: Wang Xin <wangxin410@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When we run the test case, the following results will be obtained:
test_pci  283  TPASS  :  PCI bus 7d slot 00 : Test-case '11'
test_pci  284  TFAIL  :  tpci.c:74: PCI bus 7d slot 00 : Test-case '12'
...
test_pci  300  TFAIL  :  tpci.c:74: PCI bus 7d slot 01 : Test-case '12'
test_pci  301  TPASS  :  PCI bus 7d slot 01 : Test-case '13'

The analysis is that the space allocated by the bios is insufficient.
The solution to this problem can be in add pci_release_resource(dev, i)
before system resources are reallocated.Because the resources have been
allocated when the system is initialized.If it is redistributed, it
should be released and then allocated.

Signed-off-by: Wang Xin <wangxin410@huawei.com>
---
 testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
index e29821dda..5b0896093 100644
--- a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
+++ b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
@@ -439,6 +439,7 @@ static int test_assign_resources(void)
 		if (r->flags & IORESOURCE_MEM &&
 			r->flags & IORESOURCE_PREFETCH) {
+			pci_release_resource(dev, i);
 			ret = pci_assign_resource(dev, i);
 			prk_info("assign resource to '%d', ret '%d'", i, ret);
 			rc |= (ret < 0 && ret != -EBUSY) ? TFAIL : TPASS;
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
