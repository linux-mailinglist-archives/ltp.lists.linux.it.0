Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A64332B2B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:56:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 223B83C6A8C
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:56:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8B0DA3C4BF0
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:56:25 +0100 (CET)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 315BA600C48
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:56:25 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso6792469wma.4
 for <ltp@lists.linux.it>; Tue, 09 Mar 2021 07:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=C0l4MOEDr5TPrHYvjVTnpKT7GkErPlP41/HfFr/l6f8=;
 b=NSd3itvZZBq2M/iAZXZmHIs4Egvw45qT0CKQ2TM6c8NVR2O47AKQm6eTI/ZGKQxAZc
 mFGinSHNMBB4RDvOgAHn2ont6vkQb9NQl+Tljx3elmd1GWuCH0j7PtNH1AYz3aYR7d0U
 7M1/qlrjPgKgKMTM+W3xKrP8M723gpHrBd2D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C0l4MOEDr5TPrHYvjVTnpKT7GkErPlP41/HfFr/l6f8=;
 b=HI1zaccFrOGTdt0Z7xNcyf4sBPc86JpgqsGrTDZxNAwoNhU351QK3TQBFg21sDGIkd
 5YWO+7yJUQENNB9X8vXeBLX8pXAkbO8UAwba4Z2OaMv55jxMrWGvjuxrQ1eSRTUagi7c
 CFsedyoUOT6xvySUZZR6bB88YWWVWmiDTH5mYAvtQX+9lp90lnoZHwxGs8/5OB+Cxc8k
 hxbqU2Ab8jh/TjSdBbWsy66yTFfAeOhpZA8B0I76gEAJGqPhpPwv37F9o3A5NBZn5pZD
 8osHRU9UaFuNdb6L+he5u8ZhId2fzYaEQsCbD5t8bjxwunC27u7cKj8CGxzG/UrMq/1h
 02Fw==
X-Gm-Message-State: AOAM533oP0YAUggJP2VYesQ5jtk8V6gq6zq9SivStHjZI+EyV7iG56kt
 BNkKYhWYWlwZLvMc89YnZ0AUf0bFJpwF6A==
X-Google-Smtp-Source: ABdhPJwF6eaRcr29gbKZayyUFvl6+I5BKz87TeWDJHYunSvvC8WmRyNh1zcmELOWGscQFhSkeOAIag==
X-Received: by 2002:a1c:1dd5:: with SMTP id d204mr4667557wmd.127.1615305384652; 
 Tue, 09 Mar 2021 07:56:24 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
 by smtp.gmail.com with ESMTPSA id u23sm4721418wmn.26.2021.03.09.07.56.24
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:56:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: LTP List <ltp@lists.linux.it>
Date: Tue,  9 Mar 2021 15:56:23 +0000
Message-Id: <20210309155623.2457857-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210309155623.2457857-1-richard.purdie@linuxfoundation.org>
References: <20210309155623.2457857-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls/swapon/swapoff: Move common library to
 libs/
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

There is a race/determinism issue with libswapon currently as depending on
which makefile path builds it, the debug paths may be "../swapon/libswapon.c"
or "libswapon.c". To avoid the determinism issue, move libswapon to libs/
and use it from the shared location.

The header is moved to the common includes directory to match and
the Makefile.inc fragment can be dropped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../kernel/syscalls/swapon => include}/libswapon.h   |  0
 libs/libltpswapon/Makefile                           | 12 ++++++++++++
 .../swapon => libs/libltpswapon}/libswapon.c         |  0
 testcases/kernel/syscalls/swapoff/Makefile           |  7 +++++--
 testcases/kernel/syscalls/swapoff/Makefile.inc       |  6 ------
 testcases/kernel/syscalls/swapoff/swapoff01.c        |  2 +-
 testcases/kernel/syscalls/swapoff/swapoff02.c        |  2 +-
 testcases/kernel/syscalls/swapon/Makefile            |  6 +++---
 8 files changed, 22 insertions(+), 13 deletions(-)
 rename {testcases/kernel/syscalls/swapon => include}/libswapon.h (100%)
 create mode 100644 libs/libltpswapon/Makefile
 rename {testcases/kernel/syscalls/swapon => libs/libltpswapon}/libswapon.c (100%)
 delete mode 100644 testcases/kernel/syscalls/swapoff/Makefile.inc

