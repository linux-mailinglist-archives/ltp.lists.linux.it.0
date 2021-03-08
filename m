Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407D330C45
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:25:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B40883C5571
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 12:25:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3C3953C0CC6
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:25:07 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4B8AA200ACF
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 12:25:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615202705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QmV0hRJX5Bqf7+ie06dNSXi2LYa/E4z/jfhx/zMA5ZQ=;
 b=XQuNNMvIdnU+3MoxQxU/W+TTlcgx0gknncKDCkk8+6CBu2Ex732zbJ9mUxSkSoObyXFb1T
 sZ6i4Wugar2VI3uLaHsKNrzhYOlP66lTZwM2LSNzynotyd90Yr2rbomSEAZ5Xax61C9jfm
 mG6rzskVsiL0Y9wlD3iat6UBAxPTYbA=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-fGfB0Y1vM9yEvSvYY1vhqw-1; Mon, 08 Mar 2021 06:25:01 -0500
X-MC-Unique: fGfB0Y1vM9yEvSvYY1vhqw-1
Received: by mail-yb1-f198.google.com with SMTP id v6so12479289ybk.9
 for <ltp@lists.linux.it>; Mon, 08 Mar 2021 03:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmV0hRJX5Bqf7+ie06dNSXi2LYa/E4z/jfhx/zMA5ZQ=;
 b=g572q8TuyvaNKM+YlYhIKSV0gME5FvMmEsU28xUgiq00E92ieF6F6xxrbu6SAxK6J3
 eem994qOtdQL8pjHn/MYNpIR1CxttxJfUSApotjaqPq8wmA6PxIhotsb6JD7akEXEuMC
 K/hhPrfimT/8oemC2gsV9tyCHcFC7ohUZYdu/kLTIcMOgjrozdbHb6zjMwygYTrLKHA9
 iHrq5mE+b/efKn8pYe2/w+XoB2KuTiyKBEtimdG9c4kpfMo7yKHYb0uTYmTxosoJYJX4
 LNcUP9A1O99bb2heizVxO+yTrnsbwAIeqQ61u8QeOw5IAamF5dGzZNgzfuIQNdwnikW/
 1NuA==
X-Gm-Message-State: AOAM533n7wfHAbhMLMitiNf8I8RC5R4m89dh1DByfppgLDWM0+sU+N/s
 OMqxUqrZFt9tq/XChEQIQmN6aytl2NMWSOqXbk+yoxUrWm2x8GQMpl1bKN4cMlwCo3FqczsJb4v
 Ts5dT8OohPEoCEE0zr7/l4CtCnHg=
X-Received: by 2002:a25:58c5:: with SMTP id
 m188mr32951260ybb.286.1615202701289; 
 Mon, 08 Mar 2021 03:25:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVxZ91OS2kJ1oFnrT6MO9fWyYxgrbsMm0Q58Aa6nSmifio16BbnzczXWDxxkPa5Ob6kzNOxfnPnVYgv755tIU=
X-Received: by 2002:a25:58c5:: with SMTP id
 m188mr32951241ybb.286.1615202701051; 
 Mon, 08 Mar 2021 03:25:01 -0800 (PST)
MIME-Version: 1.0
References: <20210308065329.25824-1-liwang@redhat.com>
 <20210308101732.lzkjql3t7aoscruk@vireshk-i7>
 <CAEemH2d45hFqhB-++xgswYoOh4HGFtFZxXCKGhLhDdt9oXFbfA@mail.gmail.com>
 <20210308111447.h3l2a5yep3n4n5qs@vireshk-i7>
In-Reply-To: <20210308111447.h3l2a5yep3n4n5qs@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Mon, 8 Mar 2021 19:24:49 +0800
Message-ID: <CAEemH2eKkGokVY2ZBs=U9eqDrDZVB5qKBVUApULrdL65tfnmLQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1306628079=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1306628079==
Content-Type: multipart/alternative; boundary="0000000000003c9cd805bd04af11"

--0000000000003c9cd805bd04af11
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 8, 2021 at 7:14 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> On 08-03-21, 18:59, Li Wang wrote:
> > Yes, but that's not harmful.
>
> But is useless.
>
> > If you remove all entries of varaints[] you can
> > still get PASS from the test, that's something strange to us. So I just
> add
> > this check there.
>
> Yes, that would happen because we will not run the inner loop in that
> case and even the condition you are adding will not run at all.
>
> This wasn't designed to run with empty variants list and so we don't
> verify that variants structure is empty or not and so it passes.
>

Indeed. I agree to remove 'tv->clock_gettime' check.


