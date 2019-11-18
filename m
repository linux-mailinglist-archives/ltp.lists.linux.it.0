Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8E51002A9
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 11:43:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0295D3C1841
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 11:43:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 752F13C0738
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 11:42:59 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7D51414001E7
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 11:42:58 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAIATCRX173868
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=wJrPSycAA0TWDTXVTES6ki15qwDQ4uaYylDJ1AWfhlM=;
 b=hPrvzQPb/wU1f7KdJBpykjVrYk5DZoXybmf7lU74A+GstyUYlzLoY3iKteaqQkybVGGB
 4zTwLNnsieybvOyNtKuNBq4CKv61HfM5kaocmjSyBGGEtLHmh6eDD8sMitnwC+lnq06Y
 9uywTfMwTYH1B8fYHNGYIS/hsFDiDl+1cNbyTIwI/7VTzL8iyj+UD3M32yXKvjXOLfkr
 HJB2wfKF+hkSKi4+6h604H0X8HIxGl6fNk9gZQP0CLKaZt7QpUXg5MOJiUA3UxZQheOt
 8E+DfpDUMficknRwIDX9E1pgih7wqdvsDaO7G9ASVYQ7ux0hn/UZAoCvztmmHLNI3jGv fA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2wa9rq782j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:42:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAIATASj047532
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:42:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2wau94cbkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:42:54 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAIAgouW024594
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:42:53 GMT
Received: from gyrotron.nl.oracle.com (/10.175.49.32)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 18 Nov 2019 02:42:50 -0800
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Mon, 18 Nov 2019 13:42:38 +0300
Message-Id: <20191118104238.15044-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9444
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=824
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911180095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9444
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=887 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911180095
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] lib/tst_net.sh: use SO_BINDTODEVICE in
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

Since we have the information about the device, enable the
auto usage of the option, when starting netstress.

It can be disabled with TST_NETLOAD_BINDTODEVICE=0 even if
'-D' option is passed to tst_netload().

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---

v2: * Added fixes for vti based tests and mpls
    * Control the usage with TST_NETLOAD_BINDTODEVICE

 testcases/lib/tst_net.sh                        | 10 +++++++++-
 testcases/network/mpls/mpls_lib.sh              |  2 +-
 testcases/network/stress/dccp/dccp_ipsec_vti.sh |  2 +-
 testcases/network/stress/sctp/sctp_ipsec_vti.sh |  2 +-
 testcases/network/stress/tcp/tcp_ipsec_vti.sh   |  3 ++-
 testcases/network/stress/udp/udp_ipsec_vti.sh   |  2 +-
 6 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 5e44ebdb2..5c619e358 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -641,6 +641,7 @@ tst_netload()
 	# number of server replies after which TCP connection is closed
 	local s_replies="${TST_NETLOAD_MAX_SRV_REPLIES:-500000}"
 	local s_opts=
+	local bind_to_device=1
 
 	if [ ! "$TST_NEEDS_TMPDIR" = 1 ]; then
 		tst_brk_ TBROK "Using tst_netload requires setting TST_NEEDS_TMPDIR=1"
@@ -668,7 +669,8 @@ tst_netload()
 		f) cs_opts="${cs_opts}-f " ;;
 		F) cs_opts="${cs_opts}-F " ;;
 		e) expect_res="$OPTARG" ;;
-		D) cs_opts="${cs_opts}-D $OPTARG " ;;
+		D) [ "$TST_NETLOAD_BINDTODEVICE" = 1 ] && cs_opts="${cs_opts}-D $OPTARG "
+		   bind_to_device=0 ;;
 		*) tst_brk_ TBROK "tst_netload: unknown option: $OPTARG" ;;
 		esac
 	done
@@ -676,6 +678,11 @@ tst_netload()
 
 	[ "$setup_srchost" = 1 ] && s_opts="${s_opts}-S $hostopt "
 
+	if [ "$bind_to_device" = 1 -a "$TST_NETLOAD_BINDTODEVICE" = 1 ]; then
+		c_opts="${c_opts}-D $(tst_iface) "
+		s_opts="${s_opts}-D $(tst_iface rhost) "
+	fi
+
 	local expect_ret=0
 	[ "$expect_res" != "pass" ] && expect_ret=3
 
@@ -891,6 +898,7 @@ fi
 
 export TST_NETLOAD_CLN_REQUESTS="${TST_NETLOAD_CLN_REQUESTS:-10000}"
 export TST_NETLOAD_CLN_NUMBER="${TST_NETLOAD_CLN_NUMBER:-2}"
