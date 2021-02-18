Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE0F31E86D
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 11:19:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22B7E3C6604
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 11:19:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B9FD03C66F9
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 05:46:09 +0100 (CET)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 668F5600634
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 05:46:09 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id k22so563275pll.6
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 20:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=8Sto7abP5+y2AOh5dX/OWBZdAQ1ZK9SILxRQHmk2I0Y=;
 b=kaIYx3YZjk4Iv+hxDeUwGuKnpSsWjACHEn1muJsI0D9zdcMu9TldiXMSsXwU6y6fKc
 S8zotgTxnLTv8igUDmGw5sSPwKnGo5yYrtAjuo3Z25jLTKrwr6mXK2s89g5USSWQb+ob
 6zIeLSEIpxdEeOGLHHEsl/inBb8jBctNlBXHkzsGILd1lwCTECwk5Ii9ZZfi0yjcElto
 e8cxBmvd/noB+9cF6QMVrTNTXycVcAw+XZa2DVO35WcB7dfdIx3qn6dLF+B/MUaNx0Uy
 IOZ3IzKLv7HC82zUarnNxLIQwxPOyAQSbZNfqkHTY4s+abqAYaYqYKjpXIPlNwJuvowp
 e5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=8Sto7abP5+y2AOh5dX/OWBZdAQ1ZK9SILxRQHmk2I0Y=;
 b=gtip19hMDpHcD/4ZOHZhwoWypKm61ANAksNxGdEC7eaRQzW3eXFQAIbqO241ZN44bG
 WPAgY4XfaLlKw91ReUFZhHhNYTKPzIU4h1/fcp03Ddw0gWCeYDSKW1oBFSLUQJfthxRm
 hNzuYYoYDRIVY0Zxs5x3v00KCKf8aEWBY3vtFDxwwxz0BEjyh/EQpBMJOEnuJ06wH+LV
 uWM7CF/l0z5jM6xbusgt+RLqry/dIudJHOGB0tyb9emY4unOHR7461qohkrKyjCGa4Ur
 DK7r0GcBui/s3JOvQ/I+MB7t+Bin6+ZNgYjtEoTNa7/fDT0F1YBTSy1+NB73LjaKlI5r
 p6KQ==
X-Gm-Message-State: AOAM531DE347Ukuad3caWmoDNmzDbzQOHLCrGigmr+5m5rfmCUMTUDaF
 KYh+whwUItOG0/awdo8g9sFCsA==
X-Google-Smtp-Source: ABdhPJz9A5trgR57Jxi3XNT8oH5EMLQTPqMSMsY6BB66L5ihYzJA7d85lOwBNQ2WAW/bKMbY8PyVZQ==
X-Received: by 2002:a17:90a:174d:: with SMTP id
 13mr2293215pjm.181.1613623567704; 
 Wed, 17 Feb 2021 20:46:07 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x1sm4488481pgj.37.2021.02.17.20.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 20:46:07 -0800 (PST)
Date: Wed, 17 Feb 2021 20:45:53 -0800
Message-Id: <20210218044553.2514218-2-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
In-Reply-To: <20210218044553.2514218-1-palmerdabbelt@google.com>
References: <20210218044553.2514218-1-palmerdabbelt@google.com>
MIME-Version: 1.0
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 18 Feb 2021 11:19:39 +0100
Subject: [LTP] [PATCH 2/2] fsstress: Indicate one of sync_f's arguments is
 unused
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
From: Palmer Dabbelt via ltp <ltp@lists.linux.it>
Reply-To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This argument is necessary to make sync_f's prototype match opfnc_t for
the op table, but is otherwise unused and triggers an unused argument
warning.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 testcases/kernel/fs/fsstress/fsstress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/fs/fsstress/fsstress.c b/testcases/kernel/fs/fsstress/fsstress.c
index b53a99180..42ee696a5 100644
--- a/testcases/kernel/fs/fsstress/fsstress.c
+++ b/testcases/kernel/fs/fsstress/fsstress.c
@@ -2501,7 +2501,7 @@ void symlink_f(int opno, long r)
 }
 
 /* ARGSUSED */
-void sync_f(int opno, long r)
+void sync_f(int opno, long r __attribute__((unused)))
 {
 	sync();
 	if (verbose)
-- 
2.30.0.478.g8a0d178c01-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
