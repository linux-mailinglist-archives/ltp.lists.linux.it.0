Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D603B8D4B
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:03:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C24A3C8609
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 07:03:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F35613C2A1C
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:03:23 +0200 (CEST)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8334E1401167
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 07:03:23 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id n25so6439045edw.9
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 22:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRhO9iQu0XdBH0idjanOLjwub69BvjtlcLe5iKrUPag=;
 b=nF7kb8jS0pxeT3NL0X57ZU87cDCZ79DWqMmqpO8Ws+5EyiyYllkExgljxj8HRht3Is
 ijCzWgmd9uix9U7Go83kyEe7sYErFG/qbSkuqlhQvH4zn0fIhMA+NWbiPhJamJi0Hxyd
 D7NkyewG4yTUtdyrsQULcojtxmgHJK9qSX4op0mF6r/yNN2Rr3lb8VADr6j6BkUDJw68
 YZsdFdLfoHnTNiElo78oAK09j+EK54+P0LoFwiAG9QTBvHCWm4cb79+vtmjtZqTzFSnm
 JeqFbfshqhRQzYaoF31U1+Pi1g/Jyv0151ff656SONoUDn+YnXR10Y2zJ2SRaAuF2yNk
 5+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRhO9iQu0XdBH0idjanOLjwub69BvjtlcLe5iKrUPag=;
 b=CwFtWNLcidAZokmjRJR+G36Vm8hJbC22fFY+D4Gj8Lvw0M8cONZvi8852byxgHf6Rg
 huk2E03GluHQCrTQKk4GTmudfwcoVvKVVYZ0Aqd8mGCZdJhpak9dB2oBWqWL+prv8Zrx
 /ExYvAsBBUemYVwcaGx3mrs8YQyUz/l/yDkZ231fKmHtdZ5D0ZJGkfq9dAR0rnBJINd4
 UbehmD2+3LaTd5R7lh1G9TX6pk5hnsR2/Hi5JVMnjYLzLI4z6tFFoaoQajq1t8Io/yna
 uZnEmgp26llg4V+GqbDQpYnqbSe5yY+1ss9KJjBMTFFbRvzOZk4DyMzELewnItHuqhUB
 NkWw==
X-Gm-Message-State: AOAM533S45Caul9lvXy+qmsinjvHKahvFL0TwhkWXHwv+CTHLuFX68Ig
 +lVwDO7gelKq62YJOUu2DFwkMUoxqLBj+A==
X-Google-Smtp-Source: ABdhPJz4va5Q0G2zJq8z90XyUDOK6nLfJrC6LwEG7JME7OyfyJpifM8tUXD7AQPGcSgfqwIBnK0PWg==
X-Received: by 2002:a05:6402:1e8c:: with SMTP id
 f12mr50805024edf.169.1625115803149; 
 Wed, 30 Jun 2021 22:03:23 -0700 (PDT)
Received: from localhost.localdomain (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id w24sm10319470ejk.58.2021.06.30.22.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 22:03:22 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Thu,  1 Jul 2021 07:03:13 +0200
Message-Id: <20210701050314.1005067-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0.rc0
In-Reply-To: <20210701050314.1005067-1-petr.vorel@gmail.com>
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/tests: Rename test tst_print_result.c
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

Also:
* remove copy pasted test description
* fix author in the copyright

Fixes: cecbd0cb3 ("Fix buffer overflow in print_result() function")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/.gitignore                       |  2 +-
 lib/newlib_tests/{test17.c => tst_print_result.c} | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename lib/newlib_tests/{test17.c => tst_print_result.c} (80%)

diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index 83a240223..9f53bbb99 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -22,7 +22,7 @@ tst_device
 tst_safe_fileops
 tst_res_hexd
 tst_strstatus
-test17
+tst_print_result
 test18
 test19
 test20
diff --git a/lib/newlib_tests/test17.c b/lib/newlib_tests/tst_print_result.c
similarity index 80%
rename from lib/newlib_tests/test17.c
rename to lib/newlib_tests/tst_print_result.c
index c0fc0bc30..0a2ca5af1 100644
--- a/lib/newlib_tests/test17.c
+++ b/lib/newlib_tests/tst_print_result.c
@@ -1,12 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2017 Richard Palethorpe <rpalethorpe@suse.com>
+ * Copyright (c) 2017 Veronika Kabatova <vkabatov@redhat.com>
  */
-/* Basic functionality test for tst_fuzzy_sync.h similar to the atomic tests
- * (test15.c). One thread writes to the odd indexes of an array while the
- * other writes to the even. If the threads are not synchronised then they
- * will probably write to the wrong indexes as they share an index variable
- * which they should take it in turns to update.
+
+/*
+ * Test for cecbd0cb3 ("Fix buffer overflow in print_result() function")
  */
 
 #include <stdlib.h>
-- 
2.32.0.rc0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
