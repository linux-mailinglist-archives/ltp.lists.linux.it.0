Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAA424F690
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 11:01:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1FFB3C2EF6
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Aug 2020 11:01:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id BFB863C13D8
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 11:01:28 +0200 (CEST)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 76943600B93
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 11:01:28 +0200 (CEST)
Received: by mail-pg1-x543.google.com with SMTP id v15so4243621pgh.6
 for <ltp@lists.linux.it>; Mon, 24 Aug 2020 02:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ox8MVjCeSG+JzYpIQAfyrhbExAMR4BokRuk7udR2AwE=;
 b=HpCdxeTTq5rTtKPF212NgDTy/ou+tU7GZphDvPjhGwMgJ3Nx/l/W1ZFIb/nZ3DyY7V
 ul+t2feDkVX+ejWpAJnWsvyGS2vCYNOdCLqMNemC4XhDOs8/3i1gc39l5CHSwJK7pJGU
 HMFpcM3EosqlAVBQJbnrAa1i3qz22+3UsBW1jXGMrL2F+T4M8fvMoZ6b8dCYF6zF9XcY
 TYvngX7XnUtl0Zq0jEoEr6RK9eZfysgY9DH0nOWNyFAM3PYNX8KA2KqraYbzp6eR5H2P
 8a1OSepx0Rob/X/s2YYKaXia/1Z/RWO58WI5wzrGz+7Gbgf72+5LIiGpp3/ajdVLxhQI
 bE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ox8MVjCeSG+JzYpIQAfyrhbExAMR4BokRuk7udR2AwE=;
 b=FceYGDYtT1DMXkHQkMoJN/yaU8QkAEzCqC9sD+MYSC0bftRYj6rn8kt6nSUlWlXX+9
 SxBx9sLIoqsWQFgSveNLweCIwyyAUuJYtpk7QXE2DJP/HvkJL54TrAfdf1x8JWXp9H8v
 Z/4qXoKIlDeZwPKyLW8D9fYi3nUEhdsxxz4UL+sa4DwjDGWXo7Iq7Ra1uoKDS9MPdyNM
 +igLhjacktvSizj8IidTWJJZLUNIGr+wFKA9D6tNYBcrx2Qlp4TE1H8HOtpxHnZVbuY5
 DETahACv863NvVTgxx0yxNyRBDab5Fg6eW9/itqTiILBLx+69zS27F3MML9uH89XhWhc
 fxyw==
X-Gm-Message-State: AOAM5330gaOtItt6e+IRjRa+x2TUfB/T/mboFV6fjY5hrkhVA1nTrh8+
 8Ds0FVvHexnXKjSOQEtNxnA=
X-Google-Smtp-Source: ABdhPJw213En5vp3Vl6BhFNrxGWBGfXMwROhoNwXOkfaB1LTVwSE5/g90/grQAKwkf3Nnt7I8VBGbg==
X-Received: by 2002:a62:868b:: with SMTP id x133mr439292pfd.165.1598259686579; 
 Mon, 24 Aug 2020 02:01:26 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y12sm8923653pgi.75.2020.08.24.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 02:01:25 -0700 (PDT)
Date: Mon, 24 Aug 2020 17:01:18 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200824090118.5oorsfoykpwcguoz@xzhoux.usersys.redhat.com>
References: <20200820015211.u7xdye5ggbe34fsp@xzhoux.usersys.redhat.com>
 <CAEemH2faf5g0JUdBFNvqrNRHB5orbTvHnrwHCm5enF7tt7N=YA@mail.gmail.com>
 <20200821021416.4jkqe2e57d42xkmx@xzhoux.usersys.redhat.com>
 <CAEemH2fYW2Q8CdQgEtfc3ao-XYGZ3x3OTNCgcCY07j0DLkN-Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fYW2Q8CdQgEtfc3ao-XYGZ3x3OTNCgcCY07j0DLkN-Vg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setxattr03: TCONF if failed to set immutable flag
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

On Mon, Aug 24, 2020 at 04:51:20PM +0800, Li Wang wrote:
> On Fri, Aug 21, 2020 at 10:14 AM Murphy Zhou <jencce.kernel@gmail.com>
> wrote:
> 
> > Hi Li,
> >
> > On Thu, Aug 20, 2020 at 02:16:07PM +0800, Li Wang wrote:
> > > Hi Murphy,
> > >
> > > On Thu, Aug 20, 2020 at 9:52 AM Murphy Zhou <jencce.kernel@gmail.com>
> > wrote:
> > >
> > > > Instead of TBROK, probably the underlying filesystem not support this
> > flag.
> > > >
> > >
> > > Which filesystem do you mean here? What kind of error it was given?
> > > Maybe we should confirm the errno is EINVAL or ENOTSUP before TCONF.
> >
> > NFS, with latest upstream kernel.
> >
> 
> It sounds like a new issue appears in the mainline kernel testing.
> 
> 
> > Like:
> >
> > tst_test.c:1247: INFO: Timeout per run is 0h 15m 00s
> > setxattr03.c:142: BROK: Set setxattr03immutable immutable failed: ENOTTY
> > (25)
> > setxattr03.c:154: WARN: Unset setxattr03immutable immutable failed: ENOTTY
> > (25)
> >
> 
> I noticed the setxattr03 skipped on kernel v5.8-rc6, which means the newer
> kernel
> starts to support xattr in NFSv4.2? if so, shouldn't we check why it
> returns ENOTTY
> but not ENOTSUP in failed setxflags?

Yes it's enabled in v5.9-rc1 for NFSv4.2. So setxattr03 pass
the xattr supporting check, but failed to set immutable flag.

Ya, teaching kernel to report ENOTSUP is also a solution.

Thanks for reviewing!
> 
> (btw, I assumed you guys did NOT change the mount way with user_xattr
> option)
> 
>     Kernel Version: 5.8.0-rc6+
>     setxattr03.c:135: CONF: No xattr support in fs or fs mounted without
> user_xattr option
> 
> 
> >
> > The reason not checking errno is that `chattr +i` is a very basic
> > operation,
> > if it fails, most probably it's not supported. NFS returning ENOTTY
> > makes checking errno more tricky. So I did not check it and made it as
> > simple as the checking in xfstests.
> >
> > Thanks very much for reviewing!
> >
> > >
> > > --
> > > Regards,
> > > Li Wang
> >
> > --
> > Murphy
> >
> >
> 
> -- 
> Regards,
> Li Wang

-- 
Murphy

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
