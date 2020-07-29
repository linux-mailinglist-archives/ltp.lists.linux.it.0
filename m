Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A151323217C
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:27:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D5C03C2682
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jul 2020 17:27:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 150503C20B6
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:26:57 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD293201615
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 17:26:55 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id u185so13113440pfu.1
 for <ltp@lists.linux.it>; Wed, 29 Jul 2020 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=KUoeeiFRIObgCkxNLS+PckU7p63xf159OHAWBW1sVoA=;
 b=Mlo3/NMfzWCDNch9mYOwIY/O9yyTbWkAxI4XVaUaShSfwc3VnnEX9ifC/ky0pRdW9Y
 yJXHlmtiwBuzpsCS3u5gwYhRyeFKvc3quErJEV0HnIzr8InI8ChlyWQoE7JWaAjXh2is
 kZIHeA1GDVt2yGU+VqvpDEJBv4DyG+T59l+M0LA68WSzl3760e2carRUO1Lr2ZRntaq6
 gUh8oOcKuh25klmoWBCptUk8QdC1SETGvdfVq5QYmgSrrSh5bFAbj1K7uazWOkYxzInH
 Y4B/TA5AuMWWKIslpEVgVov3T0kr91EqbjtqqdncYcp57B02+0GnbZROSxBSm4P+ORV3
 5w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KUoeeiFRIObgCkxNLS+PckU7p63xf159OHAWBW1sVoA=;
 b=YrqhzmlwRbZqjZEOuGLUGzYE3pwPJqIHEaBNv9y2kmdYE6feDFdAQh12Tmv0TfSbEe
 laEzTjTmugzJ9XRjc15clNM6ZqX7kj1nJqeszL6LgPexYHfewtJYXUnUT0AZjArtgkbF
 +hOQn+y24fFrijPjbIE6JRy8H931keH3/OqJSPQteAdCxE2xbCSufH7GBuFdiFhbjB1L
 9OwCifCd8EhmFNXCOPg+MhnZo71YPTH0CUxbFdFVejQ00K/zy/QJ9AeUAKfDY7Gs3Dkp
 YCysnJCE2riVKK8XCRpevB7QHkz6kgyfKgf8ag4wqlbdYks0r0sy9xarliY48cWb6zao
 BlMQ==
X-Gm-Message-State: AOAM533eULqDT5Mz/Q8tL7LfDZpBCtX3AOrZs32yVs8/y84gIfOlji+I
 LGVd/UFUumg7rwVytavghFtY5dVvHio=
X-Google-Smtp-Source: ABdhPJzCVj7saEjP89wdJjGYYPw9BBThpGgNXZcNmiTHcM2RGYo9NahwxtFuzsvs+bEz5AMNWFc7mA==
X-Received: by 2002:a63:f50b:: with SMTP id w11mr29427526pgh.157.1596036412708; 
 Wed, 29 Jul 2020 08:26:52 -0700 (PDT)
Received: from localhost ([106.215.77.228])
 by smtp.gmail.com with ESMTPSA id y19sm2729620pfn.77.2020.07.29.08.26.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 08:26:52 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 29 Jul 2020 20:56:47 +0530
Message-Id: <b78d4e9530a47fd8cb2693e0b27f7e7ffd6177a8.1596036365.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V8 1/2] syscalls: select: Use struct
 __kernel_old_timespec for pselect6()
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The kernel expects struct __kernel_old_timespec for __NR_pselect6
syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/select/select_var.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/select/select_var.h b/testcases/kernel/syscalls/select/select_var.h
index b19a1d1bf085..857e5d164582 100644
--- a/testcases/kernel/syscalls/select/select_var.h
+++ b/testcases/kernel/syscalls/select/select_var.h
@@ -38,7 +38,7 @@ static int do_select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *except
 	}
 	case 2: {
 		int ret;
-		struct timespec ts = {
+		struct __kernel_old_timespec ts = {
 			.tv_sec = timeout->tv_sec,
 			.tv_nsec = timeout->tv_usec * 1000,
 		};
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
