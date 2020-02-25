Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD416F37D
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 00:33:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D3FEF3C24D4
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 00:33:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 5B8133C094C
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 00:33:25 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DD67E1A00913
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 00:33:24 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id g6so484757plt.2
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 15:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=esT3T2w7bwNvCNhUNWgIZ93npmjTqgkzpu/tmBvY4f8=;
 b=YK3apF4y6K/3z9oOLlNavwckvYEEOLLa5RfWxBUZ1+Uprk6x2ffHVZDQmZx1/SfPUP
 xmEW2N/DJtpXTmFXDl5k45VmQimtHNhWReHZZJcCVRyx2BsnYcPYNfcrhEBltC3EcvBJ
 Y4zP5A50a1lF5Go5bnBLjOyIqP2T0iXRq/xrjDNUUA/ZvEcsXxPS19kNJB88xRxYt20N
 XutukPhf1ZjBcSE3BIczXkvynYH6PMaFO76I40KTzKbZblX/UmSxYi7aRauqWd92m5DL
 3AUMn4NZ38SNiza23LlM4CIgtPtFM9ui5kILkWqWO2Ede3XJBh9mn42a362FbClglu6P
 cg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=esT3T2w7bwNvCNhUNWgIZ93npmjTqgkzpu/tmBvY4f8=;
 b=WpTN2btz7Nc7Cp8lqZv4xl1Bu2L3wOHvK4+OLV9hrjnNmw1ndzW2U4e/vsu8Pr4b3k
 wbdqUIJjOt29nIxTVGaKJUCMN9531h1kOtbikeV28Vu1ItlzwaZSYLD4JIzTQhwldrG8
 m6CDY+36p0sXMvZTK9fps9oZr3+NmX9ttHN4iFFob/yN40U6K6jR1cbaju6vPallhrTN
 nRE2gJ1u4K6t2KzV9EUMPp3ktlpVh56xCDKP577dgjykGdCfDp7DsS9tIciisgT/ePKc
 KOljd+CTpeFiDJmEUB9lAnPf1JxwUsVH2yGJyLQ7DvUD9jbgKDPY+FRI8jjNvlwOTFRi
 4rJw==
X-Gm-Message-State: APjAAAUMImLuvuGNKI0PFQV/KNOXV6Ao9YlU7FC/X78r624qtKER2oqq
 Dmvabk/0b4DRqy9tUwA/Qt6Jnqy4jyE=
X-Google-Smtp-Source: APXvYqwX43/p5VffFDoEAhMtOC4w+UXOvIQOA0crT/c116T7FoJIDG/W2GsMx9cAihbtNAQtmfFzug==
X-Received: by 2002:a17:90a:e653:: with SMTP id
 ep19mr1796176pjb.58.1582673602851; 
 Tue, 25 Feb 2020 15:33:22 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id h185sm170984pfg.135.2020.02.25.15.33.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 15:33:21 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 26 Feb 2020 05:03:16 +0530
Message-Id: <2f579843fb1ff09cfaaa1b991b48437f525740b3.1582673499.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <54a3d6fcef8cfed89a1e4f0b56717f56aa502293.1582611994.git.viresh.kumar@linaro.org>
References: <54a3d6fcef8cfed89a1e4f0b56717f56aa502293.1582611994.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2] syscalls/pidfd_open: Continue with rest of the
 tests on failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

With tst_brk(), the tests end immediately while what we want to do here
is to test rest of the failure tests. Use tst_res() to report result and
continue with rest of the failure tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2: Use return, instead of if/else blocks.

 testcases/kernel/syscalls/pidfd_open/pidfd_open02.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
index d73b5326b3b1..9cdded13525a 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
@@ -35,14 +35,16 @@ static void run(unsigned int n)
 
 	if (TST_RET != -1) {
 		SAFE_CLOSE(TST_RET);
-		tst_brk(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
+		tst_res(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
 			tc->name, n);
+		return;
 	}
 
 	if (tc->exp_errno != TST_ERR) {
-		tst_brk(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
+		tst_res(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
 			tc->name, tst_strerrno(tc->exp_errno));
-	}
+		return;
+	 }
 
 	tst_res(TPASS | TTERRNO, "%s: pidfd_open() failed as expected",
 		tc->name);
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
