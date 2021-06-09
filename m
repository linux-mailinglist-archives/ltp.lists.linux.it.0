Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 250223A1BF7
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93A9A3C9E9A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0133A3C972E
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:15 +0200 (CEST)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8B4BC600728
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:14 +0200 (CEST)
Received: by mail-io1-xd2e.google.com with SMTP id k16so23613199ios.10
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fncOcTa/ypwTwgJBRt4KgH8I+TRlaNfck31eT56ooTg=;
 b=HiDY7kCSpOBzgd7d8A++xkZ5de1p66d+SAbpCKjRid4g7KDX4mnDOGQWPjrCjvZus8
 ZAojPLKi9A4GWnVIOPXpPlvLXxwv7NiMUkckjbJnn4kelyQVkJRpd3FDTy92QnPgXwIA
 Juq5qp0w/MEKvN0U732UyA/iR9fgkfNfNWK0/havExYctXV5ErOln2tQrdOezAASrGc4
 WgcJyYMc4PdJedNb7rvzOfjS4BR0bVwNNSTo6PHTTwmUu0oIJeC9NjKK/jYJfULb4awm
 y7o+BQlrjr24yxGQJ4UrULSZaIBH5/EdcO1bKDEG67+/tz7+QGBb407unK/d3LyPHsJt
 U+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fncOcTa/ypwTwgJBRt4KgH8I+TRlaNfck31eT56ooTg=;
 b=ne5BJP8hZLJbH/N/luercPb0veNL1P9MucZjqofR1lhPTao37NH6QACT6VCdtOMJSU
 pVgzsxgWP/z/wOEOoBSZ2r0lDTQjL0DQ2zu9FyEgsr0iZTBqgdncZm+7jVyvHZ7xYy0u
 2Rlda8ZPXWxSVPK0qSELXqPx1U+t4VGEx1e/KA5cjBsqty7ZNIo7xApx19Vs0oUxN5KV
 EO2xNsAzKUfr51ZcBu9R9DsWo98g2vntMobGKn2AI4H8PfpHnTuBjNeHGZmwMtGXXXjP
 8pG2s8eoOlsUDJkYx8dPfz5jx3hw4m9+JyGyyv376vjKiLeYBUmuLf+9A/pvZcnwz8rQ
 klBg==
X-Gm-Message-State: AOAM531zvpQ1dtTuIkjoxbftsEZWrACM/OShLDal6WMF/kEPTUadYGl7
 SJzzVcmTDjoMmWCQSEt/FjY=
X-Google-Smtp-Source: ABdhPJwdTApib+V3o8Hg/i7BEUSsm5gDyU+0gvSrL6YExqtcsrTYBOG4K9Hx7mub6Dg6yrC5jHlfrw==
X-Received: by 2002:a02:cc2f:: with SMTP id o15mr696239jap.3.1623260233314;
 Wed, 09 Jun 2021 10:37:13 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:37:12 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:59 +0530
Message-Id: <20210609173601.29352-8-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 08/10] semctl03 :Skipped EFAULT tests for libc
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

Tested EFAULT cases only for "__NR_semctl" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/ipc/semctl/semctl03.c     | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl03.c b/testcases/kernel/syscalls/ipc/semctl/semctl03.c
index ed2a46b16..44030ae47 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl03.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl03.c
@@ -15,6 +15,7 @@
 #include "tst_test.h"
 #include "lapi/sem.h"
 #include "libnewipc.h"
+#include "lapi/syscalls.h"
 
 static int sem_id = -1;
 static int bad_id = -1;
@@ -23,6 +24,17 @@ static struct semid_ds sem_ds;
 static union semun sem_un = {.buf = &sem_ds};
 static void *semds_ptr = &sem_un;
 static void *bad_ptr;
+static union semun arg = {0};
+
+static int libc_semctl(int semid, int semnum, int cmd, ...)
+{
+	return semctl(semid, semnum, cmd, arg);
+}
+
+static int sys_semctl(int semid, int semnum, int cmd, ...)
+{
+	return tst_syscall(__NR_semctl, semid, semnum, cmd, arg);
+}
 
 static struct tcases {
 	int *sem_id;
@@ -37,17 +49,39 @@ static struct tcases {
 	{&sem_id, IPC_SET, &bad_ptr, EFAULT, "invalid union arg"}
 };
 
+static struct test_variants
+{
+	int (*semctl)(int semid, int semnum, int cmd, ...);
+	char *desc;
+} variants[] = {
+	{ .semctl = libc_semctl, .desc = "libc semctl()"},
+
+#if (__NR_sys_semctl != __LTP__NR_INVALID_SYSCALL)
+	{ .semctl = sys_semctl,  .desc = "__NR_semctl syscall"},
+#endif
+};
+
 static void verify_semctl(unsigned int n)
 {
 	struct tcases *tc = &tests[n];
+	struct test_variants *tv = &variants[tst_variant];
+
+	if (tc->error == EFAULT
+		&& tv->semctl == libc_semctl) {
+		tst_res(TCONF, "EFAULT is skipped for libc variant");
+		return;
+	}
 
-	TST_EXP_FAIL(semctl(*(tc->sem_id), 0, tc->ipc_cmd, *(tc->buf)),
-		     tc->error, "semctl() with %s", tc->message);
+	TST_EXP_FAIL(sys_semctl(*(tc->sem_id), 0, tc->ipc_cmd, *(tc->buf)),
+		tc->error, "semctl() with %s", tc->message);
 }
 
 static void setup(void)
 {
 	static key_t semkey;
+	struct test_variants *tv = &variants[tst_variant];
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 
 	semkey = GETIPCKEY();
 
@@ -67,4 +101,5 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test = verify_semctl,
 	.tcnt = ARRAY_SIZE(tests),
+	.test_variants = ARRAY_SIZE(variants),
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
