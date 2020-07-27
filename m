Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF722F598
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F3A33C4CA2
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Jul 2020 18:44:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 376FE3C0131
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:02 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F73B600428
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 18:44:01 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id il6so4026855pjb.0
 for <ltp@lists.linux.it>; Mon, 27 Jul 2020 09:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=obuFqbmaAQHALIy5dbWZ/CcmWyqD9bG37G+kzQvCOeM=;
 b=cqunoRNDpfrZGL95FjVnYXsDe+dYwjGtiipeo3Wzj9iXzrHiGtrzBDlC+YvTsouF2e
 7M0whkSzqS1JhfhEb0RzB9pGRfU61ZujbWjEo6UEx5mNMHNES70jl9JmRMbYd8uKyxd3
 kiYflILX3cRFabjJ6ebHwKdl4KU9rbWQk/4hfaTQ+7K3fUgZ1hevKfzTxZ7yvnQdl70P
 JvsGClXdv0COVgUuYVpdKOwZbQxXjXmnozkRv4mjw3t82eb66BJ94OXliokYNl7OZG6K
 05bGHiwPRsREDZ512D/Eo1q/tLOCk3LOJm4kxM4G9XO3cQMK08re//obZijL8x04Dpui
 wVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=obuFqbmaAQHALIy5dbWZ/CcmWyqD9bG37G+kzQvCOeM=;
 b=gvBHIvpFDLSb3SA3Mxn+k1bSQ5PYfPULv3VMzd7qWZYevwIIfoHaI+MDpXH4Gp86gg
 kLEfRbuVRxqyXBVWqORdAkwH4B1TRujxlPCP0E6QogRPctUXHn+gJnPLKE3bnnsQjcsB
 qH92c/KsJ+v+LbhR+By9n9rbdM8O7Q90MO87kAId+Ho9MY2VqYA4eEpj9rOHSWLb2A3a
 ipoNwotOf74r3LRH6nC9U4pcGaUSUsL+e+ETq6/mRDZrpVuh9vmGPWm330UyQqt+Qm7R
 6dqXnXTaLUzpPDTrCpHTJyn4CPBoujLwM6u9ViY+eKkVhLyCYiOBTtVIxowkYjtfSOPA
 X4xQ==
X-Gm-Message-State: AOAM530MXKewMLCcS1mZmDInkttxCMkitLYQiGNl5PHRDyZKM1l3EWMD
 sFYzi6vUP2GzmRHex2FtZEQqBT9q
X-Google-Smtp-Source: ABdhPJyfUjLHW8bbefUIf0ItwVSnDi8eHv5PafsQBXtPIz26j0jqVMby3drjNRy9MOQxjvs0YjEHxg==
X-Received: by 2002:a17:902:bb94:: with SMTP id
 m20mr8135757pls.190.1595868239837; 
 Mon, 27 Jul 2020 09:43:59 -0700 (PDT)
Received: from aidengao.c.googlers.com.com
 (15.4.198.104.bc.googleusercontent.com. [104.198.4.15])
 by smtp.gmail.com with ESMTPSA id g10sm109562pjs.20.2020.07.27.09.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 09:43:59 -0700 (PDT)
From: aidengao <aiden.gaoyuan@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 27 Jul 2020 16:43:55 +0000
Message-Id: <20200727164355.1177602-1-aiden.gaoyuan@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] hotplug/memory_hotplug: Remove unused goto label
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: aidengao <aidengao@google.com>

Remove unused goto label in parse_command_line_args function

Signed-off-by: Yuan Gao <aiden.gaoyuan@gmail.com>
---
 testcases/kernel/hotplug/memory_hotplug/memtoy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/hotplug/memory_hotplug/memtoy.c b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
index 8ac9600de..90bfd7f2f 100644
--- a/testcases/kernel/hotplug/memory_hotplug/memtoy.c
+++ b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
@@ -447,7 +447,7 @@ int parse_command_line_args(int argc, char *argv[])
 			break;
 		}
 	}
-done:
+
 
 	return (error);
 }
-- 
2.28.0.rc0.142.g3c755180ce-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
