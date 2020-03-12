Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A241832E5
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 15:25:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC5103C5EBC
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Mar 2020 15:25:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D48653C5E8E
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 15:25:40 +0100 (CET)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 266B21A01939
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 15:25:39 +0100 (CET)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CENOUb110360
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 14:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=xsTvyz/zJ8h4nTMt7chJXj6fmLzlxzMw8GOauCJOzxw=;
 b=ooyfBOPmXpVMMv4J7sWlfjvImzXJcWHWhu+CeuqYFK70cKV8SEO7mhEX4DAmAETFVAs2
 Ruh0yt4dqw5aAi8wEEm7ohUT5NUfkhW0Q780cNm3yoqHUircGnmLlONi2tc/wPdSmCmM
 pcVtOHCvJgtBsI5ThpPzzZqCCT8xmTzR9LU06tBvUkDCmydyBmBOV7DD92Hf8IYVaSjU
 4YoSF3ikLGTOxuIHT+lWoUc9kDhSRIEwaXmK8YnzBNaBuN8ZLlwYBZ2tFrzapMcDEyUW
 AU7IBEVMpoNm3tjMT9xC7Evt9jxJ32Z7fR6aNoVvzd9kTgVQEwhSLAbyzC5mV+0tq2Sb SA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2yqkg892pu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 14:25:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CEMrDU188136
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 14:25:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2yqkvmrvpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 14:25:36 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02CEPWqH004946
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 14:25:35 GMT
Received: from gyrotron.nl.oracle.com (/10.175.52.245)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Mar 2020 07:25:31 -0700
From: Alexey Kodanev <alexey.kodanev@oracle.com>
To: ltp@lists.linux.it
Date: Thu, 12 Mar 2020 17:25:20 +0300
Message-Id: <20200312142520.25842-1-alexey.kodanev@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=1
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=1 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120078
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] proc01: exclude /proc/nfsd/clients/*/ctl
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

"ctl" files are write-only, added in Linux 5.3 with this commit
89c905beccbb ("nfsd: allow forced expiration of NFSv4 clients")

Before the patch:
proc01      1  TFAIL  :  proc01.c:396: read failed: /proc/fs/nfsd/clients/13/ctl: errno=EINVAL(22): Invalid argument
proc01      0  TINFO  :  /proc/fs/nfsd/unlock_filesystem: known issue: errno=EINVAL(22): Invalid argument
proc01      0  TINFO  :  /proc/fs/nfsd/unlock_ip: known issue: errno=EINVAL(22): Invalid argument
...

After:
proc01      0  TINFO  :  /proc/fs/nfsd/clients/13/ctl: known issue: errno=EINVAL(22): Invalid argument
proc01      0  TINFO  :  /proc/fs/nfsd/unlock_filesystem: known issue: errno=EINVAL(22): Invalid argument
proc01      0  TINFO  :  /proc/fs/nfsd/unlock_ip: known issue: errno=EINVAL(22): Invalid argument
...

Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
---
 testcases/kernel/fs/proc/proc01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/fs/proc/proc01.c b/testcases/kernel/fs/proc/proc01.c
index d917591bf..96843695c 100644
--- a/testcases/kernel/fs/proc/proc01.c
+++ b/testcases/kernel/fs/proc/proc01.c
@@ -85,6 +85,7 @@ static const struct mapping known_issues[] = {
 	{"open", "/proc/sal/init/data", EBUSY},
 	{"open", "/proc/sal/mca/data", EBUSY},
 	{"open", "/proc/fs/nfsd/pool_stats", ENODEV},
+	{"read", "/proc/fs/nfsd/clients/*/ctl", EINVAL},
 	{"read", "/proc/acpi/event", EAGAIN},
 	{"read", "/proc/kmsg", EAGAIN},
 	{"read", "/proc/sal/cpe/event", EAGAIN},
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
