Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFBD26A6
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 11:50:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 174003C1CA2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Oct 2019 11:50:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 534A33C063A
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 11:50:15 +0200 (CEST)
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0F7D91001719
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 11:48:39 +0200 (CEST)
Received: by mail-qk1-x741.google.com with SMTP id p10so4987237qkg.8
 for <ltp@lists.linux.it>; Thu, 10 Oct 2019 02:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eq21ieXGYfbio4/ONvnC5Y4VJvJvtnV+f7bJhm6JVDI=;
 b=kgP4jNYS15D8vXlgaBAEII5Kz7MnCpluuyFU9Bf5kO1PVhrBZrcyKftchjvaVC/0Wu
 CLo47T021TLkUeEYc8kgnUB3nbVusTl3wkaNBGww2zoZWdlY5rPKxVfHEitf9dzw/VXD
 Itr+JE89cgAiIjdQ9tgjb2ksfPSuj/LSEd5yJbrRM5tdm2QWsUPSE6pg6mf1r4PYDFlp
 qcV57MTt939pUHywKuBHLSiKefP2WEUy/59F07mu9TSXQpPDBV6v0d0w+LfWwIw2NvAH
 I6hsApuZO3ONSfSKcPYTnBQojNFODYR6n+L8zBLp9hRACkZ9CO9Q7J645GjhNyEuU+x+
 W2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eq21ieXGYfbio4/ONvnC5Y4VJvJvtnV+f7bJhm6JVDI=;
 b=E1FJl9wX1Rwb9zSDp5qj4tOQeY4b+xm5VIGiViY0JBW2xHpULWrfZBUfidMwaX5EGR
 WzcL+okPLU1/kCFwBv0Q+kQ2lFHlivDqjYjLUq7iEJluBEOJdnM6maoTBFoLZdp31C0O
 ijZR7F0xZRoiYx4K48nG/MmsKXYyO6tzCwZUGX6o/Fj1tmQgn7RIVOWAJFKmRT96DC0v
 pKH6/y5iinfjqGu5UKoTm/53kKD5u9tyyL/+iEWsFm7TWrqZm3g1SFXZ0v2bE7qZTqhV
 cpaoLJs1U1DzHd2peUYcaGIDdnSZUzuVp0XA9fGfMbn5gurUqguelsoSV5JOK4UE0R0R
 hSmQ==
X-Gm-Message-State: APjAAAW3OEh+LzQs2cVtZtQ2NcPB4yC7lX9B70bkspYgIEdc1bpnK09K
 TeJgyf3mfSP854HFH17J526FkiRkv9tCODTSNozXCw==
X-Google-Smtp-Source: APXvYqw0uc2wmafldvOtFV4iMk/sTNu5MMjbDOtm5t43CvU5+L67HoQvsxCb7/WviGyf24Z33oQ8SouTYm1wB5OulQg=
X-Received: by 2002:a05:620a:6b6:: with SMTP id
 i22mr8537547qkh.256.1570701013485; 
 Thu, 10 Oct 2019 02:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191009142446.6997-1-rpalethorpe@suse.com>
 <CACT4Y+b0tTAQ0r_2gCVjjRh--Xwv=aLzh6MY=ciXMMrK+cAQsA@mail.gmail.com>
 <20191009145416.GA5014@rei.lan>
 <CACT4Y+ZL8ocQPpwR-_8+0PdF=r3AkFZKvOR==+P0y0GF67w1Vg@mail.gmail.com>
 <20191009180447.GD15291@rei.lan>
 <CACT4Y+ZABX2z4Lxrvokf5DHz351xTys-gJPNhFjP+Zx6Qd2zsg@mail.gmail.com>
 <20191010093011.GA2508@rei.lan>
In-Reply-To: <20191010093011.GA2508@rei.lan>
Date: Thu, 10 Oct 2019 11:50:01 +0200
Message-ID: <CACT4Y+ZARc3gK9rweQnLr26Aa_8j9OrpAs-wfTVP2owqmXm+kQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] LTP Wrapper for Syzkaller reproducers
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
From: Dmitry Vyukov via ltp <ltp@lists.linux.it>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Cc: automated-testing@yoctoproject.org, kernelci@groups.io,
 George Kennedy <george.kennedy@oracle.com>,
 syzkaller <syzkaller@googlegroups.com>,
 "open list : KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Cyril Hrubis <chrubis@suse.com>, shuah <shuah@kernel.org>, ltp@lists.linux.it,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Oct 10, 2019 at 11:30 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > > > > Indeed, it's removed recursively by the test library.
> > > >
> > > > :popcorn:
> > > >
> > > > It took me several years to figure out how to more or less reliably
> > > > remove dirs after the fuzzer ;)
> > > > (no, unlink won't do ;))
> > >
> > > I guess that there are things such as immutable file attributes that has
> > > to be cleared and many more. Do you have piece of code somewhere that we
> > > can look into to spare us from reinventing the wheel?
> >
> > Here is what we have:
> > https://github.com/google/syzkaller/blob/c4b9981b5f5b70dc03eb3f76c618398510101a1d/executor/common_linux.h#L2358-L2461
> > Maybe it can be simplified, but that's what we ended up with after
> > some organic evolution. At least the comments may give some hints as
> > to what may go wrong.
>
> Thanks a lot!
>
> Also I see that you are using namespaces, and much more, to sandbox the
> fuzzer, I was wondering if we should do that, at least separate user and
> pid namespace sounds like a good idea to me.

I don't know how far you want to go. This sandboxing definitely helps
us to isolate processes and make tests more repeatable by avoiding
interference (I don't know if LTP, say, runs tests in parallel).
mount namespaces are useful to later drop all of test mounts at once,
this would solve a significant part of the remote_dir logic. If the
temp dir is on tmpfs in the mount namespace as well, then it will be
automatically dropped altogether with all contents.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