>
> > No, that will only print the first entry instruct variants because you're
> > using two iterations in the run(), the second loop 'j' is to traverse the
> > variants[] actually.
>
> Ahh, my bad. I didn't read the code properly. Sorry about that.
>
> Now that I had a look again, with what you are adding here we will
> start printing another line for each variant and it will be printed
> just once at the beginning of the loop of 10000 iterations. Right ?
>

Right.



>
> I am not sure how that will help you get more info out, to me it is
> still very much unreadable. Can you show the final output as well ?
>

# ./clock_gettime04
tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
clock_gettime04.c:84: TINFO: Running in a virtual machine, multiply the
delta by 10.
vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
clock_gettime04.c:158: TPASS: CLOCK_REALTIME: Difference between successive
readings is reasonable
clock_gettime04.c:158: TPASS: CLOCK_REALTIME_COARSE: Difference between
successive readings is reasonable
clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between
successive readings is reasonable
clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_COARSE: Difference between
successive readings is reasonable
clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between
successive readings is reasonable
clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Difference between successive
readings is reasonable


After my patch:

# ./clock_gettime04
tst_test.c:1288: TINFO: Timeout per run is 0h 05m 00s
clock_gettime04.c:84: TINFO: Running in a virtual machine, multiply the
delta by 10.
vdso_helpers.c:76: TINFO: Couldn't find vdso_gettime64()
clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec
clock_gettime04.c:112: TINFO: syscall with old kernel spec
clock_gettime04.c:112: TINFO: vDSO with old kernel spec
clock_gettime04.c:112: TINFO: gettimeofday
clock_gettime04.c:160: TPASS: CLOCK_REALTIME: Difference between successive
readings is reasonable
clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec
clock_gettime04.c:112: TINFO: syscall with old kernel spec
clock_gettime04.c:112: TINFO: vDSO with old kernel spec
clock_gettime04.c:160: TPASS: CLOCK_REALTIME_COARSE: Difference between
successive readings is reasonable
clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec
clock_gettime04.c:112: TINFO: syscall with old kernel spec
clock_gettime04.c:112: TINFO: vDSO with old kernel spec
clock_gettime04.c:160: TPASS: CLOCK_MONOTONIC: Difference between
successive readings is reasonable
clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec
clock_gettime04.c:112: TINFO: syscall with old kernel spec
clock_gettime04.c:112: TINFO: vDSO with old kernel spec
clock_gettime04.c:160: TPASS: CLOCK_MONOTONIC_COARSE: Difference between
successive readings is reasonable
clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec
clock_gettime04.c:112: TINFO: syscall with old kernel spec
clock_gettime04.c:112: TINFO: vDSO with old kernel spec
clock_gettime04.c:160: TPASS: CLOCK_MONOTONIC_RAW: Difference between
successive readings is reasonable
clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec
clock_gettime04.c:112: TINFO: syscall with old kernel spec
clock_gettime04.c:112: TINFO: vDSO with old kernel spec
clock_gettime04.c:160: TPASS: CLOCK_BOOTTIME: Difference between successive
readings is reasonable



>
> What about adding tv->desc to all the existing print messages instead
> ? Or maybe just the TFAIL ones? So we print everything in a single
> line only ?
>

But that still not good enough.
e.g
In PASS status, we missing some details.



>
> --
> viresh
>
>

-- 
Regards,
Li Wang

--0000000000003c9cd805bd04af11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 7:14 PM Viresh Kumar &lt;<a =
href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 08-03-21,=
 18:59, Li Wang wrote:<br>
&gt; Yes, but that&#39;s not harmful.<br>
<br>
But is useless.<br>
<br>
&gt; If you remove all entries of varaints[] you can<br>
&gt; still get PASS from the test, that&#39;s something strange to us. So I=
 just add<br>
