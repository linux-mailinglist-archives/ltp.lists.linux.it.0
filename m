Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2837131041C
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 05:38:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE41F3C7359
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 05:38:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D9D243C309C
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 05:38:18 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5DD5F600485
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 05:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612499897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kk6xKEJn1HV+65GdefvW5uiQtw56hqcX6hQ0Qm7ROKg=;
 b=gBaRFcS+i6zBSlRANNsLjh3QzUP/wlq5hGtHVZ8Lr3ymvTmUh8UJK6z1pVsdUcQ2KliOn0
 5bYGGhPITw3ZoXeGEUArAteiThhZNSs4p9xrBWI782gQ5QWohQbHnwwO7RKZl11r85JxjL
 04Zv0CmZPkaewXvpIB4N6nAz8GbQllM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-6nfc4_VPM5qOe6ydrsceZQ-1; Thu, 04 Feb 2021 23:38:14 -0500
X-MC-Unique: 6nfc4_VPM5qOe6ydrsceZQ-1
Received: by mail-yb1-f197.google.com with SMTP id k7so5643429ybm.13
 for <ltp@lists.linux.it>; Thu, 04 Feb 2021 20:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kk6xKEJn1HV+65GdefvW5uiQtw56hqcX6hQ0Qm7ROKg=;
 b=L1RqpT5jTQ93StL24g30nquiMYJi9+1FuKSjY6VLtogJrUUf8bwmOTtoK4X1Aoddyu
 ad6dbFAerm2B5uEv9M48OhW04sQr0k/wpdlnrrK5fcXth2jHn7ji7V2vun6LEYg0Njpn
 h+9bk0MXkzUdexX3C3ptHGLPwU9sXIxK+WGfYZg7yIjum7SZ1BFCoS9IlQ73l1GKI+ZL
 mTNLcbdmawusbEIzltawBHi2bxAiCOlq7YT65rrAlXJ/pgcpjtenoe9Axt4uu29SQmky
 AFjvPtp9l28VyMzVdqy41efIodH8oiJLmUFuVwBxK6sQ6sBJfeqcKk7wnw0d9llAEugf
 XbXQ==
X-Gm-Message-State: AOAM533kMCeH6jlasAERXJC0r7SfD3c5Mh89l8U+IaioZOsn9JFdxNUh
 2F7fss2xvgzR8jIqLRPdVQMtkaIC4tY9a3Oi16+SLz5ShzfQVX6K4vUQihyD6kGj7jTSnUNRme8
 xGCDvKXtjt3/LZVFA1JMNxfNGZJk=
X-Received: by 2002:a25:dccc:: with SMTP id y195mr3902999ybe.366.1612499893850; 
 Thu, 04 Feb 2021 20:38:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwLHqWuRjUQKMR4PWMm90wnEbe2Ut/P7ELJS2fMw3gmTWvSAIH3o/qord4YewzcMAvGWIZ9gyOBwSCkBIl8F4=
X-Received: by 2002:a25:dccc:: with SMTP id y195mr3902987ybe.366.1612499893667; 
 Thu, 04 Feb 2021 20:38:13 -0800 (PST)
MIME-Version: 1.0
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40385FF8E@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40385FF8E@dggeml531-mbx.china.huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 5 Feb 2021 12:38:01 +0800
Message-ID: <CAEemH2fb8vHKoU-04izd0EqBz9fF2TGjE3ABaXtGkRdPxbU=Sg@mail.gmail.com>
To: zhaogongyi <zhaogongyi@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ttype: using TERRNO to macth errno
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
Content-Type: multipart/mixed; boundary="===============1250352618=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1250352618==
Content-Type: multipart/alternative; boundary="0000000000005cdef705ba8f63fa"

--0000000000005cdef705ba8f63fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gongyi,

Thanks for your work!

That'd be awesome if you posting/sharing the method of your script too.

On Fri, Feb 5, 2021 at 11:44 AM zhaogongyi <zhaogongyi@huawei.com> wrote:

> Hi Li
>
>
>
> The problem of wrong usage of TTERRNO has been checked all of the project
> by my local script.
>
>
>
> The problem of wrong usage of TERRNO will be fixed in my next patch.
>
>
>
> Thank You
>
>
>
> *=E5=8F=91=E4=BB=B6=E4=BA=BA:* Li Wang [mailto:liwang@redhat.com]
> *=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:* 2021=E5=B9=B42=E6=9C=885=E6=97=A5=
 10:49
> *=E6=94=B6=E4=BB=B6=E4=BA=BA:* zhaogongyi <zhaogongyi@huawei.com>
> *=E6=8A=84=E9=80=81:* LTP List <ltp@lists.linux.it>
> *=E4=B8=BB=E9=A2=98:* Re: [LTP] [PATCH] ttype: using TERRNO to macth errn=
o
>
>
>
> Hi Gongyi,
>
>
>
> Any possibility of finding a way to correct all of the unprecise res-flag=
s
> in LTP tests?
>
>
>
> --
>
> Regards,
>
> Li Wang
>


--=20
Regards,
Li Wang

--0000000000005cdef705ba8f63fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Gongyi,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Thanks for your work!</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Tha=
t&#39;d be awesome if you posting/sharing the method of your script too.</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Feb 5, 2021 at 11:44 AM zhaogongyi &lt;<a href=3D"mailto:zhaogon=
gyi@huawei.com">zhaogongyi@huawei.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-CN">
<div class=3D"gmail-m_3888689763197905654WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">Hi Li<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">The problem of wrong usage =
of TTERRNO has been checked all of the project by my local script.<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">The problem of wrong usage =
of TERRNO will be fixed in my next patch.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)">Thank You<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:Calibri,sans-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span>=
</p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:=E5=BE=
=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif">=E5=8F=91=E4=BB=B6=E4=BA=BA<span=
 lang=3D"EN-US">:</span></span></b><span lang=3D"EN-US" style=3D"font-size:=
11pt;font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif"> Li Wang =
[mailto:<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redha=
t.com</a>]
<br>
</span><b><span style=3D"font-size:11pt;font-family:=E5=BE=AE=E8=BD=AF=E9=
=9B=85=E9=BB=91,sans-serif">=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span lang=
=3D"EN-US">:</span></span></b><span lang=3D"EN-US" style=3D"font-size:11pt;=
font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,sans-serif"> 2021</span><s=
pan style=3D"font-size:11pt;font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=
=91,sans-serif">=E5=B9=B4<span lang=3D"EN-US">2</span>=E6=9C=88<span lang=
=3D"EN-US">5</span>=E6=97=A5<span lang=3D"EN-US">
 10:49<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span lang=3D"EN-US">:</span></b><span=
 lang=3D"EN-US"> zhaogongyi &lt;<a href=3D"mailto:zhaogongyi@huawei.com" ta=
rget=3D"_blank">zhaogongyi@huawei.com</a>&gt;<br>
</span><b>=E6=8A=84=E9=80=81<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> LTP List &lt;<a href=3D"mailto:ltp@lists.linux.it" target=3D"_blank=
">ltp@lists.linux.it</a>&gt;<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3D"EN-US">:</span></b><span lang=3D"=
EN-US"> Re: [LTP] [PATCH] ttype: using TERRNO to macth errno<u></u><u></u><=
/span></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Gongyi,<u></u><u></u></span>=
</p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Any possibility of finding a wa=
y to correct all of the unprecise res-flags in LTP tests?<u></u><u></u></sp=
an></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-- <u></u><u></u></span></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards,<u></u><u></u></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Li Wang<u></u><u></u></span></p=
>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000005cdef705ba8f63fa--


--===============1250352618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1250352618==--

