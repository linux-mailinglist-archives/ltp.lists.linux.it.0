Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CE1CAE0A
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 15:09:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A2783C2685
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 15:09:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D8C1B3C2600
 for <ltp@lists.linux.it>; Fri,  8 May 2020 15:09:16 +0200 (CEST)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A5340600568
 for <ltp@lists.linux.it>; Fri,  8 May 2020 15:09:01 +0200 (CEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 048D84nL042329
 for <ltp@lists.linux.it>; Fri, 8 May 2020 09:09:14 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30vtxgjqtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 08 May 2020 09:09:14 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 048D01tW018164
 for <ltp@lists.linux.it>; Fri, 8 May 2020 13:09:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 30s0g5wftc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 08 May 2020 13:09:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 048D96e25898698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 May 2020 13:09:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F10FAE053;
 Fri,  8 May 2020 13:09:06 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B864AE045;
 Fri,  8 May 2020 13:09:06 +0000 (GMT)
Received: from oc3871087118.ibm.com (unknown [9.145.170.177])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 May 2020 13:09:06 +0000 (GMT)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 15:09:01 +0200
Message-Id: <cover.1588942426.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-08_13:2020-05-08,
 2020-05-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=1 clxscore=1015 lowpriorityscore=0 spamscore=0
 mlxlogscore=716 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005080116
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] syscalls/kcmp03.c: Fix CLONE_IO failure on s390
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

This series fixes the CLONE_IO flag test on s390:

	kcmp03.c:82: FAIL: clone() Failed: EBADF (9)

The reason for the failure is CLONE_IO flag is sign-
extended to unsigned long and CLONE_INTO_CGROUP gets
set unintentionally. The kernel does its job well and
fails the syscall.

The fix is probably wrong, as the right solution needs to
accomodate all archs. I however, post it as a short-term
solution that might work for other archs as well.

Thanks!

Alexander Gordeev (2):
  syscalls/kcmp03.c: Extend clone_type type to unsigned long
  lib/cloner.c: Use __clone instead of clone for s390

 lib/cloner.c                            | 5 +++++
 testcases/kernel/syscalls/kcmp/kcmp03.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
