Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 648453B8D4C
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:03:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E724C3C6B06
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:03:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 139B93C6B0D
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:03:25 +0200 (CEST)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8E2411000F6B
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:03:24 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id o5so8241286ejy.7
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQvRptY0kCD1RP/hVYa6so/HHX2Weg0fvCwLIMhat6Q=;
 b=k+IH3OTuZobwLWZxMa7goxwGYxM2GnsoXpzv7B//7bCZYjJ9BQTntiUw6QJYLhqdLM
 To14KIds6y1bxpX5K0Mlzp9+kho3UBfUlFylNyMNGQIkJJyWgT4Y5BvbNJagj+GCXrre
 IWHd+ZRkYcyDy3noUUXRLdqtLkae9oIHMOVb5/qM0DcnOvC3e1AaG/TEvy1+2cZi/Hg3
 Z3ZTVambcJBgSVdxYXZLVQa8HyprxbHSuSEvmhd5dXEXR9uLtPss2cyewZSAhP1MOSLg
 P3Leyiuq6IzojlYw9UH0DzWgfa1iHbVYjpQWGEFFu8641X0phDgqtFILdZYpN7nyr1CK
 nXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQvRptY0kCD1RP/hVYa6so/HHX2Weg0fvCwLIMhat6Q=;
 b=ExD1du78rHSAGp1BitqnPPFaFhI4lU0sK6Kn2vBinUTOaFwDnh/ND213maUvNidwmY
 1UpdDKRpGkY/XSf0sE3v7OTAiz9Ns+CdJ4w3yS3m6Po5K2A0RkzTxRfI1jJpZK/9sCqX
 kGy81K1xmHtK3mNYGudkCuOhcZ+wU/c4mqM0OEKsrQwP3ELkoxoD3Z32vPUc5QRt5ykt
 VHJhCTeJtupUzodLTwPURGXAQJMoPOI7h+d82QACZpCn/KfiYEJ1TxY/FkcH+Sk+0rOa
 nA8/V5B/NNdesDbo6tbAO7uYbWra7vNpNEBK/C3zUdbsqeqGKcg3QO4Dxq5/VE6wu8mf
 t7PQ==
X-Gm-Message-State: AOAM530low2peJhQNU90/vGushumJG1Fdl1EM7/S9EQpXzHKqOJseOyx
 ybbS0NLWUsXeBFGHQspZPrD6M4+5KP7GYg==
X-Google-Smtp-Source: ABdhPJwUwmMlxDqKWfZMRSz5a7O3rOCGH5eiJ0eC8BpTGsTqb+W4zVSAxkS8iay/viow6v37RNlK1g==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr265444ejy.532.1625115804110; 
 Wed, 30 Jun 2021 22:03:24 -0700 (PDT)
Received: from localhost.localdomain (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id w24sm10319470ejk.58.2021.06.30.22.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 22:03:23 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 07:03:14 +0200
Message-Id: <20210701050314.1005067-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0
In-Reply-To: <20210701050314.1005067-1-petr.vorel@gmail.com>
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] lib/tests: Rename test to tst_fuzzy_sync03.c
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Petr Vorel <pvorel@suse.cz>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/.gitignore                       | 2 +-
 lib/newlib_tests/Makefile                         | 4 ++--
 lib/newlib_tests/{test16.c => tst_fuzzy_sync03.c} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename lib/newlib_tests/{test16.c => tst_fuzzy_sync03.c} (100%)

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index 9f53bbb99..b51f6a679 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -13,7 +13,6 @@ test12
 test13
 test14
 test15
-test16
 tst_capability01
 tst_capability02
 tst_cgroup01
@@ -44,3 +43,4 @@ test_macros03
 test_macros04
 tst_fuzzy_sync01
 tst_fuzzy_sync02
+tst_fuzzy_sync03
diff --git a/lib/newlib_tests/Makefile b/lib/newlib_tests/Makefile
index 5bd68e95e..1fbf7649a 100644
--- a/lib/newlib_tests/Makefile
+++ b/lib/newlib_tests/Makefile
@@ -6,8 +6,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
 CFLAGS			+= -W -Wall
 LDLIBS			+= -lltp
 
-test08 test09 test15 test16 tst_fuzzy_sync01 tst_fuzzy_sync02: CFLAGS += -pthread
-test16 tst_expiration_timer: LDLIBS += -lrt
+test08 test09 test15 tst_fuzzy_sync01 tst_fuzzy_sync02 tst_fuzzy_sync03: CFLAGS += -pthread
+tst_expiration_timer tst_fuzzy_sync03: LDLIBS += -lrt
 
 ifeq ($(ANDROID),1)
 FILTER_OUT_MAKE_TARGETS	+= test08
diff --git a/lib/newlib_tests/test16.c b/lib/newlib_tests/tst_fuzzy_sync03.c
similarity index 100%
rename from lib/newlib_tests/test16.c
rename to lib/newlib_tests/tst_fuzzy_sync03.c
-- 
2.32.0.rc0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
