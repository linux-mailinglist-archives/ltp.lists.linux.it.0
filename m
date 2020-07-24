Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F260222C109
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 10:43:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B3373C4D1B
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 10:43:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4534C3C0886
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 10:43:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7512E1001F54
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 10:43:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 583B6AE7A;
 Fri, 24 Jul 2020 08:43:16 +0000 (UTC)
Date: Fri, 24 Jul 2020 10:43:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200724084331.GD9768@yuki.lan>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
 <8b0c584c86d4f45212ccf418e9840a53b6e62a09.1595511710.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b0c584c86d4f45212ccf418e9840a53b6e62a09.1595511710.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] libs: sigwait: Add SAFE_SIG*() macros
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with a minor change, thanks.

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 3fce473cc..f3f83cddd 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -438,8 +438,9 @@ static inline void safe_sigaddset(const char *file, const int lineno,
 
 	rval = sigaddset(sigs, signo);
 	if (rval == -1) {
-		tst_brk_(file, lineno, TBROK | TERRNO, "sigaddset(%d) failed",
-			 signo);
+		tst_brk_(file, lineno, TBROK | TERRNO,
+		         "sigaddset() %s (%i) failed",
+			 tst_strsig(signo), signo);
 	}
 }
 
@@ -453,8 +454,9 @@ static inline void safe_sigdelset(const char *file, const int lineno,
 
 	rval = sigdelset(sigs, signo);
 	if (rval == -1) {
-		tst_brk_(file, lineno, TBROK | TERRNO, "sigdelset(%d) failed",
-			 signo);
+		tst_brk_(file, lineno, TBROK | TERRNO,
+		         "sigdelset() %s (%i) failed",
+			 tst_strsig(signo), signo);
 	}
 }
 


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
