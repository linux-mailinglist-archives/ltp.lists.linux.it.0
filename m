Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63A330BDE
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 11:59:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4156F3C559D
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 11:59:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2E87E3C1A9E
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 11:59:25 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 3F7E3140098E
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 11:59:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615201163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0+nC8Ha2GWcAWVK3Tv33m0Zh9dzyaDUxyDiLb5DL/I=;
 b=DAHax94argEdu0rL7MmeozdEC2HtEuTm4KvFN9tfbQfY+4SRAErvorn+OOC6MY2lfY3O/L
 r7C/KhtU7jQe3nQWTRW8kkkT3q6iEaoXyP2UrHE7f7+eUb1LfahK9nKNiG5vsjLvg7/iEz
 SsZu6TFxl1Yfgn68wfZWpwD5eUK8HxY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-Y2-kbloNNFGr1N12zCNDyw-1; Mon, 08 Mar 2021 05:59:15 -0500
X-MC-Unique: Y2-kbloNNFGr1N12zCNDyw-1
Received: by mail-yb1-f199.google.com with SMTP id 194so12367982ybl.5
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 02:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0+nC8Ha2GWcAWVK3Tv33m0Zh9dzyaDUxyDiLb5DL/I=;
 b=oXxut+L4+8Nvnb94nNL2SMqobxFDq1TXz4/YvI5c84y6DdJS/bhS/+D+mN58UzQ82s
 p4sxbilg6rinJoim4bCBatIWYOdT0XfCQaDWI+X5taVnE/APtxqkYKkJtvCVog8CY3XS
 NAvGKAiDNz2K7NJkJ3Y/5SkGQGbwStKBpjGObYHDpYDrec5WZIj8HGw/7TEJqilAQFHm
 NUJ1vu2MegcSoNo/l6sHtVdrOMMn/RZF2vuyXZJ8SfXJdnhW8Fxzcy9pSA3FZ83Qf0N+
 OkSf2cwTmA7FcUtKe6kMDRBL8JznKTmsCMLPhW90Vz7/wCvnZ8gCD2XmSrAb/AtV3w2W
 0ocQ==
X-Gm-Message-State: AOAM530Tr2nSEZttPMYMOgN9qoyR8AuTil5Xi3pW2UDztiH+6JTgXbCV
 p/ZVktH61YEv2B72wUYLZs2ohcz5D9nrQDgWnELmnMxB7AUF1BEOTYTtovXHr7v6Vyym/Mfr6lj
 sbEK+58a3wthzlX/EiCUVMZEwN4U=
X-Received: by 2002:a25:412:: with SMTP id 18mr33589056ybe.366.1615201155121; 
 Mon, 08 Mar 2021 02:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylyQ6EDIAtlNfB5CVlTjQqMgLjpouUVxc8AWUrKoPNeEdVmOqsafBAHxurLiFPu4BND8sXGU/fDv8qDPyszw0=
X-Received: by 2002:a25:412:: with SMTP id 18mr33589036ybe.366.1615201154937; 
 Mon, 08 Mar 2021 02:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20210308065329.25824-1-liwang@redhat.com>
 <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
In-Reply-To: <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Mon, 8 Mar 2021 18:59:03 +0800
Message-ID: <CAEemH2d45hFqhB-++xgswYoOh4HGFtFZxXCKGhLhDdt9oXFbfA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime04: print more info to help debugging
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
Content-Type: multipart/mixed; boundary="===============1463616283=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1463616283==
Content-Type: multipart/alternative; boundary="00000000000014c71305bd0453a6"

--00000000000014c71305bd0453a6
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 8, 2021 at 6:17 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 08-03-21, 06:53, Li Wang wrote:
> > We get some sporadically failures like below, but we don't know which
> > loop it comes from. So adding more prints to help locate issue.
> >
> >   tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s
> >   vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
> >   clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference between
> successive readings is reasonable
> >   clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Difference
> between successive readings greater than 5 ms (1): 8
> >   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference between
> successive readings is reasonable
> >   clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Difference
> between successive readings greater than 5 ms (0): 5
> >   clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Difference between
> successive readings is reasonable
> >   clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference between
> successive readings is reasonable
> >
> > Btw, it occurs on a x86_64 (not virtualized) with kernel 5.11.0.
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > ---
> >  testcases/kernel/syscalls/clock_gettime/clock_gettime04.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> > index 5f8264cc6..4dc9093c7 100644
> > --- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> > +++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
> > @@ -108,6 +108,9 @@ static void run(unsigned int i)
> >                       if (tv->clock_gettime == my_gettimeofday &&
> clks[i] != CLOCK_REALTIME)
> >                               continue;
> >
> > +                     if (tv->clock_gettime && count == 10000)
>
> clock_gettime will always be valid here, isn't it ?
>

