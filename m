Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3521515C
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 05:32:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D51653C25A0
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 05:32:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 9FC213C011E
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 05:32:00 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E281D1A00801
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 05:31:59 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id x9so1126521plr.2
 for <ltp@lists.linux.it>; Sun, 05 Jul 2020 20:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1PMCqDdAALK1KF4nHQl4gfdidOVmdyHP6es8L0PTcE=;
 b=f3VuY8LsyyVyEKwEgKGYJhrgiFbfSGP8gfJ4DFBp24kwP+y1JQa8sIVyGJkEpLu3Yt
 cMtygSIaV6i6EiBFiHudgiFc31LI2766ElYk9dImoGSonITGmtFMsF+lQQt2Py5BiKp6
 CRbwQ8EipapT5twaYkfpE4eaahODYuPDWF1/JXAJPRMeXp12Sy+kg8vrMZVtdD10xoQO
 i8YMtzy5DxaK9LaoKn+r/2Ds8ENv/I9zPGwStfOsglcPw3nyX4/Mj9WvCoglDGOh8p0m
 tCKFntGcZ2vD5FpmKbyE1/yPEqBWKifiK4j+GrZeD9ahLxXxM6Q9ZVjWHA/odex2br6F
 wr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1PMCqDdAALK1KF4nHQl4gfdidOVmdyHP6es8L0PTcE=;
 b=J3GLSNvf0ISKgLoYfB+CMFh4WucbBMoW96bSy+ZWKeVnIUorzY3d3TikR5xhx03HZP
 x01yySs72CMyhmn3UIXiv8ZejLMdJGpkHLeXyfXSf3XaPbcLVRoEOSBOuDhnCd2Xo8PD
 fGZqMf0bj0TTh2lqfs3Qw3e7fEgYhbbSA9mBTJ9VK30Tv60mC6aKYGDORikmye/a7tas
 tSykr0EE++PqWtZH3mpxCfktE/6nuFjKfKmWlEbORUQZxeN497x+arzVse4B9rbuHgNm
 F6REXRvB9zYwFTWGyI9JOhdrZVuV763zL3pReDhD3YcC6VVtwF6OAd7959MovIXwY+CQ
 TXLQ==
X-Gm-Message-State: AOAM5312MVWatJH2y36dS0d1qQZU25XhblSAkawymeCyUjQmShzujqI1
 lIZy2jndEYI4/td1MrMkCxXBPzIVjCw=
X-Google-Smtp-Source: ABdhPJyJfqUQN209RdpZkQ7ICc0PuJRBkNS4SHWWuMZVct5r3PteLA+VpN272Z5lFORUJtijuZWyRg==
X-Received: by 2002:a17:90b:112:: with SMTP id
 p18mr19529527pjz.92.1594006318047; 
 Sun, 05 Jul 2020 20:31:58 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id io3sm10915040pjb.22.2020.07.05.20.31.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jul 2020 20:31:57 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Mon,  6 Jul 2020 09:01:53 +0530
Message-Id: <81a952af30185d5c72cda19d322d7abbbf7bd8fe.1594006171.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
References: <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2] syscalls/sched_rr_get_interval: Validate the
 timeslice
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

Validate the timespec returned by sched_rr_get_interval() against the
value read from /proc/sys/kernel/sched_rr_timeslice_ms.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2:
- Add .tags entry
- check if file is present or not.

 .../sched_rr_get_interval01.c                     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
index 31d7b5d56a52..0466be36bec0 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval01.c
@@ -5,11 +5,18 @@
  *
  * Gets round-robin time quantum by calling sched_rr_get_interval() and
  * checks that the value is sane.
+ *
+ * It is also a regression test for kernel
+ * commit 975e155ed873 ("sched/rt: Show the 'sched_rr_timeslice' SCHED_RR
+ * timeslice tuning knob in milliseconds").
  */
 
 #include <sched.h>
 #include "tst_timer.h"
 
+#define PROC_SCHED_RR_TIMESLICE_MS	"/proc/sys/kernel/sched_rr_timeslice_ms"
+static int proc_flag;
+
 struct tst_ts tp;
 
 static struct test_variants {
@@ -39,6 +46,8 @@ static void setup(void)
 
 	if ((sched_setscheduler(0, SCHED_RR, &p)) == -1)
 		tst_res(TFAIL | TTERRNO, "sched_setscheduler() failed");
+
+	proc_flag = !access(PROC_SCHED_RR_TIMESLICE_MS, F_OK);
 }
 
 static void run(void)
@@ -62,6 +71,8 @@ static void run(void)
 		        tst_ts_get_sec(tp), tst_ts_get_nsec(tp));
 	}
 
+	if (proc_flag)
+		TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
 }
 
 static struct tst_test test = {
@@ -69,4 +80,8 @@ static struct tst_test test = {
 	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.needs_root = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "975e155ed873"},
+		{}
+	}
 };
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
