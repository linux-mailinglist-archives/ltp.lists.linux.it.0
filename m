Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51E333761
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 09:34:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 434CD3C4BE4
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Mar 2021 09:34:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 98DB63C3178
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 09:34:41 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 81047600442
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 09:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615365279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FMC5Pzbgc7CLmlzSTlKYJ+CsBArmtuXUUzcjtclSQFA=;
 b=jJ315gk43QK2yjKDWyzmwihO1vWQ2Q8mRkr80jZ0b3P3jKGpHbV6q/O79Y2LOUcg0GzudB
 rWJK3c7i4IZXy/zkvuYUlg+xpPbfMOHsyZO8Urs8ZwFQpohWFxiubE2PbLbzOZiww1lS0l
 yz+mqnBCphLrnNG3affXDl3nJAjuMx8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-PZ2InJuFP0a6Vu4if8qszw-1; Wed, 10 Mar 2021 03:34:36 -0500
X-MC-Unique: PZ2InJuFP0a6Vu4if8qszw-1
Received: by mail-yb1-f200.google.com with SMTP id d8so20583423ybs.11
 for <ltp@lists.linux.it>; Wed, 10 Mar 2021 00:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMC5Pzbgc7CLmlzSTlKYJ+CsBArmtuXUUzcjtclSQFA=;
 b=Xdh8jbKtnJS68Fbyo3EGdsFdvKb4mAvkJMwRihVKka3E1FsGS+8f2Vlq1NxwvEmpKr
 8r+ijHSbfKR8ZLcs/yH3WAsxbo/HZu/KFHGJwAAeEMAS3uksR89tL9hdTu9MgfmZWoeQ
 UAJv3zrekXgZQOKNrEoX27xJpNk5SbcUNuP1lTAq+zPJry2mST9XxnNHsPE/K+z2OSge
 WQTJpZJe68mhqFj2yw5gZWDBcOLnMi+X2HE+Ff4QjqewKBHl6cU0as3fu4Kvs/P22gtV
 VcCPsSpxoprm6jXRf1YYSHDgKwlBE/5qI4NfHB1+jEEDFvwCOBlETmbQMjbZBEIE/l61
 3+2g==
X-Gm-Message-State: AOAM530lyBpWtqbLEMxBat47RpX5D79xyTTSR8zaxnIvEuDVB+2+bhnT
 9PlW0iVtTCLWa7zrACrmrFqzhVVdtzOO4zwXV8b6h8rlSE5udx+IvmlJxMMObUQ09y6W5ruAhsq
 YGnEf/gkl1i9WVFKqcIoHiuhzuJc=
X-Received: by 2002:a25:5ac2:: with SMTP id o185mr2763200ybb.252.1615365276046; 
 Wed, 10 Mar 2021 00:34:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1K+g+NNwQDQepnv3DrW0Y2TD2I15w1iEj5T+ZNKo2+vNIg5ds4Yu4asETL60FdkHq9FPzbJXvut48qTKmH/k=
X-Received: by 2002:a25:5ac2:: with SMTP id o185mr2763153ybb.252.1615365275407; 
 Wed, 10 Mar 2021 00:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20210309080028.16284-1-liwang@redhat.com>
 <20210309094525.4ggmppfpvavsvjzl@vireshk-i7>
 <YEdhgvXg/mYkppz6@pevik> <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
In-Reply-To: <20210309115623.ze5c7li7vuf65gvg@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Wed, 10 Mar 2021 16:34:23 +0800
Message-ID: <CAEemH2esvVfy0YeCL2nXgj441XeBY7F+Y8MVEJ31nKRNPvjC+g@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCh v2] clock_gettime04: print more info to help
 debugging
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
Content-Type: multipart/mixed; boundary="===============0403003959=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0403003959==
Content-Type: multipart/alternative; boundary="0000000000006c6c8b05bd2a89a4"

--0000000000006c6c8b05bd2a89a4
Content-Type: text/plain; charset="UTF-8"

Viresh Kumar <viresh.kumar@linaro.org> wrote:

