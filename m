Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4703A23BE
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 07:10:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8AC5C3C31A9
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 07:10:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 888AF3C313C
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 07:10:03 +0200 (CEST)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C4A491A01720
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 07:10:02 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so3001182pjp.4
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 22:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SI8rQfZ+yoYwzbCh46ib6zD69H9StXbzz/NXDF+yCwI=;
 b=ng39IfdYXPqK5dG5vjgeaej/2L2Jwi/QGup5kzRBYgIJpcPA5LU3h4Ryzey3aTnJHp
 II/3vzuIm3ccn/uWB6JLiy/JmwRB+kWX+rDa88xKxP6uAHWqyBMunSl+s50Xi+Z+nO65
 vGgr3/bvXJk9FyHkjzngjrWbwioMGNpIqEYl0NNf5Kelaw47g7R5yXZawhVUbHjUe8Dc
 QnNAkQ/GQpm4CqsyTBP24Q1OCpUvWccy3SySVWzyCp/rL2TrlUB/2rmS+rO9kevtEOiS
 RUOiJ5znZnYBaoe6re35P4y/IQtJhgwa6pE057zr8VbapOMTqxsi6EwCi9Arfj5cEPp9
 CbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SI8rQfZ+yoYwzbCh46ib6zD69H9StXbzz/NXDF+yCwI=;
 b=YBMmE7uc7mRdFApQz+lKt6OIfK6WJc7+nLnDr6sWbmKcegs4VZHxholVYiYAx6IwGN
 Zms2jMuLSBrZQV28B104qkigx75/7VHfn13NlU2HCZqKlW4eto+YbFxolCBFHE6yas4C
 1oEERlwR3BmayEAHuZu542RhNsT1j+wSnHp3ZE0pIUI7SU45KnphHeQb1TnFQTBe7NuX
 yaX5Shyv/H/eu6OogFVBNU5yrwaq5Z2HDaW3HWhHbkbShvRQwqWMKJLUzCssmNIKc1ec
 HWsSwOe1Dx6ZckE4h8cTD+OcsNoTMnqJU047zcccnjvGLfC8OXBFung603GLDoRSeKax
 4MIg==
X-Gm-Message-State: AOAM5331PU6hOiE2/iHjx8SxFgdrOn6kimxviIXkt+qtkqlKZdDp8Ltu
 bpQewLMYQSaQkh1kBFeQ/u0=
X-Google-Smtp-Source: ABdhPJzxSz9npjWgJ9Inbgn/PQJOsVz1sgnYSD8Q53g/HgKYqB3oKf2tDRoi1YZ8t8MjZi90nCN0/w==
X-Received: by 2002:a17:902:7c94:b029:fc:5e8b:e645 with SMTP id
 y20-20020a1709027c94b02900fc5e8be645mr3277692pll.18.1623301801110; 
 Wed, 09 Jun 2021 22:10:01 -0700 (PDT)
Received: from vinay-Latitude-3400.domain.name ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id w23sm1019267pfi.220.2021.06.09.22.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 22:10:00 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: metan@ucw.cz,
	ltp@lists.linux.it
Date: Thu, 10 Jun 2021 10:39:52 +0530
Message-Id: <20210610050952.2862-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602040423.9350-1-vinay.m.engg@gmail.com>
References: <20210602040423.9350-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4] adjtimex02.c: Skipped EFAULT tests for libc
 variant"
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
Cc: umesh.kalappa0@gmail.com, rwmacleod@gmail.com, vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: vinay kumar <vinay.m.engg@gmail.com>

Tested EFAULT cases only for "__NR_adjtimex" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/adjtimex/adjtimex02.c     | 226 ++++++++++++------
 1 file changed, 152 insertions(+), 74 deletions(-)

diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex02.c b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
index 19ee97158..5eaea6352 100644
--- a/testcases/kernel/syscalls/adjtimex/adjtimex02.c
+++ b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
@@ -10,115 +10,193 @@
 #include <unistd.h>
 #include <pwd.h>
 #include "tst_test.h"
