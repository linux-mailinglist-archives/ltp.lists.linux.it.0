Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC32E17CC
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 04:35:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4DFB3C672C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 04:35:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BE50F3C5710
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 04:35:45 +0100 (CET)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4C5BA600F48
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 04:35:45 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id lb18so2324204pjb.5
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 19:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/99pDg0q31S4seoomClKkVOKHVtQRr8ay8XEOTFUdBw=;
 b=ScEINY1xfzdKcq+Wed/mqqZB9/fWVy09t3oODKR3uaQrMm94zXGBbvlbUw3mVE57Aa
 FVwgs1g51QkFeTN6o0fPlPVBu2wAT5bhaBn5jlA4KqtqSA6TJBEnkQY4+6LAVnvfyZF8
 h9SrwfS8da9RbLR/Mbnv/GXRnXplQ0NBqaQnbibETKCV3c76FJcv9Lnw0ZuNOXNAH9+c
 6v1O3GWhS0Z3tejqybemBru6yPk6CEA6EBUMCf76Xdiuv3+7Pfjrs4nwf3lKTMlE7TIW
 LhaoUuybjWdxpktUJG5ikXBCIE/IQhHiQ0xa0iBsUhGwy7/ZHF7lPdPRx77McBrdJoDw
 DizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/99pDg0q31S4seoomClKkVOKHVtQRr8ay8XEOTFUdBw=;
 b=Be0RJ2JDrm/VeuzpEoMc43wMnbD1Hz4IvhyJCJONzNdjMdnEqvmBwSQpAMArNKnHUo
 pOh6Afgk+/GRofukwHERfGIakopULQkz+HrfLumhTu4eSbCp5Lqw0aRmtPQc31afIcTx
 tBKaoqaIjYFeh7Z2/0dVbO4zHtt+qF+vKlNfGOR7uYg26Gs50N2w/zy6HAfiLGgdsoCm
 +PNVi8NJbCH6FbAAAU/Q6pbqBlohqYRltPcfp3RcrLkWwBBeGfGm50SxDtlkPUKN1zeP
 AGowDyZvWrJ05VCHiYWk+p8TRU1b3hS6AwQrdBwjd2Ufw0GxinzHd5aolE4Glq4u8SLG
 AlfQ==
X-Gm-Message-State: AOAM533IWW0rMprKA1sJSZh5mVjU2s7e2Q1blJBAeJcqCatIryy2h/AI
 wSV4F9QVNqsEv6mMGbTiGWoox2u32aXohk+t
X-Google-Smtp-Source: ABdhPJycBCYiG2rwy8EV350/YUVnubyh6YJfoHfb5sATC/ru3cFeglzkQkZCzf03ED01ZbGx4ME5hw==
X-Received: by 2002:a17:90a:6a48:: with SMTP id
 d8mr23947544pjm.130.1608694543604; 
 Tue, 22 Dec 2020 19:35:43 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id n1sm22809020pfu.28.2020.12.22.19.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 19:35:43 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Wed, 23 Dec 2020 11:35:16 +0800
Message-Id: <20201223033517.1464263-3-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223033517.1464263-1-gengcixi@gmail.com>
References: <20201223033517.1464263-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] lib: implement rtctime_save and rtctime_restore
 function
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

* Reading the RTC in the setup as well as timestamping with monotonic
  timer
* Getting a second monotonic timestamp in the cleanup
* Setting the RTC to the value taken in setup plus the difference in
  the monotonic timer timestamps

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 include/tst_wallclock.h |  4 ++++
 lib/tst_wallclock.c     | 42 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/tst_wallclock.h b/include/tst_wallclock.h
index 7d6723a7a..5103c8321 100644
--- a/include/tst_wallclock.h
+++ b/include/tst_wallclock.h
@@ -12,4 +12,8 @@ void tst_wallclock_save(void);
 
 void tst_wallclock_restore(void);
 
+void tst_rtctime_save(void);
+
+void tst_rtctime_restore(void);
+
 #endif	/* TST_WALLCLK_H__ */
diff --git a/lib/tst_wallclock.c b/lib/tst_wallclock.c
index 282d6ada3..5be1f46d8 100644
--- a/lib/tst_wallclock.c
+++ b/lib/tst_wallclock.c
@@ -11,11 +11,14 @@
 #include "tst_test.h"
 #include "tst_timer.h"
 #include "tst_clocks.h"
+#include "tst_rtctime.h"
 #include "tst_wallclock.h"
 #include "lapi/posix_clocks.h"
 
 static struct timespec real_begin, mono_begin;
 
+static struct rtc_time rtc_begin;
+
 static int clock_saved;
 
 void tst_wallclock_save(void)
@@ -58,3 +61,42 @@ void tst_wallclock_restore(void)
 	if (tst_clock_settime(CLOCK_REALTIME, &adjust))
 		tst_brk(TBROK | TERRNO, "tst_clock_settime() realtime failed");
 }
+
+void tst_rtctime_save(void)
+{
+	/* save initial monotonic time to restore it when needed */
+	if (tst_rtc_gettime(&rtc_begin))
+		tst_brk(TBROK | TERRNO, "tst_rtc_gettime() realtime failed");
+
+	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_begin))
+		tst_brk(TBROK | TERRNO, "tst_clock_gettime() monotonic failed");
+
+	clock_saved = 1;
+}
+
+void tst_rtctime_restore(void)
+{
+	static struct timespec mono_end, elapsed;
+	static struct timespec rtc_begin_tm, rtc_adjust;
+	static struct rtc_time rtc_restore;
+
+	if (!clock_saved)
+		return;
+
+	clock_saved = 0;
+
+	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_end))
+		tst_brk(TBROK | TERRNO, "tst_clock_gettime() monotonic failed");
+
+	elapsed = tst_timespec_diff(mono_end, mono_begin);
+
+	rtc_begin_tm.tv_sec = tst_rtc_tm_to_time(&rtc_begin);
+
+	rtc_adjust = tst_timespec_add(rtc_begin_tm, elapsed);
+
+	tst_rtc_time_to_tm(rtc_adjust.tv_sec, &rtc_restore);
+
+	/* restore realtime clock based on monotonic delta */
+	if (tst_rtc_settime(&rtc_restore))
+		tst_brk(TBROK | TERRNO, "tst_rtc_settime() realtime failed");
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
