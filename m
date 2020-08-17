Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24742246601
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:07:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D39A83C58DA
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:07:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 647B13C58DA
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:07:00 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9A5D61400C57
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:07:00 +0200 (CEST)
Received: from mail-pj1-f69.google.com ([209.85.216.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1k7dul-0005I0-Q4
 for ltp@lists.linux.it; Mon, 17 Aug 2020 12:06:59 +0000
Received: by mail-pj1-f69.google.com with SMTP id l22so10310040pjt.8
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 05:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DKbd1jKQtCKQD5QOm5w9A/LUS4UbR6kFO2gwaNAn7kk=;
 b=PGjTxLU06r0gTvStayrEXP3sn0qECfInc4YO4e/m+3sW6VRbEAQadGSYLbOY6ScNHd
 K+31xXE6CyjEzVKVoldd1pd6qXtmvITs/CgXl0ophxSwUh+hN8KakTF0Knit3+QpbxGd
 WhTq7epJBHKoumir/vdXt1Apmb6g966ciNZR5Ea0DDXTdTfS1YmYCHuTpmTrHMmtzN1/
 dPzyL22zbgp/2neWkBZ5SKQMExNOpJOsnNKnn91hgpula/h0McJ23p/Zq9ET//fW0KfC
 Wlhk9rmyaDEs3XaOKom45zcq+V4eAKRmz21buvfoPbn2iMbBcfN+6WDGm2yPkgkTev8F
 Lv5Q==
X-Gm-Message-State: AOAM53008KIESVggNmVcPJ3934GQcEg8x4b/KTEM/ZZKuB6EfucPRYX9
 TZQ9oNYI1Ai2ODi3i5uzJl+RNOU9GGhij5fo3hhapuf1Us6FjkeL1dH9ocwS90U/ASzRMB29utA
 GzPGpeoznFRv1Im6GTRdMtDflhH0=
X-Received: by 2002:a17:90a:68c7:: with SMTP id
 q7mr3692339pjj.211.1597666018035; 
 Mon, 17 Aug 2020 05:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynitn2WTPoxa48N7f1OCwTh0CuWgLTZxcdZKOiYI7j9UbVE620qnf32C6BVoFuZzPAFsCX1A==
X-Received: by 2002:a17:90a:68c7:: with SMTP id
 q7mr3692314pjj.211.1597666017715; 
 Mon, 17 Aug 2020 05:06:57 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id e29sm19597278pfj.92.2020.08.17.05.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 05:06:57 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it,
	viresh.kumar@linaro.org,
	chrubis@suse.cz
Date: Mon, 17 Aug 2020 20:06:44 +0800
Message-Id: <20200817120644.9401-3-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817120644.9401-1-po-hsu.lin@canonical.com>
References: <20200817120644.9401-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/utimensat01: add exception for Ubuntu
 4.4 kernel
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
Cc: po-hsu.lin@canonical.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ubuntu 4.4 kernel got this patch (b3b4283) since 4.4.0-48.69,
therefore it will return EPERM instead of EACCES.

Without this fix, the test will fail on Ubuntu 4.4 kernel with:
  FAIL: 18: utimensat() failed with incorrect error, expected EACCES: EPERM (1)
  FAIL: 19: utimensat() failed with incorrect error, expected EACCES: EPERM (1)

Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 testcases/kernel/syscalls/utimensat/utimensat01.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 7dabfed6d..469cb61c5 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -158,6 +158,10 @@ static void tst_multi_set_time(enum tst_ts_type type, struct mytime *mytime)
 
 static void update_error(struct test_case *tc)
 {
+	static struct tst_kern_exv kvers[] = {
+		{ "UBUNTU", "4.4.0-48.69" },
+	};
+
 	if (tc->exp_err != -1)
 		return;
 
@@ -167,9 +171,12 @@ static void update_error(struct test_case *tc)
 	 * This patch has also been merged to stable 4.4 with
 	 * b3b4283 ("vfs: move permission checking into notify_change() for utimes(NULL)")
 	 */
-	if (tst_kvercmp(4, 4, 27) < 0)
+	if (tst_kvercmp(4, 4, 27) < 0) {
 		tc->exp_err = EACCES;
-	else
+		// Special case for Ubuntu kernel, which got this patch since 4.4.0-48.69
+		if (tst_kvercmp2(4, 4, 0, kvers))
+			tc->exp_err = EPERM;
+	} else
 		tc->exp_err = EPERM;
 }
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