diff --git a/testcases/kernel/syscalls/swapon/libswapon.h b/include/libswapon.h
similarity index 100%
rename from testcases/kernel/syscalls/swapon/libswapon.h
rename to include/libswapon.h
diff --git a/libs/libltpswapon/Makefile b/libs/libltpswapon/Makefile
new file mode 100644
index 000000000..8f738338b
--- /dev/null
+++ b/libs/libltpswapon/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) Richard Purdie <richard.purdie@linuxfoundation.org>
+
+top_srcdir		?= ../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+INTERNAL_LIB		:= libltpswapon.a
+
+include $(top_srcdir)/include/mk/lib.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/swapon/libswapon.c b/libs/libltpswapon/libswapon.c
similarity index 100%
rename from testcases/kernel/syscalls/swapon/libswapon.c
rename to libs/libltpswapon/libswapon.c
diff --git a/testcases/kernel/syscalls/swapoff/Makefile b/testcases/kernel/syscalls/swapoff/Makefile
index fbfbe0441..a74374605 100644
--- a/testcases/kernel/syscalls/swapoff/Makefile
+++ b/testcases/kernel/syscalls/swapoff/Makefile
@@ -3,7 +3,10 @@
 
 top_srcdir		?= ../../../..
 
+LTPLIBS = ltpswapon
+
 include $(top_srcdir)/include/mk/testcases.mk
-include $(abs_srcdir)/./Makefile.inc
+
+LTPLDLIBS  = -lltpswapon
+
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-$(MAKE_TARGETS): %: ../swapon/libswapon.o
diff --git a/testcases/kernel/syscalls/swapoff/Makefile.inc b/testcases/kernel/syscalls/swapoff/Makefile.inc
deleted file mode 100644
index 65350cbeb..000000000
--- a/testcases/kernel/syscalls/swapoff/Makefile.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-LIBDIR			+= ../swapon/
-LIBSWAPON		:= $(LIBDIR)/libswapon.o
-$(LIBSWAPON):
-	$(MAKE) -C $(LIBDIR)
-CPPFLAGS		+= -I$(abs_srcdir)/$(LIBDIR)
-LDFLAGS			+= -L$(abs_builddir)/$(LIBDIR)
diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kernel/syscalls/swapoff/swapoff01.c
index e115269c0..87a217a89 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff01.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
@@ -25,7 +25,7 @@
 #include <stdlib.h>
 #include "config.h"
 #include "lapi/syscalls.h"
-#include "../swapon/libswapon.h"
+#include "libswapon.h"
 
 static void setup(void);
 static void cleanup(void);
diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c b/testcases/kernel/syscalls/swapoff/swapoff02.c
index 8954f975f..60cd66c26 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff02.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff02.c
@@ -33,7 +33,7 @@
 #include "test.h"
 #include "lapi/syscalls.h"
 #include "safe_macros.h"
-#include "../swapon/libswapon.h"
+#include "libswapon.h"
 
 static void setup(void);
 static void cleanup(void);
diff --git a/testcases/kernel/syscalls/swapon/Makefile b/testcases/kernel/syscalls/swapon/Makefile
index 97113a447..57ec45d48 100644
--- a/testcases/kernel/syscalls/swapon/Makefile
+++ b/testcases/kernel/syscalls/swapon/Makefile
@@ -8,10 +8,10 @@ endif
 
 top_srcdir		?= ../../../..
 
+LTPLIBS = ltpswapon
+
 include $(top_srcdir)/include/mk/testcases.mk
 
-FILTER_OUT_MAKE_TARGETS         := libswapon
+LTPLDLIBS  = -lltpswapon
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-
-$(MAKE_TARGETS): %: libswapon.o
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
