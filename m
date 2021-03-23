Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A50E3346B75
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 22:58:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 63E863C9468
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 22:58:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E232C3C9462
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 22:58:41 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AD4A31A00E21
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 22:58:40 +0100 (CET)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NLXMps074109; Tue, 23 Mar 2021 17:58:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4LVjkSJOzytLD6tJY6/ZRad6GE00ydx04Yfw+LE5C78=;
 b=SOzokrfjApCXTcZYsDSg6iBJzPpAf2L7VnN0/ePDR9DANpEpwrQe+4/ookCQudx4hbiy
 0HcP1CMGi0WjjIbSkIwsZsffNwkL3LHp3S8B8gygJthfcN2FbYmcu2tQ/y3YeE6GI91n
 ZzCVQ5LeaX+f+mMMGr7sK280PYTfVOimgHlQCNBYic9OaRgHIzemH4L3jPrBeog6Joqi
 4Q4xwyOhfgq1P233cFfVyVJ2SpssutMYjEEe6/DSSZO/k8s0JHyzStlErqKZWSZO01ym
 HOy/bLsI0W/4hi+dol6wGY6TPDK5n6Kj+KTaOTKg8o4f8KbMJzI1N+gukddeqgtghTP2 IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fkx8r9g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 17:58:25 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NLYVqU077008;
 Tue, 23 Mar 2021 17:58:25 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fkx8r9fn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 17:58:25 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NLwNpH001166;
 Tue, 23 Mar 2021 21:58:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 37d9a61y5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 21:58:22 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NLwJqM36241892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 21:58:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C65024C044;
 Tue, 23 Mar 2021 21:58:19 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 713904C040;
 Tue, 23 Mar 2021 21:58:19 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Mar 2021 21:58:19 +0000 (GMT)
From: Heiko Carstens <hca@linux.ibm.com>
To: Li Wang <liwang@redhat.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 23 Mar 2021 22:58:16 +0100
Message-Id: <20210323215819.4161164-1-hca@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YFmUrVOyX4q+8Dy9@osiris>
References: <YFmUrVOyX4q+8Dy9@osiris>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_11:2021-03-23,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=872
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230159
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] s390 vdso fixes
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
Cc: linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Li Wang reported that clock_gettime(CLOCK_MONOTONIC_RAW, ...) does not
work correctly on s390 via vdso. Debugging this also revealed an
unrelated bug (first patch).

The second patch fixes the problem: the tod clock steering parameters
required by __arch_get_hw_counter() are only present within the first
element of the _vdso_data array and not at all within the _timens_data
array.

Instead of working around this simply provide an s390 specific vdso
data page which contains the tod clock steering parameters.

This allows also to remove ARCH_HAS_VDSO_DATA again.

Heiko Carstens (3):
  s390/vdso: fix tod clock steering
  s390/vdso: fix arch_data access for __arch_get_hw_counter()
  lib/vdso: remove struct arch_vdso_data from vdso data struct

 arch/Kconfig                              |  3 ---
 arch/s390/Kconfig                         |  1 -
 arch/s390/include/asm/vdso.h              |  4 +++-
 arch/s390/include/asm/vdso/data.h         | 13 ------------
 arch/s390/include/asm/vdso/datapage.h     | 17 +++++++++++++++
 arch/s390/include/asm/vdso/gettimeofday.h | 11 ++++++++--
 arch/s390/kernel/time.c                   |  5 +++--
 arch/s390/kernel/vdso.c                   | 25 ++++++++++++++++++++---
 arch/s390/kernel/vdso64/vdso64.lds.S      |  3 ++-
 include/vdso/datapage.h                   | 10 ---------
 10 files changed, 56 insertions(+), 36 deletions(-)
 delete mode 100644 arch/s390/include/asm/vdso/data.h
 create mode 100644 arch/s390/include/asm/vdso/datapage.h

-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
