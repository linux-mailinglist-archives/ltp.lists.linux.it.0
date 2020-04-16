Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E671ABC67
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 11:13:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17CDF3C648E
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 11:13:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A6EDC3C2AF0
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 11:13:31 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B20B110005F3
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 11:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587028409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hz2k98qlQW2WmyiGM4n40WfuGUPF56CuCB501Wiktyg=;
 b=Qk4GFJJytIXoD/bm53Qt3lWJb9ahjpw196i3IJ9zU7bTI8KiDH7vZQvGQGsYD+CEXXK34t
 1l+YWUHN/GzpLzGIRToj2VmQb4wKa48aGT/LkpB1q6lv7y03DSP7AlJRb/qakkTsd/y7V7
 N9EPcg2IIXkdlHuINoKOtwBv8gRJykk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-RK6d1eiXNoKol1DwU3L7Xw-1; Thu, 16 Apr 2020 05:13:26 -0400
X-MC-Unique: RK6d1eiXNoKol1DwU3L7Xw-1
Received: by mail-ot1-f69.google.com with SMTP id t23so2742830otq.18
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 02:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K/9xCyh3vjAm7gFwy+Hwa8Lwp24xuka5Fbr2GNelysg=;
 b=X3O5Pms8YNhg7AL0kb2byJyst07cRhuOHSXZBME0zmpgRgI0ClAd4qoQA0KkIeB9ss
 z8SY5dd0XstEYgAmOC0yiCrRyYJNPYCBlKTrdnWEB7MK2HDzbNZ4ZC6tHiVGyL4zdXwa
 lB+EXks7kwLL8QYXSdcSJzvNdbqiOC2yep7ik3zjk69hX53tnxiOJEPA3HgG7w/IxtKc
 pEObPrU2cptqfQQ+WHqbD0/T1x4W/UX/Sxgv5AaZSiee7Q4MiLHhSeawerRXdS+yD6Ls
 Sj1a9ENc6Y7izPFr+4C5vrDOl4PjqH+JCos1wq6bII7+n5mrkqyx51NC95Q+jSYimKhe
 sMmw==
X-Gm-Message-State: AGi0PuadWJ79/CxMj1bXoupWoosniAIj/f3bDnnfLt+2rphdTNplaN70
 eCCgjqmCdoC9T7LkgCxTPwSlFEhsj58RGKgOkfDyjgZbp9aEl0LxsHxktTJnHjwZ0exFT4yEB8E
 R89Ae8Eauymaq4m9TZzSqqH1TNCY=
X-Received: by 2002:a9d:75cc:: with SMTP id c12mr4296660otl.272.1587028405548; 
 Thu, 16 Apr 2020 02:13:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypJFFtPQmOyZEeVxO5l706uRBrOs1M1h4dHZAkp0GF/qtsT7TURdjkmEmCfflKHxOOwIZYDfAWTEfovar7eT0VA=
X-Received: by 2002:a9d:75cc:: with SMTP id c12mr4296646otl.272.1587028405228; 
 Thu, 16 Apr 2020 02:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200401083228.GA18685@dell5510> <20200401093934.GA23773@yuki.lan>
 <20200409074505.GA2601@dell5510>
 <CAEemH2fo2HOsgrS7q8s3gr5-BdLfO530f0WGszDDWmpw_V=KOg@mail.gmail.com>
 <20200415101955.GA21676@dell5510>
In-Reply-To: <20200415101955.GA21676@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Thu, 16 Apr 2020 17:13:13 +0800
Message-ID: <CAEemH2cfYNLwbSuDi+_GUi-rWxhw2TE201DzSiLOX3MnQnee+g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] hugemmap01 warnings with -i [was Re: LTP compilation
 broken with -fno-common]
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
Content-Type: multipart/mixed; boundary="===============1524667629=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1524667629==
Content-Type: multipart/alternative; boundary="00000000000057ae8f05a364d821"

--00000000000057ae8f05a364d821
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Wed, Apr 15, 2020 at 6:20 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > After building LTP with CFLAGS=3D"-fno-common" locally, I just find mor=
e
> > places that need to do the same improvement.
>
> >     ltp/testcases/kernel/controllers/libcontrollers/libcontrollers.h:56=
:
> > multiple definition of `num_line'
> >     ltp/lib/../include/tst_hugepage.h:16: multiple definition of `Hopt'
>
> > Sorry for involving the definition in tst_hugetlb.h without 'extern'
> issue
> > many hours ago. It'd be appreciated if you can fix them together in you=
r
> > coming patch.
> BTW that's a fix 156f91396 ("hugetlb: move nr_opt to tst_hugepage.h")
>
> I haven't checked whether -i worked without warning before, but not it
> produces it:
>

This is not introduced by hugetlb recent fixes, the warning always exists
there in tag ltp-full-20200120.
Anyway, it's a tiny issue and I will have a look when available :).

--=20
Regards,
Li Wang

--00000000000057ae8f05a364d821
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Apr 15, 2020 at 6:20 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; After building LTP with CFLAGS=3D&quot;-fno-common&quot; locally, I ju=
st find more<br>
&gt; places that need to do the same improvement.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0ltp/testcases/kernel/controllers/libcontrollers/lib=
controllers.h:56:<br>
&gt; multiple definition of `num_line&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ltp/lib/../include/tst_hugepage.h:16: multiple defi=
nition of `Hopt&#39;<br>
<br>
&gt; Sorry for involving the definition in tst_hugetlb.h without &#39;exter=
n&#39; issue<br>
&gt; many hours ago. It&#39;d be appreciated if you can fix them together i=
n your<br>
&gt; coming patch.<br>
BTW that&#39;s a fix 156f91396 (&quot;hugetlb: move nr_opt to tst_hugepage.=
h&quot;)<br>
<br>
I haven&#39;t checked whether -i worked without warning before, but not it<=
br>
produces it:<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">This is not introduced by hugetlb recent fixes=
, the warning always exists there in tag ltp-full-20200120.</div><div class=
=3D"gmail_default" style=3D"font-size:small">Anyway, it&#39;s a tiny issue =
and I will have a look when available :).</div></div></div><div><br></div>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Rega=
rds,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000057ae8f05a364d821--


--===============1524667629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1524667629==--

