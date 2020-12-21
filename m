Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A39B2DF92B
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 07:14:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A00E03C5730
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Dec 2020 07:14:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BF9EB3C2978
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 07:14:21 +0100 (CET)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5756A1A00902
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 07:14:21 +0100 (CET)
Received: by mail-pg1-x533.google.com with SMTP id f17so5736483pge.6
 for <ltp@lists.linux.it>; Sun, 20 Dec 2020 22:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OAEI4bTVywZh7ZB4YnZv+/R0RewjgwxLpVjuHPWt9x0=;
 b=EHLiU6xgWNbtBUvABhB5+hCkWZiORbHXtUH73az1/24kjawRJVWSWv5H7wb3i5UGbE
 3L9nBlqPmz62zzgtIEp/2FY6sJnj3gs8cVe/st+ZhcZC3UjxbYsILgmdUzx2KfA7vG1e
 PFdG1XcbXpYyHUyPpK+HNURM22M+3cuFx8+byTw86g+TZbwlB1ZNuIZXHGW4hIrpKW8P
 jD2YtU72oqETgawAwCqwWNDmeT1gE2wDkL+/OnR3VPwVt1XAyJlqxFL26HDKNaHUZnmP
 5z9/FjWym2gECKpgg3EaSGKPjBBH6ll6G12ufKSyrrjvli0lthu3T43hjOCa+fe0hnK6
 Db0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OAEI4bTVywZh7ZB4YnZv+/R0RewjgwxLpVjuHPWt9x0=;
 b=Di/YJNaSHbt5rYtXWDGFWfJyR6XdlVKF/3qVbDdIuN3NtjHKSGQWSivrJTa+TvCTYA
 Aa+QseO+FTFuR+7/AKcUKp37UidsxA6Q+2uYpD/zHiuRN8k8NFOuE3LGzAqejLUUBSWs
 Q59pFzcQoyW4ipTmxsod9V5rQX7UagBHPTqiJLWFfk/sGCFU48lUt3KZlhYoOhO875GF
 ThY4thNYdQJLBHY1WxwW0t0fOcvXGEE9jxTFX1Wh7aVfa0Yyz92DWBLUC0OYb2lz1BkV
 c5ebNV72dFYd7waoUspzkSGoI45o8ldchXhzu+ReqESzxnARtF0X6fYj2JROk2BoqlC1
 kA4A==
X-Gm-Message-State: AOAM531IpdZNJZZrUyGU43nIYt5hXVRUhSvn4VQjQlhN7DyLz8/4f8pZ
 rRUiUs4OMIdLRZ1kflu/HBQ=
X-Google-Smtp-Source: ABdhPJzAAtYt6qAIQ+lxX2dAIQwZ7C8IHMzfkVNya/8VXqrIf8jaJs9G3o+KfrhdJEdczsvjf0dGeQ==
X-Received: by 2002:a63:e049:: with SMTP id n9mr14048246pgj.339.1608531259856; 
 Sun, 20 Dec 2020 22:14:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d89e])
 by smtp.gmail.com with ESMTPSA id gw21sm13998947pjb.28.2020.12.20.22.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 22:14:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Petr Vorel <pvorel@suse.cz>,
	ltp@lists.linux.it
Date: Sun, 20 Dec 2020 22:14:15 -0800
Message-Id: <20201221061415.2540216-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] ltp-pan: Use long long int to print time_t
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

Some newer 32bit architectures ( e.g. riscv32 ) uses 64bit time_t so
using %ld is not sufficient to print time_t, this also fixes a crash in
ltp-pan on riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 pan/ltp-pan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
index 8b9fbe5594..54b7cb8f26 100644
--- a/pan/ltp-pan.c
+++ b/pan/ltp-pan.c
@@ -1389,8 +1389,8 @@ static void write_test_start(struct tag_pgrp *running, int no_kmsg)
 	if (!strcmp(reporttype, "rts")) {
 
 		printf
-		    ("%s\ntag=%s stime=%ld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
-		     "<<<test_start>>>", running->cmd->name, running->mystime,
+		    ("%s\ntag=%s stime=%lld\ncmdline=\"%s\"\ncontacts=\"%s\"\nanalysis=%s\n%s\n",
+		     "<<<test_start>>>", running->cmd->name, (long long)running->mystime,
 		     running->cmd->cmdline, "", "exit", "<<<test_output>>>");
 	}
 	fflush(stdout);
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
