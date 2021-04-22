Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 469DA368151
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:17:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FECD3C6AE7
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 15:17:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B19AB3C6AD4
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:17:03 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DC514201743
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:17:02 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MCA684076735
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=os1trUIZa+kMigpbdCg70PMRoFzuWT+GW6yAW0gbjO4=;
 b=OIUo5t+/R9oKMbj+dxV/AkkJdOZLEEcV/GhvD+4G/Dsb8WfSmTKJdMLT1SOc2p3m/b5C
 KGRk8IahOPu5hJiVZlLUeW5c4+estP6wSt2k4+m+rmdQAuyZ7TyeSNnWO4IlK/d7w1CX
 74G7fbt66eo8hoTlAI9lNpwuATuJiqZ2hwEuL/Aq00Cjq5f0947RQ76P/cFTd8GhpNvC
 THkU6tcrpSgYDI9zHuSuHC7XHwHU7qM8xHh8JOMOLwJcd3hxSA40TiKeAWxJWlVaKqe1
 upXVYsFPUFunb+gePVYqIYPPF/Er9Da0W4HdwZebvrntQyXgSZCwLvsFGdGOe4MD26iI RA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 38022y4qhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:17:00 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13MDG3q3051084
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:16:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3809evw95v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:16:59 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13MDGxuu055700
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 13:16:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 3809evw953-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 13:16:59 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13MDGvl4008744;
 Thu, 22 Apr 2021 13:16:57 GMT
Received: from gyrotron.nl.oracle.com (/10.175.36.197)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 22 Apr 2021 06:16:57 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 22 Apr 2021 16:16:28 +0300
Message-Id: <20210422131630.28565-2-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210422131630.28565-1-alexey.kodanev@oracle.com>
References: <20210422131630.28565-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: yNLoiZS5x4cLn7eQJQIkAzJY277k6hCl
X-Proofpoint-GUID: yNLoiZS5x4cLn7eQJQIkAzJY277k6hCl
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0
 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220103
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] lib/tst_test.sh: add TST_IPV6_FLAG ('-6')
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

Move the flag from route_lib.sh, it will also be used in
the other net tests.

It's set to blank for IPv4 and to '-6' for IPv6.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/lib/tst_net.sh                    |  4 +++-
 testcases/lib/tst_test.sh                   |  2 +-
 testcases/network/stress/route/route-lib.sh | 15 +++++++--------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index ee35bdd5c..fc5719057 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -18,11 +18,13 @@ TST_SETUP="tst_net_setup"
 # Blank for an IPV4 test; 6 for an IPV6 test.
 TST_IPV6=${TST_IPV6:-}
 TST_IPVER=${TST_IPV6:-4}
+# Blank for IPv4, '-6' for IPv6 test.
+TST_IPV6_FLAG=${TST_IPV6_FLAG:-}
 
 tst_net_parse_args()
 {
 	case $1 in
-	6) TST_IPV6=6 TST_IPVER=6;;
+	6) TST_IPV6=6 TST_IPVER=6 TST_IPV6_FLAG="-6";;
 	*) [ "$TST_PARSE_ARGS_CALLER" ] && $TST_PARSE_ARGS_CALLER "$1" "$2";;
 	esac
 }
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index a6a8e9579..dcd470dfc 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -540,7 +540,7 @@ tst_run()
 			NEEDS_ROOT|NEEDS_TMPDIR|TMPDIR|NEEDS_DEVICE|DEVICE);;
 			NEEDS_CMDS|NEEDS_MODULE|MODPATH|DATAROOT);;
 			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
-			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
+			IPV6|IPV6_FLAG|IPVER|TEST_DATA|TEST_DATA_IFS);;
 			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
 			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG|NETLOAD_CLN_NUMBER);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
diff --git a/testcases/network/stress/route/route-lib.sh b/testcases/network/stress/route/route-lib.sh
index a5bb96c12..194bd40cc 100644
--- a/testcases/network/stress/route/route-lib.sh
+++ b/testcases/network/stress/route/route-lib.sh
@@ -91,20 +91,19 @@ setup_if()
 
 test_netlink()
 {
+	local opt="-c $ROUTE_CHANGE_NETLINK $TST_IPV6_FLAG -p $ROUTE_RHOST_PORT $ROUTE_CHANGE_NETLINK_PARAMS"
+	local cmd="route-change-netlink"
 	local ret=0
-	local cmd ip_flag
-	[ "$TST_IPV6" ] && ip_flag="-6"
 
-	cmd="route-change-netlink -c $ROUTE_CHANGE_NETLINK $ip_flag -p $ROUTE_RHOST_PORT $ROUTE_CHANGE_NETLINK_PARAMS"
-	tst_res TINFO "running $cmd"
-	$cmd || ret=$?
+	tst_res TINFO "running $cmd $opt"
+	$cmd $opt || ret=$?
 	if [ "$ret" -ne 0 ]; then
 		[ $((ret & 3)) -ne 0 ] && \
-			tst_brk TFAIL "route-change-netlink failed"
+			tst_brk TFAIL "$cmd failed"
 		[ $((ret & 32)) -ne 0 ] && \
 			tst_brk TCONF "not supported configuration"
 		[ $((ret & 4)) -ne 0 ] && \
-			tst_res TWARN "route-change-netlink has warnings"
+			tst_res TWARN "$cmd has warnings"
 	fi
-	tst_res TPASS "route-change-netlink passed"
+	tst_res TPASS "$cmd passed"
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
