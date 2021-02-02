Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C77430BF8D
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:35:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 099EA3C7452
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:35:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D82A43C4F6E
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:35:32 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 244E6600977
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:35:31 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DTk5b132146
 for <ltp@lists.linux.it>; Tue, 2 Feb 2021 13:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=K8M95xCjF86qjI31SW9qaZ8tH354KJWQwg8xCTjs5k4=;
 b=MK2X5x8VGn5gFsODocMUxfBuzn7pRMQy9NHrOnKkMZTgvrj1lE2xARPJhcu7tLsbRfYx
 knczm/Bf+sVapbC7wXAuF+7Yr6YPSgHkH7siIv6sQHa4DZj1Wb6uxv6W3ASweqs2vsRE
 zsIA+dw9WsdzupW/YS8YpolYP8GEbNL5FMkmDcPFX6zMP9p/eto4+gBgqzeBO7acZafz
 Jw+7NKsPgFk7azaj9Qtu2hBPJ1UUDylC2BWa//1J3tsq67ZGFZvCB4Z7F70+rkYRTGcw
 ytNRaqvjj+Ob+WMA+g9dPvmrhamfa6ADQ4vaQY6DafKmtL3KXphLfeflWBbNMyZbX7ap Ig== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 36dn4wgn7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Tue, 02 Feb 2021 13:35:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 112DVT7U049532;
 Tue, 2 Feb 2021 13:35:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 36dh1p15p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 13:35:27 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 112DZPsr006991;
 Tue, 2 Feb 2021 13:35:25 GMT
Received: from gyrotron.nl.oracle.com (/10.175.12.115)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Feb 2021 05:35:25 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Tue,  2 Feb 2021 16:34:52 +0300
Message-Id: <20210202133454.59224-2-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202133454.59224-1-alexey.kodanev@oracle.com>
References: <20210202133454.59224-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020092
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020092
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] lib/tst_net.sh: print all netstress results in
 tst_netload()
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

This helps during debugging when you need to see from which
dataset the final result was obtained (mean).

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/lib/tst_net.sh | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index ef9354903..f1a498306 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -710,7 +710,7 @@ tst_netload()
 	tst_rhost_run -c "pkill -9 netstress\$"
 	rm -f tst_netload.log
 
-	local res=0
+	local results
 	local passed=0
 
 	for i in $(seq 1 $run_cnt); do
@@ -751,7 +751,7 @@ tst_netload()
 		[ ! -f $rfile ] && \
 			tst_netload_brk TFAIL "can't read $rfile"
 
-		res="$((res + $(cat $rfile)))"
+		results="$results $(cat $rfile)"
 		passed=$((passed + 1))
 	done
 
@@ -761,10 +761,14 @@ tst_netload()
 		tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"
 	fi
 
-	res=$((res / $passed))
-	echo "$res" > $rfile
+	local mean res_sum
+	for r in $results; do
+		res_sum="$((res_sum + r))"
+	done
+	mean=$((res_sum / passed))
+	echo "$mean" > $rfile
 
-	tst_res_ TPASS "netstress passed, mean time '$res' ms"
+	tst_res_ TPASS "netstress passed, mean time $mean ms, data:$results"
 
 	return $ret
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
