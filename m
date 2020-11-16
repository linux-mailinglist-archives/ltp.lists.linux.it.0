Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5502B3D37
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 07:43:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE2453C2F6A
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 07:43:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 88E9A3C25FE
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 01:33:50 +0100 (CET)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2FB5E10005C1
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 01:33:50 +0100 (CET)
Received: by mail-pf1-x442.google.com with SMTP id 10so12014497pfp.5
 for <ltp@lists.linux.it>; Sun, 15 Nov 2020 16:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NEBzMo3JJDSekS2ojV+KtVyT0N3NqkAKxvE9UOY8HiA=;
 b=TwY4GjBlDIfberPPQzGA+s8towDyYmVkGsrWzVIgHC1R9iU9cYqcUCQTnS6hBaj/37
 PX7Ac+Zpll9r6hffnq+9Shg9/hb3dibpCCmVTAUkMKJweGq864n4yQ5J3pJaId0CoHb1
 HDkBYOdaANic2FJRUkVYCbQQD8XC2Sz285M8uRxT8CgIC4hjtVeavvJtLMl9JUKiBLyo
 pgePnj0IVG9vfGxqu45GnDYsu5sE9Uaz2zOBhO4Mk7Gjt+2p8jEV4AUGicHmypKWW1rn
 qDwG672vGMlo+BhycWBEBv8YGHl8Z41lClXX9QzbkkafEPgSJFjJAGar7hla0K1UFKTE
 bcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NEBzMo3JJDSekS2ojV+KtVyT0N3NqkAKxvE9UOY8HiA=;
 b=nq5vU8PorjYlvJN7M5Yr0dRnR0fu0hxhtI9mKAM3ov6wvAEJvC1bIKKapkzs1l4Bno
 9km2cJCnud5Yqle/21mCJKh07pnIHyUyn4Qv8Z8UM5i3Z8eLaDqEqANCitUeE6ST4n2/
 qX1sf6F74GHmZD+OXu2n2GgSS2tjbUb07cbPzWOBNQny/eGRa2AU/5fyMNaf/f76a0wk
 QAa44kkQNjI6hAkuBPLpYZU/mhbEwBuLMEef+Vggaewv34TmVlCLUd+5P1PRMPfAZr45
 uzF5AwTmHRrAJy8rSS2u3GeumHWSlv0EtDvi3GLxuGjfV2k3HYd/JT5zwtnuqwlCHTVH
 MYPA==
X-Gm-Message-State: AOAM530dXISY5MudeYOL7SVHocT0x/p6djFzVL8TLGTZqBEqb3EG3g0l
 QQVvZJ55FKjQXcEf6pA/L/PrG+bf78eJyg==
X-Google-Smtp-Source: ABdhPJx5o7SKRfS+ko1+jmBcKVxDYS+erVUN9LfhATcE6wdG4996pMNyrw/dxtqFgybPPXyWum4aXA==
X-Received: by 2002:a65:51c8:: with SMTP id i8mr11072719pgq.142.1605486828320; 
 Sun, 15 Nov 2020 16:33:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
 by smtp.gmail.com with ESMTPSA id k4sm16846289pfg.130.2020.11.15.16.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 16:33:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it,
	Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 15 Nov 2020 16:33:45 -0800
Message-Id: <20201116003345.3261577-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 16 Nov 2020 07:43:34 +0100
Subject: [LTP] [PATCH] Define SYS_futex on 32bit arches using 64-bit time_t
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
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Newer 32bit arches like RISCV32 and ARC are using 64bit time_t
from get go unlike other 32bit architecture therefore aliasing __NR_futex to
__NR_futex_time64 helps avoid the below errors

tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/tst_checkpoint.c                        | 4 ++++
 testcases/kernel/syscalls/clone/clone08.c   | 4 ++++
 testcases/kernel/syscalls/futex/futextest.h | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
index 5e5b11496c..80e82c13f4 100644
--- a/lib/tst_checkpoint.c
+++ b/lib/tst_checkpoint.c
@@ -31,6 +31,10 @@
 #include "safe_macros.h"
 #include "lapi/futex.h"
 
+#if !defined(SYS_futex) && defined(SYS_futex_time64)
+#define SYS_futex SYS_futex_time64
+#endif
+
 #define DEFAULT_MSEC_TIMEOUT 10000
 
 futex_t *tst_futexes;
diff --git a/testcases/kernel/syscalls/clone/clone08.c b/testcases/kernel/syscalls/clone/clone08.c
index 8e115b0421..aaaff94aa0 100644
--- a/testcases/kernel/syscalls/clone/clone08.c
+++ b/testcases/kernel/syscalls/clone/clone08.c
@@ -17,6 +17,10 @@
 #include "clone_platform.h"
 #include "lapi/syscalls.h"
 
+#if !defined(SYS_futex) && defined(SYS_futex_time64)
+#define SYS_futex SYS_futex_time64
+#endif
+
 static pid_t ptid, ctid, tgid;
 static void *child_stack;
 
diff --git a/testcases/kernel/syscalls/futex/futextest.h b/testcases/kernel/syscalls/futex/futextest.h
index c50876fa67..06e2275d55 100644
--- a/testcases/kernel/syscalls/futex/futextest.h
+++ b/testcases/kernel/syscalls/futex/futextest.h
@@ -20,6 +20,10 @@
 #include "lapi/futex.h"
 #include "tst_timer.h"
 
+#if !defined(SYS_futex) && defined(SYS_futex_time64)
+#define SYS_futex SYS_futex_time64
+#endif
+
 #define FUTEX_INITIALIZER 0
 
 #ifndef FUTEX_CMP_REQUEUE
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
