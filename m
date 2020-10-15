Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F56D28F1EC
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:21:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C236C3C325C
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Oct 2020 14:21:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 92E463C23F5
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:21:21 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BE50C600D9D
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 14:21:20 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCEbJN092403
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=iPj4VbM7F3glZtqcuKKby9ieuRJfXD3NEZGDlhljUZE=;
 b=tMIoq0PiQnZ9HzWVoOElHAE+s45G0teEx0/MbIGHqt9NuoNk9dBhOtJuRb+N1ZnimWWE
 4izQYjrDBe+Mh29kSdSiEjDuBkpdYDv0Zc/Jj31dksm82aoZin6TvLZO0IhNkHNwEqMk
 ZsXmii2BvI2eqHwZamqH1Fo5onDDbTZURU92pWxtKjLcW4QmA262M3rDpOv6e1WNW7V0
 ApeAMm6nfrOdd0LHRRuj7ARk4pkWQ1lW3x0Tr/LK0NUK4euAH3CMmw3Wv54dTDH/LGpp
 Riz4M7ituz1HGPNefA0toqnWbzStaSkQnfxlh2C7nWppzvD4g1oShArg2c/ZrI/BZ/cz 4A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 3434wkvcdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09FCFj56035404
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 343phr0mgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:17 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09FCLFP2020861
 for <ltp@lists.linux.it>; Thu, 15 Oct 2020 12:21:16 GMT
Received: from gyrotron.uk.oracle.com (/10.175.204.150)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 15 Oct 2020 05:21:14 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 15 Oct 2020 15:20:54 +0300
Message-Id: <20201015122056.20715-3-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201015122056.20715-1-alexey.kodanev@oracle.com>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=824 malwarescore=0 mlxscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9774
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=1 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=836
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010150089
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/5] network/virt: skip setting neighbour table if
 tunnel doesn't have hwaddr
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
 testcases/network/virt/virt_lib.sh | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
index 80b9bcc90..f62120347 100644
--- a/testcases/network/virt/virt_lib.sh
+++ b/testcases/network/virt/virt_lib.sh
@@ -229,10 +229,13 @@ virt_minimize_timeout()
 	local mac_loc="$(cat /sys/class/net/ltp_v0/address)"
 	local mac_rmt="$(tst_rhost_run -c 'cat /sys/class/net/ltp_v0/address')"
 
-	ROD_SILENT "ip ne replace $ip_virt_remote lladdr \
-		    $mac_rmt nud permanent dev ltp_v0"
-	tst_rhost_run -s -c "ip ne replace $ip_virt_local lladdr \
-			     $mac_loc nud permanent dev ltp_v0"
+	if [ "$mac_loc" ]; then
+		ROD_SILENT "ip ne replace $ip_virt_remote lladdr \
+			    $mac_rmt nud permanent dev ltp_v0"
+		tst_rhost_run -s -c "ip ne replace $ip_virt_local lladdr \
+				     $mac_loc nud permanent dev ltp_v0"
+	fi
+
 	virt_tcp_syn=$(sysctl -n net.ipv4.tcp_syn_retries)
 	ROD sysctl -q net.ipv4.tcp_syn_retries=1
 }
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
