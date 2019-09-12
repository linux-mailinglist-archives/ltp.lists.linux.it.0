Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E7B0B7C
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:35:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99FC43C2084
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 11:35:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3F6773C0733
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:35:05 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0338C10060BF
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 11:34:56 +0200 (CEST)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B0A28796E4
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 09:35:02 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id e21so14362153otq.23
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 02:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yffs1cdOIAEG/YodhLPO3O5cfmsqLIagKmFUlzbXR7A=;
 b=WmId44dzKEtJqB+Q+Y/Snx9cQe6KXcWHUNV8SMaQAijz+0LBEi7YoNay2yu0HjC1aY
 DEuNz5l+pi21P7bRQaMvT2oX0L9TXwK7B7Y3hoSuVgNOIUSalr+6sVmJyKT3GLneSuXI
 5xCCDP2Vka0HnEMMX5of2hQHXGnGHtfwrbuU098OSRyTjYrkbGbu+oE8c93idu1dX/9e
 eU9WDJ+8ueQAxzLWVUITsbndrlEMeD0QlKOBnq0SyVKW8gq6u9A+YG80FDPzp3heI2df
 UIeHmhSW6FnOCfjM4MVmfyTGEJgEznhU37cAuj8HuLrMOo+o7qjxw9nw/wZadH2mi6Pd
 z0xg==
X-Gm-Message-State: APjAAAXW5ftrBpQs/lZOqiPlEW3XcIcN2c30e+7a0ucI65J+Rm3NKVKF
 NRy8cO5NFUFk9iGz76d0w/L9h3s/I/hGlBdX8fK9ez/h9wqQEogE8AU5zKmZeqwoYlc8VX7Fqvr
 Xq4TJ0t8TeY5r2ZkIVfKG6GjLaqc=
X-Received: by 2002:a9d:7411:: with SMTP id n17mr9780824otk.118.1568280902197; 
 Thu, 12 Sep 2019 02:35:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMR8xCvqZS0qqzmTh9ebtBv9R9lkxJQqc4YTTNMTArhp2gGvQWtcf9eTZUi0gydbmnQCXaRTJT9400B0eSs9U=
X-Received: by 2002:a9d:7411:: with SMTP id n17mr9780806otk.118.1568280901957; 
 Thu, 12 Sep 2019 02:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
 <1568279073.3621.12.camel@suse.de>
In-Reply-To: <1568279073.3621.12.camel@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Thu, 12 Sep 2019 17:34:51 +0800
Message-ID: <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
To: cfamullaconrad@suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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
Content-Type: multipart/mixed; boundary="===============0298934880=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0298934880==
Content-Type: multipart/alternative; boundary="00000000000011d662059257da33"

--00000000000011d662059257da33
Content-Type: text/plain; charset="UTF-8"

> > > > I also wonder if it is worth somehow put this minimum-enforce
> > > > mechanism inside the framework itself
> > > > instead that hardcoding it in this specific test (unless you
> > > > already mean to do it this way...
> > > > and I misunderstood)
> > >
> > > Yes, I was thinking about it as well.
> > > LTP_TIMEOUT_MUL should be reserved for users, tests should use
> > > LTP_TIMEOUT_MUL_MIN,
> > > check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN
> > > would be in
> > > _tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9
> > > (VIRT_PERF_THRESHOLD_MIN).
> >
> > +1 agree.
>
> I have a general question. What do we try to get with
> LTP_TIMEOUT_MUL_MIN? From my perspective, we try to set a minimum
> timeout value. Isn't it the value (struct tst_test*)->timeout ?
>

Well, the (struct tst_test*)->timeout is the default minimum value to set a
timeout, but for some test case(e.g memcg_stress_test.sh), they required
time should be higher than the default. So as we discussed in the above
mails, we're planning to introduce a new variable LTP_TIMEOUT_MUL_MIN to
set as a new minimum value for test timeout. The operation will be
encapsulate in function  _tst_setup_timer().



>
> I'm missing such configuration value for shell. Is there one?
>

No, we don't have it so far.


>
> Or do we need to increase timeout in smaller steps and that is why we
> need this LTP_TIMEOUT_MUL_MIN?
>

Hmm, what we want to do is:

If a testcase needs timeout value is larger than the default (300 sec), we
could only define a variable LTP_TIMEOUT_MUL_MIN in the test, then the
_tst_setup_timer() will detect if LTP_TIMEOUT_MUL_MIN is valid and reset
the minimum time for the test.

@Petr and @Cristian, If I misunderstand anything, please correct me.

-- 
Regards,
Li Wang

--00000000000011d662059257da33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; &gt; &gt; I also wonder if it is worth somehow put this minimum-enforc=
e<br>
&gt; &gt; &gt; mechanism inside the framework itself<br>
&gt; &gt; &gt; instead that hardcoding it in this specific test (unless you=
<br>
&gt; &gt; &gt; already mean to do it this way...<br>
&gt; &gt; &gt; and I misunderstood)<br>
&gt; &gt; <br>
&gt; &gt; Yes, I was thinking about it as well.<br>
&gt; &gt; LTP_TIMEOUT_MUL should be reserved for users, tests should use<br=
>
&gt; &gt; LTP_TIMEOUT_MUL_MIN,<br>
&gt; &gt; check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN<b=
r>
&gt; &gt; would be in<br>
&gt; &gt; _tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9<b=
r>
&gt; &gt; (VIRT_PERF_THRESHOLD_MIN).<br>
&gt; <br>
&gt; +1 agree.<br>
<br>
I have a general question. What do we try to get with<br>
<span class=3D"gmail_default" style=3D"font-size:small"></span>LTP_TIMEOUT_=
MUL_MIN? From my perspective, we try to set a minimum<br>
timeout value. Isn&#39;t it the value (struct tst_test*)-&gt;timeout ?<br><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">Well, the (struct tst_test*)-&gt;timeout is the default minimum=
 value to set a timeout, but for some test case(e.g memcg_stress_test.sh), =
they required time should be higher than the default. So as we discussed in=
 the above mails, we&#39;re planning to introduce a new variable=C2=A0<span=
 class=3D"gmail_default"></span>LTP_TIMEOUT_MUL_MIN to set as a new minimum=
 value for test timeout. The operation will be encapsulate in function=C2=
=A0 _tst_setup_timer().</div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
I&#39;m missing such configuration value for shell. Is there one?<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">No, we don&#39;t have it so far. </div></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Or do we need to increase timeout in smaller steps and that is why we<br>
need this LTP_TIMEOUT_MUL_MIN?<br></blockquote><div><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Hmm, what we want to do is:</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">If a testcase needs timeout va=
lue is larger than the default (300 sec), we could only define a variable L=
TP_TIMEOUT_MUL_MIN in the test, then the _tst_setup_timer() will detect if =
LTP_TIMEOUT_MUL_MIN is valid and reset the minimum time for the test.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div>@Petr and =
@Cristian<span class=3D"gmail_default" style=3D"font-size:small">, If I mis=
understand anything, please correct me.</span><div><br></div></div>-- <br><=
div dir=3D"ltr" class=3D"m_2765165892186434401gmail_signature"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000011d662059257da33--

--===============0298934880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0298934880==--
