Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4233628F1ED
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:21:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED7FC3C5803
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:21:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B09693C29C1
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:21:21 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C3E27600EA4
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:21:20 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCEMaG092298
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=cS3p72FOJI+SGYpe/jjo2nLEOSTQusXd0ZGkrVU9U84=;
 b=qp5jnzjUeZHwVSMYkE+ZFgOFt9IirImhxd9/DjMs5gHZfAOUnc7Zp8y1wkJR8tk63NLb
 VGXJaKTqIvMsCde3BzhCQaCDgcyCA6B4U9toKYrRFWcdaaNSAtb5ezDXyQpfCRHPC0MP
 m2dqsbGNf1RI5Z6C6TAA9NwW7m+J6dv8Knd3JuouxATspD3f+YXge51OLoyhT9vwfM+r
 PqTGG1/Yuq8yBdknnEigHpV/IvFNSLewlX6LFUnr8MNJgZf1AvPAvdRVVhc0rW3dydZS
 LMeyRm0oqP6Vx4asFpXWpGvUdq0dialdlcEIrz4AgKXLhNeVZS+yTN5tYD/3c5dcbaLD 3A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3434wkvcdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCFLqT014165
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 343pv1rr5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:18 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09FCLHA6025327
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:18 GMT
Received: from gyrotron.uk.oracle.com (/10.175.204.150)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 05:21:16 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 15 Oct 2020 15:20:56 +0300
Message-Id: <20201015122056.20715-5-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015122056.20715-1-alexey.kodanev@oracle.com>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=1 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=1 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150089
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] network/virt: add wireguard02: ipsec vs wireguard
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

Compare multi-threading performance with IPSec/vti.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 runtest/net.features                  |  2 ++
 testcases/lib/tst_test.sh             |  2 +-
 testcases/network/virt/wireguard02.sh | 48 +++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100755 testcases/network/virt/wireguard02.sh

diff --git a/runtest/net.features b/runtest/net.features
index c5a1ba714..617a6b91e 100644
--- a/runtest/net.features
+++ b/runtest/net.features
@@ -81,3 +81,5 @@ fanout01 fanout01
 
 wireguard01 wireguard01.sh
 wireguard01_ipv6 wireguard01.sh -6
+wireguard02 wireguard02.sh
+wireguard02_ipv6 wireguard02.sh -6
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index f2bd1e3ef..2417da140 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -506,7 +506,7 @@ tst_run()
 			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
 			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
 			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
-			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG);;
+			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG|NETLOAD_CLN_NUMBER);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
 		done
diff --git a/testcases/network/virt/wireguard02.sh b/testcases/network/virt/wireguard02.sh
new file mode 100755
index 000000000..c16ae68d1
--- /dev/null
+++ b/testcases/network/virt/wireguard02.sh
@@ -0,0 +1,48 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Oracle and/or its affiliates. All Rights Reserved.
+
+TST_CLEANUP=cleanup
+TST_TESTFUNC=test1
+TST_SETUP=wireguard_lib_setup
+
+. ipsec_lib.sh
+. wireguard_lib.sh
+
+IPSEC_MODE="tunnel"
+IPSEC_PROTO="esp_aead"
+AEALGO="rfc4106_256"
+EALGO="aes"
+AALGO="sha256"
+
+cleanup()
+{
+	wireguard_lib_cleanup
+	tst_ipsec_cleanup
+}
+
+test1()
+{
+	local wgaddr
+	local clients_num="$TST_NETLOAD_CLN_NUMBER"
+
+	# Enforce multi-threading test, at least with 10 TCP clients
+	[ $clients_num -lt 10 ] && clients_num=10
+
+	tst_res TINFO "test wireguard"
+
+	[ -n "$TST_IPV6" ] && wgaddr="$ip6_virt_remote" || wgaddr="$ip_virt_remote"
+	tst_netload -H $wgaddr -a $clients_num -D ltp_v0
+	local time_wg=$(cat tst_netload.res)
+	wireguard_lib_cleanup
+
+	tst_res TINFO "test IPSec $IPSEC_MODE/$IPSEC_PROTO $EALGO"
+	tst_ipsec_setup_vti
+	tst_netload -H $ip_rmt_tun -a $clients_num -D $tst_vti
+	local time_ipsec=$(cat tst_netload.res)
+	tst_ipsec_cleanup
+
+	tst_netload_compare $time_ipsec $time_wg -100
+}
+
+tst_run
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
