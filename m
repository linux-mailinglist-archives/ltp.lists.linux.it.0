Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1322221A1
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 13:41:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3333C29BD
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 13:41:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C6B0F3C1D19
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 13:41:03 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C8B4814017F5
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 13:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594899661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDd/oExoNZ2Wi2XLHstjwGktqOJuvd7j2keCFmLYrCg=;
 b=GwHqJXxLYRDhXnBCppdS67OGeexFbKmT4ngEEQSbaPVy8xeWykHZWfm3bWbltRNrLaNoGK
 8OfXh5s5ZK7RSNafXj7K8+sEgAX5HqRJfznTYTDPcRZnFD9c1m4h3ECgQV5pzJzpqPtKAj
 npvJjOyHKz2Z1lEfAI0H9LX5fYfoIXw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156--bUI-G0HOkGd181zGgo1AA-1; Thu, 16 Jul 2020 07:40:57 -0400
X-MC-Unique: -bUI-G0HOkGd181zGgo1AA-1
Received: by mail-lf1-f69.google.com with SMTP id m24so2727512lfh.2
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 04:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDd/oExoNZ2Wi2XLHstjwGktqOJuvd7j2keCFmLYrCg=;
 b=oN97pkRlhopThkhmvvznjGVdI2e2095CX6nBpZtvuA7RF9RRWj3AkVZaIurP+Vbo8O
 aty7/zvwjno8Y21HT4VRDY+v9ATfJDLx6M5w9qoWyL8WQ6eR+zUjEA+HNex1AwIL8PD8
 AEOxw7Bj2xnpGMDDfYx/nCBdNWYeX/0NZ/Or95vHvBtLIysVpafJK53zDEY5+AVHhyaT
 x1kvecJ9vE3TnFAAAe1woaIqqoi7WgPr1fNEM8z6ME8kLkFOhhpayX3Zh72bBZM5NAyn
 qzZUE7J6IlbHucs5+CLLzEe9QRoBHLeBCk/fQfEWohKmr2RwyLw6RbqG6Caeo0E8C8pk
 f9iw==
X-Gm-Message-State: AOAM5302vMaMpswuznkgbX9qvsBAOFUINxy+V4fxEiW6MyK/8lFX/O0m
 TopCGEm8hyJUlk3S01lkg5ZguLhMBGo/EcJe8/8ukXslRfk7TdFs3Jtv6QOgPYd3rdRQAF/dkey
 giQ2TozCMXwF5K7/k7I7fDtJdJ6I=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr1737742ljf.257.1594899655684; 
 Thu, 16 Jul 2020 04:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf0k7r+H+Xqm4hL1vm//sWYqUZNhEAVCNglaToVtvKu5NLYN2+7xvMxCp8P7aXrof7tEdGHUoXNN5YyHWIlMo=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr1737733ljf.257.1594899655482; 
 Thu, 16 Jul 2020 04:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200716061059.30525-2-liwang@redhat.com>
 <20200716091528.GA6383@dell5510>
In-Reply-To: <20200716091528.GA6383@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 16 Jul 2020 19:40:43 +0800
Message-ID: <CAEemH2fjYqGtOn9roAoUa_9CEdAMeSEt+WYG+vipdWaWqx6Pcg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [v2,2/2] ioperm: Convert to new API
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
Content-Type: multipart/mixed; boundary="===============1014249552=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1014249552==
Content-Type: multipart/alternative; boundary="0000000000006af6d605aa8d83f6"

--0000000000006af6d605aa8d83f6
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Thu, Jul 16, 2020 at 5:15 PM Petr Vorel <pvorel@suse.com> wrote:

> Hi Li,
>
> Actually it fails to build on non-intel.
> https://travis-ci.org/github/pevik/ltp/jobs/708655670
> /usr/src/ltp/testcases/kernel/syscalls/iopl/iopl02.c:21:10: fatal error:
> sys/io.h: No such file or directory
> 9793 #include <sys/io.h>
>
> https://travis-ci.org/github/pevik/ltp/builds/708655668
>
> <sys/io.h> needs to be included behind #if defined __i386__ ||
> defined(__x86_64__) guarder.
>

Thanks for catching this, I have fixed it and pushed.


-- 
Regards,
Li Wang

--0000000000006af6d605aa8d83f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Petr,</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 16, 2020 at 5:15 PM Petr Vorel=
 &lt;<a href=3D"mailto:pvorel@suse.com">pvorel@suse.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
Actually it fails to build on non-intel.<br>
<a href=3D"https://travis-ci.org/github/pevik/ltp/jobs/708655670" rel=3D"no=
referrer" target=3D"_blank">https://travis-ci.org/github/pevik/ltp/jobs/708=
655670</a><br>
/usr/src/ltp/testcases/kernel/syscalls/iopl/iopl02.c:21:10: fatal error: sy=
s/io.h: No such file or directory<br>
9793 #include &lt;sys/io.h&gt;<br>
<br>
<a href=3D"https://travis-ci.org/github/pevik/ltp/builds/708655668" rel=3D"=
noreferrer" target=3D"_blank">https://travis-ci.org/github/pevik/ltp/builds=
/708655668</a><br>
<br>
&lt;sys/io.h&gt; needs to be included behind #if defined __i386__ ||<br>
defined(__x86_64__) guarder.<br></blockquote><div><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Thanks for catching this, I have fi=
xed it and pushed.</div></div><br clear=3D"all"><div><br></div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></d=
iv><div>Li Wang<br></div></div></div></div>

--0000000000006af6d605aa8d83f6--


--===============1014249552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1014249552==--

