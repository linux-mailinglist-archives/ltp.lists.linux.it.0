Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 096692A96B0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:06:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AEAA33C6671
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:06:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 096873C282A
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:06:43 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 842B7200D19
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:06:42 +0100 (CET)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6D3Sdv164647
 for <ltp@lists.linux.it>; Fri, 6 Nov 2020 08:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wlqUjrdnB6hWq76UIeIbzE+gV7R+AYNJQiY3VpuwTvg=;
 b=f8jikd2huzaKFwCjkvslRUhvvIBIBEnvrFqTzFWl/4vqgWa+v9zCm+2bt2RUUa+WOCFk
 UDw775lbPA291CyZU4HSWb4lNlL63yN9nJqQ0VQ7/7FOHg+a92OIl+LC3MWbAotiRKD4
 7zVAUBKis1cIKE0anCAcQ0xPAOvNz7ueDCij5lCJZ0A2eF1Fzt/M4ryzxMl3EKfgqop8
 OpFp5UDz8nGHqFE+QuV1JpxH9vYX/UV8KFu0jipHrC2mgBVlNFinuZ3+wsmoNx489sHl
 EURg8TmdSz+kwhX0u8YNG6EOHuRpGcuxI4uWXlTNtKiVdhphVher8S6k/waeHpDXZ10N AQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34n3jp7139-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 08:06:40 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6D37eN008205
 for <ltp@lists.linux.it>; Fri, 6 Nov 2020 13:06:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 34h01ue8tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 13:06:38 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0A6D6ZNT59965818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 13:06:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DD15AE053;
 Fri,  6 Nov 2020 13:06:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F499AE045;
 Fri,  6 Nov 2020 13:06:35 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.34.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Nov 2020 13:06:35 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri,  6 Nov 2020 14:06:23 +0100
Message-Id: <20201106130624.454614-2-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201106130624.454614-1-egorenar@linux.ibm.com>
References: <20201106130624.454614-1-egorenar@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_04:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxlogscore=730
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011060092
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/tst_virt: fix detection when
 systemd-detect-virt returns 1
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

From: Alexander Egorenkov <Alexander.Egorenkov@ibm.com>

When systemd-detect-virt detects no virtualization environment,
it returns 1 as exit code. This leads to tst_is_virt not doing any
fallback tests.

The problem can be reproduced inside a IBM System Z LPAR virtualization
environment.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 lib/tst_virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/tst_virt.c b/lib/tst_virt.c
index 53d33e69c..914a08d96 100644
--- a/lib/tst_virt.c
+++ b/lib/tst_virt.c
@@ -109,9 +109,9 @@ int tst_is_virt(int virt_type)
 {
 	int ret = try_systemd_detect_virt();
 
-	if (ret >= 0) {
+	if (ret > 0) {
 		if (virt_type == VIRT_ANY)
-			return ret != 0;
+			return 1;
 		else
 			return ret == virt_type;
 	}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
