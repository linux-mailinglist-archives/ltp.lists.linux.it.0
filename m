Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5EE3DF8FC
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 02:42:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 997C93C87F0
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 02:42:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 96E2C3C2DBE
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 02:42:21 +0200 (CEST)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B900C60057C
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 02:42:20 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id cf5so1368025edb.2
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 17:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vyZSv6aovCCmaOdXJQVMQu51nRE7tvij8ZWBjVu/Id8=;
 b=ipGgmLLBxoTXPXrky+ZxqqG1SVBuF7y8LXozFG4Ga56Oehb7Jx/lrRg3K3TKybWYTE
 PuXIrv7hQK8AlyhuGWMzc5Rz5atUofwyOJoltwtFdHHFeGBZJ60qESbYp6M4JG79cApG
 WRYSCQwE0VBzVHWOhUyRnxVCPTh4LNr/u640YOMwT3SmqhB/7IxcvJiTTR+SeeonPA9o
 2uFl1lYABLEO9JX46y2jNiScrHJdLKCZoIKr4ttjJ2IdB2HpbEktANV6VudBV0Gq39Er
 nPuNBnXIn1WFjCy1gCsLBP1gFM5mTMdFq/fJhTpFPiSTvkEMxfSyLn+VjIUr+VIKPINq
 raWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vyZSv6aovCCmaOdXJQVMQu51nRE7tvij8ZWBjVu/Id8=;
 b=eFbW2stEW0FPiLnubX1UtNxhlJKaJ2t8zVlrGEvEM6AoTb5+Nyl2dpPz/0Bs9bfn7q
 fixQ5GgmFlQBcPcYAbfXvhOlrL0++tne2UmB2M7hcXGTSjh+Bifa4FhoAlk3jPf476P4
 vLvdphGs4RX11JhIPP3ksAKe/tkaTXH1i+4h5EQBmI0T3X7b6mSOzXhaIiSVi0ScgXou
 29ieSIK3hyeP144l4TNssA+2G0jts+B4nGtc70uQwbuY6MGveUvUKOTmwS5FKEbMHWwt
 bjYKmCgmfCisBeyuxc64HEItNL4IJdJpjiux5mL9+EwuEaBefTlGfBsCb58J7So4nQZp
 wMiw==
X-Gm-Message-State: AOAM531oG5QB/wwQABE7mxRzagtEIa4S9HGP20KgBZXy+ZpTdMm65QqQ
 BInhE3CqiWhKdeaDFAcpdkfPOjZGmwRzRJIK
X-Google-Smtp-Source: ABdhPJy4q6GdExdwq2uS3tPTpGQ4Yj17BkpkqhOvx9GAlPQFUXq7Zlc2QrfCpLf3iKEF27tUvZkeyQ==
X-Received: by 2002:a05:6402:603:: with SMTP id
 n3mr27689273edv.61.1628037740159; 
 Tue, 03 Aug 2021 17:42:20 -0700 (PDT)
Received: from localhost.localdomain (us.sesame.canonical.com. [91.189.91.16])
 by smtp.gmail.com with ESMTPSA id
 m20sm251035edv.67.2021.08.03.17.42.18 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 17:42:19 -0700 (PDT)
From: Ian May <ian.s.may@gmail.com>
X-Google-Original-From: Ian May <ian.may@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  4 Aug 2021 00:42:16 +0000
Message-Id: <20210804004216.2754304-1-ian.may@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/shmget03: Stat and skip existing shared
 segments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Ian May <ian.s.may@gmail.com>

Run a SHM_STAT prior to the creation of the shared memory segment.
This allows for not failing unexpectedly and still exhausting the
proper max shared segments.

Signed-off-by: Ian May <ian.s.may@gmail.com>
---
 testcases/kernel/syscalls/ipc/shmget/shmget03.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget03.c b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
index efbc465e1..fe91b6191 100644
--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -34,6 +34,7 @@ static void verify_shmget(void)
 static void setup(void)
 {
 	int res, num;
+	struct shmid_ds buf;
 
 	shmkey = GETIPCKEY();
 
@@ -41,6 +42,8 @@ static void setup(void)
 
 	queues = SAFE_MALLOC(maxshms * sizeof(int));
 	for (num = 0; num < maxshms; num++) {
+		if(shmctl(num, SHM_STAT, &buf) != -1)
+			continue;
 		res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | IPC_EXCL | SHM_RW);
 		if (res == -1)
 			tst_brk(TBROK | TERRNO, "shmget failed unexpectedly");
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
