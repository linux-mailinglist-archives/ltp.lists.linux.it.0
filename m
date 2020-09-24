Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E4276A7C
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:18:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 880653C59F8
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:18:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8C4063C078F
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:24 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DB30C100023E
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:23 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O78kmO175505
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=BVltFjNXufER6WVbUZkVPLd7eTYqdyVhtRCkOB+kzVg=;
 b=fFOPt9PZL1TGdoXzqkUdZV1AvgW65tAHhO4AdiivGbEqtBMrMaZiF/uvr0s7gTNTvNfA
 BV0oTPDxNpA/qZb0RrnkdztwGtPknn2qIGS2juLrgHdIqSIcc+BA8gTZlUeO69k/gTWK
 TXhww5E9W0aONQV4x3SC+y6gRmMcbm1Nb7lsH2zXFH0zJAWwc64lK2zHf0k5Wf0/UiT+
 G/uTpl1aCbrzAb6iX/N02nzkhUYPEfsk/U9ZPZcLt5SY26BgOlljLHhWnO+1Mt3M+Anu
 WJ4y/6FBZqwBJgOIBtZW9u2rff0QlZirBPm+b/lwOQ235vZC5FTbF8AYZN2gFmufWrZ3 hA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 33ndnupgvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O7ASHr084070
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:21 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 33nurvtsy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:21 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08O7IJOE005766
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:20 GMT
Received: from gyrotron.uk.oracle.com (/10.175.183.175)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 00:18:19 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 24 Sep 2020 10:17:36 +0300
Message-Id: <20200924071740.6963-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=1 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240054
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] network/ipsec: fix warning when using wrong
 option for ipv4
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

This patch is fixing the warning in ipsec vti setup:
Warning: nodad option can be set only for IPv6 addresses

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/network/stress/ipsec/ipsec_lib.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/testcases/network/stress/ipsec/ipsec_lib.sh b/testcases/network/stress/ipsec/ipsec_lib.sh
index d40941d45..198c9315d 100644
--- a/testcases/network/stress/ipsec/ipsec_lib.sh
+++ b/testcases/network/stress/ipsec/ipsec_lib.sh
@@ -295,11 +295,12 @@ tst_ipsec_setup_vti()
 	tst_ipsec_vti lhost $ip_loc $ip_rmt $tst_vti
 	tst_ipsec_vti rhost $ip_rmt $ip_loc $tst_vti
 
-	local mask=
+	local mask address_opt
 	if [ "$TST_IPV6" ]; then
 		ip_loc_tun="${IPV6_NET32_UNUSED}::1";
 		ip_rmt_tun="${IPV6_NET32_UNUSED}::2";
 		mask=64
+		address_opt=nodad
 		ROD ip -6 route add ${IPV6_NET32_UNUSED}::/$mask dev $tst_vti
 	else
 		ip_loc_tun="${IPV4_NET16_UNUSED}.1.1";
@@ -311,6 +312,6 @@ tst_ipsec_setup_vti()
 	tst_res TINFO "Add IPs to vti tunnel, " \
 		       "loc: $ip_loc_tun/$mask, rmt: $ip_rmt_tun/$mask"
 
-	ROD ip a add $ip_loc_tun/$mask dev $tst_vti nodad
+	ROD ip a add $ip_loc_tun/$mask dev $tst_vti $address_opt
 	tst_rhost_run -s -c "ip a add $ip_rmt_tun/$mask dev $tst_vti"
 }
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
