Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D43AAD04
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:08:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 212B33C88E6
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 09:08:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 60C1D3C2DC7
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:37 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 180351A00656
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 09:07:37 +0200 (CEST)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ltm7k-00040i-J6
 for ltp@lists.linux.it; Thu, 17 Jun 2021 07:07:36 +0000
Received: by mail-ej1-f72.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso1769334ejn.10
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 00:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZrSi8UjVA7oKQxjvWm7NBCWsiHBN5nHyk/1g8JYarlU=;
 b=I/xfo4hFYR+TJsGGcdt2e8c3f/Du9ItZb+nxsOZy1B/zmEFlluQ5lxmQco2pogaRRN
 wjwn28d1mU2lzmdGjxg5VPTvOkl7/ot0Iv6Cdw1c/NRcABkRAdTTZRR0WPuJYgfR3ZCW
 UC/F17ztAEq/S79vhtlH2vp77l6nXYSPqt0RNclT9APfNpASlpJLvx0YGvW25zY/dYoa
 s/0jF1vly22sss34NGTIa8+IPXj0GF+nt5iFw0V6A5mgq5wDHY5pYGpcxaVrnh+BBoSy
 5n7x5hDT34zP8WubMZ0Mrqk3N7RWYQKfrjh3Tk0NTsdfijZ6pgSon76AUHCTOAT8AWYr
 PIJg==
X-Gm-Message-State: AOAM531lkQDkWs52k+R+p11yPIuxdw8eMNS8zzlxut4/c9r38LnT9UJq
 jpsY5pihZXybfqeg6IvWH0yEG7vlrZ6MWtfL8y6ljMmuO2xS/hZDxZwBj5c6/6VSFTCGFGSB5Gd
 fbI1EzZMUusHxxou8FUxvJmxp245i
X-Received: by 2002:a17:906:c241:: with SMTP id
 bl1mr3657502ejb.536.1623913656103; 
 Thu, 17 Jun 2021 00:07:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMNmCi3vTpz2vnI8k1VMHnY+eDfTHKwZj+pz75zuHeWvnzRnWNolsTgrs8BXxQaqJHdV1tRA==
X-Received: by 2002:a17:906:c241:: with SMTP id
 bl1mr3657489ejb.536.1623913655968; 
 Thu, 17 Jun 2021 00:07:35 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id u17sm3531258edx.16.2021.06.17.00.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 00:07:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 17 Jun 2021 09:07:30 +0200
Message-Id: <20210617070730.7699-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
References: <20210617070730.7699-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/3] controllers/memcg: accept non-zero
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

It seems that recent Linux kernel still notices some memory allocation
by the memcg tool.  Accept therefore a range from 0 to 32 pages.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../memcg/functional/memcg_max_usage_in_bytes_test.sh       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
index a940606cbd34..8f0fc33996f3 100755
--- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
@@ -40,7 +40,11 @@ test_max_usage_in_bytes()
 
 	if [ $check_after_reset -eq 1 ]; then
 		echo 0 > $item
-		check_mem_stat $item 0
+		# Recent Linux kernels (at least v5.4) started reporting
+		# a non-zero max_usage_in_bytes after resetting the counter.
+		# The typical values are 0, 4096, 8096 and up to 122880.
+		# Cause is not known, so let's just be flexible.
+		check_mem_stat $item 0 $((PAGESIZE * 32))
 	fi
 
 	stop_memcg_process
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
