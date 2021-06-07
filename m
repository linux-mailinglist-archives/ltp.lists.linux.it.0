Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 540C039DA0F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:46:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D6BD3C52B3
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:46:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 242C43C7CBA
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:46 +0200 (CEST)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 90ABB140053E
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:45 +0200 (CEST)
Received: by mail-il1-x12d.google.com with SMTP id b5so15637232ilc.12
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 03:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7ZeeOtgmJhPa5RPffB/ITK/oTyG7c6VybFvglh3nP3Y=;
 b=je0spGXzjEseu7eMK7jILLAtUmbpW5EgW6kTWgszEGRFgm8e7K8uGvwWyu2X06CEqM
 T/RGR3q5RK2hfK7Qhppjtaar6lvTESG4k9NfG4qMVtDO86xbexrObfh7UZpnzhM9thNe
 vp3wjWrdxwn01/0u+zkwBXgQyJZepDOlR6l/jjHl0zIAfQe58/mbuhWzWe3lzoLJkEZU
 5IzdMRk5t/YYiK2zuWjv0grbH++ZplipLIcZaB6pK+sVcAnnJpdKL5cDlABbZdkNEXAU
 BwCE5oJhSAXBL9y0KM7h9pqapPD2ttw0oU7Ng+wmZdv6xjEl95D8iE/AITnGR9QIUAKs
 sokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7ZeeOtgmJhPa5RPffB/ITK/oTyG7c6VybFvglh3nP3Y=;
 b=t/CEYOEvbCcoK9DV+odS3W7ClNBObrZ+1J8COW/slRVgsaQ0ZAvflWB1urqHmegfk8
 IJgo/qhmBrCcI+xmyO/sQyb2zznioUnxTmIuiRvh0jnAkfGUA2feNlItUyhJA2z+D4e2
 cPrcAohrt0MMMjyrcRBPmPnY+vt6pJCsH8RqIwPhBlhXR7mxJwS7j6sAe1ndckPT+WAr
 K4byzOsGSIm4daSRIobo98C2zMnKdFz23QJ8SaSkkVaTFB78IAn6mmzogkr4tDrVCeD/
 zdHX+Gx90C9+nhGV8t6OsqpoZ7GnJ+kPg7JdJWw09CcoOBnT2V4y1IRYjHoruxmsQYzM
 bURA==
X-Gm-Message-State: AOAM53193l6sRRKVUnLKU40GQEXfVJk4DknzKttaxee6a2n1uHCCRG9D
 9C07HvZn842x/vwmwW42G2Ims35X8VapYw==
X-Google-Smtp-Source: ABdhPJwepBT7cstqQSoAk0OVai6HC0WiwuTgEQHe40/cf586tp1arS7Cw02+nr7OiaUqz399qiDH3w==
X-Received: by 2002:a92:7b01:: with SMTP id w1mr15047627ilc.100.1623062744036; 
 Mon, 07 Jun 2021 03:45:44 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id c14sm8933303ilq.9.2021.06.07.03.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:43 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Mon,  7 Jun 2021 16:15:15 +0530
Message-Id: <20210607104515.29838-7-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607104515.29838-1-vinay.m.engg@gmail.com>
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 7/7] setitimer02: Skipped EFAULT tests for libc
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

Tested EFAULT cases only for "__NR_setitimer"

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/setitimer/setitimer02.c   | 82 +++++++++++++------
 1 file changed, 59 insertions(+), 23 deletions(-)

diff --git a/testcases/kernel/syscalls/setitimer/setitimer02.c b/testcases/kernel/syscalls/setitimer/setitimer02.c
index 4d13cd1e0..ee0748884 100644
--- a/testcases/kernel/syscalls/setitimer/setitimer02.c
+++ b/testcases/kernel/syscalls/setitimer/setitimer02.c
@@ -56,6 +56,7 @@
 
 #include <errno.h>
 #include <sys/time.h>
+#include "lapi/syscalls.h"
 
 void cleanup(void);
 void setup(void);
@@ -63,12 +64,38 @@ void setup(void);
 char *TCID = "setitimer02";
 int TST_TOTAL = 1;
 
+static int libc_setitimer(int which, void *new_value, void *old_value)
+{
+	return setitimer(which, new_value, old_value);
+}
+
+static int sys_setitimer(int which, void *new_value, void *old_value)
+{
+	return ltp_syscall(__NR_setitimer, which, new_value, old_value);
+}
+
+static struct test_variants
+{
+	int (*setitimer)(int which, void *new_value, void *old_value);
+	char *desc;
+} variants[] = {
+	{ .setitimer = libc_setitimer, .desc = "libc setitimer()"},
+
+#if (__NR_setitimer != __LTP__NR_INVALID_SYSCALL)
+	{ .setitimer = sys_setitimer,  .desc = "__NR_setitimer syscall"},
+#endif
+};
+
+unsigned int tst_variant_t;
+int TST_VARIANTS = ARRAY_SIZE(variants);
+
 #if !defined(UCLINUX)
 
 int main(int ac, char **av)
 {
-	int lc;
+	int lc, i;
 	struct itimerval *value;
+	struct test_variants *tv = &variants[tst_variant_t];
 
 	tst_parse_opts(ac, av, NULL, NULL);
 
@@ -87,7 +114,6 @@ int main(int ac, char **av)
 		}
 
 		/* set up some reasonable values */
-
 		value->it_value.tv_sec = 30;
 		value->it_value.tv_usec = 0;
 		value->it_interval.tv_sec = 0;
@@ -97,27 +123,37 @@ int main(int ac, char **av)
 		 * ITIMER_REAL = 0, ITIMER_VIRTUAL = 1 and ITIMER_PROF = 2
 		 */
 
-		/* call with a bad address */
-		TEST(setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
-
-		if (TEST_RETURN == 0) {
-			tst_resm(TFAIL, "call failed to produce EFAULT error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-			continue;
+		for (i = 0; i < TST_VARIANTS; i++) {
+
+			tst_resm(TINFO, "Testing variant: %s", tv->desc);
+
+			/* call with a bad address */
+			if (tv->setitimer == libc_setitimer) {
+				tst_resm(TCONF, "EFAULT is skipped for libc variant");
+				tv++;
+				continue;
+			}
+
+			TEST(tv->setitimer(ITIMER_REAL, value, (struct itimerval *)-1));
+
+			if (TEST_RETURN == 0) {
+				tst_resm(TFAIL, "call failed to produce EFAULT error "
+					"- errno = %d - %s", TEST_ERRNO,
+					strerror(TEST_ERRNO));
+					continue;
+			}
+
+			switch (TEST_ERRNO) {
+			case EFAULT:
+				tst_resm(TPASS, "expected failure - errno = %d - %s",
+					 TEST_ERRNO, strerror(TEST_ERRNO));
+				break;
+			default:
+				tst_resm(TFAIL, "call failed to produce EFAULT error "
+					 "- errno = %d - %s", TEST_ERRNO,
+					 strerror(TEST_ERRNO));
+			}
 		}
-
-		switch (TEST_ERRNO) {
-		case EFAULT:
-			tst_resm(TPASS, "expected failure - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			break;
-		default:
-			tst_resm(TFAIL, "call failed to produce EFAULT error "
-				 "- errno = %d - %s", TEST_ERRNO,
-				 strerror(TEST_ERRNO));
-		}
-
 		/*
 		 * clean up things in case we are looping
 		 */
@@ -153,7 +189,7 @@ void setup(void)
 
 /*
  * cleanup() - performs all the ONE TIME cleanup for this test at completion
- * 	       or premature exit.
+ *		or premature exit.
  */
 void cleanup(void)
 {
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
