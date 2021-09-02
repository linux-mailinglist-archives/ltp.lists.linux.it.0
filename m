Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B83FE942
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 08:34:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F02963C9944
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 08:34:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6DDFC3C288E
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:34:38 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D756A60083A
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 08:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1630564476; i=@fujitsu.com;
 bh=Sqf2b62fCI4UTWAV2lzS0eRiYXA29wNsof96NG4vPvQ=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=fEdrjGK0exWa099Qjk4lBhPUGBknOWYydIu5Cb9UmrfXu12K95SohYW/pTWAWqRrI
 TXQ1NHYNxsQc455eE0lJCL/78PdJNTD/1Ha6u7uVDhWWCaHYBFYoMUGYaVgZ9HwndB
 uQC2RlSjaO2FDewFFKGyPZffgvHcB2vFwSoW4G021++rHCk8Zywgohe6UmYWGFpYLl
 AegASfe2vkG7cOHU1dlMThISQZiSkqK4hLIJBajxq9+d/8YRQqPjtFQDR0Yi7BWrPz
 xyyNKdUOXsSF5lcpoN2iEqZ8QX2WEgKCXtDA59UqEp8mXIfz5uLieoFb6fIl3enUZp
 Rmz47E1th4R4g==
Received: from [100.113.2.146] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 4A/B2-29877-B7070316;
 Thu, 02 Sep 2021 06:34:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxVbe6wCD
 RoPuMssWK7zsYHRg99v1exxrAGMWamZeUX5HAmnGh5xpbQSNHRef/yewNjNfYuhi5OIQEmpkk
 jm/oYodwdjNKnOw4C+RwcrAJaEo861zADGKLCEhIdDS8BYszC6hLLJ/0iwnEFhawkFj4eDKYz
 SKgInHt02MWEJtXwEPiyKK9rCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYlLHd8YIe
 wKiVmz2pgmMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGukDS1FAvsUo3US+1VDc
 5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGGIphQzTdzCuefNB7xCjJAeTkihv3in9RCG+pPyU
 yozE4oz4otKc1OJDjDIcHEoSvNy5BolCgkWp6akVaZk5wHCHSUtw8CiJ8CZlA6V5iwsSc4sz0
 yFSpxgVpcR5f+YBJQRAEhmleXBtsBi7xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9wLIdp
 7MvBK46a+AFjMBLeb5oQOyuCQRISXVwOTdrKF6L83v89t3mTu3f12wcdF5GVmLhUJLJLsdXMT
 +TtTcYJUW9DXAP7fP2bEz4lRs65kZvffm7dOoucu/5w3Trn3n3myq+Kb0d82L/QVyNfHXWmbN
 fpcq/PAlU8jsiwY6iXYd9zY2q/PIK+/4frKh2ev7DjaeWPO1l7onOreWtZxf9/p4ICtP2oapz
 Sv2Z5QYuH6XtHjGc97r93L5c1oqv32O6Z9z6j/6z19lseib5ztUbulOOLg2M621/fzZJYmHrr
 L1TG2ZdaOvbsW2AJ1fC65OlJggwir8w+hf08TFbVP4pKPPyx/rXPj0qN9nDcsK9pdbjibXSAr
 vPbL5ue527gcq54Tzc12cr0627LBXYinOSDTUYi4qTgQARDQJ7CwDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-6.tower-226.messagelabs.com!1630564475!80587!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20965 invoked from network); 2 Sep 2021 06:34:35 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
 by server-6.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Sep 2021 06:34:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1826YSH0021297
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 2 Sep 2021 07:34:35 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 2 Sep 2021 07:34:07 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 2 Sep 2021 14:34:06 +0800
Message-ID: <1630564446-3393-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/creat09: Add another linux tag
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
 testcases/kernel/syscalls/creat/creat09.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/testcases/kernel/syscalls/creat/creat09.c b/testcases/kernel/syscalls/creat/creat09.c
index 53ab202c1..9b88acd1a 100644
--- a/testcases/kernel/syscalls/creat/creat09.c
+++ b/testcases/kernel/syscalls/creat/creat09.c
@@ -18,6 +18,16 @@
  *  Date:   Tue Jul 3 17:10:19 2018 -0700
  *
  *  Fix up non-directory creation in SGID directories
+ *
+ * This fix is incomplete if file is on xfs filesystem.
+ *
+ * Fixed in:
+ *
+ *  commit 01ea173e103edd5ec41acec65b9261b87e123fc2
+ *  Author: Christoph Hellwig <hch@lst.de>
+ *  Date:   Fri Jan 22 16:48:18 2021 -0800
+ *
+ *  xfs: fix up non-directory creation in SGID directories
  */
 
 #include <stdlib.h>
@@ -112,6 +122,7 @@ static struct tst_test test = {
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "0fa3ecd87848"},
 		{"CVE", "2018-13405"},
+		{"linux-git", "01ea173e103e"}
 		{}
 	},
 };
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
