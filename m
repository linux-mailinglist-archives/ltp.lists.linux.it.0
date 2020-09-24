Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4FD276A81
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:18:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 420F33C59F6
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:18:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 47A483C59F6
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:29 +0200 (CEST)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9E85D1401256
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:28 +0200 (CEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O79bcc025596
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=dllox0nnQYJErSjmfyl4HS3ydqNoohOKHLImrZcJU3A=;
 b=M1YH8AXZarEFWNHKoQoBD3U4wNWMIDf9ZqlDMHHfjZXvuqACGxXn/boI3Q3s0xmzHB+r
 icQ/m1ERixCoF9/2dlw8gPl2iXRrrVh4+BY2NkaqK+DxSA5nA2Rd086/N/FfuhR4i8KF
 n06IzAXY4vPXp2EFJGbQSN7A40LDB+Zrlt/cS+PJgKsdeWK92iGHwBXSxpbhKxANWtKE
 y5yCI3qLhqhrdRyp782tfFb2KUJMlS3pdnk8GA31hdkizUHYJVndUrAozJA0MBlyICZ8
 49YVinGCaMzT9aRPXKMG8Tog/2yLHXhDPI5oNNGeNAgxh9ApzriTjd2+ZDnO0xGR07Xl 7A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 33qcpu3ctn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O7AFeb008695
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 33r28wmtfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:26 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08O7IOVb030217
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 07:18:25 GMT
Received: from gyrotron.uk.oracle.com (/10.175.183.175)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 00:18:24 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 24 Sep 2020 10:17:40 +0300
Message-Id: <20200924071740.6963-5-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200924071740.6963-1-alexey.kodanev@oracle.com>
References: <20200924071740.6963-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=933
 suspectscore=1 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240054
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=941
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240054
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] network/ipneigh01: use ROD when deleting the
 entries
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
 testcases/network/tcp_cmds/ipneigh/ipneigh01.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/network/tcp_cmds/ipneigh/ipneigh01.sh b/testcases/network/tcp_cmds/ipneigh/ipneigh01.sh
index e15dd708c..6ad987c49 100755
--- a/testcases/network/tcp_cmds/ipneigh/ipneigh01.sh
+++ b/testcases/network/tcp_cmds/ipneigh/ipneigh01.sh
@@ -20,14 +20,14 @@ do_setup()
 	case $CMD in
 	ip)
 		SHOW_CMD="ip neigh show"
-		DEL_CMD="ip neigh del $(tst_ipaddr rhost) dev $(tst_iface)"
+		DEL_CMD="ROD ip neigh del $(tst_ipaddr rhost) dev $(tst_iface)"
 		;;
 	arp)
 		if [ -n "$TST_IPV6" ]; then
 			tst_brk TCONF "'arp' doesn't support IPv6"
 		fi
 		SHOW_CMD="arp -a"
-		DEL_CMD="arp -d $(tst_ipaddr rhost) -i $(tst_iface)"
+		DEL_CMD="ROD arp -d $(tst_ipaddr rhost) -i $(tst_iface)"
 		;;
 	*)
 		tst_brk TBROK "unknown or missing command, use -c [ arp | ip ]"
@@ -75,7 +75,7 @@ do_test()
 		[ "$ret" -ne 0 ] && \
 			tst_brk TFAIL "$entry_name entry '$(tst_ipaddr rhost)' not listed"
 
-		$DEL_CMD || tst_brk TFAIL "fail to delete entry"
+		$DEL_CMD
 
 		$SHOW_CMD | grep -q "$(tst_ipaddr rhost).*$(tst_hwaddr rhost)" && \
 			tst_brk TFAIL "'$DEL_CMD' failed, entry has " \
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