Yes, but that's not harmful. If you remove all entries of varaints[] you can
still get PASS from the test, that's something strange to us. So I just add
this check there.



>
> > +                             tst_res(TINFO, "%s", tv->desc);
> > +
>
> I think you just need to add this to setup(), same is done for various
> tests already.
>

No, that will only print the first entry instruct variants because you're
using two iterations in the run(), the second loop 'j' is to traverse the
variants[] actually.



>
>         tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
>
> --
> viresh
>
>

-- 
Regards,
Li Wang

--00000000000014c71305bd0453a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 6:17 PM Viresh Kumar &lt;<a =
href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 08-03-21,=
 06:53, Li Wang wrote:<br>
&gt; We get some sporadically failures like below, but we don&#39;t know wh=
ich<br>
&gt; loop it comes from. So adding more prints to help locate issue.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0tst_test.c:1286: TINFO: Timeout per run is 0h 05m 00s<br>
&gt;=C2=A0 =C2=A0vdso_helpers.c:76: TINFO: Couldn&#39;t find vdso_gettime64=
()<br>
&gt;=C2=A0 =C2=A0clock_gettime04.c:157: TPASS: CLOCK_REALTIME: Difference b=
etween successive readings is reasonable<br>
&gt;=C2=A0 =C2=A0clock_gettime04.c:150: TFAIL: CLOCK_REALTIME_COARSE: Diffe=
rence between successive readings greater than 5 ms (1): 8<br>
&gt;=C2=A0 =C2=A0clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC: Difference =
between successive readings is reasonable<br>
&gt;=C2=A0 =C2=A0clock_gettime04.c:150: TFAIL: CLOCK_MONOTONIC_COARSE: Diff=
erence between successive readings greater than 5 ms (0): 5<br>
&gt;=C2=A0 =C2=A0clock_gettime04.c:157: TPASS: CLOCK_MONOTONIC_RAW: Differe=
nce between successive readings is reasonable<br>
&gt;=C2=A0 =C2=A0clock_gettime04.c:157: TPASS: CLOCK_BOOTTIME: Difference b=
etween successive readings is reasonable<br>
&gt; <br>
&gt; Btw, it occurs on a x86_64 (not virtualized) with kernel 5.11.0.<br>
&gt; <br>
&gt; Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 testcases/kernel/syscalls/clock_gettime/clock_gettime04.c | 3 ++=
+<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c=
 b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c<br>
&gt; index 5f8264cc6..4dc9093c7 100644<br>
&gt; --- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c<br>
&gt; +++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c<br>
&gt; @@ -108,6 +108,9 @@ static void run(unsigned int i)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (tv-&gt;clock_gettime =3D=3D my_gettimeofday &amp;&amp; clk=
s[i] !=3D CLOCK_REALTIME)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (tv-&gt;clock_gettime &amp;&amp; count =3D=3D 10000)<br>
<br>
clock_gettime will always be valid here, isn&#39;t it ?<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes=
, but that&#39;s not harmful. If you remove all entries of varaints[] you c=
an</div><div class=3D"gmail_default" style=3D"font-size:small">still get PA=
SS from the test, that&#39;s something strange to us. So I just add</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">this check there.</div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;%s&quot;, tv-&gt;de=
sc);<br>
&gt; +<br>
<br>
I think you just need to add this to setup(), same is done for various<br>
tests already.<br></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">No, that will only print the first entry ins=
truct variants because you&#39;re</div><div class=3D"gmail_default" style=
=3D"font-size:small">using two iterations in the run(), the second loop &#3=
9;j&#39; is to traverse the</div><div class=3D"gmail_default" style=3D"font=
-size:small">variants[] actually.</div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TINFO, &quot;Testing variant: %s&quot;,=
 variants[tst_variant].desc);<br>
<br>
-- <br>
viresh<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000014c71305bd0453a6--


--===============1463616283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1463616283==--

