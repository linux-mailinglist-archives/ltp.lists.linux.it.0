Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A12021D0982
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 09:07:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 051473C2462
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 09:07:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id F1A623C54E3
 for <ltp@lists.linux.it>; Wed, 13 May 2020 09:07:10 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id EC58B1A011D3
 for <ltp@lists.linux.it>; Wed, 13 May 2020 09:07:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,386,1583164800"; d="scan'208";a="91983473"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 15:07:04 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id C2C264BCC89B
 for <ltp@lists.linux.it>; Wed, 13 May 2020 15:07:04 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 15:07:04 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 13 May 2020 15:06:54 +0800
Message-ID: <1589353614-24423-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589353614-24423-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1589353614-24423-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C2C264BCC89B.AFB0F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/2] tpci: Remove deprecated CONFIG_HOTPLUG
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

Since kernel commit 40b313608ad4 ("Finally eradicate CONFIG_HOTPLUG"),
it always supports hotplug. It is about 7 years old and many distributions
don't have this config, so we can remove it safely.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 README.kernel_config                                       | 1 -
 testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/README.kernel_config b/README.kernel_config
index ffb2dec95..547dd4f33 100644
--- a/README.kernel_config
+++ b/README.kernel_config
@@ -131,7 +131,6 @@ CONFIG_KEXEC_JUMP=y
 ---------------------------------
 Enabling HOTPLUG for your Kernels
 ---------------------------------
-CONFIG_HOTPLUG=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
 CONFIG_ACPI_HOTPLUG_CPU=y
diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
index a57953db6..e29821dda 100644
--- a/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
+++ b/testcases/kernel/device-drivers/pci/tpci_kernel/ltp_tpci.c
@@ -290,7 +290,6 @@ static int test_find_subsys(void)
  */
 static int test_scan_bus(void)
 {
-#ifdef CONFIG_HOTPLUG
 	int num;
 	struct pci_bus *bus = ltp_pci.bus;
 
@@ -307,10 +306,6 @@ static int test_scan_bus(void)
 	}
 	prk_info("success scan bus");
 	return TPASS;
-#else
-	prk_info("pci_rescan_bus() is not supported");
-	return TSKIP;
-#endif
 }
 
 /*
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
