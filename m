Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C41622EF
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 10:02:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48E983C2559
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 10:02:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 53AB23C038C
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 10:02:35 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 931CA6018A1
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 10:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582016552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FdfgnUere9JU4smcvcgCHh81QuBPdsrs6/U5g+79VA0=;
 b=EWLsoBGksO4ouuHLsGz0xf9JeH1s6jVXD2NPYyKnUgumBRiWcGD2Jl2MlK81GopNozBABy
 c8MTqAhOEgNU1sxC+C66qFT8TjkSKnT7KVu1XuqnFC8H/K41YDmdVIroD3+kOlgZYMxASz
 cF92u1FNrGBWSUGzLcN7gN31uG12ZgU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-Qg834xhkP7S70wwV-lzR8g-1; Tue, 18 Feb 2020 04:02:30 -0500
Received: by mail-ot1-f71.google.com with SMTP id a20so12058899otl.11
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 01:02:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fp0h7kMEK+2AYsXdNqQ5M/+v7Jl1wx8KQ7CrLInoRag=;
 b=HwMoOx5YLtTpSEUK4T4MFR/yQEVLo3dfTissnCw7Xlai/+okRhVtWNvqKAJWgrPXH2
 JnrkFM2+bxI75ItEiPShhPZDI1LVMB/YjyMC0nh5yltE3a7E+tHaijYdVjt3WF/36W8r
 bYl99HWGQHdw+k8tjEJLpDsxksKPIJzrsrh+LdfK5/qyabbeCfspbApg7kelTl4CoJJu
 idQFL0hM7qlkppMGejrvuz4il+5o82+2rN0TzWpwDbfPbgE2RUrVr3b1pPxEzhWHMxuO
 XopWOMXK6mahiCV11Fn1DgoJoZAVeLuqyg88Zi5Cfx2s3zAIx0gfaYOS05etROsnytph
 8tVA==
X-Gm-Message-State: APjAAAXl10A4XsUr0fBVv9F39nuteWyifeXu9pKGy+VoMd0dmTB9s3WX
 wUiuK3A1vDLNTZmMPJW24n8R3NIqXzH9ur2YfPfaFWS7DX+rIHjtyngSlbvOYJHGcLtOIbIe9NC
 F0vdw22ES+NyKuxZA5H0wOCR1TEk=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr14514018otl.118.1582016549310; 
 Tue, 18 Feb 2020 01:02:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7mk/7ah1hvG3m2uIuByGMZxxcRpQo0iStNNu17qke7IEUiU45FyeQns3dHHjiNjXFksXQWSjqXlMYIqubgdo=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr14514002otl.118.1582016548992; 
 Tue, 18 Feb 2020 01:02:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
 <20200217133638.GB14410@rei>
 <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
 <20200218082506.2hbjglknpqdo3upm@vireshk-i7>
In-Reply-To: <20200218082506.2hbjglknpqdo3upm@vireshk-i7>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Feb 2020 17:02:17 +0800
Message-ID: <CAEemH2du9GQ17PC5uyGHdshErCSjL_qxXuWabRFpORBujQyX-w@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: Qg834xhkP7S70wwV-lzR8g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0778600860=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0778600860==
Content-Type: multipart/alternative; boundary="0000000000006ed21c059ed5ee45"

--0000000000006ed21c059ed5ee45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2020 at 4:25 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> On 18-02-20, 09:15, Li Wang wrote:
> > On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:
> >
> > > ...
> > > > > +static struct tst_test test =3D {
> > > > > +       .min_kver =3D "5.2",
> > > > >
> > > >
> > > > I suggest removing .min_kver check in all of the tests to let they
> can be
> > > > running on many distributions(which backport the features).
> > >
> > > If we do that we have to explicitely check for ENOSYS errno in each
> > > test, quite possibly with a dummy call to the tested syscall in test
> > > setup, because once these calls gets libc wrappers we will no longer
> > > call the tst_syscall() that checks for it.
> > >
> >
> > +1 add dummy call to the tested syscall in the setup.
> > Agree, thanks for point out this.
>
> Not sure if I understood it very clearly and don't want to spam everyone
> with an
> incorrect patchset still missing this point and so asking here :)
>
> How exactly would the setup() routine look like? Something like this ?
>
>         syscall(#NR, ##__VA_ARGS__);
>

I suggest to use tst_syscall(...);.

A dummy call in setup() just helps check the ENOSYS errno, something like:

$ cat testcases/cve/cve-2016-7117.c |grep setup -A 10
static void setup(void)
{
        ...
        tst_syscall(__NR_recvmmsg, 0, 0, 0, 0, 0);
}

--=20
Regards,
Li Wang

--0000000000006ed21c059ed5ee45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Feb 18, 2020 at 4:25 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 18-02-20, 09:15, Li Wang wrote:<br>
&gt; On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis &lt;<a href=3D"mailto:chr=
ubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; ...<br>
&gt; &gt; &gt; &gt; +static struct tst_test test =3D {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.min_kver =3D &quot;5.2&quo=
t;,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I suggest removing .min_kver check in all of the tests to le=
t they can be<br>
&gt; &gt; &gt; running on many distributions(which backport the features).<=
br>
&gt; &gt;<br>
&gt; &gt; If we do that we have to explicitely check for ENOSYS errno in ea=
ch<br>
&gt; &gt; test, quite possibly with a dummy call to the tested syscall in t=
est<br>
&gt; &gt; setup, because once these calls gets libc wrappers we will no lon=
ger<br>
&gt; &gt; call the tst_syscall() that checks for it.<br>
&gt; &gt;<br>
&gt; <br>
&gt; +1 add dummy call to the tested syscall in the setup.<br>
&gt; Agree, thanks for point out this.<br>
<br>
Not sure if I understood it very clearly and don&#39;t want to spam everyon=
e with an<br>
incorrect patchset still missing this point and so asking here :)<br>
<br>
How exactly would the setup() routine look like? Something like this ?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall(#NR, ##__VA_ARGS__);<br></blockquote><d=
iv>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small"=
>I suggest to use tst_syscall(...);</span><span class=3D"gmail_default" sty=
le=3D"font-size:small">.</span></div><div><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">A dummy call in setup() just helps check th=
e ENOSYS errno, something like:</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">$ cat testcases/cve/cve-2016-7117.c |grep setup -A 10<br>static void=
 setup(void)<br>{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_syscall(__NR_recvmmsg, 0, 0, 0, 0, 0);<br>}<br></div></div><=
div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></d=
iv><div>Li Wang<br></div></div></div></div>

--0000000000006ed21c059ed5ee45--


--===============0778600860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0778600860==--

