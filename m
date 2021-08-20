Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF11B3F29B7
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 568313C262C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F35113C194A
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:09 +0200 (CEST)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 61BAA200CFD
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:08 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE30A40622
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629453667;
 bh=BiSLbHu9TUOazRksX96RYnMb2Wen+oafxoAuC8/f6G8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=SIBJSGxUGvwKsRq0U6TPYClkEEGsGDP9YJPqAzc0qwIMQ+enrhPbJ0wCyfVJEyMS9
 59rcn60J9GDONbyIOgxfWwxjgZYk6RxmjYg0QorLrAnvPliDeVeQcr27/cYu+8/a6I
 QlucbETg3K4kMtRzPeBR1d2/F2rEp3hlG0gtfnTa5m7rRiPteMqQ2PsL097Uj8eEJw
 lJrHQYjXSpwMg+OcBP01w9XN02BV8E8wJb5nLLINRDuTPuVKyswdQnZoW632InlIme
 dq88LPCC7H2wLstbLntDtWxmFmubUYNomUgHRKXrnQDeTD0/6clNS4iH//OR7jcG9m
 luHKYRINNfJVA==
Received: by mail-ed1-f70.google.com with SMTP id
 a23-20020a50ff170000b02903b85a16b672so4293557edu.1
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 03:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiSLbHu9TUOazRksX96RYnMb2Wen+oafxoAuC8/f6G8=;
 b=fpv2ujMeeghsYPYfMD31nuVOHhJ0qKHmhhPcF4RunJulJX68tOt2T5KPmBtVtm465C
 9fOlt89kGTmIUykcv+qcZq6Wa1zQVhMC7T86OnuRg9UMqSfu8tUzMBgJK/ezaodf3C+W
 DUUMrZUjLocv8BkkYkuFJVJI2gXQE+MxpesfHQvoC568UehO5e8zB5Z0XZ4trR0V2oMJ
 g8z8pdQ6WEf4YjqzkIfk8jVM2h8sVMGJWGT8IyhvQjylvu/iQ1d7/TzaG8G+CJqcMJ6G
 9HQGlbiOwS0kle0Dmfdh5DbYKd85v/wgIhy8qft4VLg/DK+aZr48w+u4HQmmab3Wa1s6
 E0gw==
X-Gm-Message-State: AOAM5339fSeBSZwHCbW4vvdezP4+Cl12+MeMCOLcyiVjg4B0WM4s1eCD
 eCYRl4KlQbailPc5WTMyyclINUYCPhlTHLfcbhpKiExFchlbgXlXWs3hMgxQCs4xE7nucI/yVFZ
 MoFCaZPLIVK/a68LITcMDkB5WaQIy
X-Received: by 2002:a17:906:481b:: with SMTP id
 w27mr20652847ejq.151.1629453667493; 
 Fri, 20 Aug 2021 03:01:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE54g7QE7/X3ENaudqFlUwpUn2rohmG+np8Nq5iQeLm02IotKETWkOanWdZ9eUqLjK+ABjgA==
X-Received: by 2002:a17:906:481b:: with SMTP id
 w27mr20652828ejq.151.1629453667363; 
 Fri, 20 Aug 2021 03:01:07 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm3280162edv.78.2021.08.20.03.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:01:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 20 Aug 2021 12:00:26 +0200
Message-Id: <20210820100028.97487-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
References: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/3] lib/tst_pid: simplify error handling by
 callers of tst_get_free_pids()
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

Handle errors of getting free pids directly in the library instead of
tst_get_free_pids() caller.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 lib/tst_pid.c                                         | 9 ++++++---
 testcases/kernel/syscalls/ipc/msgstress/msgstress04.c | 6 ------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/lib/tst_pid.c b/lib/tst_pid.c
index c408172675a7..23753988ca57 100644
--- a/lib/tst_pid.c
+++ b/lib/tst_pid.c
@@ -107,15 +107,14 @@ int tst_get_free_pids_(void (*cleanup_fn) (void))
 
 	f = popen("ps -eT | wc -l", "r");
 	if (!f) {
-		tst_resm(TBROK, "Could not run 'ps' to calculate used " "pids");
+		tst_brkm(TBROK, cleanup_fn, "Could not run 'ps' to calculate used pids");
 		return -1;
 	}
 	rc = fscanf(f, "%i", &used_pids);
 	pclose(f);
 
 	if (rc != 1 || used_pids < 0) {
-		tst_resm(TBROK, "Could not read output of 'ps' to "
-			 "calculate used pids");
+		tst_brkm(TBROK, cleanup_fn, "Could not read output of 'ps' to calculate used pids");
 		return -1;
 	}
 
@@ -128,5 +127,9 @@ int tst_get_free_pids_(void (*cleanup_fn) (void))
 	/* max_pids contains the maximum PID + 1,
 	 * used_pids contains used PIDs + 1,
 	 * so this additional '1' is eliminated by the substraction */
+	if (used_pids >= max_pids) {
+		tst_brkm(TBROK, cleanup_fn, "No free pids");
+		return 0;
+	}
 	return max_pids - used_pids;
 }
diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
index f1c124990cb1..b9ebf9035c6d 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress04.c
@@ -413,12 +413,6 @@ void setup(void)
 	tst_resm(TINFO, "Found %d available message queues", MSGMNI);
 
 	free_pids = tst_get_free_pids(cleanup);
-	if (free_pids < 0) {
-		tst_brkm(TBROK, cleanup, "Can't obtain free_pid count");
-	} else if (!free_pids) {
-		tst_brkm(TBROK, cleanup, "No free pids");
-	}
-
 	/* We don't use more than a half of available pids.
 	 * For each child we fork up to 2*maxnkids grandchildren. */
 	maxnprocs = (free_pids / 2) / (1 + 2 * maxnkids);
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
