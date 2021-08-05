Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E1C3E0CE6
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:49:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19BA73C86FD
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:49:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2A2D13C8101
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:48:44 +0200 (CEST)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 95B00200DB0
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1628135322; i=@fujitsu.com;
 bh=A3PIGJjK3cg+7U7URYyiFoXs63TSR6onKOViNe4G3+4=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=AVMDE9TVmT25FPyzBV86tQkQVpgabXNVygsigZN3oQtaZOa+NGFdoQ4MCmxCq+8WR
 hcSVr7LChjnoNlT9yKp4thGCE6K+R/wYfDHFy3ONAsDbaGgUg7YG/7nIzk+zAS3B6w
 tvo5CNuMW5i4xiUJ8M9JZ2U8X5tj0HiLtcTn7UW0FjsDq78via/EJDXZcD+/hnDpdw
 jmEXlrA1RRg9rBgbKk7ZrRirs612zL5aQ3mNiOeZdeeZIaN/XbUU+4YqJCoyixtBwJ
 cYK6vu5Zu0Vb3JGqbH7XOrHSPgMvj7pUP5eJw1hHk/bL+/eFiylrSzayVeuNLLcO/u
 HB3XEQ1l3516g==
Received: from [100.112.192.148] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 6D/6D-07800-A9F5B016;
 Thu, 05 Aug 2021 03:48:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MRojsznjv
 RYOVKXYsV33cwOjB67Pu9jjWAMYo1My8pvyKBNWPhvd3MBW+4K1ovfWVvYJzM1cXIxSEk0Mwk
 Mf3IOkYIZzejxKRzd1i6GDk52AQ0JZ51LmAGsUUEJCQ6Gt6yg9jMAuoSyyf9YgKxhQUSJO7d3
 QlWzyKgIrHs0DGwGl4BD4lDd3eA2RICChJTHr4Hm8Mp4CnRNnUFI4gtBFTz4uguNoh6QYmTM5
 +wQMyXkDj44gUzRK+ixKWOb4wQdoXErFltTBMY+WchaZmFpGUBI9MqRoukosz0jJLcxMwcXUM
 DA11DQyNdQ0sjXSMDE73EKt1EvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwIBMKThwZgfj
 qdcf9A4xSnIwKYnyfpDgThTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXshFignWJSanlqRlpkDj
 A6YtAQHj5IIbwhImre4IDG3ODMdInWK0Zhj59F5i5g5mj4sWcQsxJKXn5cqJc4rGQdUKgBSml
 GaBzcIFrWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzvogBmsKTmVcCt+8V0ClMQKdciOU
 EOaUkESEl1cCUsYYvI+lR90cH6/zZLK3KQXYZMlMDCk1Nc2RUdrOKsXpwTbI//vpPwclr1UHr
 Su4XbXHKqTrvez/NS3jPiubqoztUm7apvl2UvfDxr1tHn9/hFD7gXPVqbrzDvXS3sqj5O0wfS
 l97tV9/24QHqf16ypGmbjYuecZeLvZ6/s9fdz2s7jx1pHhpGU/EgZccdSsVjydnKG4TFlf/8I
 /F7FuF4Vu/MrEkiZ+K3gWzJ51dvm/b3j8soRn7P52N/iViNzmjoqlm8YsZLLsevQ7hSxdguPA
 jWrdr0Xa2uX7v73O+L3e4X9H39eiNry5aShVnYwwnyMT3/yruEjocZnyszGKJ6tr5pt/Dri+q
 f1Tw2FKJpTgj0VCLuag4EQB7NPAsVQMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-5.tower-267.messagelabs.com!1628135321!103219!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14181 invoked from network); 5 Aug 2021 03:48:41 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-5.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Aug 2021 03:48:41 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1753mdiR020613
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 5 Aug 2021 04:48:41 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 04:48:36 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Aug 2021 11:48:43 +0800
Message-ID: <1628135323-3722-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 3/3] syscalls/msgget03: Create message queues
 dynamically instead of hardcode
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

It is the same problem as shmget03. Use the same way to fix this problem
that hit the ENOSPC problem unexpectedly in setup.

Fixes: #842
Fixes: 19a07c445 ("ipc/msgget03: Make sure we get ENOSPC error after..")
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/ipc/msgget/msgget03.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
index ab5714cdc..711886e17 100644
--- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
+++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
@@ -21,7 +21,7 @@
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
 
-static int maxmsgs, queue_cnt;
+static int maxmsgs, queue_cnt, used_cnt;
 static int *queues;
 static key_t msgkey;
 
@@ -37,11 +37,15 @@ static void setup(void)
 
 	msgkey = GETIPCKEY();
 
+	used_cnt = GET_USED_QUEUES();
+	tst_res(TINFO, "Current environment %d message queues are already in use",
+		used_cnt);
+
 	SAFE_FILE_SCANF("/proc/sys/kernel/msgmni", "%i", &maxmsgs);
 
-	queues = SAFE_MALLOC(maxmsgs * sizeof(int));
+	queues = SAFE_MALLOC((maxmsgs - used_cnt) * sizeof(int));
 
-	for (num = 0; num < maxmsgs; num++) {
+	for (num = 0; num < maxmsgs - used_cnt; num++) {
 		res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
 		if (res == -1)
 			tst_brk(TBROK | TERRNO, "msgget failed unexpectedly");
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
