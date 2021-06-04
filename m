Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B1939B779
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 13:04:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59CCE3C7FD2
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 13:04:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B2093C2836
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 13:04:14 +0200 (CEST)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9AE841A014B9
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 13:04:13 +0200 (CEST)
Received: by mail-il1-x132.google.com with SMTP id b5so8405501ilc.12
 for <ltp@lists.linux.it>; Fri, 04 Jun 2021 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TYL85YQwRw5OqgWtMgODH65JiYo2dCGgtZkJYY8ef6Q=;
 b=oulN7BnzdFq/V5bPd3JalNftAnNGcZ1l+uNBiu7NyRlKqISGHrl4ak+54qUls+tWcB
 gwG6LnQ+0uyFFrnex9Nu10JZDYcj3CwED2T0sNgC5nn5yfEHDOVOTo5LTcdQFvWZg3GY
 4gHkchtm/k3Wj3aafVrvsZu/QzKiap4nhwE1/z2tSMH3ivPBccQgc5vA1chWc4y6juYN
 RAfR9gUBons1pAvrcswGoH/Gre+a6vyoKGDyfZhe/MsMpZKQlsaXeS4hRqe/cXUphUUt
 q0FtD/YR809F5gENJUztq9vdrVpLAj4XZXMvINrqLPk0NGCat8+mAZ8AKCK9SxryzxrZ
 MImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TYL85YQwRw5OqgWtMgODH65JiYo2dCGgtZkJYY8ef6Q=;
 b=Ghhh7xuxxV1wpz6L/jXLHAqJhSyiiN9fEm4Q24pBH8nLoTvq4ywz8Gol0Mj8YKktG9
 myAAKGyT02Wk9CAHcJhYc47NlralvrcQrCzlqkrLPqR8uqkht359DLPPxYhveFnXoWaU
 rDwESVA+bQDSbsL09SK1ZQwqBs2PZYIfhHKbugX+8iDXgCTN+6Hun3nLqEhUU9lFHgXu
 isJ7c48T4QCs0neOh5+sCMPuN8wl91/DrgpEI2UCXHLSm6ePcqutGunDYSNgOu/hcYc+
 cZVI/kurgmg9/HiZFn40Uh5HthR7wYhie5stQiC3iJQfhlrk2cLlO4h5htHhR5iVVLPU
 QtMw==
X-Gm-Message-State: AOAM530r1uqtPaUgWKKGMyfUmxr8OEkO9I8vz2ZTuwfBkK6Qk6dIXpFM
 Bmf5kLTl9iapjutnowBQOt5w/kd4Bo3c3ilS
X-Google-Smtp-Source: ABdhPJztJPfLvSNzOxbYTlCggmA5tNI3YVFhvxUfnChLTafjf5M/sxw2nsf8YzIUekuPcXhFbMQgAw==
X-Received: by 2002:a05:6e02:eaf:: with SMTP id
 u15mr3400727ilj.0.1622804651887; 
 Fri, 04 Jun 2021 04:04:11 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id y11sm3187384iop.27.2021.06.04.04.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 04:04:11 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Fri,  4 Jun 2021 16:33:56 +0530
Message-Id: <20210604110356.28791-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CANUMPcXNUv6gBeguaX+rDjr=1uUXs2kuCcZYYuyzufgLn=dbcg@mail.gmail.com>
References: <CANUMPcXNUv6gBeguaX+rDjr=1uUXs2kuCcZYYuyzufgLn=dbcg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] adjtimex02.c: Tested EFAULT case only for
 "__NR_adjtimex syscall". Remaining EINVAL and EPERM are tested for both
 "__NR_adjtimex syscall" and "libc adjtimex()".
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
Cc: vinay.kumar@blackfigtech.com, shivahms@gmail.com, umesh.kalappa0@gmail.com,
 rwmacleod@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: vinay kumar <vinay.m.engg@gmail.com>

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
