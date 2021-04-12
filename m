Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D835C439
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 12:41:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59FB93C74C3
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 12:41:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1FE9C3C1BB4
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 12:41:52 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 47E236006CC
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 12:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1618224110; i=@fujitsu.com;
 bh=4ZAOnpru/cicw0GzAmgrM4zfkRRsXdzxPruUe+UW1sg=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=kHzYxRAYvM3uWKodMZsUibl0azCaDHYZKhxz4tQQoLjtXCTWx2owkCYfKL1nv8k5V
 fVnJBGoGOjuQFFMUVdojN3RLLLh2al2CGtxE7FOAY4R3TSiBQDUy2Z1MUtsAu7CBZg
 U5Gow/1aUdqVIR/bhyyj5iG7yi5grPkTR2N6dZBMVrRng4CgoqaMOoP9g/yEWwpU7k
 EHPVbipr5JQcV10pFsIssVST1r9TGRuvEQ6cLADCOaNm66ZovpUSTG65amLMOzbe5b
 9Y1A09Bu2rhdKsxumdoYlT1Pqxess4vXLOBGds4y902AuK8Dd6LOjJy5qQlosdb35K
 oRV2l5JEXPkpg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 03/EF-38244-EE324706;
 Mon, 12 Apr 2021 10:41:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxVfetckm
 CweuH5hYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa0Z362XmgguCFTv/azQw/uPvYuTiEBJoYZL4
 cu8UC4Szm1Fi5rJpbF2MnBxsApoSzzoXMIPYIgISEh0Nb9lBbGYBdYnlk34xgdjCAj4SPVemg
 tWzCKhKzJ10iRHE5hXwlLi04TFYXEJAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBTNEjaLEpY5vjB
 B2pUTn+gWMExh5ZyFpmYWkZQEj0ypGy6SizPSMktzEzBxdQwMDXUNDY10gaWqol1ilm6iXWqq
 bnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAywlEKG6TsY17z5oHeIUZKDSUmUt02iJEGILyk/
 pTIjsTgjvqg0J7X4EKMMB4eSBC8zMGSFBItS01Mr0jJzgMEOk5bg4FES4WUASfMWFyTmFmemQ
 6ROMSpKifMagSQEQBIZpXlwbbAIu8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDcIZApPZl
 4J3PRXQIuZgBZf3FoIsrgkESEl1cDkelz82qrV9k9qlwgknVVk6lBleLx/Dqvns5sOfivvqp4
 5d4d5qpXEuz+P97+2d1iVONXTJHvm70vc8cLKN7w6Jt7eyl2w67Bm5W6O1aV+UV/rHA7MjnzF
 FHxAzareoX+Ll91m77tb5c8n3+WbKPnqUb2Kzze7eQy7bPnnbtCUz3tp6ae5VeSo9vRFV932J
 LWuaD929dn6Dp5m9ptZrmUrhKpZOvNmabwWnKpbIx91lu36x/l3d3EGsAmxTZcT3/a3Tjc1YL
 Fb7qlDB6wNbrBNSZv4tjulhUNX1Ib77XLWeh3jCRLr9D47LYx9WnZf47qbYvIX3rOSyVJfyyc
 wyezY0sKvansuKjlL4lsBl4cSS3FGoqEWc1FxIgC+/6mOKwMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-23.tower-232.messagelabs.com!1618224109!268233!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11960 invoked from network); 12 Apr 2021 10:41:49 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-23.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Apr 2021 10:41:49 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13CAfekj032043
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 11:41:49 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Apr 2021 11:41:39 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 12 Apr 2021 19:41:50 +0800
Message-ID: <1618227710-27541-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED] syscalls/sched_rr_get_interval: Fix wrong TTERRNO
 usage
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

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval01.c    | 2 +-
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval02.c    | 2 +-
 .../syscalls/sched_rr_get_interval/sched_rr_get_interval03.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 9d9ddf32e..5da5fe51d 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -42,7 +42,7 @@ static void setup(void)
 	tp.type = tv->ts_type;
 
 	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
-		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
+		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 
 	proc_flag = !access(PROC_SCHED_RR_TIMESLICE_MS, F_OK);
 }
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
index 0e98fec56..9a0b8673d 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval02.c
@@ -36,7 +36,7 @@ static void setup(void)
 	tp.type = tv->ts_type;
 
 	if ((sched_setscheduler(0, SCHED_FIFO, &p)) == -1)
-		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
+		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 }
 
 static void run(void)
diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index 6a64ca2c6..67ad17793 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -56,7 +56,7 @@ static void setup(void)
 	tp.type = tv->ts_type;
 
 	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
-		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
+		tst_res(TFAIL | TERRNO, "sched_setscheduler() failed");
 
 	unused_pid = tst_get_unused_pid();
 }
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
