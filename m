Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D481CAE08
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 15:09:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C0CEE3C2607
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 15:09:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8623E3C2602
 for <ltp@lists.linux.it>; Fri,  8 May 2020 15:09:15 +0200 (CEST)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BFE69201447
 for <ltp@lists.linux.it>; Fri,  8 May 2020 15:09:14 +0200 (CEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 048D3okp007625
 for <ltp@lists.linux.it>; Fri, 8 May 2020 09:09:12 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30vts7k8ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 08 May 2020 09:09:12 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 048D0AYO018325
 for <ltp@lists.linux.it>; Fri, 8 May 2020 13:09:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 30s0g5wfte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <ltp@lists.linux.it>; Fri, 08 May 2020 13:09:09 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 048D97TO63504472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 May 2020 13:09:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F940AE059;
 Fri,  8 May 2020 13:09:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A132AE045;
 Fri,  8 May 2020 13:09:07 +0000 (GMT)
Received: from oc3871087118.ibm.com (unknown [9.145.170.177])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 May 2020 13:09:06 +0000 (GMT)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: ltp@lists.linux.it
Date: Fri,  8 May 2020 15:09:03 +0200
Message-Id: <8f28b9797be3408c0c1086d0a2bc9c052b55bfe2.1588942426.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1588942426.git.agordeev@linux.ibm.com>
References: <cover.1588942426.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-08_12:2020-05-08,
 2020-05-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=684 lowpriorityscore=0 malwarescore=0
 suspectscore=1 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080111
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] lib/cloner.c: Use __clone instead of clone for
 s390
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

The kernel sys_clone and s390 glibc entry __clone assume
the flags parameter type as unsigned long. However, the
glibc clone wrapper used by ltp_clone helper defines flags
as signed int. That leads to gcc extending CLONE_IO flag of
0x80000000 value to 0xffffffff80000000.

A quick solution for s390 is to skip clone weak alias and
use __clone entry point directly.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 lib/cloner.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/cloner.c b/lib/cloner.c
index 11401f2..1192e4b 100644
--- a/lib/cloner.c
+++ b/lib/cloner.c
@@ -49,6 +49,11 @@ extern int __clone2(int (*fn) (void *arg), void *child_stack_base,
                     size_t child_stack_size, int flags, void *arg,
                     pid_t *parent_tid, void *tls, pid_t *child_tid);
 #endif
+#if defined(__s390__)
+# define clone __clone
+extern int __clone(int (*fn)(void *arg), void *child_stack, unsigned long flags,
+		   void *arg, pid_t *parent_tid, void *tls, pid_t *child_tid);
+#endif
 
 #ifndef CLONE_SUPPORTS_7_ARGS
 # define clone(fn, stack, flags, arg, ptid, tls, ctid) \
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
