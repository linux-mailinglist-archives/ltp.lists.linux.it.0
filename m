Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D233C1F8F79
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 09:26:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05FBA3C601D
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jun 2020 09:26:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 4849C3C0EC1
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 09:26:23 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id A2213637EA3
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 09:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592205981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqkBXCvnYcrr1cyOrbMJwXEnJf4VoEX0G0VyHLhhX1I=;
 b=FABSmwQuXPcUIk0kYVf3Z9np0khOOu+qGcVvfkET6JZUn3ktnws6Abrc+29S/7yCe5Jyj9
 Clm8R8ZRxHx5+mZMA6B5K60ExnTUf/Dkly92SvTWxavppyE6U7Rv33T0h5nIWUrqL6RzR7
 Uj5oxttufXeAej41i+1GmGR2vRjGRVg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-PciiP5UPNq637gRGZsqqmA-1; Mon, 15 Jun 2020 03:26:18 -0400
X-MC-Unique: PciiP5UPNq637gRGZsqqmA-1
Received: by mail-lj1-f197.google.com with SMTP id h14so2371506ljk.7
 for <ltp@lists.linux.it>; Mon, 15 Jun 2020 00:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqkBXCvnYcrr1cyOrbMJwXEnJf4VoEX0G0VyHLhhX1I=;
 b=sFI74fmQfxcjh6EEiIioUjrxmncmsOuAejbIdZ44wuMLOkknJHy+3T0V41qtBu5I9H
 du2i46tsyApQX7rWAzwhJVBcWX5+M11p0WOpT0HY/TMS5geV4U4SiYkX7YdlNG1C0syv
 R+LMmH9pEEZOzlfHWNG+07iSNyu4htwOFYhhiGwIVxewIkuUtFEEKclP/7yrruAPuIIb
 hN2nLqw6O5S3nJbRmZ9cvCMkdJwXtX1TgCEJzyAE5IoTPxzs3DAlAEhumoN02mwobGky
 MXl8JzSsSmLO8R2QqpkqUh31DE/6W57piG9dY3FlmYN+brlaf/NeL0sfWzAsU+MFf5vX
 It1A==
X-Gm-Message-State: AOAM5312hqsSxx2Zo+UttdMtlReZtmPyJebVK5/jFzlV9TmU3CzEvIxu
 Prz4OFLTUwZ1mEn27preCYac20N23+clCBZ1qR+j7QZc5HQ1hm4bTW5DLZruKD7JOUQXs5dbuzu
 bLbkc3P/3IQRCFPewJRWaIrxFSVA=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr4575561lfa.60.1592205976938; 
 Mon, 15 Jun 2020 00:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+g44s2yWqOppkCSijxkQRT0w+yRm2KtfqkMqTacwNDPPaUnK4U8W26XEgWkrDfHXmH4UJP3L/8ZbwPTdNlJ8=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr4575547lfa.60.1592205976717; 
 Mon, 15 Jun 2020 00:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
 <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
 <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
 <ce8bd6c0-0abb-e09e-b21f-5e769ffd3ab3@linuxfoundation.org>
 <20200609195851.GA29515@x230>
 <8b3cbf25-83ad-42da-f3ec-e2bafdfff97c@linuxfoundation.org>
 <874krjxuby.fsf@our.domain.is.not.set> <20200610072732.GA32619@dell5510>
In-Reply-To: <20200610072732.GA32619@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 15 Jun 2020 15:26:04 +0800
Message-ID: <CAEemH2dKooCXs84Qa=AoAd+QrHLZWo4Ko_hzOvHy6Cm74JVADw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
Cc: Dmitry Vyukov <dvyukov@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0907263520=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0907263520==
Content-Type: multipart/alternative; boundary="000000000000a6dfe405a81a57e2"

--000000000000a6dfe405a81a57e2
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 10, 2020 at 3:27 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Shuah, Richard,
>
> > > If this patch doesn't intend to update syzkaller-repo, there is
> > > nothing to do for linux-arts. I thought that this patch is for
> > > Dmitry's syzkaller repo I update from and looking get this into
> > > linux-arts directly.
>
> > > Since this is LTP patch, ignore my comments. Sorry for the noise.
>
> > > thanks,
> > > -- Shuah
>
> > No problem at all, I should have made that more clear.
>
> > Infact I will send a seperate patch to linux-arts mentioning the LTP
> > wrapper.
> Thanks you both for clarifying.
>
> @Jan, @Cyril, @Yang, @Li: any ack/objection to this patch?
>

I have no objection to merging the syzkaller patch.
Build and run some of the testcase locally(Fedora32) by manual, it works
well.

-- 
Regards,
Li Wang

--000000000000a6dfe405a81a57e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jun 10, 2020 at 3:27 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Shuah, Richard,<br>
<br>
&gt; &gt; If this patch doesn&#39;t intend to update syzkaller-repo, there =
is<br>
&gt; &gt; nothing to do for linux-arts. I thought that this patch is for<br=
>
&gt; &gt; Dmitry&#39;s syzkaller repo I update from and looking get this in=
to<br>
&gt; &gt; linux-arts directly.<br>
<br>
&gt; &gt; Since this is LTP patch, ignore my comments. Sorry for the noise.=
<br>
<br>
&gt; &gt; thanks,<br>
&gt; &gt; -- Shuah<br>
<br>
&gt; No problem at all, I should have made that more clear.<br>
<br>
&gt; Infact I will send a seperate patch to linux-arts mentioning the LTP<b=
r>
&gt; wrapper.<br>
Thanks you both for clarifying.<br>
<br>
@Jan, @Cyril, @Yang, @Li: any ack/objection to this patch?<br></blockquote>=
<div><br></div><div class=3D"gmail_default" style=3D"font-size:small">I hav=
e no objection to merging the syzkaller patch.=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-size:small">Build and run some of the testcase lo=
cally(Fedora32) by manual, it works well.</div></div><div><br></div>-- <br>=
<div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<b=
r></div><div>Li Wang<br></div></div></div></div>

--000000000000a6dfe405a81a57e2--


--===============0907263520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0907263520==--

