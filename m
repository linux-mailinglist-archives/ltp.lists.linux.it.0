Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC62FFD1C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 03:35:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC0AC3C220C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 03:35:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B25EB3C1824
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 03:35:24 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id AB3B4100185A
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 03:35:21 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,318,1569254400"; d="scan'208";a="78638947"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Nov 2019 10:35:18 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 85D7E4CE1A05
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 10:27:00 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 18 Nov 2019 10:35:27 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Mon, 18 Nov 2019 10:34:54 +0800
Message-ID: <1574044495-2813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20191115163517.GB25964@rei.lan>
References: <20191115163517.GB25964@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 85D7E4CE1A05.AB587
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v6 1/2] lib/tst_timer_test: move test setup function
 before PR_GET_TIMERSLACK
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

Move test setup function before PR_GET_TIMERSLACK in timer setup function so
that the library includes the newly set timerslack in the calculation.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_timer_test.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index f6459e5c0..13e9deff2 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -340,6 +340,9 @@ static void timer_setup(void)
 	struct timespec t;
 	int ret;
 
+	if (setup)
+		setup();
+
 	tst_clock_getres(CLOCK_MONOTONIC, &t);
 
 	tst_res(TINFO, "CLOCK_MONOTONIC resolution %lins", (long)t.tv_nsec);
@@ -360,16 +363,11 @@ static void timer_setup(void)
 	tst_res(TINFO, "PR_GET_TIMERSLACK not defined, using %uus",
 		timerslack);
 #endif /* PR_GET_TIMERSLACK */
-
 	parse_timer_opts();
 
 	samples = SAFE_MALLOC(sizeof(long long) * MAX(MAX_SAMPLES, sample_cnt));
-
 	if (set_latency() < 0)
 		tst_res(TINFO, "Failed to set zero latency constraint: %m");
-
-	if (setup)
-		setup();
 }
 
 static void timer_cleanup(void)
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
