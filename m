Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F139D9FA
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A43403C4DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD87C3C7C6B
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:30 +0200 (CEST)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4190A1A00E0A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:30 +0200 (CEST)
Received: by mail-il1-x12d.google.com with SMTP id v13so15610483ilh.13
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 03:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BaLwuc/lsCpa+lPwzoUyiLUN6m8Ng3A3BPFsAdqoDLk=;
 b=I8K5vg+Edtj20MZrCVfN+RHnCZ7/buR5Uj2UO64j/yv1NdTI965VpKKBCu2BZr7HuF
 +cCeu4Zt5NddX99g2x2Yz8ni/L79lzCYdSNsAsKJnAJTIJgzQvCS6blXS3nKrmSoa/dC
 uyv4cV/8ySfheYMweRpY6rmLVR+5gJl5471HHCT1dmcZv/hEsb2qMyNWLFIcfgyR0Jil
 nZqIA7lR/jXrJ5q+Vmh+076xgWEObsZFYXNcaabSZPE8jVMqZBC4sYgY55NFg6Sk2WIl
 TXoAVvrimChJgr+em56KdVyvGacsuuNy2xH9jqpq5aTO/IK+nbfWGpmy56HX7KI33QUl
 ay3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BaLwuc/lsCpa+lPwzoUyiLUN6m8Ng3A3BPFsAdqoDLk=;
 b=eA1gyXsc+Hrs3ioJnaK7p8DDiJTZO/0W2WbJ1zYdv5jJC4PHp1fEQ/BUzpggCwpWsE
 lgP9/VbR64XecsbNMtaBhWJ3uuAR+WzJJmu7eQvdQ7n7kx11k05pmG3QkeQOSd7tNics
 nJ/NK1eHTxQvWsHKOj2AgLRMqU3z1u9kLGjzbjOluHKS73RGpjQJ5aeqdPVVZZ3t8BUc
 j14owQoBVdrxjVHnQD58tNdyl7mUDh4WHdMkeEK2FfxE2cjyQ4yBrh6isJJDDUNHFnKK
 DhC1ty35gK77axyrzuo+lOe9bfdP/DX+b3fjAYfxwJf1plGu9jzEI7pZnQ7v2n0F6LeG
 B54w==
X-Gm-Message-State: AOAM530knccdFppLZbvo7bTRw8YcdtzkobaQ622aR+VO2uqhb/onosCt
 t6t+wPaICVx7LwfYUK6BTed94J+I7JZWOw==
X-Google-Smtp-Source: ABdhPJzMGTDN+gsMwkASwtx4OdSE3ztwBirRRUrmERPIP7CC59DgbKCDrcsbBZwrwKjsHFj1fVRSfw==
X-Received: by 2002:a05:6e02:4a:: with SMTP id
 i10mr13478239ilr.78.1623062728630; 
 Mon, 07 Jun 2021 03:45:28 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id c14sm8933303ilq.9.2021.06.07.03.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:28 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Mon,  7 Jun 2021 16:15:10 +0530
Message-Id: <20210607104515.29838-2-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607104515.29838-1-vinay.m.engg@gmail.com>
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/7] getrusage02: Skipped EFAULT tests for libc
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
Cc: vinay.kumar@blackfigtech.com, umesh.kalappa0@gmail.com, rwmacleod@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_getrusage" syscall.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/getrusage/getrusage02.c   | 53 ++++++++++++++++---
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/getrusage/getrusage02.c b/testcases/kernel/syscalls/getrusage/getrusage02.c
index 8077606a2..00c1af805 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage02.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage02.c
@@ -71,6 +71,7 @@
 #include <sched.h>
 #include <sys/resource.h>
 #include "test.h"
+#include "lapi/syscalls.h"
 
 #ifndef RUSAGE_BOTH		/* Removed from user space on RHEL4 */
 #define RUSAGE_BOTH (-2)	/* still works on SuSE      */
@@ -83,6 +84,16 @@ char *TCID = "getrusage02";
 
 static struct rusage usage;
 
+static int libc_getrusage(int who, void *usage)
+{
+	return getrusage(who, usage);
+}
+
+static int sys_getrusage(int who, void *usage)
+{
+	return ltp_syscall(__NR_getrusage, who, usage);
+}
+
 struct test_cases_t {
 	int who;
 	struct rusage *usage;
@@ -96,12 +107,26 @@ struct test_cases_t {
 #endif
 };
 
+static struct test_variants
+{
+	int (*getrusage)(int who, void *usage);
+	char *desc;
+} variants[] = {
+	{ .getrusage = libc_getrusage, .desc = "libc getrusage()"},
+
+#if (__NR_getrusage != __LTP__NR_INVALID_SYSCALL)
+	{ .getrusage = sys_getrusage,  .desc = "__NR_getrusage syscall"},
+#endif
+};
+
+unsigned int tst_variant_t;
+int TST_VARIANTS = ARRAY_SIZE(variants);
 int TST_TOTAL = ARRAY_SIZE(test_cases);
 
 int main(int ac, char **av)
 {
-
-	int lc, i;
+	struct test_variants *tv = &variants[tst_variant_t];
+	int lc, i, j;
 
 	tst_parse_opts(ac, av, NULL, NULL);
 
@@ -111,18 +136,30 @@ int main(int ac, char **av)
 
 		tst_count = 0;
 
-		for (i = 0; i < TST_TOTAL; i++) {
-			TEST(getrusage(test_cases[i].who, test_cases[i].usage));
+		for (j = 0; j < TST_VARIANTS; j++) {
+
+			tst_resm(TINFO, "Testing variant: %s", tv->desc);
+			for (i = 0; i < TST_TOTAL; i++) {
+
+				if (test_cases[i].exp_errno == EFAULT &&
+					tv->getrusage == libc_getrusage) {
+					tst_resm(TCONF, "EFAULT is skipped for libc variant");
+					tv++;
+					continue;
+				}
+
+			TEST(tv->getrusage(test_cases[i].who, test_cases[i].usage));
 
 			if (TEST_RETURN == -1 &&
-			    TEST_ERRNO == test_cases[i].exp_errno)
+				TEST_ERRNO == test_cases[i].exp_errno)
 				tst_resm(TPASS | TTERRNO,
-					 "getrusage failed as expected");
+				"getrusage failed as expected");
 			else
 				tst_resm(TFAIL | TTERRNO,
-					 "getrusage failed unexpectedly");
+				"getrusage failed unexpectedly");
+				}
+			}
 		}
-	}
 
 	cleanup();
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
