Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3439C3F9636
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 10:34:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E958F3C93AE
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Aug 2021 10:34:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 58FDD3C2D6A
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 10:34:49 +0200 (CEST)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D150310011A4
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 10:34:48 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id m4so10057444ljq.8
 for <ltp@lists.linux.it>; Fri, 27 Aug 2021 01:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQzXal7Y6wMQfn8JdXoLaXOyaNsPR6LCg0GjAvu8iQY=;
 b=ibUBevMPT+tfAnuGta6pTgL6fPvCq5dHSzc+xMGRIzXO2c09JR0bAmcnIE01bV3zs0
 qXgnPUbEsbeGwYTWe4wmMi+I64WZleE2/Wz8HkLe1+it1NQaa6k9d+V8n45V15RYU2PW
 ownqn1M0RxAdv6Vb3XVIDL2dMK970mPZV8D4nb83Gz6pibmjcjPE773tDBJhBXLF89j2
 bOZ30MeVVcO8vqP9+7yrYTR6AuBr+ThmEENsTd0XwrCaf+7odnAlRZp9LF71sucIwpiY
 nyjMcuLgOrb525/0CsxlBy5JjqA/JLmz/jUQVgojSPlcll8PgnTuxg/Xcya6s56UjGj7
 qWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lQzXal7Y6wMQfn8JdXoLaXOyaNsPR6LCg0GjAvu8iQY=;
 b=lgR8AwV0jFT6BBc0NXqtP77gfbwb8dRyp3RkDGmidpl584UGi94pM61Cjmc+9TNZ6D
 DiDOeRnLfmXWGjXsyBbPHgS0tsVqeBgehQ7SW7c9DGBnT1eipo8te9H1em7w1rcCyZNL
 CD3bJuFph3z8IeEyget08Nwk5eZgFaNmb/fpYtXQ7f0S1Xk2FYfSquY7pJXFqCrmqGfy
 S5WaMaOwTCFCesT9NdMxSvG7SCfnMxB9OtDBvYD3YSm8DHIL0PTPSqv2sIzVvVOt5AkB
 vijs9e5hXCCtwaRNsuHc1UWyBUA2BdZM53GF6P8PCmS5dtf7SFkB+dBegzULj8yr/3Io
 hKug==
X-Gm-Message-State: AOAM533kOnvmpL+eSMSmkQ3ti4pWi6fQnJGXTPxIX35/UGdhM1IQy0Tz
 dEX8gY6Rk+aLCXrRySA4h0mdhikKG9Gc
X-Google-Smtp-Source: ABdhPJx7g0kDaGBG7ajUfoItR4w04YkEUcrv8UqsOO+AatX6aP7d7HLlTKvrVmmP5ylsE0U6CI0kEw==
X-Received: by 2002:a2e:99da:: with SMTP id l26mr6894108ljj.339.1630053287915; 
 Fri, 27 Aug 2021 01:34:47 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.8])
 by smtp.gmail.com with ESMTPSA id m14sm530519lfo.196.2021.08.27.01.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 01:34:47 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri, 27 Aug 2021 11:34:17 +0300
Message-Id: <20210827083417.67579-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] network/netstress: fix stdout/stderr log file flags
 and mode
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

* fix access mode for stdout/stderr

* add a write bit to the mode so that the next time the server
  starts, it doesn't fail with EACCES because the log file
  already exists and has read-only permissions.

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 testcases/network/netstress/netstress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
index c46bc86c3..03b1563dc 100644
--- a/testcases/network/netstress/netstress.c
+++ b/testcases/network/netstress/netstress.c
@@ -723,7 +723,7 @@ static void move_to_background(void)
 	close(STDOUT_FILENO);
 	close(STDERR_FILENO);
 
-	int fd = SAFE_OPEN(log_path, O_CREAT | O_TRUNC | O_RDONLY, 00444);
+	int fd = SAFE_OPEN(log_path, O_CREAT | O_TRUNC | O_WRONLY, 0644);
 
 	SAFE_DUP(fd);
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
