Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B9B3C7F25
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 95CA43C8760
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 09:13:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EA7B03C7571
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C4061000DD1
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 09:12:14 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 00FCE2025F;
 Wed, 14 Jul 2021 07:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626246734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f2UvmmvNF4XVDI5AYNrFJNSxzQrFumuKXkPMfGRj5x8=;
 b=H52nEFf3n54Bt8UoBdCEvXefEYJuv23KnO+EWj9uRiouTYHZ2eqvfHnqJLBStSXToWAsW3
 /5wOkYjndrFIACI+DXHRZMC7qkiC7aK/Vh22j9xrTuQbLy7TOtKbDIXmVrnsev/vggAGer
 3D/sgjCId3Y9uWUS345Kh0sUoG2SLKQ=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 956AEA3B8F;
 Wed, 14 Jul 2021 07:12:13 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed, 14 Jul 2021 08:11:57 +0100
Message-Id: <20210714071158.15868-8-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714071158.15868-1-rpalethorpe@suse.com>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 7/8] API: Move libtsc.h from realtime tests include
 to tst_tsc.h
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Allow the meltdown test to use this file without modifying the
CFLAGS. This avoids having to add the include also to the CHECK_FLAGS.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/realtime/include/libtsc.h => include/tst_tsc.h  | 0
 testcases/cve/Makefile                                    | 2 --
 testcases/cve/meltdown.c                                  | 2 +-
 testcases/realtime/func/async_handler/async_handler_tsc.c | 3 ++-
 testcases/realtime/func/measurement/preempt_timing.c      | 3 ++-
 testcases/realtime/func/measurement/rdtsc-latency.c       | 3 ++-
 6 files changed, 7 insertions(+), 6 deletions(-)
 rename testcases/realtime/include/libtsc.h => include/tst_tsc.h (100%)

diff --git a/testcases/realtime/include/libtsc.h b/include/tst_tsc.h
similarity index 100%
rename from testcases/realtime/include/libtsc.h
rename to include/tst_tsc.h
diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
index ddf8b6fe1..c5308794d 100644
--- a/testcases/cve/Makefile
+++ b/testcases/cve/Makefile
@@ -18,8 +18,6 @@ ifneq ($(ANDROID),1)
 cve-2014-0196:  LDLIBS += -lutil
 endif
 
-meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
-
 ifneq (,$(filter $(HOST_CPU),x86 x86_64))
 meltdown: CFLAGS += -msse2
 endif
diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
index a387b3205..5a984aba3 100644
--- a/testcases/cve/meltdown.c
+++ b/testcases/cve/meltdown.c
@@ -19,7 +19,7 @@
 
 #include <emmintrin.h>
 
-#include "libtsc.h"
+#include "tst_tsc.h"
 
 #define TARGET_OFFSET	9
 #define TARGET_SIZE	(1 << TARGET_OFFSET)
diff --git a/testcases/realtime/func/async_handler/async_handler_tsc.c b/testcases/realtime/func/async_handler/async_handler_tsc.c
index 7da4324a5..73d4ee5c6 100644
--- a/testcases/realtime/func/async_handler/async_handler_tsc.c
+++ b/testcases/realtime/func/async_handler/async_handler_tsc.c
@@ -46,7 +46,8 @@
 #include <pthread.h>
 #include <librttest.h>
 #include <libstats.h>
-#include <libtsc.h>
+
+#include "tst_tsc.h"
 
 #define HANDLER_PRIO 98
 #define SIGNAL_PRIO 99
diff --git a/testcases/realtime/func/measurement/preempt_timing.c b/testcases/realtime/func/measurement/preempt_timing.c
index 8b5333480..b84d54692 100644
--- a/testcases/realtime/func/measurement/preempt_timing.c
+++ b/testcases/realtime/func/measurement/preempt_timing.c
@@ -52,7 +52,8 @@
 #include <sys/mman.h>
 #include <stdint.h>
 #include <librttest.h>
-#include <libtsc.h>
+
+#include "tst_tsc.h"
 
 #define ITERATIONS 1000000ULL
 #define INTERVALS 10
diff --git a/testcases/realtime/func/measurement/rdtsc-latency.c b/testcases/realtime/func/measurement/rdtsc-latency.c
index d6ab89ff0..3829947bc 100644
--- a/testcases/realtime/func/measurement/rdtsc-latency.c
+++ b/testcases/realtime/func/measurement/rdtsc-latency.c
@@ -44,7 +44,8 @@
 #include <errno.h>
 #include <stdint.h>
 #include <librttest.h>
-#include <libtsc.h>
+
+#include "tst_tsc.h"
 
 #define ITERATIONS 1000000
 
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
