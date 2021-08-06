Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2530A3E2E94
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C725B3CABCB
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:50:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6226B3CA3CB
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:10 +0200 (CEST)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DDA4320005E
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:09 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id g13so19097961lfj.12
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kcq9pZy8psW8Q6DO3JqXHf2Bu6pH7LfpaaQfiDFwZTc=;
 b=1YhW/xnib7U75LA3BBQzu/qu9nJJHnr+uk1KitTspo8bdaXeNP7qYRnUUBBAbTOZRl
 Eb65+9EGZzi0Fqb8Bc3fESjOMIp+L+VKdaiE2nTfoURyt4c4k9N9cApiQBD+RV/cchDF
 SyXz2oHJR1jMu60+ca2BZt1NPFGIioYbwBSo6p7H2Xs3bq0UVILpPlLsulAdwUA6eGXl
 eoS9/SExkckUTWnLciXY7r+gCX0evNDXQcm/NomFEjO+uiXSQVLk6x2QhmXpPMdP9dvA
 4CBswJKhHZ6n3Zbqps3RSiQ6Nw0xK1vrB9EzreWsd0yHy/De0ItLATDkJnBx2Q0XWwfb
 54lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kcq9pZy8psW8Q6DO3JqXHf2Bu6pH7LfpaaQfiDFwZTc=;
 b=OAVEEwFPwpnv8CT4rV/tU7R60Xpv1diHByP8VJuvwFm95VW2IT5tMsP2KuQ91/cWDI
 Iwt7wt7CojN80Tfh7Aka/1jD9sDwTlVEvRIG7WZ5LWC05fl+1ufGNdv67LdwlDbZzSAX
 T4qc2f6S47ytmUh/NwzDFrJrLO6Rg/lWKawipTjFq8y7PGaiTvVbNJxKRhiK2MKkyxv/
 BQa+by192ZHwwckbmGsYq1ay2fBAhie4ZdQUCuOictqDjHmuZ2bOGUx0Nk7eXDyDum0+
 c7F+rsT0A8904ZTraxHO3VWlMesG6K8vndguQgICaGbul/QUACF76cogA/xfayaK0WLk
 35hg==
X-Gm-Message-State: AOAM533Y/+yHO2tvvUX3IpvVzfydzKzk1aOHjs+k3Yu7C7sIAfKo7uYw
 J9aZayASAPq8QFF3uaqz4jBFU+HXS5oA
X-Google-Smtp-Source: ABdhPJzsn2jad5yXS88PjZu/9eJLFwM/Z4129cVW0nYGzMVeLGOb/JxArudVl/eLDX6uigWiRCCYZw==
X-Received: by 2002:a05:6512:3af:: with SMTP id
 v15mr8298215lfp.330.1628268489188; 
 Fri, 06 Aug 2021 09:48:09 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:08 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:28 +0300
Message-Id: <20210806164730.51040-15-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 14/16] syscalls/sched_setscheduler03: use
 libc/sys_sched_*()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 .../sched_setscheduler/sched_setscheduler03.c | 39 ++++++++++++-------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c
index 9045d0366..01385a08d 100644
--- a/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c
+++ b/testcases/kernel/syscalls/sched_setscheduler/sched_setscheduler03.c
@@ -17,19 +17,30 @@
 #include <stdio.h>
 #include <errno.h>
 #include <pwd.h>
-#include <sched.h>
 #include <sys/time.h>
 #include <sys/resource.h>
 #include <sys/wait.h>
 #include <stdlib.h>
 
 #include "tst_test.h"
+#include "tst_sched.h"
 
 #define RLIMIT_NICE_NORMAL 20
 
 static pid_t zero_pid;
 static struct sched_param param[1] = { {0} };
 
+static struct sched_variants variants[] = {
+	{ .sched_setscheduler = libc_sched_setscheduler,
+	  .sched_getscheduler = libc_sched_getscheduler,
+	  .desc = "libc"
+	},
+	{ .sched_setscheduler = sys_sched_setscheduler,
+	  .sched_getscheduler = sys_sched_getscheduler,
+	  .desc = "syscall"
+	},
+};
+
 struct test_case_t {
 	pid_t *pid;
 	int policy;
@@ -92,26 +103,25 @@ static void l_rlimit_setup(const int type, struct rlimit *limit)
 
 static void verify_fn(unsigned int i)
 {
-	tst_res(TINFO,
-		"Verifying case[%d]: policy = %d, priority = %d",
+	struct sched_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Verifying case[%d]: policy = %d, priority = %d",
 		i + 1, cases[i].policy, cases[i].sched_param->sched_priority);
 
-	TEST(sched_setscheduler(*cases[i].pid, cases[i].policy,
-					cases[i].sched_param));
-	if (TST_RET)
-		tst_res(TFAIL | TTERRNO, "case[%d] expected: %d, got: ",
-			i + 1, cases[i].error);
-	else
-		tst_res(TPASS, "case[%d] succeeded", i + 1);
+	TST_EXP_PASS(tv->sched_setscheduler(*cases[i].pid, cases[i].policy,
+		     cases[i].sched_param));
 }
 
 static void setup(void)
 {
+	struct sched_variants *tv = &variants[tst_variant];
 	uid_t ruid, euid, suid;
 	struct rlimit limit;
 	struct passwd *pw;
 	uid_t nobody_uid;
 
+	tst_res(TINFO, "Testing %s variant", tv->desc);
+
 	pw = SAFE_GETPWNAM("nobody");
 	nobody_uid = pw->pw_uid;
 	l_rlimit_show(RLIMIT_NICE, &limit);
@@ -129,11 +139,9 @@ static void setup(void)
 	l_rlimit_setup(RLIMIT_NICE, &limit);
 
 	tst_res(TINFO, "Setting init sched policy to SCHED_OTHER");
-	if (sched_setscheduler(0, SCHED_OTHER, &param[0]) != 0)
-		tst_res(TFAIL | TERRNO,
-			 "ERROR sched_setscheduler: (0, SCHED_OTHER, param)");
-
-	if (sched_getscheduler(0) != SCHED_OTHER)
+	TST_EXP_PASS_SILENT(tv->sched_setscheduler(0, SCHED_OTHER, &param[0]),
+			    "sched_setscheduler(0, SCHED_OTHER, 0)");
+	if (tv->sched_getscheduler(0) != SCHED_OTHER)
 		tst_res(TFAIL | TERRNO, "ERROR sched_setscheduler");
 
 	tst_res(TINFO, "Setting euid to nobody to drop privilege");
@@ -159,6 +167,7 @@ static void do_test(unsigned int i)
 }
 
 static struct tst_test test = {
+	.test_variants = ARRAY_SIZE(variants),
 	.tcnt = ARRAY_SIZE(cases),
 	.test = do_test,
 	.setup = setup,
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
