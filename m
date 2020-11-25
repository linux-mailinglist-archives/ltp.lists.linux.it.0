Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6122C4399
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 16:41:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 854C63C4E33
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 16:41:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 370223C14BC
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 16:41:46 +0100 (CET)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 65281600718
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 16:41:46 +0100 (CET)
Received: by mail-il1-x142.google.com with SMTP id q1so2525833ilt.6
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 07:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bliYMv/MydKjKm3heuDepuZrfYVgDdAE6AxCOndiZPQ=;
 b=orix0apQtClK/bCPb9zz6IO4iu6awzCd86BfxceXU06uDJC00gjy76L+2ABb7esQXv
 re5P4IRb0soL3A9Hz4WbDPlmHa7JH61DbHyuJlDC9PxNW0MVmN1QydJ+VJmGijQtmP+9
 SUlyyJ7nwpuTJ0kZkScow0gQEnEWutNE5BXIF8aJergtilNDlkQWdcPWdwaopOGTXeNX
 4ehZWqFI8aRYF7CIC+Zdyc12+Vpe3Ya9mdzSXK2KsPmGpU5zVS4EseymYO55rmEfvaxT
 qkXs0CZRln0wOF7A/dbEqBRX+KPPiiZZ8/ZQtWxHwCTJ2aJrD9anuPQBIbwlcnHDwNLc
 vLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bliYMv/MydKjKm3heuDepuZrfYVgDdAE6AxCOndiZPQ=;
 b=QJgyJkYNRZwFS36ptfLK3+TfCEJry5Rf3+VMAtBOZ0Xz7FiDwlSfLDMnmGYmWCXWse
 Pla2oAoBdteDlegypxA6mPOsmiDbwZFnjE0w8EfjYnc5KZA+B9F7lf+/AmyjwK456wmr
 ivKNEUypjS0+avK+9g5mkrrCy+npGxCuo3tr75Ej9H7foF4d2AtooxXIjCtRFE0l0QK/
 /WacOK/+J4+chi3PQXVEoFoknGLctmnHqSfeQDt2ons/GzCpHkBHfofZwDhWZMpmlS5M
 dveOT9c+RDbg1BeaOFrluTdpxQ3YFFU3tqJrN0u1xneLFVGoekO0U1TSjKXFCpEmCiiT
 LBag==
X-Gm-Message-State: AOAM533intJw5l9OVLScWIYErD2SyEEvRBWngv9SXXV0l1kiCVBkt5cA
 czISHeXS7DWfgTcGOIar/0jq7zouXExg9LeFaCE=
X-Google-Smtp-Source: ABdhPJz7OiUODbMCrNNFMF8NMVcnL/rPOS/dMErymFjqc7nyfhQnmcrK03ArJ3orM4LKhMIaC6ni9IKJHAbvAkf4vrI=
X-Received: by 2002:a92:8541:: with SMTP id f62mr3597978ilh.9.1606318905163;
 Wed, 25 Nov 2020 07:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20201113164944.26101-1-pvorel@suse.cz>
 <20201113164944.26101-4-pvorel@suse.cz>
 <20201119102740.GD2785@yuki.lan>
 <CAOQ4uxigsk5e7GHgDHydd03D1bAih1SJv36dB4209mpE_dU6PQ@mail.gmail.com>
 <20201125141624.GA32471@pevik>
In-Reply-To: <20201125141624.GA32471@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 25 Nov 2020 17:41:33 +0200
Message-ID: <CAOQ4uxi5MCx8g2ZkNsKS487AK3Vkhb31-05yp_r8EB=w_2TLvA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/5] fanotify: Introduce SAFE_FANOTIFY_MARK()
 macro
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Nov 25, 2020 at 4:16 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > > > +++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
> > > > @@ -101,19 +101,8 @@ static void test_fanotify(unsigned int n)
> > > >                       "failed", tc->init_flags);
> > > >       }
>
> > > > -     if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag,
> > > > -                       FAN_ACCESS | FAN_MODIFY | FAN_CLOSE | FAN_OPEN,
> > > > -                       AT_FDCWD, fname) < 0) {
> > > > -             if (errno == EINVAL && mark->flag == FAN_MARK_FILESYSTEM) {
> > > > -                     tst_res(TCONF,
> > > > -                             "FAN_MARK_FILESYSTEM not supported in kernel?");
> > > > -                     return;
> > > > -             }
>
> > > Here we had tst_res(TCONF, ...) followed by a return but we will can
> > > tst_brk() after the change. I guess that we may skip part of the test on
> > > older kernels with that change.
>
>
> > That's not good. I missed that in my review.
> > There are many tests where only the FAN_MARK_FILESYSTEM
> > test cases are expected to result in TCONF, but the rest of the test
> > cases should run.
>
> I'm not sure if I understand you. Is my approach correct here?
>

I think it is not correct, but please tell me what the outcome is when running
test fanotify01 on kernel < v5.1.

The expected outcome is that the 2 first test cases PASS and the rest of the
test cases are skipped (TCONF).

Now what happens if you reorder the 2 first test cases to be last in the tcases
array? Will they run at all or will tst_brk(TCONF, ... in safe_fanotify_mark()
cause the rest of the test cases not to run?

I'm just not sure how tst_brk() behaves with test cases, but I have a feeling
that it won't result in the expected outcome?

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
