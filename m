Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B31BB59A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:00:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD1813C5F47
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:00:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D4C5D3C282C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:00:36 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id ED4C11000ADC
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:00:35 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id f8so7881478plt.2
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 22:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PwrZ/mMqFEdsR17/Z/WYlMNgJc2KSTz7iBek00LEOp8=;
 b=gTQl9eDGLDXjuJ35yI35Eo/cAvUa2p4Hr4TXDgOBE0w1kcyzUiw7jSEFvnVq+qTAK3
 7E7EsZhGpegcRotFhTFK1amVg9hjd/dNdmxU5/fywmG6EdGXkSBiUjTAwFP8UpFTHnO+
 mJtMTMPptnuEBOrWejd1Z+ENaCDLv/LyyFVig9SxBDioy4+6aQ9RrNtjipHYu6ktFYnb
 xMAGy+6OalfvmBZC6WoNy2KphF2qq2tzYxiTm8XqRFHDyjvX/2OxJzBQLoJsJ4ZiiO55
 Gj0y+QCRozmMedtUhMYQzxpz8LvlBP2rMgSKK3LkJt0OV+KB1gv44G+VQUCxzrZkq1v7
 B62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PwrZ/mMqFEdsR17/Z/WYlMNgJc2KSTz7iBek00LEOp8=;
 b=BjirT7Yg8VWkJCzwCZpL6XUtEFjBdSIDIww+U/zV6VF0TYUIQjY7VH+RodfhU+ktwF
 vOlnRnVmsFb4UT4oWGRpLxINZmDQVI0Rw2KcLFrmsPHfq/iPujJ5NebfCGjTX9GS5lY3
 5sdapdCdnhS+xBmi4eqmQZ7jqBg6et8WOvsDMhydJDa8Z6JT9lsx/VDTGWzT7e/vlYsO
 fjTu1LWgDhTjQCq7bfohQrVapLtZ9d6nt302iysWN455D6UMbi5uAEZPP7pvorydJucV
 RVxFuimwqF6/QXuRTsUOsNbkxs5jdeDNSrkonK3ecQ/2iuvkvsatHJmbPxNyMKopCBqx
 CsUA==
X-Gm-Message-State: AGi0PubT62OtCqQR77D0EeioqN8D2vV9uL2vocaNLoxTuL2Cy64OT3Ni
 suYT45a8bbQavA+/QaACKcamV+YyLK4=
X-Google-Smtp-Source: APiQypIybGFbupfW6OKzS0mjOsQDmeR6/kZNHshRuXUbVWwBmZwcyxS5eTIA3a1INKF7xrpCKUwiUg==
X-Received: by 2002:a17:90a:648d:: with SMTP id
 h13mr2969415pjj.12.1588050034143; 
 Mon, 27 Apr 2020 22:00:34 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id m4sm13874803pfm.26.2020.04.27.22.00.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 22:00:33 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 28 Apr 2020 10:30:29 +0530
Message-Id: <90ea553dfdea21683c517a7f47b2a5d3c2dba77f.1588050000.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <20200427145212.GA5678@dell5510>
References: <20200427145212.GA5678@dell5510>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] common_timers: staticize all definitions
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Staticize all variable and function definitions to avoid build failures
in the future if this gets included by multiple files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/common_timers.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/lapi/common_timers.h b/include/lapi/common_timers.h
index df4196eeb579..d2d0d0dab5fd 100644
--- a/include/lapi/common_timers.h
+++ b/include/lapi/common_timers.h
@@ -15,7 +15,7 @@
 #define NSEC_PER_SEC (1000000000L)
 #endif
 
-clock_t clock_list[] = {
+static clock_t clock_list[] = {
 	CLOCK_REALTIME,
 	CLOCK_MONOTONIC,
 	CLOCK_PROCESS_CPUTIME_ID,
@@ -34,7 +34,7 @@ clock_t clock_list[] = {
 	case def_name:		\
 		return #def_name;
 
-const char *get_clock_str(const int clock_id)
+static inline const char *get_clock_str(const int clock_id)
 {
 	switch (clock_id) {
 	CLOCK_TO_STR(CLOCK_REALTIME);
@@ -50,7 +50,7 @@ const char *get_clock_str(const int clock_id)
 	}
 }
 
-int possibly_unsupported(clock_t clock)
+static inline int possibly_unsupported(clock_t clock)
 {
 	switch (clock) {
 	case CLOCK_BOOTTIME:
@@ -63,7 +63,7 @@ int possibly_unsupported(clock_t clock)
 	}
 }
 
-int have_cputime_timers(void)
+static inline int have_cputime_timers(void)
 {
 	return tst_kvercmp(2, 6, 12) >= 0;
 }
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
