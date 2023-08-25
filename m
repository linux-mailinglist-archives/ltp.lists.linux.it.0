Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DA27885D8
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Aug 2023 13:35:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1945C3CC3FA
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Aug 2023 13:35:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6D6F03C8930
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 13:35:54 +0200 (CEST)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com
 [68.232.139.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AD86C1000D9B
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 13:35:53 +0200 (CEST)
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="129571091"
X-IronPort-AV: E=Sophos;i="6.02,195,1688396400"; d="scan'208";a="129571091"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 20:35:51 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com
 [192.168.87.60])
 by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A02DBCA1E6
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 20:35:48 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com
 [192.51.207.12])
 by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D2633D9463
 for <ltp@lists.linux.it>; Fri, 25 Aug 2023 20:35:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.215.131])
 by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0594488FD5;
 Fri, 25 Aug 2023 20:35:46 +0900 (JST)
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 25 Aug 2023 19:35:36 +0800
Message-Id: <1692963336-4007-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1692963336-4007-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1692963336-4007-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27834.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27834.007
X-TMASE-Result: 10--3.517500-10.000000
X-TMASE-MatchedRID: 53L3gibb0joKK0r2G9VU7k7nLUqYrlslFIuBIWrdOeOjEIt+uIPPOBUl
 FfwzsqyWj/os4F7akNn0SV7CRnVQRDcpdZ3fQiLdFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTt8fx
 dFDBKE7uovgWDUk5pbNbC+Ni79n7WuKc9894SVfP9t8W3FsJNEVQu1JJ/BkryaHtMiC+yc2AVuF
 OZanU8erOWCQCk2bXc723RGbqO3ZjyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] hugeshmctl03: Mark struct tcase and several
 functions as static
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

To follow LTP conventions.

Reviewed-by: Xiao Yang <yangx.jy@fujitsu.com>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
index 21ec6bf78..61e9704bb 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmctl/hugeshmctl03.c
@@ -44,7 +44,7 @@ static struct shmid_ds buf;
 static uid_t ltp_uid;
 static char *ltp_user = "nobody";
 
-struct tcase {
+static struct tcase {
 	int *shmid;
 	int cmd;
 	struct shmid_ds *sbuf;
@@ -97,7 +97,7 @@ static void do_child(void)
 	}
 }
 
-void setup(void)
+static void setup(void)
 {
 	long hpage_size;
 
@@ -118,7 +118,7 @@ void setup(void)
 	ltp_uid = getuserid(ltp_user);
 }
 
-void cleanup(void)
+static void cleanup(void)
 {
 	rm_shm(shm_id_1);
 }
-- 
2.39.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
