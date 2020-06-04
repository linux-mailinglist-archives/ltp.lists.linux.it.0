Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5E1EE396
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jun 2020 13:42:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E88ED3C2FBD
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jun 2020 13:41:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A946E3C2FAB
 for <ltp@lists.linux.it>; Thu,  4 Jun 2020 13:41:54 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9474C1A00CCF
 for <ltp@lists.linux.it>; Thu,  4 Jun 2020 13:41:53 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id x207so3152063pfc.5
 for <ltp@lists.linux.it>; Thu, 04 Jun 2020 04:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uLWCqEDdiIEBhOO8D/zwl5gVL4iAxcYCbRLUpKnKFVQ=;
 b=QGlHo0Zc/7BScfQ619WBkn1SaopCSRQFhLnaiPS0n/ZZJfgJTtK7Ga0j5lx6dbwD8V
 MTXTcOJev7xbfHzE77oVeQLpg7mQd5bCTFCreHXD7bOM1baQQQUSuz55bQKJ851pdJdm
 YiAjtpFciq0Cp3l0VPwD1RZ0ySyS1TNOdztBaVg2Vch/AgBU69npDUS7n6fidYJKkQ1i
 4fF0cbUYpdcfrw+xYWc8rkgl/5z8rDytsZYSpiQvbkLHn297+frDT2quy/9YB3N8Nxbv
 hGPeAM7BOyE7SsozTjFiKfOOXabaoMI4S1C0Us047MRhNKfIPuIkOHlS/YkGnJiw9dsA
 aiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uLWCqEDdiIEBhOO8D/zwl5gVL4iAxcYCbRLUpKnKFVQ=;
 b=E6WMc2R57LbkWr3zmViB/bDeYmiCZqzHPywUoLyt8qfLAnRY9BfIyW8yUt+8i10qhe
 tXgglVoiPspwy4jKe2ahMBJNAw8IaDVkRqYDBz2lwFbBrm2QQLgiUWszPrs1X/w6lWY0
 E2eXej1JMMIkoSyJmSCt9xXIGRTSXQR+015v4b/4udrn15pX2fkIuYqCTBevAf+/8raA
 1/W0pQf9HpUn5slXYla4TEAuxovO9Dz7LWWIRMeCMxrZ4sAnlchRoCA1B4WPsJaWRUAk
 0VMMUtxN8WY77x8GpXy3D5jB8vKiZCYJHUy9lhKZrY7gFiEnsolpaUgC3BF5nH0zTe2r
 OVKw==
X-Gm-Message-State: AOAM530652kAspIsOy2ap1z5L64Lf02hBHBZmECWAAQF+fiK31g6pNQr
 vhLN18Tc8gLswN3TwZs/5pUraCSTUb0=
X-Google-Smtp-Source: ABdhPJwuXTMnzzoJ0ypej1qzrhg1GziSIqTIfck1LPOG2WXGBPN6K8oj9S9ivR0miJPz5+77YMSarQ==
X-Received: by 2002:a62:c185:: with SMTP id i127mr4100793pfg.132.1591270911760; 
 Thu, 04 Jun 2020 04:41:51 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id 12sm4794792pfb.3.2020.06.04.04.41.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 04:41:50 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu,  4 Jun 2020 17:11:44 +0530
Message-Id: <8b9a7e8ea27894090f1e31e178d7328f118163d0.1591270889.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] clock_gettime03: Fix issues with negative offset
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The tests takes difference between two time readings and check it
against the offset set by the test. When the offset is set to a positive
value (eg 10000 ms), then the diff comes to a value >= 10000 ms (eg
10001 ms), and with divided by 1000, both sides evaluate to 10.

But when the offset is set to -10000 ms, then the delta is >= -10000 ms
(eg -9999) ms. And when divided by 1000, it comes to -9 != -10 and the
test reports error. Over that we are comparing value in seconds, which
is too large of a value. Change the test to compare delta in ms and fix
the false failures.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/clock_gettime/clock_gettime03.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
index e6b9c9c7857c..8341051088d7 100644
--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
@@ -76,7 +76,7 @@ static void child(struct test_variants *tv, struct tcase *tc)
 
 	diff = tst_ts_diff_ms(then, now);
 
-	if (diff/1000 != tc->off) {
+	if (diff - tc->off * 1000 > 10) {
 		tst_res(TFAIL, "Wrong offset (%s) read %llims",
 		        tst_clock_name(tc->clk_id), diff);
 	} else {
@@ -86,7 +86,7 @@ static void child(struct test_variants *tv, struct tcase *tc)
 
 	diff = tst_ts_diff_ms(parent_then, now);
 
-	if (diff/1000) {
+	if (diff > 10) {
 		tst_res(TFAIL, "Wrong offset (%s) read %llims",
 		        tst_clock_name(tc->clk_id), diff);
 	} else {
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
