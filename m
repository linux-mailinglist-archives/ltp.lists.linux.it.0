Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 672EC3A69D9
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:14:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC12C3C8B14
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:14:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 79A9D3C4D17
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:14:53 +0200 (CEST)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BC674600875
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:14:52 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id c11so20692657ljd.6
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 08:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GgRyVcwmUVfVvA2QfaNWUVYoo+hsISEWAxBPJjMrAqI=;
 b=ZKVZ8T8BM0xpYPPA97gHvR4gGNJIOXNni2vaegRf3lpTjwBucGtK/rNvSh8NqT6dsm
 P2rpFH83RwqFvFVDTczVGdkmLKBF62XvIU4ZosMPDUd/Lpq+5uiN+iNA7VR23jOkHWF8
 0Dc0OVZu8ZuQQEMr81ajvJfXB5PTURLm+bngMCUlW5QTEUIkpBey/pVfWizEE9JV1Ufy
 gtttfpuKXvzD0+kcK1H2nSe6PWOxDdIwW0T4/0pCa+Wpet4fOIVjJUiVzplYNpU+uPoi
 YKK4b1TsCRKkZ1GoaphD2fq2lWU/TqyBLTvpt8THkOqPQtoVXMA5zg7vhTUcZLy+WtRG
 fZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GgRyVcwmUVfVvA2QfaNWUVYoo+hsISEWAxBPJjMrAqI=;
 b=hg680k0X5JnObtGwwQzudxi4SQB0dFaiyQYEo/MOA3e+jll1/dodLNEsftgwR/CY5f
 4sgcBZBEqdtWLq6yo2tg4xGWI7hQHcH55auIBzXyg3Xc79KxlZnUNTyWKO2BPAGTxKCP
 B0zF2R51aerkUaOpCAqtDgh7xWYypmj7LEAP+m6gJQFE1K+2GUPo+agdKz7dnzwh1aw9
 HPP0ATpteUDlA7f1KECFTnWRQGqyGIgyJ5r++fuxchoKvb07qsFLKHJKNjkkFYhq7Ik3
 6qXhTLYFMaRV8nkKW0fbLT+lz1cPUTvH/fW7KwEOExOvvg15FdR8qW0w1ddknfhr0mzw
 EYpQ==
X-Gm-Message-State: AOAM530nhxbg1aGVdcXyQrrQH/qebSkS0h3YexhVRKtQB6SKcZMEK/hi
 laHEW5KOZT4tGXPiJ7RsuQoPeE++zWiZSfNWSho=
X-Google-Smtp-Source: ABdhPJwLhcB8Qtyt5DcQWTQoask0K73UD9QpGiYY6Z1zENmdpZFnP6xUfNolLOqyCNhAFy0Nonf/f7/FdBZOYkukkNc=
X-Received: by 2002:a2e:9945:: with SMTP id r5mr14251842ljj.324.1623683692120; 
 Mon, 14 Jun 2021 08:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <YMNqQE218QqnPiZY@yuki>
 <20210613171642.7773-1-vinay.m.engg@gmail.com>
 <YMdpulBdM4FEtFm5@yuki>
In-Reply-To: <YMdpulBdM4FEtFm5@yuki>
From: Vinay Kumar <vinay.m.engg@gmail.com>
Date: Mon, 14 Jun 2021 20:44:40 +0530
Message-ID: <CANUMPcWU-fXLJvLR=4+uv4RJFJQ7-WcozND72RD7aouotLQgng@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] getrusage02: Skipped EFAULT tests for libc
 variant.
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
Cc: umesh kalappa0 <umesh.kalappa0@gmail.com>, metan@ucw.cz,
 Randy MacLeod <rwmacleod@gmail.com>, vinay.kumar@blackfigtech.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Thanks for your review.
In your corrections for getrusage02.c need below change.

============================
diff --git a/testcases/kernel/syscalls/getrusage/getrusage02.c
b/testcases/kernel/syscalls/getrusage/getrusage02.c
index 24777687c..767663090 100644
--- a/testcases/kernel/syscalls/getrusage/getrusage02.c
+++ b/testcases/kernel/syscalls/getrusage/getrusage02.c
@@ -61,7 +61,7 @@ static void verify_getrusage(unsigned int i)
                return;
        }

-       TST_EXP_FAIL(getrusage(tc[i].who, tc[i].usage), tc[i].exp_errno,
+       TST_EXP_FAIL(tv->getrusage(tc[i].who, tc[i].usage), tc[i].exp_errno,
                     "getrusage(%i, %p)", tc[i].who, tc[i].usage);
 }
============================

Regards,
Vinay

On Mon, Jun 14, 2021 at 8:33 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> Slightly adjusted and pushed, thanks.
>
> --
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
