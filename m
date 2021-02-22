Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC965320F71
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 03:32:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 515C53C659A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 03:32:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7A4663C0032
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 03:32:24 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5602A100055B
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 03:32:22 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,195,1610380800"; d="scan'208";a="104706438"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 10:32:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5E4294CE7312
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 10:32:19 +0800 (CST)
Received: from RHEL74GA.g08.fujitsu.local (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 10:32:21 +0800
From: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Sun, 21 Feb 2021 21:32:14 -0500
Message-ID: <1613961134-31207-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5E4294CE7312.A89D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] memcg_stat_test.sh: Add missing dot in cd command
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

Signed-off-by: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
---
 testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
index 3a62391..f531f87 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_stat_test.sh
@@ -109,7 +109,7 @@ test8()
 	cd subgroup
 	check_mem_stat "hierarchical_memsw_limit" $((PAGESIZE*2))
 
-	cd .
+	cd ..
 	rmdir subgroup
 }
 
-- 
1.8.3.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