> ...
> > > >   clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between
> successive readings is reasonable for following variants:
> > > >   clock_gettime04.c:162: TINFO:   - vDSO or syscall with libc spec
> > > >   clock_gettime04.c:162: TINFO:   - syscall with old kernel spec
> > > >   clock_gettime04.c:162: TINFO:   - vDSO with old kernel spec
> >
> > Sorry for putting my opinion late. Instead of repeating variants
> (duplicity)
> > I'd prefer just print variants once at the beginning + print which
> variant
> > failed.
>
> I too thought about that, but then realized that the variant list
> isn't same for all the clocks, like gettimeofday only there for
> CLOCK_REALTIME and so let it go.
>

But we can put the printing behind the 'gettimeofday+CLOCK_REALTIME'
checking.
Just similar to what I did in patch V1, is that your mean, Petr?

--- a/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c
@@ -108,6 +108,9 @@ static void run(unsigned int i)
                        if (tv->clock_gettime == my_gettimeofday && clks[i]
!= CLOCK_REALTIME)
                                continue;

+                       if (count == 10000)
+                                tst_res(TINFO, "\t- %s", tv->desc);
+
                        ret = tv->clock_gettime(clks[i], tst_ts_get(&ts));
                        if (ret) {
                                /*
@@ -139,8 +142,8 @@ static void run(unsigned int i)

                        diff = end + slack - start;
                        if (diff < 0) {
-                               tst_res(TFAIL, "%s: Time travelled
backwards (%d): %lld ns",
-                                       tst_clock_name(clks[i]), j, diff);
+                               tst_res(TFAIL, "%s(%s): Time travelled
backwards (%d): %lld ns",
+                                       tst_clock_name(clks[i]), tv->desc,
j, diff);
                                return;
                        }



-- 
Regards,
Li Wang

--0000000000006c6c8b05bd2a89a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.=
org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmail_default"=
 style=3D"font-size:small">...</span><br>
&gt; &gt; &gt;=C2=A0 =C2=A0clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Di=
fference between successive readings is reasonable for following variants:<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0clock_gettime04.c:162: TINFO:=C2=A0 =C2=A0- vDSO=
 or syscall with libc spec<br>
&gt; &gt; &gt;=C2=A0 =C2=A0clock_gettime04.c:162: TINFO:=C2=A0 =C2=A0- sysc=
all with old kernel spec<br>
&gt; &gt; &gt;=C2=A0 =C2=A0clock_gettime04.c:162: TINFO:=C2=A0 =C2=A0- vDSO=
 with old kernel spec<br>
&gt; <br>
&gt; Sorry for putting my opinion late. Instead of repeating variants (dupl=
icity)<br>
&gt; I&#39;d prefer just print variants once at the beginning + print which=
 variant<br>
&gt; failed.<br>
<br>
I too thought about that, but then realized that the variant list<br>
isn&#39;t same for all the clocks, like gettimeofday only there for<br>
CLOCK_REALTIME and so let it go.<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">But we can put the printin=
g behind the &#39;gettimeofday+CLOCK_REALTIME&#39; checking.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Just similar to what I did in=
 patch V1, is that your mean, Petr?</div></div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">--- a/testcases/kernel/syscalls/clock_gettime/clock_gettim=
e04.c<br>+++ b/testcases/kernel/syscalls/clock_gettime/clock_gettime04.c<br=
>@@ -108,6 +108,9 @@ static void run(unsigned int i)<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tv-&=
gt;clock_gettime =3D=3D my_gettimeofday &amp;&amp; clks[i] !=3D CLOCK_REALT=
IME)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>=C2=A0<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (count =3D=3D 10000)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(T=
INFO, &quot;\t- %s&quot;, tv-&gt;desc);<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D tv-&gt;clo=
ck_gettime(clks[i], tst_ts_get(&amp;ts));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>@@ -139,8 +142,8 @@ static void ru=
n(unsigned int i)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diff =3D end + slack - start;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (diff &lt; 0) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(=
TFAIL, &quot;%s: Time travelled backwards (%d): %lld ns&quot;,<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_clock_name(clks[i]=
), j, diff);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quot;%s(%s=
): Time travelled backwards (%d): %lld ns&quot;,<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_clock_name(clks[i]), tv-&gt;desc=
, j, diff);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }=
<br></div></div><div><br></div><div><br></div><div><br></div>-- <br><div di=
r=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--0000000000006c6c8b05bd2a89a4--


--===============0403003959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0403003959==--

