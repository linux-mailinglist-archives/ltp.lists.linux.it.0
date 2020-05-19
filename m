Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A333F1D9283
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFF603C4E68
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 10:51:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1D7F63C4E6B
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:21 +0200 (CEST)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 63C5A1000D41
 for <ltp@lists.linux.it>; Tue, 19 May 2020 10:51:20 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id u35so6070740pgk.6
 for <ltp@lists.linux.it>; Tue, 19 May 2020 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FgkX7pjArOSJHsMxZLtwqOigdrdlAozbg7OdUVf+AZs=;
 b=hN9IfEKZPS8HakhE422a/Ok9rLhUsRL2Lk/jMp4fYGbDMlY+rSuEWLRRLWRMbPEp9W
 7V5QBh1T9yxwPpfxtKY3HR1qgnaHf6H7vhp6bneGI1lWBZ5++8ThLwtVXBY6Is1hZtdx
 9dtDIjUcyzVRpz+oz4eya69H8zE+4uWGZqN9BFGHnURFRgpnQoiHc0O1KHsPigWaVs9k
 84xIeEubnmKFhAn6ceY13CwcaFnV+LXSeIllUN5XEvj8O2UNaUCb7sVPZcf3Rp/DQPow
 IzH3iJ8SZbVb8109+v4af+SdHTtALMdDy+434XbuB64R8HTPfCb2boAP6GvRy93O/tux
 rB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgkX7pjArOSJHsMxZLtwqOigdrdlAozbg7OdUVf+AZs=;
 b=kkmoh5ZkQpQtKg+aDuQexV5v1Z7Q5cK/trzqJpk+Dwz/fqyUXd/TUFRWEvllnGoUx+
 Hi1bFC/LtNpFh+nr2fKgIri7WdlCWPQUgPamiMmHWdpjQh4mgkbFpfjTzQZIpk3/rWRq
 h+ss27b4e2iFSPBneK5IKwusTeoj99ipViAAJTDoxE3Y+3imcf44eMJHm/A1Yj6flGr+
 Qs7zfG5ZmSCbH/weyI2iV5k1ytXAYB9SCl2j9Og7sXl2b8CdvoSMAgJn3B1CoTvfnVxF
 nViMNbnQaMiUJIN+sUOhvDowEuXTNvoegTN/1UnBXPd9kZ+ciYbcEgv5Bz/DRpUzZJZb
 Zq4g==
X-Gm-Message-State: AOAM5305ikOtYLQ383TjC0r9Pcs97ZTv5WdZpMK8DSUoouEayy06dfC5
 XOfMzgMhuMf3NYuWKwPYyj6MYCu+Olc=
X-Google-Smtp-Source: ABdhPJwcQfYg9KyW23NRzx503hLTEg7MWIwKYL+f9DRzMYkTJkwupHjgPavOujGuFtkfe0UKyr53ag==
X-Received: by 2002:a62:ab04:: with SMTP id p4mr6845761pff.254.1589878278662; 
 Tue, 19 May 2020 01:51:18 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id p2sm9554848pgh.25.2020.05.19.01.51.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 01:51:18 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 14:21:08 +0530
Message-Id: <530fdb27575512ec76d975e31c05f9f58592e2cf.1589877853.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1589877853.git.viresh.kumar@linaro.org>
References: <cover.1589877853.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] tst_safe_clocks: Remove safe_clock_adjtime()
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

safe_clock_adjtime() isn't used anymore, remove it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/tst_safe_clocks.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/tst_safe_clocks.h b/include/tst_safe_clocks.h
index 27e8bda45589..4cb5f41ed82f 100644
--- a/include/tst_safe_clocks.h
+++ b/include/tst_safe_clocks.h
@@ -55,21 +55,6 @@ static inline void safe_clock_settime(const char *file, const int lineno,
 	}
 }
 
-static inline int safe_clock_adjtime(const char *file, const int lineno,
-	clockid_t clk_id, struct timex *txc)
-{
-	int rval;
-
-	rval = tst_syscall(__NR_clock_adjtime, clk_id, txc);
-	if (rval < 0) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d clock_adjtime(%s) failed %i",
-			file, lineno, tst_clock_name(clk_id), rval);
-	}
-
-	return rval;
-}
-
 #define SAFE_CLOCK_GETRES(clk_id, res)\
 	safe_clock_getres(__FILE__, __LINE__, (clk_id), (res))
 
@@ -79,7 +64,4 @@ static inline int safe_clock_adjtime(const char *file, const int lineno,
 #define SAFE_CLOCK_SETTIME(clk_id, tp)\
 	safe_clock_settime(__FILE__, __LINE__, (clk_id), (tp))
 
-#define SAFE_CLOCK_ADJTIME(clk_id, txc)\
-	safe_clock_adjtime(__FILE__, __LINE__, (clk_id), (txc))
-
 #endif /* SAFE_CLOCKS_H__ */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