+export TST_NETLOAD_BINDTODEVICE="${TST_NETLOAD_BINDTODEVICE:-1}"
 export HTTP_DOWNLOAD_DIR="${HTTP_DOWNLOAD_DIR:-/var/www/html}"
 export FTP_DOWNLOAD_DIR="${FTP_DOWNLOAD_DIR:-/var/ftp}"
 export FTP_UPLOAD_DIR="${FTP_UPLOAD_DIR:-/var/ftp/pub}"
diff --git a/testcases/network/mpls/mpls_lib.sh b/testcases/network/mpls/mpls_lib.sh
index 84b323615..4ac79950e 100755
--- a/testcases/network/mpls/mpls_lib.sh
+++ b/testcases/network/mpls/mpls_lib.sh
@@ -8,7 +8,7 @@ TST_NEEDS_ROOT=1
 TST_NEEDS_DRIVERS="mpls_router mpls_iptunnel mpls_gso"
 TST_NEEDS_CMDS="sysctl modprobe"
 TST_TEST_DATA="icmp tcp udp"
-
+TST_NETLOAD_BINDTODEVICE=0
 . tst_net.sh
 
 mpls_cleanup()
diff --git a/testcases/network/stress/dccp/dccp_ipsec_vti.sh b/testcases/network/stress/dccp/dccp_ipsec_vti.sh
index 5c8f78249..24c28fbde 100755
--- a/testcases/network/stress/dccp/dccp_ipsec_vti.sh
+++ b/testcases/network/stress/dccp/dccp_ipsec_vti.sh
@@ -16,7 +16,7 @@ do_test()
 	local rand_opt="$(echo $2 | cut -d'R' -f2)"
 
 	[ "$2" != "$rand_opt" ] && opts="-A $rand_opt"
-	tst_netload -H $ip_rmt_tun -T dccp $opts -r $IPSEC_REQUESTS
+	tst_netload -H $ip_rmt_tun -T dccp $opts -r $IPSEC_REQUESTS -D $tst_vti
 }
 
 tst_run
diff --git a/testcases/network/stress/sctp/sctp_ipsec_vti.sh b/testcases/network/stress/sctp/sctp_ipsec_vti.sh
index fe6135ac2..9c5747121 100755
--- a/testcases/network/stress/sctp/sctp_ipsec_vti.sh
+++ b/testcases/network/stress/sctp/sctp_ipsec_vti.sh
@@ -17,7 +17,7 @@ do_test()
 
 	[ "$2" != "$rand_opt" ] && opts="-A $rand_opt"
 	tst_netload -H $ip_rmt_tun -T sctp $opts -r $IPSEC_REQUESTS \
-		-S $ip_loc_tun
+		-S $ip_loc_tun -D $tst_vti
 }
 
 tst_run
diff --git a/testcases/network/stress/tcp/tcp_ipsec_vti.sh b/testcases/network/stress/tcp/tcp_ipsec_vti.sh
index 118db547a..41ab1ca98 100755
--- a/testcases/network/stress/tcp/tcp_ipsec_vti.sh
+++ b/testcases/network/stress/tcp/tcp_ipsec_vti.sh
@@ -18,7 +18,8 @@ do_test()
 	local rand_opt="$(echo $2 | cut -d'R' -f2)"
 
 	[ "$2" != "$rand_opt" ] && opts="-A $rand_opt"
-	tst_netload -H $ip_rmt_tun $opts -r $IPSEC_REQUESTS -R $max_requests
+	tst_netload -H $ip_rmt_tun $opts -r $IPSEC_REQUESTS \
+		    -R $max_requests -D $tst_vti
 }
 
 tst_run
diff --git a/testcases/network/stress/udp/udp_ipsec_vti.sh b/testcases/network/stress/udp/udp_ipsec_vti.sh
index 2afe70eee..d9a1e33af 100755
--- a/testcases/network/stress/udp/udp_ipsec_vti.sh
+++ b/testcases/network/stress/udp/udp_ipsec_vti.sh
@@ -19,7 +19,7 @@ do_test()
 
 	[ $1 -eq 2 ] && type="udp_lite"
 	[ "$2" != "$rand_opt" ] && opts="-A $rand_opt"
-	tst_netload -H $ip_rmt_tun -T $type $opts -r $IPSEC_REQUESTS
+	tst_netload -H $ip_rmt_tun -T $type $opts -r $IPSEC_REQUESTS -D $tst_vti
 }
 
 tst_run
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
