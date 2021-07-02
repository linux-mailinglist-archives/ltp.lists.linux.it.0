Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F83BA0C1
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05B713C8CD2
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:54:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8DF8E3C8CD2
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:53 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3E1F460110A
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:53 +0200 (CEST)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzIg4-0001e2-JX
 for ltp@lists.linux.it; Fri, 02 Jul 2021 12:53:52 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso3510872ejp.3
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4Vr5DWDe5olB4oN1BexDw7K1/Z2Zzndvws5ZG+/HQw=;
 b=bH7OqlN2eIG+ck+xPg4aHMJepJ5yzsIzRO2itwEiebbfO77ribwYA1pWj8rGi3fhH5
 /VLzeyPsw12lUOBvCQnErBRXJAubCfkp5p1RJkzOE5HptCglSuPv7LYAwPjmdDuvTNu0
 6ONmi3xa02qcJhpQiDmwnmASwY4VUp7bqwd+IulGpACArDKXvxjFqk1SpM2Itqlr6oRf
 JB3d/8JqyMJip8qmXTk3ePlkSAZ2I58R3a4n6gF2ANllDS8N4/KHz54TlY2b05AhSkrW
 kUV/WUh5UgMIlTbt5VD2Hjy4Vcl+/Vlp2geXnyAKAABBWFPcDN3vud7oq2mjJVN7Tc4l
 pFxg==
X-Gm-Message-State: AOAM533jPSuJNcscKNP+KNSAZ5LcrxK1sbgKswsz76s+L+a/c1XPbBdE
 SBUK+4Ygkrw+ekLVvEZnZgPTQkY9CQIBHFLl6+Oeu16FGjA0xlSeHOps53TiM7D29uyxxQacg6b
 qRuk9dd+cp29mWuHfALXbMedVRAUg
X-Received: by 2002:a17:907:97c3:: with SMTP id
 js3mr5359252ejc.114.1625230431934; 
 Fri, 02 Jul 2021 05:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+UcLN8L6sANa3cCiHrXwFPCyHXcizI7JURDWbkrteVd81eKU1OJoPYJzqfwa4A68W6c756A==
X-Received: by 2002:a17:907:97c3:: with SMTP id
 js3mr5359244ejc.114.1625230431811; 
 Fri, 02 Jul 2021 05:53:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b23sm1304446edy.44.2021.07.02.05.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:53:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri,  2 Jul 2021 14:53:36 +0200
Message-Id: <20210702125338.43248-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
References: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 3/5] controllers/memcg: accept non-zero
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
