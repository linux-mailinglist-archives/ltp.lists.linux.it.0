Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1B3A59E8
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:49:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E5673C4D3F
	for <lists+linux-ltp@lfdr.de>; Sun, 13 Jun 2021 19:49:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E3FE3C2F28
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:49:57 +0200 (CEST)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6E83A1A00614
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 19:49:57 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id k5so27378323iow.12
 for <ltp@lists.linux.it>; Sun, 13 Jun 2021 10:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qrOwXwlBWFGyUQMsDEy4eIPmdT/Cp8C5S2RkNZPz3pU=;
 b=KMZcN9gsw0NpP8F06TSHKyO9d7lKqAoyFrG7RLmjAGhv5Gfd6yX9vzrC+09jJs5w/h
 FNsnjdlEecc+kSLimX5vji3HF8FXWCeD7Olg7lxndqX+o8wNfoumhfypiWcdS/e8XTRG
 Bdgw5KI4b6RIUcy3P18TkiUtjVmKOc6CeO1Qi6rI54On1msvymvsVfiNR7mKl61envWz
 /sNZBS6zVjaBcjRwG+OWwQFCT/HbcMsBBqqzXYR6YpABshPHGfeaPaxJVM1yKx2s3wK7
 twHJ3f0oIsWStyobZoHe+PGK0/xay3aB9gnOLCCa0r+W2FUMjI0sT/DShhOi1eXvpIzG
 t5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qrOwXwlBWFGyUQMsDEy4eIPmdT/Cp8C5S2RkNZPz3pU=;
 b=VitgAIcJcor/5k0k6kDWJrR8bJZz/PdA3UmmB9Ezbu0OqJWvJjCjY/brkeF+IBqVeS
 dqA9BDBn7befL89LwNXUBIkcEy/ksu+ubK74Bk17SUyHodvm5HvBrqE8aIpx6GS8FwFS
 IhBFTIMVk93J/4dsviBJ6XT0+MPEfv+TSy8AATqwIwIn+xk2s5S5C0PWyrjp6mMqfXDG
 eipBAfUchAv0rVpil5CPueQP6HRex8KqmcibXK35gasULTEcB4/NqDi2az59f+VUuSsA
 zf5z5hzoK0HnjrfmaL3wHqpdOJtTM1IsXsmFEiSHiKO49XPQ42btR/lFMKLRyUtiulEu
 +9kg==
X-Gm-Message-State: AOAM531UKD4twD5yfjp0eXijokVczn7RBsMQOFCaXha+w8eNH03qjWgj
 DdvEReqP+nzLiS4R35qteIM=
X-Google-Smtp-Source: ABdhPJzBpYekraaNxidY4IPCBRgHiJSBIowN/mYRme8aoLeKN1A9aRiTVZb05CQmhfvj1BJJ7N3YSg==
X-Received: by 2002:a6b:dc0c:: with SMTP id s12mr11408711ioc.11.1623606596328; 
 Sun, 13 Jun 2021 10:49:56 -0700 (PDT)
Received: from vinay-Latitude-3400.wrs.com ([220.158.157.78])
 by smtp.gmail.com with ESMTPSA id e13sm6404233ilr.68.2021.06.13.10.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 10:49:55 -0700 (PDT)
From: Vinay Kumar <vinay.m.engg@gmail.com>
To: chrubis@suse.cz,
	ltp@lists.linux.it
Date: Sun, 13 Jun 2021 23:19:46 +0530
Message-Id: <20210613174946.9804-1-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609173601.29352-10-vinay.m.engg@gmail.com>
References: <20210609173601.29352-10-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] ipc/shmctl02: Make use of TST_EXP_FAIL()
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

In order to simplify the code a bit.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 testcases/kernel/syscalls/ipc/shmctl/shmctl02.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
index b9a71722d..9841d3a86 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
@@ -96,21 +96,8 @@ static void verify_shmctl(unsigned int i)
 		return;
 	}
 
-	TEST(tv->shmctl(*(tc[i].shm_id), tc[i].cmd, tc[i].buf));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "shmctl() returned %li", TST_RET);
-		return;
-	}
-
-	if (TST_ERR == tc[i].error) {
-		tst_res(TPASS | TTERRNO, "shmctl(%i, %i, %p)",
-				*tc[i].shm_id, tc[i].cmd, tc[i].buf);
-		return;
-	}
-
-	tst_res(TFAIL | TTERRNO, "shmctl(%i, %i, %p) expected %s",
-		*tc[i].shm_id, tc[i].cmd, tc[i].buf, tst_strerrno(tc[i].error));
+	TST_EXP_FAIL(tv->shmctl(*(tc[i].shm_id), tc[i].cmd, tc[i].buf),
+		tc[i].error, "shmctl(%i, %i, %p)", *(tc[i].shm_id), tc[i].cmd, tc[i].buf);
 }
 
 static void setup(void)
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
