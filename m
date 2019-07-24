Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D59177367E
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 20:24:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89E333C1CFE
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 20:24:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EFE5D3C1D17
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 20:23:59 +0200 (CEST)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9705A14002D3
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 20:23:59 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id n9so48098475wru.0
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6mv45r7y7VhpJfXW/kn24MB8uD/8TX73p45kNdXJqyQ=;
 b=GBdbM2MRxHuvxnKbtRWQNN2ooXkXp2g2MRnlp8Ogwbd4xITlkjxqmrFPzxHs6MhZ8B
 O8YG4aksb51+Exm23jT6hgdLa6ayUyrnn43EjgzR92GIJ43wdRk9p8xFEzpIaNzicE8E
 jICzX3MoKp44gVV6cVwujKbee/eKNXcXpQLHfn1yILeLJXaSJV3OwJt5Lb3djJWhNfuh
 lK5LKs6rXKNTpvKA8KtUqIfaQKmXQDChkk3NhaaLV2u1T4JUk258a1JGGEm6WFCT2N5G
 FtPheqo68RtHODaI58WdZQDtzk6vW/+8mCdTHu9ed3nHsGEWX6AwGqFMVa+TT2gLwHQN
 G7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6mv45r7y7VhpJfXW/kn24MB8uD/8TX73p45kNdXJqyQ=;
 b=hsvoQjM6Y4Vb9e+pQITu5+70k2WeCdQFnWalh8X1YrYk4X4gne1ctdfnvFGbNDQX5w
 Fqp40cewXbOOAYCTW7a+we5AzH25CQxszZceggrHG3TzokbDDV+QKbRLFAe7iWq9Dg0e
 DQbedcBkl5patkgLBJBoS2m2JPLIBMSFTDp7Zd9e2wS5msMGyPBY5DBvnmtS2WFC3apP
 tFnTj7P3Hs7yusTeSIEUW5eKSkp/jcwW2FJfssKQS7dwka17t8BzewF4BikGr87FI6GW
 8BijA68nNDd3TRWb/WLVDK17DaMeI5yLd4zDduVSz44yGQ5OZLhF6WjE6I8d26s6huNb
 Griw==
X-Gm-Message-State: APjAAAWuf5IX5UXojkG45cubakgziP1JCXMOohCcUSBrkGkYYnwmwmxW
 hSHJ4IDTfxRu7ZD7DothFjjxiqJU
X-Google-Smtp-Source: APXvYqz21DYoC0KJhAWSEkL1W6bg49C+u6cruM9hR8t+Mr3b4vSImPS45fL4EaqD9u2Pb9NrsT7J5A==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr90975869wrv.207.1563992639026; 
 Wed, 24 Jul 2019 11:23:59 -0700 (PDT)
Received: from localhost.localdomain (static-46-238-236-44.awacom.net.
 [46.238.236.44])
 by smtp.gmail.com with ESMTPSA id o6sm90944429wra.27.2019.07.24.11.23.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Jul 2019 11:23:58 -0700 (PDT)
From: Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
To: ltp@lists.linux.it
Date: Wed, 24 Jul 2019 20:23:43 +0200
Message-Id: <1563992624-4968-2-git-send-email-piotr.krzysztof.gawel@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563992624-4968-1-git-send-email-piotr.krzysztof.gawel@gmail.com>
References: <1563992624-4968-1-git-send-email-piotr.krzysztof.gawel@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_timer: fix qsort comparison function
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

From qsort() manual:
    The  comparison  function must return an integer
    less than, equal to, or greater than zero if the
    first argument is considered to be respectively
    less than, equal to, or greater than the second.
    If two members compare as equal, their order in
    the sorted array is undefined.
We need it in descending order so the logic is
reverted.

Signed-off-by: Piotr Gawel <piotr.krzysztof.gawel@gmail.com>
---
 lib/tst_timer_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index 4c16b59..f6459e5 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -159,7 +159,7 @@ static int cmp(const void *a, const void *b)
 {
 	const long long *aa = a, *bb = b;
 
-	return *aa < *bb;
+	return (*bb - *aa);
 }
 
 /*
-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
