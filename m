Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7B2DDEC6
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 07:58:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8EC63C2A3B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 07:58:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7E9453C29E1
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 07:58:15 +0100 (CET)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 09A5410000D8
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 07:58:15 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id x12so893903plr.10
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 22:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvR3KwQUSkWRCFSjk6ugg2qjidXlDjgFGDOUOEDcVuo=;
 b=chesFf7pMWaVnpl3T2sJ0SQo4v0EX03q6nHkbXipyKK4uWngi/xkODURzShEsxCCK0
 FFIuB8jdRKBFRZQG25PPSZBbZTuTW0PNoW1Qe0V85LZNPFKWsruDca7tNpbuBDfvDIDj
 pt22YgZVGJOulD5QoVhSdJRYOA0eqN8zadz6PNqbiyHAxe2ugXuGj1VxqKDSLIuvytHe
 W0HbufoUoQvVKOLlnaQyeTczfTYOQvUlIJnMaOcSks/b8hx43fb1h3Cuw5jejS+8tdAB
 eYInGKeAdA4P/tQJ45l/O69hLUsD5l58Ki89jEvTWNC/9AQsAxU/C1aHfs9vxu6SRgWt
 vL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvR3KwQUSkWRCFSjk6ugg2qjidXlDjgFGDOUOEDcVuo=;
 b=rgS8vZj6wayZdTwlyp/im+jL407H/LvOtH1pLSWZooL/NlER2jqUPciqCqerSB4ARC
 mEw89eJFl4iH9/ZQOgzK7F/7dENrFcZA0f6LsKCmHtbURfOOBcyXyUi8Ca40/E2y7zdC
 qkcSbeAnp5gOixI9kaWubQqNqQ1P1c9XQoSb+EoE9h1J2ta9G88kS6I/h3hwfuQFldco
 Vn0b+x0Bdk9HAQ9olru/Eve0He1kUVPmrYWeBvCUQZ5vRFr0Z/qJtCThm4BFB5yhqpR+
 OlrbMRipTiZIyc3PkKf3Ku9iN1anx7MGd1C/uMiUh+s6b3QsHMvPYMy1teiWqLZhc7aY
 qN2w==
X-Gm-Message-State: AOAM533/jkb0pG+CuGHEVcdHdTtt8YgabXb2mym8KR8PSmlgJ0Wg7R66
 R8ythefxpF9tQuax9dCpCi712RpkpcTeRg==
X-Google-Smtp-Source: ABdhPJzHUg3KAvNTq1V4hsD7SO3G9mMUhvMKJ5hhq2m/jL7g8wHi0xPK0WO4if80Ug0sa2FB8qGn+w==
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr3094546plb.17.1608274693289; 
 Thu, 17 Dec 2020 22:58:13 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id mz1sm6398368pjb.33.2020.12.17.22.58.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Dec 2020 22:58:12 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 18 Dec 2020 12:28:09 +0530
Message-Id: <049a750ca35c6adc18e8aa6bc1f97d91c05d3429.1608274686.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: init_module: Print test's name in messages
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This was part of the original patch but got dropped while applying, lets
get it back.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/init_module/init_module02.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/init_module/init_module02.c b/testcases/kernel/syscalls/init_module/init_module02.c
index ff35b35e2321..88917bd7c2ed 100644
--- a/testcases/kernel/syscalls/init_module/init_module02.c
+++ b/testcases/kernel/syscalls/init_module/init_module02.c
@@ -71,7 +71,8 @@ static void run(unsigned int n)
 	if (tc->exp_errno == EEXIST)
 		tst_module_load(MODULE_NAME, NULL);
 
-	TST_EXP_FAIL(init_module(*tc->buf, *tc->size, tc->param), tc->exp_errno);
+	TST_EXP_FAIL(init_module(*tc->buf, *tc->size, tc->param), tc->exp_errno,
+		     "TestName: %s", tc->name);
 
 	if (tc->exp_errno == EEXIST)
 		tst_module_unload(MODULE_NAME);
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
