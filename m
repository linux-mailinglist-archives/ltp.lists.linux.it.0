Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7C109D5D
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 12:56:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD1CA3C1D76
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 12:56:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 93DCB3C1D76
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:56:50 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E16331401AE1
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:56:49 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQBpcOO082172
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=nbYOpVcnQ1VLQ213nrgCS42l+fXoul8aytVbPslNFhs=;
 b=b9ixPHsnZeZLHFt0eB7RyFkL23SfycAt6on6+g7igtvogFmq9xZrCjo/PJOyW4l+Evvn
 xvgf2WO/RrFNxjmTb9HGv8TQfC8OpAK5dxxSHCQpYROFZlZJ8FQrkGAt13rf6aWyWQ2p
 pOQVEEpUAKGR9f/AVc9OGxDOoBJJdTFVyrCmQIyku9wDOsXLTu5HMfyCFZbgVcM9nPbu
 qPmQucuDkJmIwqvVTViF2crlhFG57MGhtDMrmagUFqWSS0YVvvSYYiqpxPQT6d6KapFw
 SJyg36evvaatmfRS6fa5m393+pY7lG38C9wdPt8aFv2E/2E6MSV3SyWSYtLDOdv+vLJ8 dQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2wewdr67fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:56:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQBsa4H054907
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:54:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2wgvfjcnxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:54:38 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQBrtGN007661
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 11:53:57 GMT
Received: from gyrotron.nl.oracle.com (/10.175.39.117)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 03:53:54 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue, 26 Nov 2019 14:53:43 +0300
Message-Id: <20191126115344.15926-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=1 spamscore=0 mlxscore=0 mlxlogscore=923
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=2 spamscore=0 clxscore=1015
 lowpriorityscore=2 mlxscore=0 impostorscore=0 mlxlogscore=976 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260107
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] network/iptables: reduce ping timeouts
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

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/network/iptables/iptables_tests.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/testcases/network/iptables/iptables_tests.sh b/testcases/network/iptables/iptables_tests.sh
index 11412d6fb..d8b23283f 100755
--- a/testcases/network/iptables/iptables_tests.sh
+++ b/testcases/network/iptables/iptables_tests.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2018 Oracle and/or its affiliates. All Rights Reserved.
+# Copyright (c) 2018-2019 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2001
 #
 #  Author:	Jan 20 2004 Hubert Lin <linux02NOSPAAAM@tw.ibm.com>
@@ -123,7 +123,7 @@ test2()
 	fi
 
 	tst_res TINFO "Pinging 127.0.0.1"
-	ping -c 2 127.0.0.1 > tst_iptables.out 2>&1
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
 		if [ $? -ne 0 ]; then
@@ -148,7 +148,7 @@ test2()
 		return
 	fi
 	tst_res TINFO "Pinging 127.0.0.1 again"
-	ping -c 2 127.0.0.1 > tst_iptables.out 2>&1
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "iptables blocking loopback. This is expected" \
 			       "behaviour on certain distributions where" \
@@ -174,7 +174,7 @@ test3()
 	fi
 
 	tst_res TINFO "Pinging 127.0.0.1"
-	ping -c 2 127.0.0.1 > tst_iptables.out 2>&1
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		grep "100% packet loss" tst_iptables.out > tst_iptables.err 2>&1
 		if [ $? -ne 0 ]; then
@@ -198,7 +198,7 @@ test3()
 		return
 	fi
 	tst_res TINFO "Pinging 127.0.0.1 again"
-	ping -c 2 127.0.0.1 > tst_iptables.out 2>&1
+	ping -c 2 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -ne 0 ]; then
 		tst_res TFAIL "iptables blocking ping requests. This is" \
 			      "expected behaviour on certain distributions" \
@@ -332,7 +332,7 @@ test6()
 	fi
 
 	tst_res TINFO "ping 127.0.0.1"
-	ping -c 10 127.0.0.1 > tst_iptables.out 2>&1
+	ping -c 10 127.0.0.1 -W 1 -i 0 > tst_iptables.out 2>&1
 	if [ $? -eq 0 ]; then
 		sleep 2
 		logcnt=$(dmesg | grep -c "$logprefix")
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
