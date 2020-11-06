Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAED2A96AD
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:06:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84EEE3C60CC
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 14:06:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 12E1E3C282A
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:06:41 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1720F200055
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 14:06:40 +0100 (CET)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6D3Duf045106
 for <ltp@lists.linux.it>; Fri, 6 Nov 2020 08:06:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9TZBrFmIf9UONNom7pSi/mZZOM4sLu12MRYy1O5Onjg=;
 b=nJDsQcwBaFodiq6GJ2DUy1db1pPz/lkLcuF2xIr3NlqKtasdoSNSJ+ciYOa/ajrqXm1v
 PUntmKA4KW+kcpC8qyuW8WVdfuQkmA+mXq6D6x1MnUPjW+Q5DB/rnQIh7//SmCHQaLhY
 Zhssu8EyrIC0DPtL1XWXA///aQ2WVOApqHkb+ZWBMgyitNPKcI4eJRosseEzsKvaxJ0h
 tM9tvcEGwQ8VQ14BYEQI17/zqA1tGWYTWULGv8TYBrXGjOpE3NyDFxbxgAtB780nPZXh
 mSyqlD34/xY0VuCtxJlfndjlFpEuVGhF+YvRcw1swvwcSVk34OnwoPqcYbwFQ4xhsWbD Gw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34n3qr6y72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 08:06:39 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A6D6b8Q020342
 for <ltp@lists.linux.it>; Fri, 6 Nov 2020 13:06:37 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 34h01kkbq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 06 Nov 2020 13:06:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A6D6YIN1245948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Nov 2020 13:06:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32433AE053;
 Fri,  6 Nov 2020 13:06:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6E32AE04D;
 Fri,  6 Nov 2020 13:06:33 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.34.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Nov 2020 13:06:33 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri,  6 Nov 2020 14:06:22 +0100
Message-Id: <20201106130624.454614-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_04:2020-11-05,
 2020-11-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=1
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 mlxlogscore=762 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011060090
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] lib/tst_virt: support IBM/Z LPAR and z/VM
 virtualization environments
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

Support detection of virtualization environment on IBM System Z.

Alexander Egorenkov (2):
  lib/tst_virt: fix detection when systemd-detect-virt returns 1
  lib/tst_virt: support IBM/Z LPAR and z/VM virtualization environments

 include/tst_cpu.h |  3 +++
 lib/tst_virt.c    | 66 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 66 insertions(+), 3 deletions(-)

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
