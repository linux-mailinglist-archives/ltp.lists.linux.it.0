Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3391D86E1
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 20:30:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E91033C4F2C
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 20:30:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6684D3C042E
 for <ltp@lists.linux.it>; Mon, 18 May 2020 20:30:04 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 84B1C60109E
 for <ltp@lists.linux.it>; Mon, 18 May 2020 20:29:41 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id l18so13025310wrn.6
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7s2WyxtDu8hGpu5dRNVLEYsqXqP9r7+v9akkAFK1YQY=;
 b=gtFcM9pWy5fLbReQu4OHmNtx6ASfz5zF3pB1JYVXVZ6R965fENaUlYF2RgmS1MJTOZ
 CDNp6wkcnSIqmV01vBy3/b01gZEFXiEEXWPad0gA6JNxukURkv/0egD3gEy88gflev+q
 gEVL32iDmBDr3bC6rtHBzijuxMBcKah2zNFcoFa9A5lvk5pMkbJ40BEBg68km0SHlONZ
 mJI+aE2qxxZQ1m9iacR+ZVFwGXEepVhtJH1WFP31TdHgjzKPDTPhjv8dLFRFUnyLOw+2
 7ytVHrl3zMjFxtG8I+M3ThgeloWN1wg716bfwEEJ3jQ8EEeenYRX4Ms/X5U3DdfISYkw
 SZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7s2WyxtDu8hGpu5dRNVLEYsqXqP9r7+v9akkAFK1YQY=;
 b=dEEBHbs9n7wY0ZzFR5umIryMjHNJN7z45KYco0hi3FDs6Gwe7hJVwREA4Nksce/mlY
 K+rAllMURGTLjiq7djZSX8U9I6uX+SsTDHFkm0OjhCSx1W6OkvQoLJ6fR7exL/pKXAVi
 HFtN2aqrZqjXO/g5HwHFq4tgndLS2mtVZd2PPAHNnwohnFHUrsm9HiechUeFdTwIDUNo
 9jfDHqR/Z0vwF8BvPsYRgf0xLtMPujHHiBWcPk7qj9LPwYkB4IxiByZSbLzzVsAxk/43
 kMqepl31eh5Vnej6GnGVOrXC9eDaJ+5isDJz4Ea9n61LDc/DbLbbo7oH8lVmATQI7UmT
 1xpg==
X-Gm-Message-State: AOAM530IwefB/Gbk8e/5lFYcWcqczJnVhBX81xV7kCydQXyGB6TRm21d
 Y+/9ttmK/T5wc/dknCjpmJn5oLRmxUs=
X-Google-Smtp-Source: ABdhPJwZlAgAzw6A4ehTRnAi4xjkskmvJvIOYibR+mcBWGO1txbW6qXkAT+Xi7TX7C+876Gg2GyhVQ==
X-Received: by 2002:adf:f041:: with SMTP id t1mr21398435wro.346.1589826603897; 
 Mon, 18 May 2020 11:30:03 -0700 (PDT)
Received: from dell5510.arch.suse.de ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id c25sm437292wmb.44.2020.05.18.11.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 11:30:03 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 20:29:52 +0200
Message-Id: <20200518182952.23520-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] ebizzy: guard mallocopt() with
 __GLIBC__
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

From: Khem Raj <raj.khem@gmail.com>

mallocopt is not available on non glibc implementations

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/benchmark/ebizzy-0.3/ebizzy.c b/utils/benchmark/ebizzy-0.3/ebizzy.c
index 5bb8eff56..934d951f3 100644
--- a/utils/benchmark/ebizzy-0.3/ebizzy.c
+++ b/utils/benchmark/ebizzy-0.3/ebizzy.c
@@ -215,10 +215,10 @@ static void read_options(int argc, char *argv[])
 			"\"never mmap\" option specified\n");
 		usage();
 	}
-
+#ifdef __GLIBC__
 	if (never_mmap)
 		mallopt(M_MMAP_MAX, 0);
-
+#endif
 	if (chunk_size < record_size) {
 		fprintf(stderr, "Chunk size %u smaller than record size %u\n",
 			chunk_size, record_size);
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
