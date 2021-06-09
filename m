Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 233043A1BF1
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B380E3C8FC8
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:37:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D09963C8FCB
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:01 +0200 (CEST)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4601E600658
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:01 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id b25so23627351iot.5
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=n7wchVjaRyvYzOBKHQEthJJrSyUVz/HTFqPe0cwaM/I=;
 b=QwcjSQ3EjSYmMJ8ct/Ahc94t8G0WsJtDJLT1ejKh1n3HORUG7D8pd5VIQVudrCuOCy
 ZZoAX0yQurxKvkuw45BHPmLW1YQBD+bk5f9bgyU7FXKjldi1glO0TWiVF12fP+HmLbAF
 CbhztbgZoQqqA1KYdMhtTkWkQvgzNUhsZtoQaBDA5jChbrEHuhcwgFjxpDjuAObYw7Fd
 jp6dvYG+jw0XikBKjcWmw9XY4ToJw0wmntlpFLIYFn2ROOZ56hRfk5bedyORIvzSFXm9
 k0rj7PaH9iBNslG0C5RiimCWsba6IJyxv6B7RMG81moehBPhNNfuUSUf1E0+IQ7+hsgb
 rX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=n7wchVjaRyvYzOBKHQEthJJrSyUVz/HTFqPe0cwaM/I=;
 b=pqSRS0Yk8RdCyafMEekEuKL/xhu57t8R6+r3+rtjGe17roqQBT+l5NmzupMyShR4/P
 5ZkqVNLkfeSJd5lhVXDu4a+yO+dkqPe8N9zqOIlRu+eme/w4lgOAgWDF8uRlNtxxjxMP
 wlbIFfnFM/1yUk0BG2yaACEmTub3qNjS0Aim/586GVapajl1AWhLTsK3MP6jSAkjGceB
 M+zm6lOgdUzwMCyxTbqIaQvEl4kizRVN+plbYLoRY81HrQfraavUMbiAhK15FvniZGGB
 i/BOS7qULRA9/4/8dvKkFCpJpt6wHmc7GQVDJRhBRSy+cmGLUJ9WjoIX4HYu0OwtD5rc
 69Qg==
X-Gm-Message-State: AOAM531DAEIV3JG9CfbEWl95ML6RwRvKagAR2QUOnaiP8X7JS95Fcj/D
 2H7+TKmRXOEInClnyJEsunU=
X-Google-Smtp-Source: ABdhPJx3+j/4oXVHkhb2EPMOAa7ftOuVb0BBvtM+yOeMrk2/b7L2crVCHhnI3esxjmdAmzk0HCyzcQ==
X-Received: by 2002:a6b:7d4b:: with SMTP id d11mr426188ioq.161.1623260220028; 
 Wed, 09 Jun 2021 10:37:00 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:36:59 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:55 +0530
Message-Id: <20210609173601.29352-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 04/10] getrusage02: Skipped EFAULT tests for libc
 variant.
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
Cc: metan@ucw.cz, umesh.kalappa0@gmail.com, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_getrusage" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/getrusage/getrusage02.c   | 58 ++++++++++++++++---
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/getrusage/getrusage02.c b/testcases/kernel/syscalls/getrusage/getrusage02.c
index c4b3f0f69..07ff04dee 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage02.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage02.c
@@ -19,6 +19,7 @@
 #include <sched.h>
 #include <sys/resource.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
 
 #ifndef RUSAGE_BOTH		/* Removed from user space on RHEL4 */
 #define RUSAGE_BOTH (-2)	/* still works on SuSE      */
@@ -26,6 +27,16 @@
 
 static struct rusage usage;
 
+static int libc_getrusage(int who, void *usage)
+{
+	return getrusage(who, usage);
+}
+
+static int sys_getrusage(int who, void *usage)
+{
+	return tst_syscall(__NR_getrusage, who, usage);
+}
+
 struct test_cases_t {
 	int who;
 	struct rusage *usage;
@@ -37,21 +48,50 @@ struct test_cases_t {
 	RUSAGE_SELF, (struct rusage *)-1, EFAULT}
 };
 
+static struct test_variants
+{
+	int (*getrusage)(int who, void *usage);
+	char *desc;
+} variants[] = {
+{ .getrusage = libc_getrusage, .desc = "libc getrusage()"},
+
+#if (__NR_getrusage != __LTP__NR_INVALID_SYSCALL)
+{ .getrusage = sys_getrusage,  .desc = "__NR_getrusage syscall"},
+#endif
+};
+
 static void verify_getrusage(unsigned int i)
 {
-		TEST(getrusage(test_cases[i].who, test_cases[i].usage));
-
-		if (TST_RET == -1 &&
-		    TST_ERR == test_cases[i].exp_errno)
-			tst_res(TPASS | TTERRNO,
-				"getrusage failed as expected");
-		else
-			tst_res(TFAIL | TTERRNO,
-				"getrusage failed unexpectedly");
+	struct test_variants *tv = &variants[tst_variant];
+
+	if (test_cases[i].exp_errno == EFAULT &&
+		tv->getrusage == libc_getrusage) {
+		tst_res(TCONF, "EFAULT is skipped for libc variant");
+		return;
+	}
+
+	TEST(tv->getrusage(test_cases[i].who, test_cases[i].usage));
+
+	if (TST_RET == -1 &&
+		TST_ERR == test_cases[i].exp_errno)
+		tst_res(TPASS | TTERRNO,
+			"getrusage failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO,
+			"getrusage failed unexpectedly");
+}
+
+static void setup(void)
+{
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 }
 
 static struct tst_test test = {
 	.test = verify_getrusage,
+	.setup = setup,
 	.tcnt = ARRAY_SIZE(test_cases),
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_root = 1,
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
