Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE363A1BF9
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D13933C9E9A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9DE43C8F0D
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:21 +0200 (CEST)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 39E1F600658
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:37:21 +0200 (CEST)
Received: by mail-il1-x136.google.com with SMTP id t6so20255846iln.8
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CwtKwWCUqD11YEXs/hy+1OvZ9KcsIwxebOS2U9sk6eE=;
 b=aw5KNdYiZm9wzKJAvIHLzm12eZZjZ/hEAAyg7p6qHWaoh5iGaXQqC6O2uYeQ8ocya1
 Js92+YPRVxM7xisHgg5Mag3arX5oZdQc1ZdQTfXa9CGvSJ2aUHFg/zizawK7x2SCZiMi
 OlFh6fMqziO8xL4e6AMq0uZaOfgtEtb3A1unTMmaPoD3UpJtmRPD3CsmVIaMjW3lHMhZ
 NylVe/jSM+wF+pecDvfTe0aevrV0Tf6uGFMSU/7HWJAbBoEG/zv9RovYjwxY8JtOP9eO
 K+T3f95wjyLI5wvgI9I3JZPWY6vtsA5pCgmaR4PSu2utBeTJm2+5OjuqgXKEGxdwTMo8
 2wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CwtKwWCUqD11YEXs/hy+1OvZ9KcsIwxebOS2U9sk6eE=;
 b=RQUn+M+j+G6/aK8fcODrE/daMso3EcXbP+i+JIQF/OIUY7MoYJcbUcFnuZz2OkvqTO
 d4Bn7dt1r/6xEYvV1dYhtTlY8ibYPMZaJAgzaW79N8gYQ9ZFSHqXJEhnvsYx+3ht4Nz/
 QUPU8g4pVxQK2QSRrG9Nua1fctPLpFoLIS4h2KVSUGk7EqQY3VQBJlLp25fiT/gzttjl
 oYAi8uuu+Gna7JdD5qApXmRr0NB0MVJQgoU0BM9djGRhuPzHQfXWUOmMvtz3RRZFpvJZ
 b0AsEPKcizPBXZ3MULEATcTFHecGs8OkZ6Gm85FaHDbbsINLrZIW7x9Mt+D94EX8dvC+
 8Clw==
X-Gm-Message-State: AOAM532EdnUHIEvAbtpwt4phumBFuU5hErtT1BFKw41hnCGLr+6Sj+3f
 KD7oXFt2IIQt1m5NsxWEE0BVJkpzsKziug==
X-Google-Smtp-Source: ABdhPJxdl+u4IC6mpyDkaWQZTeV5Q6GRdEwafP5XGuIU+W0u0hHiGg3NV0wpxISlFpG0a2Aa3JV+BA==
X-Received: by 2002:a92:6b02:: with SMTP id g2mr613994ilc.23.1623260239884;
 Wed, 09 Jun 2021 10:37:19 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.54])
 by smtp.gmail.com with ESMTPSA id k12sm327817ilu.77.2021.06.09.10.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:37:19 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed,  9 Jun 2021 23:06:01 +0530
Message-Id: <20210609173601.29352-10-vinay.m.engg@gmail.com>
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
Subject: [LTP] [PATCH v2 10/10] shmctl02 :Skipped EFAULT tests for libc
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

Tested EFAULT cases only for "__NR_shmctl" syscall.

Tests for bad addresses in LTP cases trigger segment
fault in libc on a 32bit system.

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
