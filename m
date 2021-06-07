Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E872D39DA01
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:46:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 983AA3C56B8
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:46:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC5593C7C83
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:39 +0200 (CEST)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 585A91A00E0C
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:39 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id b25so17766924iot.5
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XNobSiTTaPNkQzLj1w9PC/8NaplaMyZJqM9F8UxM4jE=;
 b=NUOH34gr6oQVypO1pFaRzCGDvXBznWlyLtlzbzIMWlLQ3p3ES9tJfGky2vYxkLRKjU
 hnOWuGbnCVm3lBHdbwZjpqsI7DOGh1KsB8UVBMRu/9O8cBjAZik+DC5Aw56dWP5fUJ4H
 dp6gmHGMu4pbsnCSvLosrl/1qzdRQZhSv1Z2nf3+bM4GFfjqqyQ21Kuyi/0J1Q2eIWlE
 1hi1D6ugMjsfCFS15yqcIRGL4ETly7L3ygyXvkz+0RGbsJ57QvJDdWtZJfHRqZUJuT8j
 AdK1UrdDtcqnb6T3/EmBLWAiGY2uJnSR52akQs+kOZCCOJK80eOS3YBYCk3ATMNrh3vT
 PtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XNobSiTTaPNkQzLj1w9PC/8NaplaMyZJqM9F8UxM4jE=;
 b=fwl2gwFyBEqo9KBvqfxp8n39RJmJGp7SI1yErecHlCHPp3xh2icNPW4SFiHO9ydcbt
 DiasESYj62vN/SCb/6pb0MkUPzDAEURocV6M4Dui9GyrLIs3UQMruZ3/xNl3kJw64dhl
 A6popRBTwAJRjQmY0nZHvq+LYpiHhapuhU5fwhtTgb/FWprdY+pvEyGPgMiee5f5iP7P
 wwkPI0hun89L1biN8YMHe1c1536XFxJTf1d6ABCSlJamNsruGMWEc+alsNT6ttsTQ2NP
 mXvTY5QfelLbzsmQqp8Errrb7Wp1zmZU8YvfmQCavlfNfiqVYYQu1AmwoXzlt8kcvE+N
 98GA==
X-Gm-Message-State: AOAM533BERBxKGOO8/iah3mbyJrNLHYUIgQ/ASfRgdXySESeLf8DnZAU
 xO+HrvYUjuKbUag2NLnGT2QNxav0XVPYww==
X-Google-Smtp-Source: ABdhPJwI4XWQCeD9c0A5wGp7R4pHHipuEn9PeikOGtG0GiO1PdUvKyUqa1TJ+uOUkoJu6jNeRGCUPA==
X-Received: by 2002:a5e:930d:: with SMTP id k13mr14129416iom.61.1623062737805; 
 Mon, 07 Jun 2021 03:45:37 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id c14sm8933303ilq.9.2021.06.07.03.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:37 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Mon,  7 Jun 2021 16:15:13 +0530
Message-Id: <20210607104515.29838-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607104515.29838-1-vinay.m.engg@gmail.com>
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 5/7] shmctl02: Skipped EFAULT tests for libc variant.
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

Tested EFAULT cases only for "__NR_shmctl"

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/ipc/shmctl/shmctl02.c     | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
index 9057b7f54..b9a71722d 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
@@ -32,6 +32,7 @@
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
+#include "lapi/syscalls.h"
 
 #define SHM_SIZE 2048
 
@@ -43,6 +44,16 @@ static int shm_rem;
 
 static struct shmid_ds buf;
 
+static int libc_shmctl(int shmid, int cmd, void *buf)
+{
+	return shmctl(shmid, cmd, buf);
+}
+
+static int sys_shmctl(int shmid, int cmd, void *buf)
+{
+	return tst_syscall(__NR_shmctl, shmid, cmd, buf);
+}
+
 static struct tcase {
 	int *shm_id;
 	int cmd;
@@ -63,9 +74,29 @@ static struct tcase {
 	{&shm_id3, SHM_UNLOCK, &buf, EPERM}
 };
 
+static struct test_variants
+{
+	int (*shmctl)(int shmid, int cmd, void *buf);
+	char *desc;
+} variants[] = {
+	{ .shmctl = libc_shmctl, .desc = "libc shmctl()"},
+
+#if (__NR_shmctl != __LTP__NR_INVALID_SYSCALL)
+	{ .shmctl = sys_shmctl,  .desc = "__NR_shmctl syscall"},
+#endif
+};
+
 static void verify_shmctl(unsigned int i)
 {
-	TEST(shmctl(*(tc[i].shm_id), tc[i].cmd, tc[i].buf));
+	struct test_variants *tv = &variants[tst_variant];
+
+	if (tc[i].error == EFAULT
+		&& tv->shmctl == libc_shmctl) {
+		tst_res(TCONF, "EFAULT is skipped for libc variant");
+		return;
+	}
+
+	TEST(tv->shmctl(*(tc[i].shm_id), tc[i].cmd, tc[i].buf));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "shmctl() returned %li", TST_RET);
@@ -74,7 +105,7 @@ static void verify_shmctl(unsigned int i)
 
 	if (TST_ERR == tc[i].error) {
 		tst_res(TPASS | TTERRNO, "shmctl(%i, %i, %p)",
-		        *tc[i].shm_id, tc[i].cmd, tc[i].buf);
+				*tc[i].shm_id, tc[i].cmd, tc[i].buf);
 		return;
 	}
 
@@ -84,10 +115,14 @@ static void verify_shmctl(unsigned int i)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
 	key_t shmkey1, shmkey2;
 	struct passwd *ltpuser;
 	int tmp;
 
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
+
 	shm_id3 = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
 
 	ltpuser = SAFE_GETPWNAM("nobody");
@@ -121,6 +156,7 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_shmctl,
+	.test_variants = ARRAY_SIZE(variants),
 	.tcnt = ARRAY_SIZE(tc),
 	.needs_root = 1,
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
