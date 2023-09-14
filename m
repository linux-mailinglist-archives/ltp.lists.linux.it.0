Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AA779CB2C
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Sep 2023 11:10:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61E3F3CE7E8
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Sep 2023 11:10:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C59973CBFDB
 for <ltp@lists.linux.it>; Tue, 12 Sep 2023 11:10:02 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9F5DE60563E
 for <ltp@lists.linux.it>; Tue, 12 Sep 2023 11:10:00 +0200 (CEST)
Received: from kwepemm600014.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RlHk54lSpztSWp
 for <ltp@lists.linux.it>; Tue, 12 Sep 2023 17:05:49 +0800 (CST)
Received: from huawei.com (10.175.100.195) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 12 Sep
 2023 17:09:54 +0800
To: <ltp@lists.linux.it>
Date: Fri, 15 Sep 2023 02:22:59 +0800
Message-ID: <20230914182259.29435-1-limin154@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [10.175.100.195]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.8 required=7.0 tests=DATE_IN_FUTURE_48_96,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] stress/udp/multi-diffip: bugfix for
 multi-diffip/udp4-multi-diffip01
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
From: Li Min via ltp <ltp@lists.linux.it>
Reply-To: Li Min <limin154@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

udp4-multi-diffip01: line 233: ret: unbound variable

Signed-off-by: Min Li <limin154@huawei.com>
---
 testcases/network/stress/udp/multi-diffip/udp4-multi-diffip01 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/stress/udp/multi-diffip/udp4-multi-diffip01 b/testcases/network/stress/udp/multi-diffip/udp4-multi-diffip01
index 92af9e438..c0d50efaf 100644
--- a/testcases/network/stress/udp/multi-diffip/udp4-multi-diffip01
+++ b/testcases/network/stress/udp/multi-diffip/udp4-multi-diffip01
@@ -230,7 +230,7 @@ while [ $ipaddr_pair_num -lt $IP_TOTAL_FOR_TCPIP ]; do
 	# Set IPv6 addresses to the interfaces
 	ip addr add ${lhost_addr}/${network_mask} dev $lhost_ifname

-	if [ $ret -eq 2 ]; then
+	if [ $? -eq 2 ]; then
 	ip addr del ${lhost_addr}/${network_mask} dev $lhost_ifname  2>&1
 	ip addr add ${lhost_addr}/${network_mask} dev $lhost_ifname
 	fi
--
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
