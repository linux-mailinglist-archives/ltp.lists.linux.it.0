Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511C28F1EE
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:21:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D05393C5806
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:21:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B41B93C324C
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:21:21 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C47596002CE
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:21:20 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCENjX092324
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=UTNNXF26sT/A+p/sNMe7KK6TNLjVygZwr9PpdRtzkNc=;
 b=G45OOFA4NtxY6+cTeYAk2g9xZkAPHsQ1HO7/gnNoe/IGam1usppsqekLjS22i/jvvLk1
 UlX2wKAbdsEnsMpLYZIoJ8zBjBr+lGAroVqlUoZxESNwaSe1myRwetFBCcBANC9iJLih
 U9NoXz9T2WfMdHJDPk8ZvYFGbrkAZMkhb0iQ+E3CXt/pbhN1mcEHPcZ23Tlwbc1KmK/O
 APNuzc3zXjAjIZGcWH9Ja6ObAQ1LlVvvZQ8LrkydEbVddlrbbYifnsoero6vOx7Ug+kI
 OR8MpDl+9a6jO3/wStKzTu7UwE96DzXiwheoYikEm6huftrVOSMN3MfzreXGp+VgzLzW YA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3434wkvcdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCFLDp014221
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 343pv1rr4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09FCLEIh023932
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:16 GMT
Received: from gyrotron.uk.oracle.com (/10.175.204.150)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 05:21:13 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 15 Oct 2020 15:20:53 +0300
Message-Id: <20201015122056.20715-2-alexey.kodanev@oracle.com>
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
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] lib/tst_net: calc mean in tst_netload()
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

Add TST_NETLOAD_RUN_COUNT to control how many times netstress
test will be run to calculate the mean time value. Default is 5.

This value will divide the total number of requests in order
not to significantly increase the time for the test after this
patch.

Moreover, one of the runs can fail once, it will produce only a
warning. The test will broke after the second failure. It can
be useful to make sure we have reproducible results.

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/lib/tst_net.sh | 95 ++++++++++++++++++++++++++--------------
 1 file changed, 62 insertions(+), 33 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index b29e076c3..1912b984d 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -623,9 +623,11 @@ tst_wait_ipv6_dad()
 	done
 }
 
-tst_dump_rhost_cmd()
+tst_netload_brk()
 {
 	tst_rhost_run -c "cat $TST_TMPDIR/netstress.log"
+	cat tst_netload.log
+	tst_brk_ $1 $2
 }
 
 # Run network load test, see 'netstress -h' for option description
@@ -640,6 +642,7 @@ tst_netload()
 	# common options for client and server
 	local cs_opts=
 
+	local run_cnt="$TST_NETLOAD_RUN_COUNT"
 	local c_num="$TST_NETLOAD_CLN_NUMBER"
 	local c_requests="$TST_NETLOAD_CLN_REQUESTS"
 	local c_opts=
@@ -692,51 +695,76 @@ tst_netload()
 	local expect_ret=0
 	[ "$expect_res" != "pass" ] && expect_ret=3
 
-	tst_rhost_run -c "pkill -9 netstress\$"
-	s_opts="${cs_opts}${s_opts}-R $s_replies -B $TST_TMPDIR"
-	tst_res_ TINFO "run server 'netstress $s_opts'"
-	tst_rhost_run -c "netstress $s_opts" > tst_netload.log 2>&1
-	if [ $? -ne 0 ]; then
-		cat tst_netload.log
-		local ttype="TFAIL"
-		grep -e 'CONF:' tst_netload.log && ttype="TCONF"
-		tst_brk_ $ttype "server failed"
+	local was_failure=0
+	if [ "$run_cnt" -lt 2 ]; then
+		run_cnt=1
+		was_failure=1
 	fi
 
-	local port=$(tst_rhost_run -s -c "cat $TST_TMPDIR/netstress_port")
-	c_opts="${cs_opts}${c_opts}-a $c_num -r $c_requests -d $rfile -g $port"
+	s_opts="${cs_opts}${s_opts}-R $s_replies -B $TST_TMPDIR"
+	c_opts="${cs_opts}${c_opts}-a $c_num -r $((c_requests / run_cnt)) -d $rfile"
+
+	tst_res_ TINFO "run server 'netstress $s_opts'"
+	tst_res_ TINFO "run client 'netstress -l $c_opts' $run_cnt times"
 
