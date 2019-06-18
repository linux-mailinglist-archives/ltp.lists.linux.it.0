Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B6B497AD
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 05:07:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2CDB294ADC
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 05:07:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4E7F83EA36C
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 05:07:17 +0200 (CEST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 74F40200346
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 05:07:16 +0200 (CEST)
Received: by mail-ua1-f46.google.com with SMTP id 34so4377973uar.8
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 20:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dEz2zWhOf+Ny3T6fQsD2l6CmMo45h2R3az8gWzXOq4=;
 b=adhPOfYm84uWD/AARzUAqJ6pmBIIHZAabtzNTwZk+atjfUXgQ00jllJ9/zJ0ho5tol
 Jo9rr3KBvGfhJkdohIME4gnt8zkZvXgE3yTaqIApeI2Flg2WlTd5u0d5D2RxJGUNdiJC
 8cglQyMEnMpr5KLoSEGu1LKWLkN5V3jJhSidHC0vUhg2BQyY5uGjenvBV3MWysemvtN0
 XI6eWRnJ/BQnzwGOsk/nT+1YqS852ZEE6OBv6dGcL0Z134dKFSz49LeBSzk8m+gO5V9o
 Tm7jJt6STcYCdoFJ1w4OY/vRVBwoTveNM+MZ7q+p/6eN3L4pRxwqi3iCxZA1omok3bjo
 JCyQ==
X-Gm-Message-State: APjAAAU/CClPRDeCGglDzxUtJ8GkrdM7jSgxBwLfM+JXRvZ1xybPfVK0
 vn2sJ0gJqjiRp+1hNEjqMu60owc+KRsQ1a0RwXJZmg==
X-Google-Smtp-Source: APXvYqxWq+hNyQosXvr7ZXIWAfr7cNBuPt+HD0/6u+YE4lwQDw5BAqK8jIajE7PgzbU0oaUGxME2uSGjnpJnt2CRai8=
X-Received: by 2002:a67:6d45:: with SMTP id i66mr35346658vsc.130.1560827235405; 
 Mon, 17 Jun 2019 20:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190615042048.29839-1-liwang@redhat.com>
 <20190617214901.GC19347@x230>
In-Reply-To: <20190617214901.GC19347@x230>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 Jun 2019 11:07:04 +0800
Message-ID: <CAEemH2cAFUkmmiokVwvC5YvT1QoXaANxtCjFypnYS309ietX0g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2 1/3] lib: adding .arch field in tst_test
	structure
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
Content-Type: multipart/mixed; boundary="===============1633985277=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1633985277==
Content-Type: multipart/alternative; boundary="000000000000ec3386058b9068d6"

--000000000000ec3386058b9068d6
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 18, 2019 at 5:49 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > Testcases for specified arch should be limited on that only being
> supported
> > platform to run, we now create a function tst_on_arch to achieve this new
> > feature in LTP library.  All you need to run a test on the expected arch
> is
> > to set the '.arch' string in the 'struct tst_test' to choose the required
> > arch list. e.g. '.arch = "x86_64 i386"'.
> Just one note, strings are error prone. I wonder if defining constants and
> using
> array would be too complicated for this use case.
>

I thought about that array way, but it seems a bit complicted in using.
Yes, strings are easy to involve typo but we can make a check in library.

Thanks for review.

-- 
Regards,
Li Wang

--000000000000ec3386058b9068d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 18, 2019 at 5:49 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; Testcases for specified arch should be limited on that only being supp=
orted<br>
&gt; platform to run, we now create a function tst_on_arch to achieve this =
new<br>
&gt; feature in LTP library.=C2=A0 All you need to run a test on the expect=
ed arch is<br>
&gt; to set the &#39;.arch&#39; string in the &#39;struct tst_test&#39; to =
choose the required<br>
&gt; arch list. e.g. &#39;.arch =3D &quot;x86_64 i386&quot;&#39;.<br>
Just one note, strings are error prone. I wonder if defining constants and =
using<br>
array would be too complicated for this use case.<br></blockquote><div><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">I thought abou=
t that array way, but it seems a bit complicted in using. Yes, strings are =
easy to involve typo but we can make a check in library.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Thanks for review.</div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000ec3386058b9068d6--

--===============1633985277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1633985277==--