+#include "lapi/syscalls.h"
 
-#define SET_MODE ( ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
-	ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK )
+#define SET_MODE (ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
+				ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK)
 
-static int hz;			/* HZ from sysconf */
-
-static struct timex *tim_save;
-static struct timex *buf;
+static int hz;		/* HZ from sysconf */
 
+static struct timex *tim_save, *buf;
 static struct passwd *ltpuser;
 
-static void verify_adjtimex(unsigned int nr)
+struct test_case {
+	unsigned int modes;
+	long lowlimit;
+	long highlimit;
+	long delta;
+	int exp_err;
+};
+
+static int libc_adjtimex(void *timex)
 {
-	struct timex *bufp;
-	int expected_errno = 0;
+	return adjtimex(timex);
+}
 
-	/*
-	 * since Linux 2.6.26, if buf.offset value is outside
-	 * the acceptable range, it is simply normalized instead
-	 * of letting the syscall fail. so just skip this test
-	 * case.
-	 */
-	if (nr > 3 && (tst_kvercmp(2, 6, 25) > 0)) {
-		tst_res(TCONF, "this kernel normalizes buf."
-				"offset value if it is outside"
-				" the acceptable range.");
-		return;
-	}
+static int sys_adjtimex(void *timex)
+{
+	return tst_syscall(__NR_adjtimex, timex);
+}
+
+static struct test_case tc[] = {
+	{
+	.modes = SET_MODE,
+	.exp_err = EFAULT,
+	},
+	{
+	.modes = ADJ_TICK,
+	.lowlimit = 900000,
+	.delta = 1,
+	.exp_err = EINVAL,
+	},
+	{
+	.modes = ADJ_TICK,
+	.highlimit = 1100000,
+	.delta = 1,
+	.exp_err = EINVAL,
+	},
+	{
+	.modes = ADJ_OFFSET,
+	.highlimit = 512000L,
+	.delta = 1,
+	.exp_err = EINVAL,
+	},
+	{
+	.modes = ADJ_OFFSET,
+	.lowlimit = -512000L,
+	.delta = -1,
+	.exp_err = EINVAL,
+	},
+};
+
+static struct test_variants
+{
+	int (*adjtimex)(void *timex);
+	char *desc;
+} variants[] = {
+	{ .adjtimex = libc_adjtimex, .desc = "libc adjtimex()"},
+
+#if (__NR_adjtimex != __LTP__NR_INVALID_SYSCALL)
+	{ .adjtimex = sys_adjtimex,  .desc = "__NR_adjtimex syscall"},
+#endif
+};
+
+static void verify_adjtimex(unsigned int i)
+{
+	struct timex *bufp;
+	struct test_variants *tv = &variants[tst_variant];
 
 	*buf = *tim_save;
 	buf->modes = SET_MODE;
 	bufp = buf;
-	switch (nr) {
-	case 0:
-		bufp = (struct timex *)-1;
-		expected_errno = EFAULT;
-		break;
-	case 1:
-		buf->tick = 900000 / hz - 1;
-		expected_errno = EINVAL;
-		break;
-	case 2:
-		buf->tick = 1100000 / hz + 1;
-		expected_errno = EINVAL;
-		break;
-	case 3:
-		/* Switch to nobody user for correct error code collection */
-		ltpuser = SAFE_GETPWNAM("nobody");
-		SAFE_SETEUID(ltpuser->pw_uid);
-		expected_errno = EPERM;
-		break;
-	case 4:
-		buf->offset = 512000L + 1;
-		expected_errno = EINVAL;
-		break;
-	case 5:
-		buf->offset = (-1) * (512000L) - 1;
-		expected_errno = EINVAL;
-		break;
-	default:
-		tst_brk(TFAIL, "Invalid test case %u ", nr);
+
+	if (tc[i].exp_err == EINVAL) {
+		if (tc[i].modes == ADJ_TICK) {
+			if (tc[i].lowlimit)
+				buf->tick = tc[i].lowlimit - tc[i].delta;
+
+			if (tc[i].highlimit)
+				buf->tick = tc[i].highlimit + tc[i].delta;
+		}
+		if (tc[i].modes == ADJ_OFFSET) {
+			if (tc[i].lowlimit) {
+				tst_res(TCONF, "this kernel normalizes buf. offset value if it is outside the acceptable range.");
+				return;
+			}
+			if (tc[i].highlimit) {
+				tst_res(TCONF, "this kernel normalizes buf. offset value if it is outside the acceptable range.");
+				return;
+			}
+		}
 	}
 
-	TEST(adjtimex(bufp));
-	if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
-		tst_res(TPASS | TTERRNO,
-				"adjtimex() error %u ", expected_errno);
-	} else {
-		tst_res(TFAIL | TTERRNO,
-				"Test Failed, adjtimex() returned %ld",
-				TST_RET);
+	if (tc[i].exp_err == EFAULT) {
+		if (tv->adjtimex != libc_adjtimex) {
+			bufp = (struct timex *) -1;
+		} else {
+			tst_res(TCONF, "EFAULT is skipped for libc variant");
+			return;
+		}
+	}
+
+	TEST(tv->adjtimex(bufp));
+
+	if (tc[i].exp_err != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "adjtimex(): expected %s mode %x",
+					tst_strerrno(tc[i].exp_err), tc[i].modes);
+		return;
 	}
 
-	/* clean up after ourselves */
-	if (nr == 3)
-		SAFE_SETEUID(0);
+	tst_res(TPASS, "adjtimex() error %s", tst_strerrno(tc[i].exp_err));
+
 }
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	size_t i;
+	int expected_errno = 0;
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+
 	tim_save->modes = 0;
 
