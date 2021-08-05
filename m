Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A23E0CE5
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:48:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 723703C80C9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 05:48:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 114CF3C808F
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:48:39 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 110BE600472
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 05:48:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1628135318; i=@fujitsu.com;
 bh=WosL4p8mQYMieiZP1BkXnJYKyg0DN8MSmk0xwsEAUFo=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=tkRnk3XW9TNOREIYpsRkP3yoVYczQx8zOAmB5UdRozoCerCU57EI7O2A3By7aW5CR
 GqXmeX8NdlKjmD3J3N0TJBJaE96nFBVLJyXEtSr0u6EesY2WeDgjZIfnmAenbYa78m
 J3vKXNiIxjRLw6YzpGucYAeXeH5Fa01gLITzoN0P3tYjAmzpT5rsX7epGHk/rEjc3+
 TjuD5Nu1gJ5HGb67xAEIasSHwDi3dYlP7thqRpHe6HT4A29pUSxhZGfQuOVM5xlPfd
 3oZUvcd8D7kuaWHjeTKmAFqNPZj78Ls8p3i2X2YpaN7VdMs8iYWp5cy9V592bLz2GV
 qnXtXmjyVTD9Q==
Received: from [100.113.4.199] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.eu-central-1.aws.symcld.net id A8/C1-07605-59F5B016;
 Thu, 05 Aug 2021 03:48:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxRXdKPHe
 iwd+51hYrvu9gdGD02Pd7HWsAYxRrZl5SfkUCa8ampbIFO/krNn06zNLAOI23i5GLQ0igmUli
 wsJTLBDObkaJd8+fM3cxcnKwCWhKPOtcAGaLCEhIdDS8ZQexmQXUJZZP+sUEYgsLpEvsPtvPC
 mKzCKhIzPlwkRHE5hXwkJi3+QpYr4SAgsSUh+/BbE4BT4m2qSvAaoSAal4c3cUGUS8ocXLmEx
 aI+RISB1+8gOpVlLjU8Y0Rwq6QmDWrjWkCI/8sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKB
 raGisa6prZGKol1ilm6SXWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAzIlELWjzsYD73+
 oHeIUZKDSUmU94MEd6IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4LsUA5waLU9NSKtMwcYHTAp
 CU4eJREeENA0rzFBYm5xZnpEKlTjLocO4/OW8QsxJKXn5cqJc4rGQdUJABSlFGaBzcCFqmXGG
 WlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzpoBM4cnMK4Hb9AroCCagIy7EcoIcUZKIkJJqYGL
 VyWQ72vTdXHliY5SerGSxZ6eOgj3jltojN7h25Z6+xtO+e/rPpq71NtHHPt94+PRow0SxrE2H
 64KTTodfqww7zFn1/y//rdMvFr/YYMMmwfouqCv1vz/3yh9BXY8yPufH934zrTq6YvLXv5lPX
 fZs2r004uTuc0HfLs13uXtbSZnfZ8FHe+uEecwh7ov3LxWbaV596aKL4abyatYbe3qLvbmXSJ
 zcccJng87uzd5l6Y/tkjqbVt+UOtV79Oi9wIONE/7cbcgJmLlU2fTE3HW7Fie23GTOOfPju80
 idlvhhDkJn1iWlnzYqPeGVVmhd+PtYN0vXOVTQi0/5b0R+pTC/p5zXa/1zMeFudVSKYlKLMUZ
 iYZazEXFiQDjYljNTwMAAA==
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-4.tower-245.messagelabs.com!1628135316!288269!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10028 invoked from network); 5 Aug 2021 03:48:36 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-4.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Aug 2021 03:48:36 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1753mUfO011127
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 5 Aug 2021 04:48:36 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 04:48:33 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Aug 2021 11:48:42 +0800
Message-ID: <1628135323-3722-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1628135323-3722-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/3] syscalls/shmget03: Create shared memory
 segment dynamically instead of hardcode
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

Before this patch, we don't consider this situation that system has consumed shared memory
segments. So we hit the ENOSPC error unexpectedly in setup.

Use GET_USED_SEGMENTS() to get the used shared memory segments, so we can trigger the
ENOSPC error correctly(just hit the limit) even current environment has consumed some
shared memory segments.

I don't use this api in verify function since we don't support run cases in parallel and
we should assume this situation that this case is the only case to use(free or alloc) sysv
ipc resource at that time.

Fixes: #842
Fixes: 4dc493b44 ("syscalls/shmget*: Convert into new api")
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 testcases/kernel/syscalls/ipc/shmget/shmget03.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
index efbc465e1..8b157e439 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -22,7 +22,7 @@
 #include "libnewipc.h"
 
 static int *queues;
-static int maxshms, queue_cnt;
+static int maxshms, queue_cnt, used_cnt;
 static key_t shmkey;
 
 static void verify_shmget(void)
@@ -36,11 +36,13 @@ static void setup(void)
 	int res, num;
 
 	shmkey = GETIPCKEY();
-
+	used_cnt = GET_USED_SEGMENTS();
+	tst_res(TINFO, "Current environment %d shared memory segments are already in use",
+		used_cnt);
 	SAFE_FILE_SCANF("/proc/sys/kernel/shmmni", "%i", &maxshms);
 
-	queues = SAFE_MALLOC(maxshms * sizeof(int));
-	for (num = 0; num < maxshms; num++) {
+	queues = SAFE_MALLOC((maxshms - used_cnt) * sizeof(int));
+	for (num = 0; num < maxshms - used_cnt; num++) {
 		res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
 		if (res == -1)
 			tst_brk(TBROK | TERRNO, "shmget failed unexpectedly");
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
