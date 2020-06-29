Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4620CE50
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:43:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47D343C573D
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 13:43:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F38AC3C2AE3
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:43:30 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4D624600669
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 13:42:32 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id u9so3391613pls.13
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 04:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzGq0L91dBYG984t39JtjmCcjwULQeN3HFZjBLR11ps=;
 b=n+RDO8kupxaRe2a7s4hxNTJLARfLkCzCQiRo4XHTePNq+zO1VwtIxtaXvbowT0MrR4
 xCxYMNtdqmXMDqFwqHZc9gs48rf79nwkWimTEB0vl/cV8dsCsxs4uNSYO5or3xksg9fQ
 KK731NwQdjXjtDYUGZJ16oms8RSySLIu479ofCIGZm6UCCxAFLHfsyJ3hjNBSN/EHVv6
 WOIp6e0ZLXyWz75svbhL8AuzIBdaseIRMFDQlu+1THAq7gWNd6RE8dwMCKg0K3aIDlei
 DXlN1bXJ/9K1SdgCFmRQ+8QE1nbs0KwIfK8hdtz7qhPTYxN5R1b9O5nX+5Ty6Ng9kP92
 1e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzGq0L91dBYG984t39JtjmCcjwULQeN3HFZjBLR11ps=;
 b=n7h2v0yMucPyE4QpqEKKTFToUIlvHWSo3yG8RImdAwO/BYuSyW4ov7sJI/wvskrGVc
 ylQwSHnJ5LIxo0EjW3tlII4Jxuo867z2HFufLrGL7b5wzS5Ws9xvlBdTD+2/x+sHm9LT
 V0Pd97iPDygMQNiWX5A0sEn+NTr1Wg4A243fFlqeNFD6fQTQmGpkhNpoNECVvfgAa74Y
 G0A4mB//QlY92RjoCJawFHeJCTwvY9RpoBDp52L5K9licwFdFnYdpwRuECkQztjorcbU
 2xEnxGnOFeRgVT5ThzdsmtI4XFcrqCJkW5YXaIJEVtONE+gTANjBp3l3Y9p10emgfzlP
 iHwQ==
X-Gm-Message-State: AOAM5304y7Or7tSrRbV4BXUD4sTuVQMj3dFy0DPcwhbBudXQxfjfnaOl
 ulMmO1K3U6GubyAX0GEjiA5BbU/7/T4=
X-Google-Smtp-Source: ABdhPJwlQDNRATeY80zOlx6UJDfeyAPgP7dNuiT6w59QchIOi2XrTLw36Xd9kd5OWx62Gmn1BGaZBw==
X-Received: by 2002:a17:902:7109:: with SMTP id
 a9mr13574233pll.58.1593431008362; 
 Mon, 29 Jun 2020 04:43:28 -0700 (PDT)
Received: from localhost ([122.172.127.76])
 by smtp.gmail.com with ESMTPSA id l15sm3794434pja.2.2020.06.29.04.43.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jun 2020 04:43:27 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon, 29 Jun 2020 17:13:23 +0530
Message-Id: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/timer_settime01: Improve print messages
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

This improves the print messages by providing additional information
about the tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/timer_settime/timer_settime01.c  | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
index 08fb56e4943a..52c435ee3d91 100644
--- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
+++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
@@ -82,12 +82,12 @@ static void run(unsigned int n)
 		if (TST_RET != 0) {
 			if (possibly_unsupported(clock) &&
 				(TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
-				tst_res(TCONF | TTERRNO, "%s unsupported",
-					get_clock_str(clock));
+				tst_res(TCONF | TTERRNO, "%s: %s unsupported",
+					tv->desc, get_clock_str(clock));
 			} else {
 				tst_res(TFAIL | TTERRNO,
-					"timer_create(%s) failed",
-					get_clock_str(clock));
+					"%s: timer_create(%s) failed",
+					tv->desc, get_clock_str(clock));
 			}
 			continue;
 		}
@@ -102,9 +102,8 @@ static void run(unsigned int n)
 		if (tc->flag & TIMER_ABSTIME) {
 			timenow.type = tv->type;
 			if (tv->gettime(clock, tst_ts_get(&timenow)) < 0) {
-				tst_res(TFAIL,
-					"clock_gettime(%s) failed - skipping the test",
-					get_clock_str(clock));
+				tst_res(TFAIL, "%s: clock_gettime(%s) failed - skipping the test",
+					tv->desc, get_clock_str(clock));
 				continue;
 			}
 			val += tst_ts_get_sec(timenow);
@@ -115,19 +114,21 @@ static void run(unsigned int n)
 		tst_its_set_value_sec(&new_set, val);
 		tst_its_set_value_nsec(&new_set, 0);
 
-		TEST(tv->func(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
-
+		TEST(tv->func(timer, tc->flag, tst_its_get(&new_set),
+			      tst_its_get(tc->old_ptr)));
 		if (TST_RET != 0) {
-			tst_res(TFAIL | TTERRNO, "%s failed",
-					get_clock_str(clock));
+			tst_res(TFAIL | TTERRNO, "%s: timer_settime(%s) failed",
+				tv->desc, get_clock_str(clock));
 		} else {
-			tst_res(TPASS, "%s was successful",
-					get_clock_str(clock));
+			tst_res(TPASS, "%s: timer_settime(%s) was successful",
+				tv->desc, get_clock_str(clock));
 		}
 
 		TEST(tst_syscall(__NR_timer_delete, timer));
-		if (TST_RET != 0)
-			tst_res(TFAIL | TTERRNO, "timer_delete() failed!");
+		if (TST_RET != 0) {
+			tst_res(TFAIL | TTERRNO, "%s: %s: timer_delete() failed!",
+				tv->desc, get_clock_str(clock));
+		}
 	}
 }
 
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
