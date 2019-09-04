Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37511A7B11
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 08:01:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A75043C2100
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 08:01:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1EC813C20A7
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 08:00:58 +0200 (CEST)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4A047600626
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 08:00:58 +0200 (CEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x846054X105979
 for <ltp@lists.linux.it>; Wed, 4 Sep 2019 06:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2019-08-05;
 bh=hcTOTpuntaC22AjLGP7PL7S94BYBGBAJSqXVFwxczj8=;
 b=eni9qVxwARrJJlkAY0vgtRKNDq+LQMOs914Rr9S033VlOGfZUZV6a/fKhvPONV5Gvc35
 JRYFCwIw8aa8mteg24oZMQMnZU10pLvW1LSJOxvLYR0N9PwmeOy1i6clPF2oqKdGqUsw
 cOW2HEJJwTadVH5OgrKxal4/hyc0GC1JORscF0W1omkTyeSg7U3MQYnQhE9LB17ha24E
 w232LC5IPpGtnRSLErra5Ql0VlqXF+ylHX44kZWWjnRbte2/6ZF11LmjvSS6w8xgKrJ1
 dvTRJhku0AHQktiRqGZ0TqWNBqYRX2pDHJbiZcw8H4xqC05qhkBwmICv30vE0HKcYi9P lg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2ut7kx805a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 04 Sep 2019 06:00:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x845wRDS026151
 for <ltp@lists.linux.it>; Wed, 4 Sep 2019 06:00:54 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2usu51eevm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <ltp@lists.linux.it>; Wed, 04 Sep 2019 06:00:54 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8460r7D021324
 for <ltp@lists.linux.it>; Wed, 4 Sep 2019 06:00:54 GMT
Received: from localhost.localdomain (/221.223.37.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Sep 2019 23:00:52 -0700
From: shuang.qiu@oracle.com
To: ltp@lists.linux.it
Date: Wed,  4 Sep 2019 14:00:23 +0800
Message-Id: <1567576823-10080-1-git-send-email-shuang.qiu@oracle.com>
X-Mailer: git-send-email 1.9.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040064
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] madvise09:Change PAGES size to the value more than 32
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
Change the PAGES to the value more than 32 can fix such issue.

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
+#define PAGES 64
 #define TOUCHED_PAGE1 0
 #define TOUCHED_PAGE2 10
 
-- 
1.9.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
