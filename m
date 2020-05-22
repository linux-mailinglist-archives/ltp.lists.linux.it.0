Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289E1DE02B
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CEED63C4C19
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0DFED3C4CA5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:23 +0200 (CEST)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 66A8A600B6E
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:22 +0200 (CEST)
Received: by mail-pg1-x52b.google.com with SMTP id f21so1584612pgg.12
 for <ltp@lists.linux.it>; Thu, 21 May 2020 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FgkX7pjArOSJHsMxZLtwqOigdrdlAozbg7OdUVf+AZs=;
 b=xyGiI0niOOxH2KxKtTYcqByWwA4lYvCxu6i3QN4aySpZhCczQGKZUdx5f9mPt2Vu2O
 2hCm1q6ZW/4hIJySrt3riPZ7HlgXiKo6E7Gfjgh94MwQ7WXkZq/y9aPV5dcVmRCXO3vi
 8bbLcB8zUk35icnwOnCnMhLc0tt5SZt/grZosI/ByksuPIC1MOuP8PuQrB3GlbbLAgj/
 G89GNs+N0av1WivCFirZJao1iBIZUdWofSXlWJwx0O/xrZESi/W59gnZMeZt+noKtcro
 y7eFSWV3iScT/4ujtP7t8czVOywit2ldfGsZ9mGkknoN0gg5wQJ8jzaamgzOAB7XdEeG
 JvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FgkX7pjArOSJHsMxZLtwqOigdrdlAozbg7OdUVf+AZs=;
 b=dKE/laM4OEpgFSwWUQJc5FthapshUM5g63X0cQvDzYu2TPDTRK2Aaz7/K7TG9eE4wx
 /55qTJCO5ujU6gj0OHE6qOMWQ4+ywsl01kn8l7TQx/jJzKArIG6CzSvuMMf/xRRnrtvJ
 izFf+aFB7uOYX7EXQUABe8r0r7GEYsoBbn6L54r2pDMD8i+kjOE6feaqMWYIj940fqsA
 cm6HyDuHXv4INVtz61hX3TGohgQAw0Lzi2bQojrA+562hp+TmMy1dE31Cg3lhfeu6SCG
 Ows9HTKVI/p/YeQYtiqWs85sTC1Mno8YWC4gGQAPO9QxnAqBAub/CjUGMIQkYdqxBWIN
 1R4A==
X-Gm-Message-State: AOAM532svIJxfZtcRTSwVbu7D/1FQPsgdCoQ16vyoaoiEX1d3/Hq+jSG
 4VCRRAS6k+VOBkX6ClkWGtnqUiN7mFc=
X-Google-Smtp-Source: ABdhPJz2BQBnEv2FCYtL8KfFFICel81kirfbirpGF6qHOxoUXzJwkUEd937AW5218+UkN1fdoEAQ9w==
X-Received: by 2002:a63:5a41:: with SMTP id k1mr12905240pgm.424.1590130460639; 
 Thu, 21 May 2020 23:54:20 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id bv24sm5984723pjb.28.2020.05.21.23.54.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 23:54:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:24:07 +0530
Message-Id: <d6f2460611242e1ae0a967483e4550d95c55ee95.1590130423.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590130423.git.viresh.kumar@linaro.org>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/6] tst_safe_clocks: Remove safe_clock_adjtime()
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
