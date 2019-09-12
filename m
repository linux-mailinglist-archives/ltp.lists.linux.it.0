Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C8B0852
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 07:37:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A60C33C20C5
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 07:37:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AFEAB3C0638
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 07:37:26 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E123C1401B06
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 07:37:25 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8C5YC6U141270
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=hSsfsk2ki9/XP1AKFxYXFYivYxlyP6NZHBAVBWA/foE=;
 b=XtjOyF0NegV0aKJGdcYLZ9vdRcngfZocZnGxQA+ZSd5E0BsaoSzwAbBUin6IDgsYUSMZ
 5FxNZQ3ipS0Yz91Fcb3kWuU2Q7YkHRAnyIF2jGYohcR2q539EiRbS0V2E4juXE10Ct5d
 G0pX3KOExVCL5lRrfwSu2C2kIP5GZuKVeCPmval6KG6qvAPS8PCyJoD2FcNT5+/dVANz
 ot+k5XzQS2zoT387hJT4P0VpRSrtwidcYSQmJaEptbp7QI4X0ZAl4TZ3kOvbfq2aS0fU
 5FSCiyfa0w2Lp37otZGp5UDA90Y9+ZAneRfxlrMu5K4c4fnp130Od/gul59+OXnZJQFv jA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2uw1m964dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:37:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8C5XXYb003734
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:37:23 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2uy33bqn8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:37:23 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8C5bMPu011735
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 05:37:22 GMT
Received: from localhost.localdomain (/10.191.17.180)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 11 Sep 2019 22:37:22 -0700
From: shuang.qiu@oracle.com
To: ltp@lists.linux.it
Date: Thu, 12 Sep 2019 13:37:15 +0800
Message-Id: <1568266635-17666-1-git-send-email-shuang.qiu@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909120057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9377
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909120057
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2] madvise09:Update PAGES to a larger value
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

From: Shuang Qiu <shuang.qiu@oracle.com>

In upstream patch 1a61ab (mm: memcontrol: replace zone summing with lruvec_page_state()),
it modify the lruvec state in batch,equal and less than 32 MADV_FREE pages will not trigger
the account of lruvec_stat,and will not be free in memory pressure either.
So the testcase may fail with:
...
madvise09.c:219: INFO: Memory hungry child 6178 started, try 10
madvise09.c:254: INFO: Memory map: pppppppppppppppppppppppppppppppp
madvise09.c:259: FAIL: No MADV_FREE page was freed on low memory
...
We should allocate several megabytes to avoid depending kernel implementation details, 
which would mean allocating thousands of pages.
Setting PAGES=970 so that it will just avoid hitting the WARN that "message is too long" 
in tst_res(TINFO, "Memory map: %s", map).

Signed-off-by: Shuang Qiu <shuang.qiu@oracle.com>
---
 testcases/kernel/syscalls/madvise/madvise09.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/madvise/madvise09.c b/testcases/kernel/syscalls/madvise/madvise09.c
index 01075f6..3759053 100644
--- a/testcases/kernel/syscalls/madvise/madvise09.c
+++ b/testcases/kernel/syscalls/madvise/madvise09.c
@@ -57,7 +57,7 @@ static int sleep_between_faults;
 
 static int swap_accounting_enabled;
 
-#define PAGES 32
+#define PAGES 970
 #define TOUCHED_PAGE1 0
 #define TOUCHED_PAGE2 10
 
-- 
1.9.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
