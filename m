Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC239D9FB
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BDCF3C7B4F
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 12:45:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C8D4E3C4DBC
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:33 +0200 (CEST)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3BE5E1400159
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 12:45:33 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id b25so17766662iot.5
 for <ltp@lists.linux.it>; Mon, 07 Jun 2021 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MEUlKykNlkscVPficLXy7yLulpuF0W+I4OnfCTkKVmk=;
 b=YNv2gIi657jp/vUQ02MTP22LksbMKvNZDUeNBCZ9AOorb3tFqRpjGls+Jy8uNK9kbQ
 lgCTMoSt3MrKT1bsHNsLdyr65G4/g5m0b2TWgXT/uHxfn+H3oC3px/fYuw7WkQ0Sbf4L
 14ElBYXr6wMH6XRY1AHKgDkP6lXkkMiOJvZz7IcqKY36ZpeCnjHDE2re500aKN+zg6H0
 cH2K3bL9sLRrT0NqV7wOEu3i80s0ucXozBy90EG+5m/3JY0PH8o7kULBLyftHFrF+YcT
 fAbBfkHxWLAbQH9pO95Nu/af+mzvIBwQRMYt+9Q31X9bfMP1pwJ7xNrOeKVmqw3yPhWO
 tgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MEUlKykNlkscVPficLXy7yLulpuF0W+I4OnfCTkKVmk=;
 b=A1mM4XlqbIEN/PATdwqbczxUh9Wa7HBTeObGu/4voKnSPT67fidNQF4jJT8icG1ImC
 T6z91fVECCdlrmKqwSD8if2S+adDLRmXhTCtHVsSabAeo6NbrOf5AX61/FXZx65Mc0Sf
 Y7acV3PAHCOTq/kNQNzRs1wzVwV8LjabkxBVwAq/UxqRF7N27tTdogKK4FSDD+p8OA/8
 pkTL5osPgLRcU96ORhqhGk3UXLJs8Vi/ppeuZ5NyjAm0/v9rjiqnEpB8ayyyVuC3yEqf
 XuBP94FOJcjAdRclBqMBI03e2OBPUFUtWOdbAZCyc6iL7MUsW+Y9EN8Mnu7lUAKYdAj9
 9aiw==
X-Gm-Message-State: AOAM533CTEtllYyFljcTVZM2Qfkab+s4ZxEBinbEOJ1LGpyru1u+Lcq4
 73lcA/B4qj/cNqonEbkWwdpRoqLn3ehuNA==
X-Google-Smtp-Source: ABdhPJxuDwbF0ntOFC3l04LL+vFpQXw5kHwYRwsAsqrd8utUgsDJsRQy0wGQA3ol7Ki9UQ/l3V9H8Q==
X-Received: by 2002:a02:9109:: with SMTP id a9mr15779637jag.93.1623062731675; 
 Mon, 07 Jun 2021 03:45:31 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id c14sm8933303ilq.9.2021.06.07.03.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 03:45:31 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: ltp@lists.linux.it,
	metan@ucw.cz
Date: Mon,  7 Jun 2021 16:15:11 +0530
Message-Id: <20210607104515.29838-3-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607104515.29838-1-vinay.m.engg@gmail.com>
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/7] msgctl04: Skipped EFAULT tests for libc variant.
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

Tested EFAULT cases only for "__NR_msgctl" syscall.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 .../kernel/syscalls/ipc/msgctl/msgctl04.c     | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c b/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c
index 900b22244..3d0c7f896 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c
+++ b/testcases/kernel/syscalls/ipc/msgctl/msgctl04.c
@@ -15,6 +15,7 @@
 #include "tst_test.h"
 #include "tst_safe_sysv_ipc.h"
 #include "libnewipc.h"
+#include "lapi/syscalls.h"
 
 static int msg_id1 = -1;
 static int msg_id2 = -1;
@@ -23,6 +24,16 @@ static int bad_q = -1;
 
 struct msqid_ds q_buf;
 
+static int libc_msgctl(int msqid, int cmd, void *buf)
+{
+	return msgctl(msqid, cmd, buf);
+}
+
+static int sys_msgctl(int msqid, int cmd, void *buf)
+{
+	return tst_syscall(__NR_msgctl, msqid, cmd, buf);
+}
+
 struct tcase {
 	int *msg_id;
 	int cmd;
@@ -45,9 +56,29 @@ struct tcase {
 	{&msg_id3, IPC_RMID, NULL, EPERM},
 };
 
+static struct test_variants
+{
+	int (*msgctl)(int msqid, int cmd, void *buf);
+	char *desc;
+} variants[] = {
+	{ .msgctl = libc_msgctl, .desc = "libc msgctl()"},
+
+#if (__NR_msgctl != __LTP__NR_INVALID_SYSCALL)
+	{ .msgctl = sys_msgctl,  .desc = "__NR_msgctl syscall"},
+#endif
+};
+
 static void verify_msgctl(unsigned int i)
 {
-	TEST(msgctl(*(tc[i].msg_id), tc[i].cmd, tc[i].buf));
+	struct test_variants *tv = &variants[tst_variant];
+
+	if (tc[i].error == EFAULT &&
+		tv->msgctl == libc_msgctl) {
+		tst_res(TCONF, "EFAULT is skipped for libc variant");
+		return;
+	}
+
+	TEST(tv->msgctl(*(tc[i].msg_id), tc[i].cmd, tc[i].buf));
 
 	if (TST_RET != -1) {
 		tst_res(TFAIL, "msgctl() returned %li", TST_RET);
@@ -66,6 +97,8 @@ static void verify_msgctl(unsigned int i)
 
 static void setup(void)
 {
+	struct test_variants *tv = &variants[tst_variant];
+
 	key_t msgkey1, msgkey2;
 	struct passwd *ltpuser;
 
@@ -79,6 +112,8 @@ static void setup(void)
 
 	msg_id1 = SAFE_MSGGET(msgkey1, IPC_CREAT | IPC_EXCL);
 	msg_id2 = SAFE_MSGGET(msgkey2, IPC_CREAT | IPC_EXCL | MSG_RD | MSG_WR);
+
+	tst_res(TINFO, "Testing variant: %s", tv->desc);
 }
 
 static void cleanup(void)
@@ -100,6 +135,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.test = verify_msgctl,
 	.tcnt = ARRAY_SIZE(tc),
+	.test_variants = ARRAY_SIZE(variants),
 	.needs_tmpdir = 1,
 	.needs_root = 1,
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