&gt; this check there.<br>
<br>
Yes, that would happen because we will not run the inner loop in that<br>
case and even the condition you are adding will not run at all.<br>
<br>
This wasn&#39;t designed to run with empty variants list and so we don&#39;=
t<br>
verify that variants structure is empty or not and so it passes.<br></block=
quote><div><br></div>Indeed. I agree to remove <span class=3D"gmail_default=
" style=3D"font-size:small">&#39;</span>tv-&gt;clock_gettime<span class=3D"=
gmail_default" style=3D"font-size:small">&#39;</span> check.<div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; No, that will only print the first entry instruct variants because you=
&#39;re<br>
&gt; using two iterations in the run(), the second loop &#39;j&#39; is to t=
raverse the<br>
&gt; variants[] actually.<br>
<br>
Ahh, my bad. I didn&#39;t read the code properly. Sorry about that.<br>
<br>
Now that I had a look again, with what you are adding here we will<br>
start printing another line for each variant and it will be printed<br>
just once at the beginning of the loop of 10000 iterations. Right ?<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Right.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
I am not sure how that will help you get more info out, to me it is<br>
still very much unreadable. Can you show the final output as well ?<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small"># ./clock_gettime04</div>tst_test.c:1288: TINFO: Timeout per run i=
s 0h 05m 00s<br>clock_gettime04.c:84: TINFO: Running in a virtual machine, =
multiply the delta by 10.<br>vdso_helpers.c:76: TINFO: Couldn&#39;t find vd=
so_gettime64()<br>clock_gettime04.c:158: TPASS: CLOCK_REALTIME: Difference =
between successive readings is reasonable<br>clock_gettime04.c:158: TPASS: =
CLOCK_REALTIME_COARSE: Difference between successive readings is reasonable=
<br>clock_gettime04.c:158: TPASS: CLOCK_MONOTONIC: Difference between succe=
ssive readings is reasonable<br>clock_gettime04.c:158: TPASS: CLOCK_MONOTON=
IC_COARSE: Difference between successive readings is reasonable<br>clock_ge=
ttime04.c:158: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive re=
adings is reasonable<br>clock_gettime04.c:158: TPASS: CLOCK_BOOTTIME: Diffe=
rence between successive readings is reasonable<br><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">After my patch:</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
"># ./clock_gettime04</div>tst_test.c:1288: TINFO: Timeout per run is 0h 05=
m 00s<br>clock_gettime04.c:84: TINFO: Running in a virtual machine, multipl=
y the delta by 10.<br>vdso_helpers.c:76: TINFO: Couldn&#39;t find vdso_gett=
ime64()<br>clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec<br>=
clock_gettime04.c:112: TINFO: syscall with old kernel spec<br>clock_gettime=
04.c:112: TINFO: vDSO with old kernel spec<br>clock_gettime04.c:112: TINFO:=
 gettimeofday<br>clock_gettime04.c:160: TPASS: CLOCK_REALTIME: Difference b=
etween successive readings is reasonable<br>clock_gettime04.c:112: TINFO: v=
DSO or syscall with libc spec<br>clock_gettime04.c:112: TINFO: syscall with=
 old kernel spec<br>clock_gettime04.c:112: TINFO: vDSO with old kernel spec=
<br>clock_gettime04.c:160: TPASS: CLOCK_REALTIME_COARSE: Difference between=
 successive readings is reasonable<br>clock_gettime04.c:112: TINFO: vDSO or=
 syscall with libc spec<br>clock_gettime04.c:112: TINFO: syscall with old k=
ernel spec<br>clock_gettime04.c:112: TINFO: vDSO with old kernel spec<br>cl=
ock_gettime04.c:160: TPASS: CLOCK_MONOTONIC: Difference between successive =
readings is reasonable<br>clock_gettime04.c:112: TINFO: vDSO or syscall wit=
h libc spec<br>clock_gettime04.c:112: TINFO: syscall with old kernel spec<b=
r>clock_gettime04.c:112: TINFO: vDSO with old kernel spec<br>clock_gettime0=
4.c:160: TPASS: CLOCK_MONOTONIC_COARSE: Difference between successive readi=
ngs is reasonable<br>clock_gettime04.c:112: TINFO: vDSO or syscall with lib=
c spec<br>clock_gettime04.c:112: TINFO: syscall with old kernel spec<br>clo=
ck_gettime04.c:112: TINFO: vDSO with old kernel spec<br>clock_gettime04.c:1=
60: TPASS: CLOCK_MONOTONIC_RAW: Difference between successive readings is r=
easonable<br>clock_gettime04.c:112: TINFO: vDSO or syscall with libc spec<b=
r>clock_gettime04.c:112: TINFO: syscall with old kernel spec<br>clock_getti=
me04.c:112: TINFO: vDSO with old kernel spec<br>clock_gettime04.c:160: TPAS=
S: CLOCK_BOOTTIME: Difference between successive readings is reasonable<br>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
What about adding tv-&gt;desc to all the existing print messages instead<br=
>
? Or maybe just the TFAIL ones? So we print everything in a single<br>
line only ?<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">But that still not good enough.</div><div class=
=3D"gmail_default" style=3D"font-size:small">e.g=C2=A0</div><div class=3D"g=
mail_default" style=3D"font-size:small">In PASS status, we missing some det=
ails.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
-- <br>
viresh<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000003c9cd805bd04af11--


--===============1306628079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1306628079==--

