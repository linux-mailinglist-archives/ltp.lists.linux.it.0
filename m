Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F139D9FD
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4F553C7B51
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BEAF53C7C0B
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:36 +0200 (CEST)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3B456600682
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:36 +0200 (CEST)
Received: by mail-io1-xd2e.google.com with SMTP id k5so7966922iow.12
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0tVpdzF0iLK7ndqm6GhUOilisgw23CW2T2L/5dnsTt8=;
 b=fnliE/kgiST176YGtiqRJAFEavv9/jVaOwt9CGAvMHlOT3fJyMuDTxeJBqvCtScB2D
 QlCZVEUDTWqcvoTa6DViB8z/19CTKz52CqC+zaR0EHKk7ah9S0DUqOR2Nc8+kWcZ4vzg
 6ppeLHcT3ADqe0I545LOHciIa9isi8UFS2HvAt8t9ideXMk7fFo+B5vx9MHHyj83kaeq
 KO4s+H2RcWNAaeiL8WAmN72HkKKzGHqKyFR6xaD9Wtx6joDpbj911Gglh2uf8c2IUeFE
 t9g+cKWeuY9ngpLZpeFgox6dvPkANOSgQgOm6LHSS6TkpTAtf39ihUHgD8D5mXGaXk6G
 Wbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0tVpdzF0iLK7ndqm6GhUOilisgw23CW2T2L/5dnsTt8=;
 b=NA2pOklTdXVPEh49kw+LwOQVpJGrIqhFKw6pjk5PgcI2m0RcjgN+jWYkMeeGS7js8z
 hEdk2zaJGH5BntezaI7Lioa+ObwnBFuyz+BLAp8oLHNNncr1mJkHt9C5BMj5uh3n0amC
 DpdUUMorG2TfL/ZE5QAPLB87G36bhBogK9XCkD+DDow/vB/i4owwkRY7F4lNl1S4833y
 8+xJzwtMbZuBxtdB3ijK5NYGAeOcIh9q9jc46W1PeewH3Oa0E5oz3CDM3LsgAsHs0Qao
 3NtVSGTh//lzU/QDu2aUx+Jq+Evpwq4xhXy5PQEOOWy1B7eO18KoI71tHgFYQZz+TO7a
 +ymg==
X-Gm-Message-State: AOAM531pweZccoiAD2FZbJ+4iphNxSSaUgVUHsxattggH2u6XfdLAkSs
 iKxvfBTSlXcZbDn27MnFtbGa9P/dA7bBjA==
X-Google-Smtp-Source: ABdhPJxCOwWd+g4l4XMKINdQSJZ/mrmXtysvZyuQer5fDRqdeIyZbkB7f6LXI2bNiuJWCEMHKI+6nQ==
X-Received: by 2002:a05:6602:2b01:: with SMTP id
 p1mr14184449iov.84.1623062734733; 
 Mon, 07 Jun 2021 03:45:34 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id c14sm8933303ilq.9.2021.06.07.03.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:34 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Mon,  7 Jun 2021 16:15:12 +0530
Message-Id: <20210607104515.29838-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607104515.29838-1-vinay.m.engg@gmail.com>
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] semctl03: Skipped EFAULT tests for libc variant.
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

Tested EFAULT cases only for "__NR_semctl" syscall.

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
