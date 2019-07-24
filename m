Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F10EF7367F
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 20:24:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADAD73C1CFC
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 20:24:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F31D33C1D06
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 20:24:02 +0200 (CEST)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 281F11000C4D
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 20:23:57 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id p17so47984505wrf.11
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pPkcRGqvzKwASEoGlIcy77/ZXUQdb7N4P8f/Fa2Kq0Y=;
 b=Q3VRMeag32oZVX0bQp8GbVBV6ArmGbJVqg44QKWITwKiJCUBhtduQCD1aQojtsLb7U
 RLn8vN61+3iuVnU2ECcdHMvaX7lusVPEAxPFBfbuqOfXJjg4qnSBW/ah9FklW8EETM/S
 1KLSmvlDfWL+21mIKrCtd+O08roSeduXpeEA6QZGThBOjQB9hTXptXAosMdl0iXp+rFi
 isuNUEbew+7KMYx8KQeKf3EMNyvuB5MoYWSwrmtMOwzxVmtUsi6CKq6qiUhw/vAY8LV4
 xVLo7jQT7ODyQlQdjWoAdp9Wmf1cugWbxE1aRHey2kA+3eEuaM700hEn8uSmHbjTEZxr
 UrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pPkcRGqvzKwASEoGlIcy77/ZXUQdb7N4P8f/Fa2Kq0Y=;
 b=tXqWDKBk2L9KLHO6DUm+DDnnUcP4deQbUPknz8FHxxGCCMFLDjnhWvCIYaUDTBC7Mm
 c5wSHIXKKzkP5uXEvkRF+IPLj90b4anbySjapYfNp3tNcUKBJc0ehsaCupm1Qf4NVfCP
 jlQT+am1z2ADC2yjPkg1/gFJmewhyU1asaK/VuNh9gIdMNgkjVFlZSacQQTvIALQoMZZ
 CrekcwU34dKddHLrFCGaSM+IAmk/z8RuDPTHmXc/zPizuPR80K3UGPXlh2vWW8qo4sTM
 9Rqikssjm/IOGClhY3OO3dBUBTvm5EvxfibYdwhrOSvo6bkWqcaEzpY2ofGerTQR/0uc
 zF4A==
X-Gm-Message-State: APjAAAW1QKsQiIek2mRKhsxELoZVxTYfx0a3mfOj4fMTDJfyIgYo+nVc
 Niw44RklYFF0n7/rhgzKMxqwMLLL
X-Google-Smtp-Source: APXvYqwX/0kAnT9KAVGYGYTGmsPoHZ4dE/Wk5qryaKD5ATC/DdbE+7EhMOjLkkkH4hjfw0v2WhCDIQ==
X-Received: by 2002:adf:f601:: with SMTP id t1mr89540839wrp.337.1563992642060; 
 Wed, 24 Jul 2019 11:24:02 -0700 (PDT)
Received: from localhost.localdomain (static-46-238-236-44.awacom.net.
 [46.238.236.44])
 by smtp.gmail.com with ESMTPSA id o6sm90944429wra.27.2019.07.24.11.24.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Jul 2019 11:24:01 -0700 (PDT)
From: Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 24 Jul 2019 20:23:44 +0200
Message-Id: <1563992624-4968-3-git-send-email-piotr.krzysztof.gawel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563992624-4968-1-git-send-email-piotr.krzysztof.gawel@gmail.com>
References: <1563992624-4968-1-git-send-email-piotr.krzysztof.gawel@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_timer: fix verification of execution time
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
Cc: piotr.krzysztof.gawel@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Each sample needs to be in range:
    t < s[i] < t + threshold
Thus for i from the interval [d...n]:
    (n-d)*t < sum(s[d...n]) < (n-d)*(t + threshold)
This patch fixes that check.

Signed-off-by: Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
---
 lib/tst_timer_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index f6459e5..4508e29 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -306,7 +306,7 @@ void do_timer_test(long long usec, unsigned int nsamples)
 		samples[nsamples-1], samples[0], median,
 		1.00 * trunc_mean / keep_samples, discard);
 
-	if (trunc_mean > (nsamples - discard) * usec + threshold) {
+	if (trunc_mean > keep_samples * (usec + threshold)) {
 		tst_res(TFAIL, "%s slept for too long", scall);
 
 		if (!print_frequency_plot)
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
