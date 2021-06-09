Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 373743A1BF6
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 889493C9EFB
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC5763C9054
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:11 +0200 (CEST)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3BCE2601C77
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:11 +0200 (CEST)
Received: by mail-io1-xd2f.google.com with SMTP id q7so23685251iob.4
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ns3pUmfMBO2wfAgIH1RxzoFRBgU2tKR8HPaXo9Ic4OM=;
 b=vhKgGKiB0fRfHGU2NsANCXH4p5vSzAUPItv2+v5V1Yy+ExDaxei4wgt029JI6WhnXK
 QJBs7Vz7OLN5YW2l+L/8WJ64mTtp0X45mYvd3wlNOKb4qfaTomWska+99GXExXvs5jMh
 RviKNgI8L4R36G/9xIETQ4Vrg2hgbXWQ4Aw39WIru4fMiamqtGntBbKOX0rX6V0LH2Wj
 pA09s66Xg27ibxlu4qEX3cj8XuFjaqsKRg8R5wPlNNGTDuX4PJPmnXkEx23Kj683bJP0
 N+m6dncsXj+Fa7JNm2Q0aa16jrGmtEWpS6XECMKHlNoJN8unAQRrxkppo/gc/Gt/Ys+3
 BxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ns3pUmfMBO2wfAgIH1RxzoFRBgU2tKR8HPaXo9Ic4OM=;
 b=TzMinBE4qMCdHjuPKxAAqzTOASa+4Cf1XmD5pwz8alnHWOp6voBZkbqLPA5o+LdGfG
 y8yuVamurKBToh3xwLsJziImgSYEB1QAYHtKFT83rZaB/bi50NuzN0cFrbm3l8iafoep
 lyS+56fKnwM0itcoR8OX5AolAkq+0N62UFh+eQXzcxBrhvhw2w1swJV6koIQypOGDQGX
 iFzbkq9ViMURIk/v2PrAE8l/koc5AVHQZlPeG57HTPtRIyHD0oqlVATWxmgGgVOn8uj3
 acJc4U3Fm0YnAkKp0BqBMQPlR5Tvlr0JYMlBxmFxugkaImL9LV0d05JwX4InECLsQjWG
 2SKQ==
X-Gm-Message-State: AOAM531eaQ2dLAAjl7Luo8NGidlpRoi0MoOoaLvixlnG7si8uS0RiFbq
 T8dmQ1XlPnLpseojbvqaKIo=
X-Google-Smtp-Source: ABdhPJyW5FFxHMCR2KNJKXdTsVC7a7VRyFW7/RzukCbjvyov2G47xSAxoJH+kxyhGiKuUXy22x+chA==
X-Received: by 2002:a6b:7d4b:: with SMTP id d11mr426705ioq.161.1623260229986; 
 Wed, 09 Jun 2021 10:37:09 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:37:09 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:05:58 +0530
Message-Id: <20210609173601.29352-7-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-1-vinay.m.engg@gmail.com>
References: <YL/Wf51Y6V5lRnkM@pevik>
 <20210609173601.29352-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 07/10] msgctl04: Skipped EFAULT tests for libc
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

Tested EFAULT cases only for "__NR_msgctl" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

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
