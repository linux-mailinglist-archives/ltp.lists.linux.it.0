Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4F485B3A
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 09:05:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 018273C1D1E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 09:05:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E24053C1C87
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 09:04:59 +0200 (CEST)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id AB66F600D32
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 09:05:00 +0200 (CEST)
Received: by mail-vs1-f68.google.com with SMTP id v129so62365121vsb.11
 for <ltp@lists.linux.it>; Thu, 08 Aug 2019 00:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/iXOSzpJNuJA7c1w7SUyZvyKWCKz2ne9Ty7MkKRQVnE=;
 b=IjGKnmxWJE4VadFgwybTV6Rk7kvlAd78lnOyI++uelpfy8xd704RKeUmRAU1//adIW
 G8gJ7UNqwcSiT3XDqX6eNuTxkVxdNaE841QXMINEdP2VtYocZmkqjOSPwdSHGKw9OJPx
 Gcq9O5OrJSzurJhpZxOJ+jGq0/3TsbrgLMFJPPFd6asdSD/dARrF95zhzztb/q7f2uMe
 U1LghAYfnReqTRjpoO8QfnOwgCZiblJ1m/5sPuPlb7gHPmZ1nWWSrWoBJGaIjAUzFvMh
 A3tvGFndOfobJtaLBTdqz25yWxPtC2uAyei/Rt/ipvlPXrn6D/RvT4rk/bhZV/A5abco
 1+TA==
X-Gm-Message-State: APjAAAWLqIW3M1I3Uer+b1Y42LXJwo2Ij/m7gS3axy7DQkc+kQb7qPhQ
 TAY0lAhP/1dRY/lR0gEgYAlMWiIo6iti2xavW5SGHg==
X-Google-Smtp-Source: APXvYqwhMkyYiq9E1Xv3323UdpNdlfnAeSjKycP6ubTtCZWyOGIrL8GyYX02EE8/fIT455DrCT76LeiN40NQd1Ayq3o=
X-Received: by 2002:a67:ed87:: with SMTP id d7mr8861486vsp.130.1565247897035; 
 Thu, 08 Aug 2019 00:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190807094119.10834-1-pvorel@suse.cz>
In-Reply-To: <20190807094119.10834-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Aug 2019 15:04:46 +0800
Message-ID: <CAEemH2cM7mhkYBvTTFC4UhjnYxG0D_e-nkCmSF2U8pB61UT0bw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: Fix #12 when TMPDIR
 is on tmpfs or ext[234]
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
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Thanks for highlight this.

> Cyril, Jan, Li, still not sure what the policy about errno is (see
> Cyril's statements in recent discussion about it in Jinhui's patch [1]
> [2]). With these frequent changes we should IMHO check for all possible
> variants (EXDEV, EFBIG, EINVAL).
>
> Or should we investigate all fixes and keep errors which highlight
> important fix was not backported (to both stable and LTS/enterprise
> distros kernels?). That'd be weird but approach practical :).

That sounds not very realistic. We can't satisfy all distributions for
errno checking, because we don't know when/wheather it backports the
patch.

>
> Anyway, we should define and write down LTP policy / rules about it.

I think we might have these ways of choosing:

1. Only align with the latest kernel behavior
    e.g limit the latest kernel version and verify that valid errno
The disadvantage of this is only tested on a small kernel range.

2. Guarded by kernel version check as Cyril suggests in [1]
    e.g  kernel >= 4.10; Check errno == EBADF
           kernel < 4.10; Check errno == EISDIR
           ....
The disadvantage is that the test result is affected by LTS with a
backport-patch.

3. Regards all acceptable errnos as valid on any kernel version
    e.g  whatever errno get any of them EXDEV, EFBIG, EINVAL, regard valid
This sounds obviously awful.

Or, anything else?

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