+	buf->modes = SET_MODE;
+
+	/* Switch to nobody user for correct error code collection */
+	ltpuser = SAFE_GETPWNAM("nobody");
+	SAFE_SETEUID(ltpuser->pw_uid);
+	expected_errno = EPERM;
+
+	TEST(tv->adjtimex(buf));
+
+	if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
+		tst_res(TPASS, "adjtimex() error %s ",
+				tst_strerrno(expected_errno));
+	} else {
+		tst_res(TFAIL | TTERRNO,
+				"adjtimex(): returned %ld", TST_RET);
+	}
+
+	SAFE_SETEUID(0);
+
 	/* set the HZ from sysconf */
 	hz = SAFE_SYSCONF(_SC_CLK_TCK);
 
-	/* Save current parameters */
-	if ((adjtimex(tim_save)) == -1)
+	for (i = 0; i < ARRAY_SIZE(tc); i++) {
+		if (tc[i].modes == ADJ_TICK) {
+			tc[i].highlimit /= hz;
+			tc[i].lowlimit /= hz;
+		}
+	}
+
+	if ((adjtimex(tim_save)) == -1) {
 		tst_brk(TBROK | TERRNO,
-			"adjtimex(): failed to save current params");
+		"adjtimex(): failed to save current params");
+	}
 }
 
 static void cleanup(void)
 {
+
 	tim_save->modes = SET_MODE;
 
-	/* Restore saved parameters */
-	if ((adjtimex(tim_save)) == -1)
-		tst_res(TWARN, "Failed to restore saved parameters");
+	if ((adjtimex(tim_save)) == -1) {
+		tst_brk(TBROK | TERRNO,
+		"adjtimex(): failed to save current params");
+	}
 }
 
 static struct tst_test test = {
-	.needs_root = 1,
-	.tcnt = 6,
+	.test = verify_adjtimex,
 	.setup = setup,
 	.cleanup = cleanup,
-	.test = verify_adjtimex,
+	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
+	.needs_root = 1,
 	.bufs = (struct tst_buffers []) {
-		{&buf, .size = sizeof(*buf)},
-		{&tim_save, .size = sizeof(*tim_save)},
-		{},
-	}
+		 {&buf, .size = sizeof(*buf)},
+		 {&tim_save, .size = sizeof(*tim_save)},
+		 {},
+		}
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
