Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C4998EEFD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 05:09:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DA283EA1BB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 05:09:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 8976D3EA183
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 05:09:26 +0200 (CEST)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6ED4710009E1
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 05:09:21 +0200 (CEST)
Received: by mail-vk1-f194.google.com with SMTP id x194so2792170vke.0
 for <ltp@lists.linux.it>; Mon, 29 Apr 2019 20:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmfa8g06rdyixo57Ionb828/pt+58hTjG/E/TZOR3mg=;
 b=sKFYwaYW7LHfsym0zW1wJLv8gUb+QrX0J+aJoGdYr+TWc7B/yTM7BhmE0YNOfKuMMo
 WClmyj7+0c3Oy0+L7v6pos+Qc13vFzYgQ/DPZpi89jrQf1zNWuf4OniZlPrCDZ7zv5N3
 XszlfOm1d0SD/jNypYI2WNB5yy2gTaJ9ZlEE1XwsFIDAa+3GQ5CvdXDQIVzHbtiFxiee
 GY/LacwiwmYPWgZf16fXvKTUk2FMKuE6Ap49K5r3qjagtMbWPMAIv0qCEPYQ5vKNkpOw
 jXeVLHmzIzdYqjpKKIj84IMqRbvu5HDWEXqp0vBmQ5ZaOAqIYMyBhB9GhbmL3gzZZKe9
 WYIw==
X-Gm-Message-State: APjAAAWCC9WpPsmf7LTag3YEQmQCUDzYTI4yqoB1xecanfqzZBrPcDto
 ++lB4VSRq8yvQ5eH39Y7SkjMM+LN2yRHLU1yRWBEeA==
X-Google-Smtp-Source: APXvYqycq3p8FkWrtSH2mfKwMtxMZXi3MO8mMMyWJ8p7r8nJ01lGrfxPzpZ/b9lkwcldWb5kG693SIRROSQRhpeb1MQ=
X-Received: by 2002:a1f:c446:: with SMTP id u67mr34454097vkf.52.1556593762792; 
 Mon, 29 Apr 2019 20:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190418111812.GB3073@rei.lan> <20190426131258.GA18760@rei>
 <CAEemH2ezD-diAYeG0=pbgUgdMtSFxs+dWYo4CnDNdHQT=SOEaQ@mail.gmail.com>
 <20190429115952.GA6265@rei>
In-Reply-To: <20190429115952.GA6265@rei>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Apr 2019 11:09:11 +0800
Message-ID: <CAEemH2ehjHx+XmAh+ZCZbs1hG9CfZeAm-c_V14ifXgZgJtfKtw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] LTP Release
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0235361279=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0235361279==
Content-Type: multipart/alternative; boundary="0000000000004a9c250587b6bad5"

--0000000000004a9c250587b6bad5
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 29, 2019 at 7:59 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > > So as usually please go ahead and point out anything that should go
> in
> > > > before the release.
> > >
> > > Only Peter replied so far, so I suppose that we are ready to freeze git
> > > starting next week and start the pre-release testing.
> > >
> > > Or is there anything that has to be considered to be included before we
> > > do that?
> > >
> >
> > Here is a simple fix for hugepage test broken with memory shortage.
> > Consider merging?
> > http://lists.linux.it/pipermail/ltp/2019-April/011714.html
>
> The basic idea looks OK however:
>
> * the function name (reset_hugepages) is a bit confusing
>   what about "cap_hugepages" or "limit_hugepages"
>

"limit_hugepages" sounds good to me.

>
> * The MemFree: may be close to zero on long running system because of
>   cached files, AFAIK MemAvailable: would be a better choice, see:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=34e431b0ae398fc54ea69ff85ec700722c9da773
>
>   Unfortunately that one is available since 3.14 kernel, if we wanted to
>   run on older kenrnels I would propose to fall back to dropping caches
>   and using MemFree: on kernel that does not have MemAvailable: in
>   meminfo.
>

Good proposal. I will improve like this in patch V4. Thanks!

-- 
Regards,
Li Wang

--0000000000004a9c250587b6bad5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 29, 2019 at 7:59 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; &gt; So as usually please go ahead and point out anything that sh=
ould go in<br>
&gt; &gt; &gt; before the release.<br>
&gt; &gt;<br>
&gt; &gt; Only Peter replied so far, so I suppose that we are ready to free=
ze git<br>
&gt; &gt; starting next week and start the pre-release testing.<br>
&gt; &gt;<br>
&gt; &gt; Or is there anything that has to be considered to be included bef=
ore we<br>
&gt; &gt; do that?<br>
&gt; &gt;<br>
&gt; <br>
&gt; Here is a simple fix for hugepage test broken with memory shortage.<br=
>
&gt; Consider merging?<br>
&gt; <a href=3D"http://lists.linux.it/pipermail/ltp/2019-April/011714.html"=
 rel=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp/2=
019-April/011714.html</a><br>
<br>
The basic idea looks OK however:<br>
<br>
* the function name (reset_hugepages) is a bit confusing<br>
=C2=A0 what about &quot;cap_hugepages&quot; or &quot;limit_hugepages&quot;<=
br></blockquote><div><br></div><div>&quot;limit_hugepages&quot; sounds good=
 to me.<br></div><div class=3D"gmail_default" style=3D"font-size:small"></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
* The MemFree: may be close to zero on long running system because of<br>
=C2=A0 cached files, AFAIK MemAvailable: would be a better choice, see:<br>
<br>
=C2=A0 <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/?id=3D34e431b0ae398fc54ea69ff85ec700722c9da773" rel=3D"nor=
eferrer" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/=
torvalds/linux.git/commit/?id=3D34e431b0ae398fc54ea69ff85ec700722c9da773</a=
><br>
<br>
=C2=A0 Unfortunately that one is available since 3.14 kernel, if we wanted =
to<br>
=C2=A0 run on older kenrnels I would propose to fall back to dropping cache=
s<br>
=C2=A0 and using MemFree: on kernel that does not have MemAvailable: in<br>
=C2=A0 meminfo.<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Good proposal. I will improve like this in =
patch V4. Thanks!</div></div></div><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wa=
ng<br></div></div></div></div>

--0000000000004a9c250587b6bad5--

--===============0235361279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0235361279==--
