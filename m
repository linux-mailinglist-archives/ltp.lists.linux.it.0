Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB71FD13C
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 17:50:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A691D3C2CB5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 17:50:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A186B3C1C9A
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 17:50:01 +0200 (CEST)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BF4C3140112E
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 17:50:00 +0200 (CEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05HFl4lP098201
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 15:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=O5Fo3AtXKxskAHMphsQLSnxCTON9KH4cxSeLcWPwKmE=;
 b=UN2h81LZT/leHafrOVJbygu+qXFfjs8IE95AAUye2bFQefTAy8GbBeIXKZ+Ggs8GiPOk
 fB98FAm/pet95+MkwVZOo6v55DFBJKZZST0j1Poka/qRvAmMbtyurYR7FhYT8iBBFEDS
 NBc5tVcMs0LaG9sAsUsKK4ikY8nEBO46TUYLMSCjaZkUPs18ONHkOsnCyEezx8BPYjtP
 KEsPzLhHW6txPgiRm4ceKHPmuIaFOcNbo+Bzqt+VYPwCbKPCDkr4OwixGFl0Vmg6Sbud
 4WF/RMky9T4K5YGJhwrKLbrVDwmuvoxCJcCcKaweCs5qS5lzBzlHzj+S995umAogn+g9 XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 31qecktrpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 15:49:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05HFneoA050359
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 15:49:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 31q66nbj94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 15:49:54 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05HFnrXl006575
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 15:49:54 GMT
Received: from gyrotron.uk.oracle.com (/10.175.162.47)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 17 Jun 2020 08:49:53 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Wed, 17 Jun 2020 18:49:26 +0300
Message-Id: <20200617154926.32588-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9655
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006170124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9655
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 cotscore=-2147483648 malwarescore=0
 clxscore=1015 adultscore=0 suspectscore=1 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006170124
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] network/nsf_lib.sh: TCONF on mount (udp/udp6) failure
 for Linux v5.6+
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

Most likely support is disabled with NFS_DISABLE_UDP_SUPPORT config
option (default y).
commit b24ee6c64ca7 ("NFS: allow deprecation of NFS UDP protocol")

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/network/nfs/nfs_stress/nfs_lib.sh | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/testcases/network/nfs/nfs_stress/nfs_lib.sh b/testcases/network/nfs/nfs_stress/nfs_lib.sh
index e236cd485..1bd057717 100644
--- a/testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ b/testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -87,11 +87,17 @@ nfs_mount()
 
 	tst_res TINFO "Mounting NFS: $mnt_cmd"
 	if [ -n "$LTP_NETNS" ] && [ -z "$LTP_NFS_NETNS_USE_LO" ]; then
-		tst_rhost_run -s -c "$mnt_cmd"
-		return
+		tst_rhost_run -c "$mnt_cmd"
+	else
+		$mnt_cmd > /dev/null
 	fi
 
-	ROD $mnt_cmd
+	if [ $? -ne 0 ]; then
+		if [ "$type" = "udp" -o "$type" = "udp6" ] && tst_kvcmp -ge 5.6; then
+			tst_brk TCONF "UDP support disabled with the kernel config NFS_DISABLE_UDP_SUPPORT?"
+		fi
+		tst_brk TBROK "mount command failed"
+	fi
 }
 
 nfs_setup()
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
