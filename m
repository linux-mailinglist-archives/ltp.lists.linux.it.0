Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16900826715
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jan 2024 02:23:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98B5C3CE581
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jan 2024 02:23:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CDAE23C080E
 for <ltp@lists.linux.it>; Mon,  8 Jan 2024 02:23:13 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=68.232.139.117;
 helo=esa4.hc1455-7.c3s2.iphmx.com; envelope-from=lizhijian@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com
 [68.232.139.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 05C39600796
 for <ltp@lists.linux.it>; Mon,  8 Jan 2024 02:23:11 +0100 (CET)
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="145697414"
X-IronPort-AV: E=Sophos;i="6.04,340,1695654000"; d="scan'208";a="145697414"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 10:23:09 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com
 [192.168.87.61])
 by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BDACF7FB8C
 for <ltp@lists.linux.it>; Mon,  8 Jan 2024 10:23:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com
 [192.51.206.22])
 by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC20BAA80F
 for <ltp@lists.linux.it>; Mon,  8 Jan 2024 10:23:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BB996BD7A
 for <ltp@lists.linux.it>; Mon,  8 Jan 2024 10:23:06 +0900 (JST)
Received: from FNSTPC.g08.fujitsu.local (unknown [10.167.226.45])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id F2F011A0070;
 Mon,  8 Jan 2024 09:23:05 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: ltp@lists.linux.it
Date: Mon,  8 Jan 2024 09:22:50 +0800
Message-ID: <20240108012252.2496776-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.003
X-TMASE-Result: 10--1.392700-10.000000
X-TMASE-MatchedRID: OVdoBgHyl5DlWiNI/3lAD07nLUqYrlslFIuBIWrdOeOcbyawsiRjd6PF
 jJEFr+olKE0Je8DR/D4CU1PRf9o2s90H8LFZNFG76sBnwpOylLN0cvS7x+R0Ui/H6FNR4JcDnXI
 4djFZoxVDlT3qeK4YngpdQVKPqzIgs1UsYRX572YA1gJqDoy5MS61zNC23bm8yMv+oWlS2PEhya
 dlGFXHKsTgfCdKUS4cicSkmYsAV+kLUU1zqiphVX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [RESEND PATCH 1/2] syscalls: setgroups: Add missing gitignore
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

setgroups{04,04_16} should be documented in .gitignore

Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 testcases/kernel/syscalls/setgroups/.gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/syscalls/setgroups/.gitignore b/testcases/kernel/syscalls/setgroups/.gitignore
index 9de928241f..0649a34251 100644
--- a/testcases/kernel/syscalls/setgroups/.gitignore
+++ b/testcases/kernel/syscalls/setgroups/.gitignore
@@ -4,3 +4,5 @@
 /setgroups02_16
 /setgroups03
 /setgroups03_16
+/setgroups04
+/setgroups04_16
-- 
2.41.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
