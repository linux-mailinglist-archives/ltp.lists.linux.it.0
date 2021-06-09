Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39E3A1BF8
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B94E3C9E9A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 750CD3C8FD0
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:19 +0200 (CEST)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1895600C74
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:17 +0200 (CEST)
Received: by mail-il1-x133.google.com with SMTP id v13so27320171ilh.13
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vIBuj+DOu5jGON5HJIz2pTp3IXIRad6aDACZ9X1ipdQ=;
 b=WPx9HSlsaHEwrhxa7TIgwJ0e44Coxlt52dxwzaA27i9nIrVg8kZHXIclwyGWGGXyj2
 1o5+jCgMTj25vDLXOq5bkz622pUUCTbfmXPN9lXG9QfRQWdMXSY+p7eAVGq0dmjgCmKx
 aHXCzdVFqGOYkw6LmYUqBci3RKcdwEdtpYFj16DN8J1Lcub7Qge4fo1IixK5vgraiwr6
 NGwMQUTeNaopnsMsXS+JgnrXY//FC6JX+k4EtoCws0HFpn6N4ovSUETldsONJtSSfXXv
 EBOBSr/cSnghDFDJ48cJljp4JGABrzYWj712LUF0wb4jI7Sk/IT0xodKnMcXITplr73D
 DI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vIBuj+DOu5jGON5HJIz2pTp3IXIRad6aDACZ9X1ipdQ=;
 b=L7nuUbfM5pfQJCbmBBGEZtpszpVEdGBgYxoW51z3GhyGAYl189urAwIuIG8UJofbBR
 7TQKjU16aO79Fso7g4dLUdR6JRJDt+A4MEMORs8k022Vj9CfgXLmMyMGQTb2fYNyf5RD
 piyROx72nKS4UnEnOaSL9b6trto6vgmHgsqed/MLSvKy4VaPTXnjyLE9EZoy84AWbJ+j
 Xu/TsYR5G1vllIfRz15PPgutuCaJ0W8AAa/+kLIEyhqUkb6JvMUi40IhKifi2vE6gJfJ
 z5+Jm06d8ViuLxIWHRzGNPQB5sLEhqFPQVljBO901Avv0A5QwemjzGazSKXkVRhimVi1
 /ZoQ==
X-Gm-Message-State: AOAM530cocolPJ5WRYNhbIQx7wL6+PoGTYp3ynUPGo4EKJt7ywJ6T61Z
 /141dLEWMV0mjwRk4gYHi5I=
X-Google-Smtp-Source: ABdhPJx2o8dch1Sa2t8TAHYr43wj+9MUbJ0H/7SzVadmi10lhmY7N0U6ef9GH8ITs8Hu7ayzAiJedQ==
X-Received: by 2002:a05:6e02:20c4:: with SMTP id
 4mr622049ilq.288.1623260236599; 
 Wed, 09 Jun 2021 10:37:16 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:37:16 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:06:00 +0530
Message-Id: <20210609173601.29352-9-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 09/10] sched_rr_get_interval03: Skipped EFAULT
 tests for libc variant.
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
Cc: metan@ucw.cz, umesh.kalappa0@gmail.com, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_sched_rr_get_interval"
and "__NR_sched_rr_get_interval_time64" syscalls.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../sched_rr_get_interval/sched_rr_get_interval03.c         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
index 0c9887f36..cee9245e6 100644
--- a/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
+++ b/testcases/kernel/syscalls/sched_rr_get_interval/sched_rr_get_interval03.c
@@ -67,6 +67,12 @@ static void run(unsigned int i)
 	struct test_cases_t *tc = &test_cases[i];
 	struct timerspec *ts;
 
+	if (tc->exp_errno == EFAULT
+		&& tv->sched_rr_get_interval == libc_sched_rr_get_interval) {
+		tst_res(TCONF, "EFAULT skipped for libc_variant");
+		return;
+	}
+
 	if (tc->exp_errno == EFAULT)
 		ts = bad_addr;
 	else
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
