Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED941DE02E
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F08493C24B3
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 08:54:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 116B53C24E3
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:29 +0200 (CEST)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 659241000CA3
 for <ltp@lists.linux.it>; Fri, 22 May 2020 08:54:28 +0200 (CEST)
Received: by mail-pl1-x641.google.com with SMTP id x11so3025987plv.9
 for <ltp@lists.linux.it>; Thu, 21 May 2020 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OGg7ZMcMbrAZ32nWrfvObO7MF8WykTQdplVH6P08/MY=;
 b=urOdaLuKlfBiUfEiU0TAiHZLhD3efpbxG6oIk6m3m/al3DGPlhkNLVIUkYBdxT+ngK
 BoIo8me1wXxAPY0VLEAh0Zsy7Ky7L9dHdpLgQdYfSMqcCrrMmuwRkT6Bh8dHfuHlSeXx
 Yn2a53nV0m9wKQUmK6D7GuFZ3AwOgomiez6aeIEkvioRmUl3m/rbaG9xGF8IWtSfxRNk
 xXAh5SLli1j/GOu6SYKfF35nVIaThtiXGBeg4c2+PWjoC4csO4JuRhCyxvwhP2J/qmvu
 5HpuLfHrmowjsGaMLUL7lbi9hJv2wf2VRH/Gg28IBEhRl/i0nrDcpx03WduSvlwRwgeF
 oJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OGg7ZMcMbrAZ32nWrfvObO7MF8WykTQdplVH6P08/MY=;
 b=l2cY7CQ4W0YU+7+HVsvqUI6CZKPKB+RVNMofFRNMb2M/sloemeFaiHNQb/kJzJ7nJ/
 2n2S2JINeZII3SazFN+i/+3cDTwicc4mqABEmMpxaUS2CJtonUHMzhrXKlzAmay/9tKU
 VDBXgF6hyILFAqsbaBh9b3NIsO85VE2Oz+WacmabtnNdh6vlRJdI2hey2Mb/Po2AJ6kU
 UDRu+zoqDv7Mw5u6e8b5amuRTuENpzc7jRMONuRlHNELz1cAPDLmn8WtvU/pJoeC7W5a
 Fbl/94Jp/kSWIjhAMDbmv5LNpsYjxnIs+S3X1NNc7t3LHBC3dc5xjz5iDVK0FpK5A5sX
 pFbA==
X-Gm-Message-State: AOAM5319HjLpzJIDJ0iV2v+s7g8lsrq8D2507Rpq7JeaOq08efMxW/jF
 6LzV1mWP+caJOfNAj7Yv4HwDEIf1H+E=
X-Google-Smtp-Source: ABdhPJzAX2h0WK6QVfbHPll7Lj12WRkpKIK6G2PoerVq2L9DGNHEqRspTCw51ZzaZOWceNm0wx+3TQ==
X-Received: by 2002:a17:90a:f994:: with SMTP id
 cq20mr2815875pjb.52.1590130466498; 
 Thu, 21 May 2020 23:54:26 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id g7sm5925939pjs.48.2020.05.21.23.54.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 May 2020 23:54:25 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 12:24:09 +0530
Message-Id: <d3926ba3a6976021828a7de4be0c12a536c34ef1.1590130423.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590130423.git.viresh.kumar@linaro.org>
References: <cover.1590130423.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 3/6] syscalls: settimeofday02: Remove time
 restoration code
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

Unless the kernel is buggy, the system time shouldn't get updated by
this test and so there is no need to have the code to restore the clock.
Remove it.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../syscalls/settimeofday/settimeofday02.c    | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/testcases/kernel/syscalls/settimeofday/settimeofday02.c b/testcases/kernel/syscalls/settimeofday/settimeofday02.c
index 485a26b1d9c5..0fa8a147a212 100644
--- a/testcases/kernel/syscalls/settimeofday/settimeofday02.c
+++ b/testcases/kernel/syscalls/settimeofday/settimeofday02.c
@@ -12,9 +12,6 @@
 #include "tst_test.h"
 #include "lapi/syscalls.h"
 
-struct timeval tv_saved;
-static int flag;
-
 static struct tcase {
 	struct timeval tv;
 	int exp_errno;
@@ -29,12 +26,10 @@ static void verify_settimeofday(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
 
-	flag = 0;
 	tst_res(TINFO, "%s", tc->message);
 	TEST(settimeofday(&tc->tv, NULL));
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "settimeofday() succeeded unexpectedly");
-		flag = 1;
 		return;
 	}
 
@@ -44,23 +39,7 @@ static void verify_settimeofday(unsigned int n)
 		tst_res(TPASS | TTERRNO, "Received expected errno");
 }
 
-static void setup(void)
-{
-	if (tst_syscall(__NR_gettimeofday, &tv_saved, NULL) == -1)
-		tst_brk(TBROK | TERRNO, "gettimeofday(&tv_saved, NULL) failed");
-}
-
-static void cleanup(void)
-{
-	if (!flag)
-		return;
-	if ((settimeofday(&tv_saved, NULL)) == -1)
-		tst_brk(TBROK | TERRNO, "settimeofday(&tv_saved, NULL) failed");
-}
-
 static struct tst_test test = {
-	.setup = setup,
-	.cleanup = cleanup,
 	.test = verify_settimeofday,
 	.tcnt = ARRAY_SIZE(tcases),
 	.caps = (struct tst_cap []) {
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
