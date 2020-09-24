Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F42276A7F
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:18:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC5B93C59F6
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Sep 2020 09:18:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6AEA93C32C0
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:26 +0200 (CEST)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D01FC1A0064E
 for <ltp@lists.linux.it>; Thu, 24 Sep 2020 09:18:25 +0200 (CEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O7997p175725;
 Thu, 24 Sep 2020 07:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=mSZjdRWsk+xjvmTwoagqFhzId+BaZguAb82Q+di4YaA=;
 b=nHLn+43QuOxHP4nbpl/K5PRQnaidSrJzRQHKLurQEtShABR4Rz+ClHiXhhqLuTPNJXJX
 f36nefqpu1l0MmqaI6rVZwuavR2haUq3u8HPmM14AXrbZGAs9C0S/aPLGWgHXzPcSsmk
 LLi9s3JD5gDRZiQnBPTj1TO2AMZgDH29GeimGqW1kKQsVdDzW4k9mZQdfJahz5DU9lxi
 oLXha7hZVOj13KqEWr2hnEUOHEk6Xkn/FZbaF0u98dtzedBKJIJeN+Ek4+AhthsK6rMt
 fv0LbLVS2h8xAodWV/yXaEL+LCii0H4VcQeJN3qBTMOFmW85AwbgOfSAFLWpEYhvMHVo AQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 33ndnupgvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 07:18:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08O7ASvT084057;
 Thu, 24 Sep 2020 07:18:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 33nurvtt04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 07:18:23 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08O7IM76005774;
 Thu, 24 Sep 2020 07:18:22 GMT
Received: from gyrotron.uk.oracle.com (/10.175.183.175)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 00:18:22 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 24 Sep 2020 10:17:38 +0300
Message-Id: <20200924071740.6963-3-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200924071740.6963-1-alexey.kodanev@oracle.com>
References: <20200924071740.6963-1-alexey.kodanev@oracle.com>
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
 clxscore=1015 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240054
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH resend 3/5] network/nsf_lib.sh: TCONF on mount
 (udp/udp6) failure for Linux v5.6+
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
Reviewed-by: Petr Vorel <pvorel@suse.cz>
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
