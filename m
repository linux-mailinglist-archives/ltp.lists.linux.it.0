Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C7C1D0981
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 09:07:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 206943C2596
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 09:07:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4D6213C1D31
 for <ltp@lists.linux.it>; Wed, 13 May 2020 09:07:06 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4B89014017CA
 for <ltp@lists.linux.it>; Wed, 13 May 2020 09:07:04 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,386,1583164800"; d="scan'208";a="91983469"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 15:06:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4D43C4BCC89B
 for <ltp@lists.linux.it>; Wed, 13 May 2020 15:06:57 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 15:06:57 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 13 May 2020 15:06:53 +0800
Message-ID: <1589353614-24423-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4D43C4BCC89B.AF1EA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v1 1/2] tpci: remove useless ENABLE_BRIDGES
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

Since the previous commit, we have removed test_enable_bridges() because
pci_enable_bridges() was removed in 3.12 (928bea964827). But it forgot
to delete it in tpci.h. So remove it.

Fixes: 3dd286b ("ltp_tpci.c: Update legacy code")
Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h b/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h
index f65c6fc22..f7defb29f 100644
--- a/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h
+++ b/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h
@@ -30,7 +30,6 @@ enum PCI_TCASES {
 	FIND_SUBSYS,
 	BUS_SCAN,
 	SLOT_SCAN,
-	ENABLE_BRIDGES,
 	BUS_ADD_DEVICES,
 	MATCH_DEVICE,
 	REG_DRIVER,
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
