Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B47743A5983
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 18:19:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88D633C4D3F
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 18:19:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 542503C2F2D
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 18:19:53 +0200 (CEST)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 92CBF600661
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 18:19:52 +0200 (CEST)
Received: by mail-io1-xd32.google.com with SMTP id p66so35178537iod.8
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o3tAxQqr3b46F0UhQf7HhElHxqWENts0EIYirIM55Ng=;
 b=ptl19IZh/Rsil9HSiCnxCGjto55oyKz2O81pxv9GrTLVyJlVHkQBAOgLUEC/Wge+fC
 4uriAX3wV3wEQHcHE4px+3byfCX/3zCSo/xnw3AjpO9a8ascdNqPTrBZxONJsrnAGcqz
 VVwqWu2dAffgS8t9v9Pd5TsDNA0p4/sRT3htNJ0HyYK71mY8CvyquUUyLluNJ7ndMg+K
 gblYhqJmPYWTsVh9geWeA1uj60jnZJNnXuaum73WtMv803+anxV5MyyLlLkX4eizPny8
 vFldK2K/pXLzRqrJt/TjfDbofoTb7jVFTEoLi52Mepm8by7MKqhNXuKyYa/xCGyshKPD
 /4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o3tAxQqr3b46F0UhQf7HhElHxqWENts0EIYirIM55Ng=;
 b=fMSRYZ8USTb1g58ALwB5fo38dNENfkrv1yU/TcEQs4N5fI++wydETrwFFNOReceurp
 61ytv0WLow9JFfeE46x3JAxtM3ZgZ2otqNyitjPh5d6ewj8W/EM6WBuUAwpdOQ/8XjEH
 NhgTqjcKi9/CDNDIhkPVO55Y/UFcUTTf96nuvR22vA7YyIl6Oyv0uqM/Qd41niUECpss
 iZfnogvXE4qxj7Ti1OnF1reK/zSjkuz9vvcfScQWmsGu7fYMD6IjYJD0NFei+JkAObsy
 fFuJRVfmHZ0aeLKz6BD45wU/mUT+e3kC8pfDW6wImUfjOPEdXHC9+Y9ryub2Uu9UfF0n
 BmSA==
X-Gm-Message-State: AOAM532oUJ8soLEnVZgPycxRj/nBmaCq/oe4GEBhVpGHqTpPQp+Jt0Fs
 Gwd4UfLS4NXQUUG8aZxVKa4=
X-Google-Smtp-Source: ABdhPJz7teD7wpSsn2sNt0AwenX/VSLBp+7c6slnbDJFxfnLAAqmTfDTNw0PPI0vSuHRVz6/JcVnyg==
X-Received: by 2002:a6b:760e:: with SMTP id g14mr11056420iom.119.1623601191350; 
 Sun, 13 Jun 2021 09:19:51 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id z14sm6488375ilb.48.2021.06.13.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 09:19:50 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 21:49:41 +0530
Message-Id: <20210613161941.4934-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YMNNHVaIQZ84+lLS@yuki>
References: <YMNNHVaIQZ84+lLS@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5] adjtimex02.c: Skipped EFAULT tests for libc variant
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
Cc: umesh.kalappa0@gmail.com, metan@ucw.cz, rwmacleod@gmail.com,
 vinay.kumar@blackfigtech.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Tested EFAULT cases only for "__NR_adjtimex" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/adjtimex/adjtimex02.c     | 169 +++++++++++-------
 1 file changed, 101 insertions(+), 68 deletions(-)

diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex02.c b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
index 19ee97158..bfe07ec72 100644
--- a/testcases/kernel/syscalls/adjtimex/adjtimex02.c
+++ b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
@@ -10,99 +10,131 @@
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
+static int libc_adjtimex(struct timex *value)
+{
+	return adjtimex(value);
+}
+
+static int sys_adjtimex(struct timex *value)
+{
+	return tst_syscall(__NR_adjtimex, value);
+}
+
+static struct test_case {
+	unsigned int modes;
+	long lowlimit;
+	long highlimit;
+	long delta;
+	int exp_err;
+} tc[] = {
+	{ .modes = SET_MODE, .exp_err = EPERM},
+	{ .modes = SET_MODE, .exp_err = EFAULT},
+	{ .modes = ADJ_TICK, .lowlimit = 900000, .delta = 1, .exp_err = EINVAL},
+	{ .modes = ADJ_TICK, .highlimit = 1100000, .delta = 1, .exp_err = EINVAL},
+	{ .modes = ADJ_OFFSET, .highlimit = 512000L, .delta = 1, .exp_err = EINVAL},
+	{ .modes = ADJ_OFFSET, .lowlimit = -512000L, .delta = -1,	.exp_err = EINVAL},
+};
+
+static struct test_variants
+{
+	int (*adjtimex)(struct timex *value);
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
 {
 	struct timex *bufp;
-	int expected_errno = 0;
-
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
+
+	if (tc[i].exp_err == EPERM)
 		SAFE_SETEUID(ltpuser->pw_uid);
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
 	}
 
-	/* clean up after ourselves */
-	if (nr == 3)
+	TST_EXP_FAIL(tv->adjtimex(bufp), tc[i].exp_err, "adjtimex() error");
+
+	if (tc[i].exp_err == EPERM)
 		SAFE_SETEUID(0);
 }
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+	size_t i;
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+
 	tim_save->modes = 0;
 
+	ltpuser = SAFE_GETPWNAM("nobody");
+	SAFE_SETEUID(ltpuser->pw_uid);
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
 			"adjtimex(): failed to save current params");
+	}
 }
 
 static void cleanup(void)
 {
+
 	tim_save->modes = SET_MODE;
 
 	/* Restore saved parameters */
@@ -111,14 +143,15 @@ static void cleanup(void)
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
