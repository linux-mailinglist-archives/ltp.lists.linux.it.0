Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1D39DA07
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:46:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17ED43C4DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:46:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE1293C7C68
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:42 +0200 (CEST)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 69FFE1400B9A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:42 +0200 (CEST)
Received: by mail-il1-x131.google.com with SMTP id i13so9919061ilk.3
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9TAudQSrZeFbiQatmzUff/0xImtXLS9FQEs0rPZ5vWc=;
 b=aU3X1j0xkKdoFeGXiJpIlss6OMsPhRxoWK8L1xu2Xmn68xlTlQ5qyV2yCFYCF0n6gG
 eNHdUl0ze+C3r9W+61Jm+Iv0E6YxSz74XfaA2Xgm/+dY5TISErKbYi826GqxLr79GENS
 Md75U4hIxQUwEEYxK5YQnRPF2tQTTLHYfPnHojty14V5m1L2UQerG1gnvU+/m7MtOXJz
 FQemJO1kivYcm/wlfDDO8vfsHIZLa1PCWrVF1lWqyX/HXxTitarVtnKVl9+Wx4fu1jvn
 yKqsBkqzPI5XopIx2IyjhNzwSOUVGlzRn1/Nrt6im5Lnup9eIjfPE9K8nPthPG5IVGjC
 IvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9TAudQSrZeFbiQatmzUff/0xImtXLS9FQEs0rPZ5vWc=;
 b=H+SKsjbp5fk5AVE9UnZtKXr0CY8nxcdfG4H8VLYbyEmZourEQME7XKa5vtjwIYhJZ+
 FUzyscFgQba7HnutJTYKIfwpAvG1agO8hLrPmQSfKtKaYO7nne4R76jrYAMt4Y4Q7C6M
 GeL5uFqK27doyf0uwjocnZd7637HtRmbSGNXWPuQvisUMKn1BS2w8JMiFLwfK+UkuEja
 u9+RrviTql4xwZc7bq8pdz+4rJRGu/L7t87YlQB+ebYCJVB3pv9WjGhyr0TfIjn6/Y+H
 zyDoJrrUXfL7y7tCr5GzW01rh/AxbkzmO2PH353fh7RPwfWbbP8Fgp//9MyUwZJL69JN
 kJ/Q==
X-Gm-Message-State: AOAM5313HdfSp3734kX4fTJ/REEM1PTULr63WVJTRXEUnNvhVr9t31Y+
 vud14PglgDZYOJjyUBBN+WDFXO+6YH/QTw==
X-Google-Smtp-Source: ABdhPJzfc8QgrR91TKD9PQmEq3GNw+kIHAT8cTlsy+t6pwCyXWWmkA+UDMo2F4N+UIUqhlP9Y0Hf1g==
X-Received: by 2002:a92:da4f:: with SMTP id p15mr14725827ilq.200.1623062740887; 
 Mon, 07 Jun 2021 03:45:40 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id c14sm8933303ilq.9.2021.06.07.03.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:40 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Mon,  7 Jun 2021 16:15:14 +0530
Message-Id: <20210607104515.29838-6-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607104515.29838-1-vinay.m.engg@gmail.com>
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 6/7] sched_rr_get_interval03: Skipped EFAULT tests for
 libc variant.
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
Cc: vinay.kumar@blackfigtech.com, umesh.kalappa0@gmail.com, rwmacleod@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_sched_rr_get_interval" and "__NR_sched_rr_get_interval_time64"

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
