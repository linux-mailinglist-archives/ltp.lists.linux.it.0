Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62A3C6D38
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C56793C7583
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B40E53C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:19 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5BD561000470
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:19 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 036424061A
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626168139;
 bh=C4Vr5DWDe5olB4oN1BexDw7K1/Z2Zzndvws5ZG+/HQw=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Yar6qQLgsr5p1tVpTJGMzyMZ18eO7qtS8pdQD/nhm3a7rGCuS7UHDw5lidvd8xZ8c
 UHSM6yuZu+ttAf/XjKiUDirvPsvJy1Lqv6dMtKnBUmKwaW+PNSFvWa/reA5yu0tvMb
 ZOyGvnsLEAgvyiUtiXBNkcCPFjBoui6/lW8A2/u8d5tBlf/0F2a6Uy7dgOAMgc2xgC
 ykG/VsFKWnuJCfHAwbx/aWNlfKZSZbI0TtUIUwy6l6P3b9qZW0WLcIEt7LDlr/fQRs
 O+F9jpjYJYIovzcYS1ZJwQyZqoGMVYG9k33Y9InmMfH+7APK3DR7RcAA61qE1OBoYk
 BpUZsuC7H/qOA==
Received: by mail-wm1-f72.google.com with SMTP id
 p6-20020a05600c3586b029020b46124c2eso671839wmq.1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 02:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4Vr5DWDe5olB4oN1BexDw7K1/Z2Zzndvws5ZG+/HQw=;
 b=aMEcKBthX9pEYEyBmNWuk/+kx+IC5N+03LBtGUhUc3J5JMH8uirmmQPMmIFsfZQEYC
 9paoL42jOWjg615M4xIwOntojyvNCo+H65X8mQGAna9hACoFwUEmGJtzRi0YREKwXRSI
 O8nC+k8Uwzv0FMG4BPdfe9WLNwe80MyMQnbAEI3T4pOEoImO6WIaSrT8Lf+wZaWLVu+s
 NUf9AYXgzlh9R7LVQfzqmnRftpEU4nE/OJc+YxlbUe3mbdhHvUpyYUzKRCx5KiGBb3RQ
 IyHX3JH79SQC+PNC93x4FQx/78Jx8h85tCDixpdTOGeIhlAc6LwqpnEK4XEjHQyFs85x
 TA3w==
X-Gm-Message-State: AOAM532UvA/MqYDFmHr0Iq+S9n6aTXCLq3C7fAfrrGihmuV5CkbWSdQ/
 fD4K1mkEQYfUDwtFvJTbpz95XEvi0mqo7Zc/V3rLV2bde6VIpnIzFxymiAFNmkk401Mp8BNsNMQ
 rPROvs5lHZXfIS/yGLkuybJ6J5Ew7
X-Received: by 2002:adf:e743:: with SMTP id c3mr4352975wrn.354.1626168138568; 
 Tue, 13 Jul 2021 02:22:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkc32EYg0raqt9pBw6XuLnMCjT20pmCGxfEMEHvBG2jXq0hCcJgK3F8RWAh5zdtLsKV/tGvQ==
X-Received: by 2002:adf:e743:: with SMTP id c3mr4352958wrn.354.1626168138407; 
 Tue, 13 Jul 2021 02:22:18 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e11sm15663393wrt.0.2021.07.13.02.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:22:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 11:22:08 +0200
Message-Id: <20210713092210.17141-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/5] controllers/memcg: accept non-zero
 max_usage_in_bytes after reset
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

Several Linux kernel versions report a non-zero max_usage_in_bytes after
resetting the counter.  For example v5.4, v5.8, v5.10, v5.11, v5.12 and
5.13.0-rc5:

    memcg_max_usage_in_bytes_test 4 TINFO: Test reset memory.memsw.max_usage_in_bytes
    memcg_max_usage_in_bytes_test 4 TINFO: Running memcg_process --mmap-anon -s 4194304
    memcg_max_usage_in_bytes_test 4 TINFO: Warming up pid: 1416
    memcg_max_usage_in_bytes_test 4 TINFO: Process is still here after warm up: 1416
    memcg_max_usage_in_bytes_test 4 TFAIL: memory.memsw.max_usage_in_bytes is 4325376, 4194304 expected
    memcg_max_usage_in_bytes_test 4 TFAIL: memory.memsw.max_usage_in_bytes is 122880, 0 expected

It seems that recent Linux kernel caches the statistics more
aggressively (especially on multi-CPU systems) and the batch updates of
32 pages are visible in usage_in_bytes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../memcg/functional/memcg_max_usage_in_bytes_test.sh           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
index 8831f1937070..2d494ac3a78f 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
@@ -37,7 +37,7 @@ test_max_usage_in_bytes()
 
 	if [ $check_after_reset -eq 1 ]; then
 		echo 0 > $item
-		check_mem_stat $item 0
+		check_mem_stat $item 0 $PAGESIZES
 	fi
 
 	stop_memcg_process
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
