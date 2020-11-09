Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DB92ABFD4
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:28:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B42EF3C2FCA
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 16:28:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 547EF3C0489
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:28:54 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A2CE11A006E0
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 16:28:53 +0100 (CET)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9F3DnT056544
 for <ltp@lists.linux.it>; Mon, 9 Nov 2020 10:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JDny8kyenVMdvpMrvvkKq9YFDaJ5kZgLNOqENiWrce0=;
 b=Fm/9UF5IA2poXhzS0ofAvbqpK+c2S2CgTO0M1A79kpMag+2O/Iy4rjt5Q01t8NwGlx0f
 fNtBZ7A20HkZJbV7+8S4ahLOodNM45ma172KPZ9fyFHN/GtvCdzA7j7Md+keQB0L+Ee5
 /CUUzM/kOX9SDFuGwsVcKfE3Gwa2wjMQAikDZtNwZjuO2xOgzFQ8ZqZSwS8XGJ7gA4Qv
 zZt6o4k+fUc+WDJzQM82cTgTO8xq1tFdNIBUc3Ygb6m5GW6m+MkfecUfQwxVDAeSLISe
 WAksBe9ZfUtvkVIQGvPKrtH6gOsqoROBh+1G+T625UBCQ8arl/gXylI6dB3EsD0y9Nuo Rg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34q74ek4c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 10:28:51 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A9FRabH008383
 for <ltp@lists.linux.it>; Mon, 9 Nov 2020 15:28:49 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 34nk7813tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 15:28:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A9FSjiS65732884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Nov 2020 15:28:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1A09A404D;
 Mon,  9 Nov 2020 15:28:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F92A4040;
 Mon,  9 Nov 2020 15:28:45 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.3.151])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  9 Nov 2020 15:28:45 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Mon,  9 Nov 2020 16:28:37 +0100
Message-Id: <20201109152837.657853-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_07:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxlogscore=843 phishscore=0 spamscore=0
 impostorscore=0 suspectscore=1 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011090102
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] lib/tst_virt: fix is_ibmz(VIRT_IBMZ) on IBM
 System Z
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
Cc: Alexander Egorenkov <Alexander.Egorenkov@ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

is_ibmz(VIRT_IBMZ) always returns 0 which is incorrect on IBM System Z.
Don't check virt_type unnecessarily because it is checked later on
in the switch statement.

Fixes commit b2cc450f3 ("lib/tst_virt: support IBM/Z LPAR and z/VM virtualization environments").

Signed-off-by: Alexander Egorenkov <Alexander.Egorenkov@ibm.com>
Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 lib/tst_virt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/tst_virt.c b/lib/tst_virt.c
index 1c6e41548..e72352464 100644
--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -70,9 +70,6 @@ static int is_ibmz(int virt_type)
 	char line[64];
 	int found_lpar, found_zvm;
 
-	if (virt_type != VIRT_IBMZ_LPAR && virt_type != VIRT_IBMZ_ZVM)
-		return 0;
-
 	if (access("/proc/sysinfo", F_OK) != 0)
 		return 0;
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
