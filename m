Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6072F0E57
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:41:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9AE173C5FC8
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:41:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0B8463C5FF5
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:31 +0100 (CET)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A7E601000934
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:41:30 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id v3so9116302plz.13
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 00:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B8FjTtXfharJtxQVs95FkB3wNzPTYhGviGgFDbFbQ6A=;
 b=YbmOyb0eMKxbw/TG1L/MTcvW9PbbJX9xcas7bDtQEbe0XoUjNfMBTtVTRekoszyLad
 HBGluEmH8r9tW/fQoMtBBb71jb66UlpMFtYzRooskngDKxPK7CWpsuiSHahKlFQrdT5X
 7Ab3YoOYpyXvq/s1x+lVyR6h7ekzRWx4AQnOcCpNYK8LByOuhwBjJwjxcPVV/C24uiYz
 T1RQzPrJLSPurNF2rWsiaKOL/SORr6ezuF1oZ476nELQEzBtyX+Bl6gyOuyiDurvs1DF
 bLkXrTIFOtRbM1y1fKaeQYro4pj7+Co0QsmDFwwT6z0Us5ALt1IQT//WpPt9lv+av4Ga
 PMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B8FjTtXfharJtxQVs95FkB3wNzPTYhGviGgFDbFbQ6A=;
 b=iffzE3BZoHyTPzLi3mGxuoaO1cVbVTmY9zV0VrQdxGiaO63q6Q73NogkzV3KLMd/Da
 4AHCutqj6eiyX6PIvW54063+HmSFlartYxjiamYPeCja10rOEOw1ej63a6la2fziL9iQ
 lc1jWpuKNp3SiNL49mmxnhbAGK73FJcNbVxuf+B6JafgzUNftKoXyGGKTK2fleNtKXC/
 zofDfYGbNK33FvejfjXLGcjEPvnPv3hgvTEZN+PBIlDljE+9WyXWIrAFVOGV0pjLgiSg
 DOh53o0S1FOY36koly7j1dzIOka2OWxZLs9JVq+/wI9n6BIEaUEfRbvOuEgK3ganw3kY
 4VvA==
X-Gm-Message-State: AOAM530Q5gGoX8v7kJIt40N58jw8aoyOzssSOmQtEa7CIMfYwnf5prYg
 GW4agZ7MEpUVTX+jmVS8bvU=
X-Google-Smtp-Source: ABdhPJzQawSYABIQqwBvryV7H+twa7uY+t7cXIQohIutzdWxUECVJ82O0J8y+ZigtzxM49ZM/myb0w==
X-Received: by 2002:a17:90a:1d07:: with SMTP id
 c7mr16951668pjd.154.1610354489295; 
 Mon, 11 Jan 2021 00:41:29 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u12sm19186901pgi.91.2021.01.11.00.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 00:41:29 -0800 (PST)
From: gengcixi@gmail.com
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Mon, 11 Jan 2021 16:37:09 +0800
Message-Id: <20210111083711.1715851-3-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111083711.1715851-1-gengcixi@gmail.com>
References: <20210111083711.1715851-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 2/3] lib: implement rtc_clock_save and
 rtc_clock_restore function
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

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 include/tst_wallclock.h |  4 ++++
 lib/tst_wallclock.c     | 44 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/include/tst_wallclock.h b/include/tst_wallclock.h
index 7d6723a7a..56d30f02e 100644
--- a/include/tst_wallclock.h
+++ b/include/tst_wallclock.h
@@ -12,4 +12,8 @@ void tst_wallclock_save(void);
 
 void tst_wallclock_restore(void);
 
+void tst_rtc_clock_save(char *rtc_dev);
+
+void tst_rtc_clock_restore(char *rtc_dev);
+
 #endif	/* TST_WALLCLK_H__ */
diff --git a/lib/tst_wallclock.c b/lib/tst_wallclock.c
index 282d6ada3..c1a640338 100644
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
@@ -58,3 +61,44 @@ void tst_wallclock_restore(void)
 	if (tst_clock_settime(CLOCK_REALTIME, &adjust))
 		tst_brk(TBROK | TERRNO, "tst_clock_settime() realtime failed");
 }
+
+void tst_rtc_clock_save(char *rtc_dev)
+{
+	/* save initial monotonic time to restore it when needed */
+	if (tst_rtc_gettime(rtc_dev, &rtc_begin))
+		tst_brk(TBROK | TERRNO, "tst_rtc_gettime() realtime failed");
+
+	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_begin))
+		tst_brk(TBROK | TERRNO, "tst_clock_gettime() monotonic failed");
+
+	clock_saved = 1;
+}
+
+void tst_rtc_clock_restore(char *rtc_dev)
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
+	rtc_begin_tm.tv_nsec = 0;
+
+	rtc_begin_tm.tv_sec = tst_rtc_tm_to_time(&rtc_begin);
+
+	rtc_adjust = tst_timespec_add(rtc_begin_tm, elapsed);
+
+	tst_rtc_time_to_tm(rtc_adjust.tv_sec, &rtc_restore);
+
+	/* restore realtime clock based on monotonic delta */
+	if (tst_rtc_settime(rtc_dev, &rtc_restore))
+		tst_brk(TBROK | TERRNO, "tst_rtc_settime() realtime failed");
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
