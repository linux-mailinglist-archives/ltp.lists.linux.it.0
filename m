Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 231A012335E
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 18:19:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAFDF3C226D
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Dec 2019 18:19:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 7AD353C18F9
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:19:53 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 952A0200FC0
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 18:19:52 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHHJTmf026157
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=jFZVl4PYAL4anvrCfW0SpFiIiyOqUEQVpIukKfpnY+s=;
 b=oohl5GtTCUM34cKCcjCzSwP4krJbVnb3ZeIVOy9t3YmTrfUMeFgPrTAYyRQkdSW4sPU5
 h+1CQt4TkE+XR6KkZEdvJACyBoCresQeH+bIGZLUhwYbl7mf/ZQpNIfxn1MfV4scxIcu
 5ViVGwNU8c4ZcZWSl0YvCybWn2ij92CeEOmNhX98txbnhbLTOu6varm10LG1m3fgB1Hi
 Nww2lTUhpSCJAZEwqJvdy1n3LJO6Tz8xgyQ2N7Nvnjc2goFdnAPWel5Zl8Fd25+W1AL/
 in8THslhEhWc6WuEKvoRyqH2+SgHasBg4fsH7Ec00VKs+JmIC/g98JKed/4dz4x45FfU FQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2wvqpq85y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHHJIko117268
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2wxm4w0asj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:49 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBHHJj2a021003
 for <ltp@lists.linux.it>; Tue, 17 Dec 2019 17:19:48 GMT
Received: from gyrotron.nl.oracle.com (/10.175.8.42)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Dec 2019 09:19:45 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue, 17 Dec 2019 20:19:17 +0300
Message-Id: <20191217171918.10237-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=927
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912170137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=1 spamscore=0 clxscore=1015
 lowpriorityscore=1 mlxscore=0 impostorscore=0 mlxlogscore=973 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912170137
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] network/iptables: reduce ping timeouts
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
v2: no changes

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
