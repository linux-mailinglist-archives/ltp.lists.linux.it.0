Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BAF39D9F9
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED9933C4DC2
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B9C0E3C4DBB
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:27 +0200 (CEST)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B8A91A00E0A
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:27 +0200 (CEST)
Received: by mail-il1-x134.google.com with SMTP id h16so2985124ila.6
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 03:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=X9gzvjUNwXLcDEEd9dNEY9bgJ62PHKLicsBCiJflmGk=;
 b=uCqdel4lKZ8BsaxZAtYDSkrXg359FxyIiEbGFA83io/v5ivsZu9FLdOT/FFXYI1+LJ
 elUh4NRzc0+5JsYkjlFhSJKHBQJbEvvmttYtETst2/dMX5a3uNkPK1r29KHp1Wjua+RJ
 tNfg5HrVmwebCPXN1KAyhdjozCrSr11B4ovo3GFxsCRX/IMejWeY203eISLWAUi/YTio
 rdjZWnrUj+BFTyXZlasC/2XSCNOPCDJE7tRZ8LZSTmoGc7zfNZU0aTvdoY08B2LzmYSC
 NuVHYYD1KlGAuSUIPSWu3yEto53JCIOdwCDZgIzqyXgMro6xLGJ8gLdJNqCleJHKug9M
 ONwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=X9gzvjUNwXLcDEEd9dNEY9bgJ62PHKLicsBCiJflmGk=;
 b=GkfhfA4F7pZxi9VTkx5vy5ZWw9GIogfXwIdad/VH5sn8HALhAm/sVMhG0T1arQAnCP
 L3yYY3I3hKX7WQOfaEixRtAK6+LBhqXdr9nyfdramsh7E+QDh3v+5wD3QWf8DPUl9Y7K
 HSP7itk/8JKvai0M6LQnqW2+SFC2+/NdMCWFcOjkesWf6ygwZJxE+lHX22iqhVa77E/m
 0jIFr3E9Yzss3GRBSJ3k8I9etnbuaP3dA9CmtYTrxswB1yEmeSdo00P58PgP5Gzzz8Ms
 UmhVBHkRYYbJ5d1cDikzfYWQ5GaC7pubdyo7vGoS9LeuBfLriOq/WXViG+SVVO4s2XcX
 Z+zQ==
X-Gm-Message-State: AOAM531H15PsS6YSzCkTyTrt1kawT17QVMd21m+wg1zTHDINzSC7SbkP
 XPXszRuwTuaZEmLCAQznAMO5cMSv/9bL/w==
X-Google-Smtp-Source: ABdhPJxaWMTadRZx1HdPX+mDRAz7N9wG+Vvg7j2WgsZFWIvHxEx3DKnhKuGf7X02hcHH/TiZXJKvsQ==
X-Received: by 2002:a92:7303:: with SMTP id o3mr14561672ilc.203.1623062725555; 
 Mon, 07 Jun 2021 03:45:25 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id c14sm8933303ilq.9.2021.06.07.03.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:24 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Mon,  7 Jun 2021 16:15:09 +0530
Message-Id: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/7] getitimer02: Skipped EFAULT tests for libc
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

Tested EFAULT cases only for "__NR_getitimer" syscall.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/getitimer/getitimer02.c   | 54 +++++++++++++++----
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/getitimer/getitimer02.c b/testcases/kernel/syscalls/getitimer/getitimer02.c
index b9c03143a..356453d4d 100644
--- a/testcases/kernel/syscalls/getitimer/getitimer02.c
+++ b/testcases/kernel/syscalls/getitimer/getitimer02.c
@@ -30,6 +30,7 @@
 
 #include <errno.h>
 #include <sys/time.h>
+#include "lapi/syscalls.h"
 
 char *TCID = "getitimer02";
 int TST_TOTAL = 1;
@@ -39,9 +40,35 @@ int TST_TOTAL = 1;
 static void cleanup(void);
 static void setup(void);
 
+static int libc_getitimer(int which, void *curr_value)
+{
+	return getitimer(which, curr_value);
+}
+
+static int sys_getitimer(int which, void *curr_value)
+{
+	return ltp_syscall(__NR_getitimer, which, curr_value);
+}
+
+static struct test_variants
+{
+	int (*getitimer)(int which, void *curr_value);
+	char *desc;
+} variants[] = {
+	{ .getitimer = libc_getitimer, .desc = "libc getitimer()"},
+
+#if (__NR_getitimer != __LTP__NR_INVALID_SYSCALL)
+	{ .getitimer = sys_getitimer,  .desc = "__NR_getitimer syscall"},
+#endif
+};
+
+unsigned int tst_variant_t;
+int TST_VARIANTS = ARRAY_SIZE(variants);
+
 int main(int ac, char **av)
 {
-	int lc;
+	int lc, i;
+	struct test_variants *tv = &variants[tst_variant_t];
 
 	tst_parse_opts(ac, av, NULL, NULL);
 
@@ -50,16 +77,25 @@ int main(int ac, char **av)
 	for (lc = 0; TEST_LOOPING(lc); lc++) {
 		tst_count = 0;
 
-		/* call with a bad address */
-		TEST(getitimer(ITIMER_REAL, (struct itimerval *)-1));
+		for (i = 0; i < TST_VARIANTS; i++) {
+			tst_resm(TINFO, "Testing variant: %s", tv->desc);
 
-		if (TEST_RETURN == 0) {
-			tst_resm(TFAIL, "call failed to produce "
-				 "expected error - errno = %d - %s",
-				 TEST_ERRNO, strerror(TEST_ERRNO));
-			continue;
-		}
+			/* call with a bad address */
+			if (tv->getitimer == libc_getitimer) {
+				tst_resm(TCONF, "EFAULT skipped for libc variant");
+				tv++;
+				continue;
+			}
 
+		TEST(tv->getitimer(ITIMER_REAL, (struct itimerval *)-1));
+
+			if (TEST_RETURN == 0) {
+				tst_resm(TFAIL, "call failed to produce "
+					 "expected error - errno = %d - %s",
+					TEST_ERRNO, strerror(TEST_ERRNO));
+				continue;
+			}
+		}
 		switch (TEST_ERRNO) {
 		case EFAULT:
 			tst_resm(TPASS, "expected failure - errno = %d - %s",
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
