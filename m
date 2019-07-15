Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B2368664
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 11:34:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BFFAA3C1D03
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 11:34:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id B499F3C18F9
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 11:34:05 +0200 (CEST)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9AD93600FD7
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 11:34:04 +0200 (CEST)
Received: by mail-vs1-f65.google.com with SMTP id r3so10876469vsr.13
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 02:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KgdlKWBOSk49Pz5x4OCvkC/d5LjltOGvnlLR1ELA3qA=;
 b=E2Jks7MB6nhQgCr29olrh7AmfMaCR8xlmdc7CNDrSb/l8feUP8/ZuoRudEAhEU+RA6
 g1epowxEXbVm1N5CMFfMBESOqUFzYZ0VSzW+hr3RIecmSVVfIoYeiMCVf1YOQYD23zs2
 IAL15d84sRXFjv4ToEjV29EKOEv3a97cxoPZrf75ttJdjmud+Ljx2vPst/RCj2Dfr4j8
 XlEZszltxRxmXswHonWJ4LKnU6dL3MD3ZpxPXxQrSG3NBuSrXL2tHc+B81UznUfsNUls
 Zbov4ckEvOn5MJUOfnCM67oieINm4BDrNt/jJYP/DzFtSeFVXvS1431Y912mI7mqo/P8
 ltMQ==
X-Gm-Message-State: APjAAAVSOFk56RMhhCeqV/3GvI1Ke4Yyy+9kp20RJqWAk+DPmPgfxWCB
 Fe2ZNXgjOJZGIrawdaIkkEgeqZzUQ/a1BUqJyyPuPw==
X-Google-Smtp-Source: APXvYqzB7iN4/y1AhCIvIVk1851CKL8vb47wFr6DFcRK1ftMbgT4vYaGJXcIYn1WHI4j8Bwq5kldo+7mNXStrDSoT/M=
X-Received: by 2002:a67:1a07:: with SMTP id a7mr14594446vsa.58.1563183243481; 
 Mon, 15 Jul 2019 02:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190607095213.13372-1-liwang@redhat.com>
 <20190703131005.GA1712@rei>
 <CAEemH2fGUABOfz=Yq6xONgmHwjaiU6n_q=9EXyZz2EUedpuK8Q@mail.gmail.com>
 <CAEemH2eMA78=5eNwJnZPJ1kw1GZnimSyBsQ+e_wrAu3E+JOoPg@mail.gmail.com>
 <20190710125954.GA5628@rei.lan>
In-Reply-To: <20190710125954.GA5628@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Mon, 15 Jul 2019 17:33:51 +0800
Message-ID: <CAEemH2ffEk0QT_LHdo6NEuy2FRkwe4j1rRgf9C0E8HzQE-V_eA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] move_pages12: handle errno EBUSY for
 madvise(..., MADV_SOFT_OFFLINE)
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
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1449414444=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1449414444==
Content-Type: multipart/alternative; boundary="000000000000f29ccd058db4f5f1"

--000000000000f29ccd058db4f5f1
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 10, 2019 at 9:00 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > iteration, the mmap() will be failed with ENOMEM(since we only have 1
> huge
> > > page in /proc/.../nr_hugepages).
> > >
> >
> > Sentence correction:
> >     It is not "only have 1 huge page in nr_hugepages", I mixed this test
> > with another case, sorry about that.
> >
> > But the justification is the same, we don't have enough memory for the
> > parent does mmap(..., MAP_HUGETLB) in a new loop.
>
> I guess I get it now, if we attempt to continue after EBUSY we unmap()
> the memory but that unmap() will happen asynchronously because the
> migration is in progress and we hit ENOMEM just in the next iteration of
> the loop.
>
> Should we then attempt to retry the mmap() on ENOMEM as well, ideally
> with exponential backoff?
>

Not very sure if that worth to do.

>
> Unfortunately we cannot reuse the TST_RETRY_FUNC() as it is because it
> exits the test with TBROK on failure, we need a function that actually
> returns the last function return value on timeout.
>

Yes, we could define a new TST_WAIT_FUNC() to return mmap() returned value
on timeout, but it seems hard to give an expected return(ERET) value for
that function, in this case, we could define the ERET as addr since we know
it, but for most situations, we can't make sure what is the address being
returned. Once the returned address is not equal ERET, then it will retry
the mmap() and do not unmmap() the previous memory. That will be terrible.

-- 
Regards,
Li Wang

--000000000000f29ccd058db4f5f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 10, 2019 at 9:00 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; iteration, the mmap() will be failed with ENOMEM(since we only ha=
ve 1 huge<br>
&gt; &gt; page in /proc/.../nr_hugepages).<br>
&gt; &gt;<br>
&gt; <br>
&gt; Sentence correction:<br>
&gt;=C2=A0 =C2=A0 =C2=A0It is not &quot;only have 1 huge page in nr_hugepag=
es&quot;, I mixed this test<br>
&gt; with another case, sorry about that.<br>
&gt; <br>
&gt; But the justification is the same, we don&#39;t have enough memory for=
 the<br>
&gt; parent does mmap(..., MAP_HUGETLB) in a new loop.<br>
<br>
I guess I get it now, if we attempt to continue after EBUSY we unmap()<br>
the memory but that unmap() will happen asynchronously because the<br>
migration is in progress and we hit ENOMEM just in the next iteration of<br=
>
the loop.<br>
<br>
Should we then attempt to retry the mmap() on ENOMEM as well, ideally<br>
with exponential backoff?<br></blockquote><div><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">Not very sure if that worth to do.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Unfortunately we cannot reuse the TST_RETRY_FUNC() as it is because it<br>
exits the test with TBROK on failure, we need a function that actually<br>
returns the last function return value on timeout.<br></blockquote><div>=C2=
=A0</div><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, w=
e could define a new TST_WAIT_FUNC() to return mmap() returned value on tim=
eout, but it seems hard to give an expected return(ERET) value for that fun=
ction, in this case, we could define the ERET as addr since we know it, but=
 for most situations, we can&#39;t make sure what is the address being retu=
rned. Once the returned address is not equal ERET, then it will retry the m=
map() and do not unmmap() the previous memory. That will be=C2=A0terrible.<=
/div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--000000000000f29ccd058db4f5f1--

--===============1449414444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1449414444==--
