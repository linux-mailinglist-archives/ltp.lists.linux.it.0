Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE8F215147
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 05:03:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 158553C2A04
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 05:03:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 52FC13C0B90
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 05:03:09 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 23D851400547
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 05:03:09 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id w2so16919079pgg.10
 for <ltp@lists.linux.it>; Sun, 05 Jul 2020 20:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xgU+paWrq4aQPhnLsEAtq+7yGqjJT72yPqmubTMHWgk=;
 b=s7Ojcij6PWYy/gLZFGpbBUd3SEWfuLZZpmo1Yj4qO5yVlTtJ1RurftEcCTXf1kPWRs
 e8QlrETAWzwITb0bLkSuEzrPykkigiUX6LTQ59Ti3UHGODLAeGqpV8kdpMDBNN5nlVff
 SWNYrGIIq0u7JYEg2Z7VnyGIc3Xfj+r2xd8YAxsPuU+wihyo3OMZgyjho4PFdQVbQH4d
 nPkrVZLOUGzPQccpmTeGiyfHpaJFSQiJRYWUOdBgIQFnL3rNEGwQNTfQOczsYPlEaA3Y
 7kdtO1MB6X0ZxdVwaruRS5dQlk4yMcQrfhX8U+IU3I7v2rqMDLFhRpw5rrx8DAZ48Yy0
 HOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xgU+paWrq4aQPhnLsEAtq+7yGqjJT72yPqmubTMHWgk=;
 b=Zw6Y4cK+msL//K0byupPZ94G9VE6qBeY+ZrLpRsEIcfHzygiy1+B118MJZQVgjSDE7
 S1qQx0J9+w7Yo0Wg0xO/zZlXTJbe4yhFDQiC6641zsNq+R4utCiX/1DkVA7PjRjD1APB
 JRT+sZeibqpK1qwzOhvqtbt0yr2JcQDvD09dMPQi+M5HB5u2vNMLeqJnYuI9oOka7D9Q
 UBUFxlgFjWhnB1vJNCX26MmSsgGgu8kGjv97tj7CTUguSu8ZqZD5VGGfBhy8MMJY+Ok7
 XKZFJUPImJH5g7s0dN3/vdtMlY1wo8zV7xOQnR9NBVsGju+6aqFO7XVS8PYsyVT+8XHy
 CDIw==
X-Gm-Message-State: AOAM53334E1JOLk2I7KPy9aQQZXDM+xc6hyajSHJwXTpebZH/urD2wIg
 HeMKen3CGEO8wDwlkuVBUSAt1/6kuX4=
X-Google-Smtp-Source: ABdhPJwsCSNv1i4IImi6bB44MZ2sK8Wytai2WyXP9t0eVrXatJa+2JU8JAoTRTFMqXD7WaQkF4tLHw==
X-Received: by 2002:a62:6dc3:: with SMTP id
 i186mr19034706pfc.104.1594004586974; 
 Sun, 05 Jul 2020 20:03:06 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id d6sm16899736pfn.47.2020.07.05.20.03.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jul 2020 20:03:06 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon,  6 Jul 2020 08:33:03 +0530
Message-Id: <9f82f6280630838380c2db503343848d81c94bf5.1594004560.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_test: Fix spelling mistake
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Fix few spelling mistakes.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 lib/tst_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index e93c88ba564a..175dea7c4ae9 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -363,7 +363,7 @@ static void check_child_status(pid_t pid, int status)
 	}
 
 	if (!(WIFEXITED(status)))
-		tst_brk(TBROK, "Child (%i) exited abnormaly", pid);
+		tst_brk(TBROK, "Child (%i) exited abnormally", pid);
 
 	ret = WEXITSTATUS(status);
 	switch (ret) {
@@ -673,7 +673,7 @@ static void print_failure_hints(void)
 				hint_printed = 1;
 				printf("\n");
 				print_colored("HINT: ");
-				printf("You _MAY_ be vunerable to CVE(s), see:\n\n");
+				printf("You _MAY_ be vulnerable to CVE(s), see:\n\n");
 			}
 
 			printf(CVE_DB_URL "%s\n", tags[i].value);
@@ -790,7 +790,7 @@ static void assert_test_fn(void)
 		cnt++;
 
 	if (!cnt)
-		tst_brk(TBROK, "No test function speficied");
+		tst_brk(TBROK, "No test function specified");
 
 	if (cnt != 1)
 		tst_brk(TBROK, "You can define only one test function");
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
