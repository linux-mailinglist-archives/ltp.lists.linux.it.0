Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6FD3B2750
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 08:16:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A2C33C6F4A
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 08:16:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 96C053C2298
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 08:15:57 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 920F4600D56
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 08:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1624515355; i=@fujitsu.com;
 bh=Vzn6OFe6tLakds27JXJQDVINRK+olsXVYCGhvkDIb1s=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=n5q9ePFrZLFJ3508UWFsKQNf1DnoTZdR4pg5KX1nD0UHW0+Yjr7fn9FWESYgMgb6a
 rZ1cs+4yUyStJ9bymjcqm0lPCpX8txp/t1jsb8BlUq3++ue9wjzI+BQPbTywTMRNfM
 t3jpIeizcLr+IdDszchoofSLwI0yj3HPBWvNhuj/TTfYYJHae5MtIL8gKYg59yRiup
 WZ23pOzlQf/mAVkeH7/PIYg/mBze/+itDekL+p3f7Xa5L/fei9QUfbi4xou6GEc1k1
 EfBZ7BNJJ0UcXoflYdQ6RBBJimJzrRGf405QMKjkTU0mBRoB+2paYXlOjFGMPtysKj
 Hdh3VInYCbroQ==
Received: from [100.113.1.143] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-central-1.aws.symcld.net id D6/4A-52906-B1324D06;
 Thu, 24 Jun 2021 06:15:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxVVda+Uq
 CwaTl/BbTXxxls1jxfQejA5PHvt/rWD3OLDjCHsAUxZqZl5RfkcCa0bvgPHvBIv6KrtvLmRoY
 7/N0MXJxCAm8ZpRomDadGcLZwyjxbusEli5GTg42AU2JZ50LmEFsEQFRic/Tz4HZzAK2Es8fX
 mIDsYUFEiXmXbzLBGKzCKhKvDr8hR3E5hXwkDh++xojiC0hoCAx5eF7Zoi4oMTJmU9YIOZISB
 x88YIZokZR4lLHN6j6CokZM7axTWDknYWkZRaSlgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXU
 NdY2MzPQSq3QT9VJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiBYZdSyPhoB+Pp1x/0DjFK
 cjApifLe57+SIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV0EBKCdYlJqeWpGWmQOMAZi0BAePk
 givpCxQmre4IDG3ODMdInWK0ZJj59F5i5g5mj4sAZKb5y5dxCzEkpeflyolztuiCNQgANKQUZ
 oHNw4Wp5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNWgEzhycwrgdv6CuggJqCDFH5fBDm
 oJBEhJdXAFD2/+EVlaeqnki8Kcy1Yzj14XN77soY7O52XL/Xq1m2nDbl2qnJc/8icMkmLw+3t
 dDnRfhWL1ogr5z9/P33qXoje4f5Nr0p99zw6k57VuPmyzd1jSQxSC2V2JW0qybuZYH72baT85
 gk8+q9lWL+JfXWSqfHuWpsu9enta3/Oni1l9ZqN8ff2xXicDjpYs/Tb1hBNg8cHLM/yr3c1nX
 pjlc2qj/c2BS1iuXNKpulO5oXZ/HJrpWqL7Ze0L2o+srx52qYLsZxPTOdeeMqYl/qgd2kg3+N
 DU6q1jr+e6lObq3fnwvlb3/TbTyxZue226vwZO1htbs8zbxC8fvAQb9vK1hcTP57ujFuxwrL7
 aod8k4wSS3FGoqEWc1FxIgDvM8kwTgMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-6.tower-226.messagelabs.com!1624515354!100243!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5687 invoked from network); 24 Jun 2021 06:15:55 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-6.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Jun 2021 06:15:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O6FmTY024151
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 24 Jun 2021 07:15:51 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 07:15:45 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 24 Jun 2021 14:16:13 +0800
Message-ID: <1624515373-3899-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] ipc/msgget03: Make sure we get ENOSPC error after
 creating MSGMNI message queues
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Even msgget() failed, this for loop still continues. So we can't know whether
system creates actual MSGMNI message queues and then fail with ENOSPC. Fix this by
reporting fail if msgget failed in setup.

Also make use of TST_EXP_FAIL2 macro.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 .../kernel/syscalls/ipc/msgget/msgget03.c     | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
index 8fa620855..da3753a19 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
@@ -20,22 +20,14 @@
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
 
-static int maxmsgs;
+static int maxmsgs, queue_cnt;
 static int *queues;
 static key_t msgkey;
 
 static void verify_msgget(void)
 {
-	TEST(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL));
-	if (TST_RET != -1)
-		tst_res(TFAIL, "msgget() succeeded unexpectedly");
-
-	if (TST_ERR == ENOSPC) {
-		tst_res(TPASS | TTERRNO, "msgget() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "msgget() failed unexpectedly,"
-			" expected ENOSPC");
-	}
+	TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
+		"msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
 }
 
 static void setup(void)
@@ -52,8 +44,9 @@ static void setup(void)
 		queues[num] = -1;
 
 		res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
-		if (res != -1)
-			queues[num] = res;
+		if (res == -1)
+			tst_brk(TBROK | TERRNO, "msgget failed unexpectedly");
+		queues[queue_cnt++] = res;
 	}
 
 	tst_res(TINFO, "The maximum number of message queues (%d) reached",
@@ -67,7 +60,7 @@ static void cleanup(void)
 	if (!queues)
 		return;
 
-	for (num = 0; num < maxmsgs; num++) {
+	for (num = 0; num < queue_cnt; num++) {
 		if (queues[num] != -1)
 			SAFE_MSGCTL(queues[num], IPC_RMID, NULL);
 	}
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
