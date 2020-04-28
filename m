Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A23B1BB87F
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 10:10:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20E383C2862
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 10:10:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2A5CF3C2838
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 10:10:21 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D84A6600973
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 10:10:13 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id t7so2124715plr.0
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCIyxYjpLZmwDiXGOJqb8SpdsXbovmwj+uiazPZUsO0=;
 b=HX6RvsZjEMl1kxao888GvARbr7wRDhAgyQZsbF0CAKZFDOoMwnueuPAGcePrCPhhOR
 +5+FyCzC6bowjcd9C7NG7U7ig8R1WhVm+XvombCJkPdC3jyw+l+LnSa8zYrwLjWpCga9
 kmS6VWaJGm+BqF9n9laLtdbWbBauc8qGjttXE/7iSiivXkHFte+DD24tKtT6HS9nAjds
 e5jaE8qboSNUh4uSkXvMmxPImGgAwgEEznHuDUpVY+yd2yhrHZsNgVld8Iz2NMRk2Bpx
 Gpf9QVYnPu0OAsYsBCbX0oyIdQCsFqZ5l4mtu7K/qwPsZkMcBKtlg7M5bMDHftYtwXyF
 icMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCIyxYjpLZmwDiXGOJqb8SpdsXbovmwj+uiazPZUsO0=;
 b=kAvTXfGPonQKaQ3/CDRO2lND14p+YUHGwNxLN1qYIXaRyGkevcR4BbImXCLsEysL+k
 Oh4eQJNOoL7xFqW9/9PUaXNPmAw4GsOdnlqocStDVsdqUkYowKk60qIfxgDCL+NVxBh3
 HJE1ax3qWqz3ZbatmCRs8Gj04A4usy7WWx/p49Sf511lwvefXF296Wr5XHSqBv2TI8C2
 bvbwLibz15xWcBIi3WAPTItuqle8UYQ6/xBGSv77XC6oLROp5e/cVOsJMGKO/Ds6LtIs
 Yr5aaCy6g/A8X7iVdYT+KXhwE/ETwZh0zA/ppTrNeL4t9H+LjQWQ9mmDL21DAWyzNmL2
 RG+w==
X-Gm-Message-State: AGi0PuY1XL2jMmM1jwgXOkQ8A78Sng6h+AJT8uxhEqJGZSjMrGBvMCl5
 lJ85dRYaxAyw6SJ1mtJIfvwGuuijfpI=
X-Google-Smtp-Source: APiQypI3gMCa+KR5m8FGwn8phAoFpauOCJEDhWn9wu7a1QHFB+L8OM+uHrWNX8+DqY7KmY/5+r3kyQ==
X-Received: by 2002:a17:902:9895:: with SMTP id
 s21mr5897795plp.158.1588061418523; 
 Tue, 28 Apr 2020 01:10:18 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 3sm15003013pfo.27.2020.04.28.01.10.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 01:10:17 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 28 Apr 2020 13:40:14 +0530
Message-Id: <d39e442b4c0e60880f1da3f69125afa01418f8c1.1588061382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH V2] common_timers: staticize all definitions
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
Make clock_list static const to avoid warnings.

 include/lapi/common_timers.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/lapi/common_timers.h b/include/lapi/common_timers.h
index df4196eeb579..b783beff4f8b 100644
--- a/include/lapi/common_timers.h
+++ b/include/lapi/common_timers.h
@@ -15,7 +15,7 @@
 #define NSEC_PER_SEC (1000000000L)
 #endif
 
-clock_t clock_list[] = {
+static const clock_t clock_list[] = {
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