-	tst_res_ TINFO "run client 'netstress -l $c_opts'"
-	netstress -l $c_opts > tst_netload.log 2>&1 || ret=$?
 	tst_rhost_run -c "pkill -9 netstress\$"
+	rm -f tst_netload.log
+
+	local res=0
+	local passed=0
+
+	for i in $(seq 1 $run_cnt); do
+		tst_rhost_run -c "netstress $s_opts" > tst_netload.log 2>&1
+		if [ $? -ne 0 ]; then
+			cat tst_netload.log
+			local ttype="TFAIL"
+			grep -e 'CONF:' tst_netload.log && ttype="TCONF"
+			tst_brk_ $ttype "server failed"
+		fi
 
-	if [ "$expect_ret" -ne 0 ]; then
-		if [ $((ret & expect_ret)) -ne 0 ]; then
-			tst_res_ TPASS "netstress failed as expected"
-		else
-			tst_res_ TFAIL "expected '$expect_res' but ret: '$ret'"
+		local port=$(tst_rhost_run -s -c "cat $TST_TMPDIR/netstress_port")
+		netstress -l ${c_opts} -g $port > tst_netload.log 2>&1
+		ret=$?
+		tst_rhost_run -c "pkill -9 netstress\$"
+
+		if [ "$expect_ret" -ne 0 ]; then
+			if [ $((ret & expect_ret)) -ne 0 ]; then
+				tst_res_ TPASS "netstress failed as expected"
+			else
+				tst_res_ TFAIL "expected '$expect_res' but ret: '$ret'"
+			fi
+			return $ret
+		fi
+
+		if [ "$ret" -ne 0 ]; then
+			[ $((ret & 32)) -ne 0 ] && \
+				tst_netload_brk TCONF "not supported configuration"
+
+			[ $((ret & 3)) -ne 0 -a $was_failure -gt 0 ] && \
+				tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"
+
+			tst_res_ TWARN "netstress failed, ret: $ret"
+			was_failure=1
+			continue
 		fi
-		return $ret
-	fi
+
+		[ ! -f $rfile ] && \
+			tst_netload_brk TFAIL "can't read $rfile"
+
+		res="$((res + $(cat $rfile)))"
+		passed=$((passed + 1))
+	done
 
 	if [ "$ret" -ne 0 ]; then
-		tst_dump_rhost_cmd
-		cat tst_netload.log
-		[ $((ret & 3)) -ne 0 ] && \
-			tst_brk_ TFAIL "expected '$expect_res' but ret: '$ret'"
-		[ $((ret & 32)) -ne 0 ] && \
-			tst_brk_ TCONF "not supported configuration"
 		[ $((ret & 4)) -ne 0 ] && \
 			tst_res_ TWARN "netstress has warnings"
+		tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"
 	fi
 
-	if [ ! -f $rfile ]; then
-		tst_dump_rhost_cmd
-		cat tst_netload.log
-		tst_brk_ TFAIL "can't read $rfile"
-	fi
+	res=$((res / $passed))
+	echo "$res" > $rfile
 
-	tst_res_ TPASS "netstress passed, time spent '$(cat $rfile)' ms"
+	tst_res_ TPASS "netstress passed, mean time '$res' ms"
 
 	return $ret
 }
@@ -938,6 +966,7 @@ export TST_NET_DATAROOT="$LTPROOT/testcases/bin/datafiles"
 export TST_NETLOAD_CLN_REQUESTS="${TST_NETLOAD_CLN_REQUESTS:-10000}"
 export TST_NETLOAD_CLN_NUMBER="${TST_NETLOAD_CLN_NUMBER:-2}"
 export TST_NETLOAD_BINDTODEVICE="${TST_NETLOAD_BINDTODEVICE-1}"
+export TST_NETLOAD_RUN_COUNT="${TST_NETLOAD_RUN_COUNT:-5}"
 export HTTP_DOWNLOAD_DIR="${HTTP_DOWNLOAD_DIR:-/var/www/html}"
 export FTP_DOWNLOAD_DIR="${FTP_DOWNLOAD_DIR:-/var/ftp}"
 export FTP_UPLOAD_DIR="${FTP_UPLOAD_DIR:-/var/ftp/pub}"
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
