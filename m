Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C223CFC10E
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 09:00:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7859A3C1C94
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 09:00:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EC4203C1414
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 09:00:03 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D4D756005F7
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 09:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573718398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vuec1awlxjptDJcTcSwkljDK1fC6xCLSXkixPDrWxkc=;
 b=Qf1pEHo/bg4SHkvLhobiWNDvZ0S8fqpxbY2S8ZswCro25haQbiT5jKlOKiQoiYnLJJ5vs3
 +7pkOyNJN5zG5bJhEC4/Gz4GkZSre/0BNcRQnNDE75qTgCrH1OysvHAMd3wp0UuXC4ovnw
 jB1V0t1mHg9wROgl/MNiDu//JJNqupg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-cqK2ccjxOmuSgyYx60ZG3A-1; Thu, 14 Nov 2019 02:59:54 -0500
Received: by mail-ot1-f69.google.com with SMTP id 22so2163025otk.20
 for <ltp@lists.linux.it>; Wed, 13 Nov 2019 23:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZvDTtjaneK4txtb4daU5/82VPg8TunDDI181E625CA=;
 b=QBbda40vl3laN2ICyyUpmF3x5rDd4j0QxCn777PLPhsbbeaBWhvn50CyGLyf5JFUg1
 AkU+L/P6yafMndCpIfqVYhGepdLPU18xi8fRuwfxwqHnSXcaqDhsiPzKMe06SsqqDza9
 WUjrUwmiYcz0dUbn0NVIAp1B8vMfqLbBnFO3wTMEmRyYYn8SBk5DiuES/wMRuPqN63dg
 1xW7mfbJoPywRS+rtJfYEYITjf58+mdm+G8bjKzANzvWcM2quAcmSqNPZnJThWXz7DS4
 RITpQYZSSJk+KgpVf3yY9xeuMbh62UGfyc1MZfN7ZTezpj0nW87lYUmdulraT1CzUjdT
 wMvw==
X-Gm-Message-State: APjAAAX3+LuFJx+MfaO8FLSX0wbmmX8YI1N3aUW9UuGQ9E9BFFqc/4+/
 csyJzHi5SwLUaGWnSWqH4G439FO1buchp2ALwEPDFAal9vz2L1vyCoadXbC+tzzRWW/H6kFcaCn
 Gb/sT5vwTAkCyWO+RI3wRCmb/+SY=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr6663332oto.264.1573718393855; 
 Wed, 13 Nov 2019 23:59:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwin/1LagwH5y4wTo3cMNjHzD5blSqX0V066SW7mbqfqekScuiCCXgog3E5NhSTpXsKhHxO+Z3JacwgymasCTA=
X-Received: by 2002:a9d:7b50:: with SMTP id f16mr6663312oto.264.1573718393570; 
 Wed, 13 Nov 2019 23:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20191113104149.42407-1-lkml@jv-coder.de>
 <CAEemH2eP-ibqs=Mc-aMYUxj7CJ-u9CUZnkD8=Ro_2td9StPVZQ@mail.gmail.com>
 <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
In-Reply-To: <e506bf38-f1d9-6f9e-e4cd-6edf24f74cd9@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Thu, 14 Nov 2019 15:59:42 +0800
Message-ID: <CAEemH2dWkKyx38HFNKDk6Lt1KiDYry9WVDx9Xzg7fVAkp3kOww@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
X-MC-Unique: cqK2ccjxOmuSgyYx60ZG3A-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] configure.ac: Fix --with* options
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2036852366=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2036852366==
Content-Type: multipart/alternative; boundary="000000000000d37149059749dd9f"

--000000000000d37149059749dd9f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

On Thu, Nov 14, 2019 at 2:31 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> ...
> > From the original intention, it likely to set yes as the default, so
> > maybe the [action-if-not-given] should as  [with_expect=3Dyes]?
> Maybe, but I did not want to change the current behavior here. This
> should be done in another patch.
>

Ok, sure.


> >
> >
> >     -# testcases/realtime requires bash and python.
> >     -if test "x$with_bash" =3D xyes && test "x$with_python" =3D xyes; t=
hen
> >     -    AC_ARG_WITH([realtime-testsuite],
> >     -      [AC_HELP_STRING([--with-realtime-testsuite],
> >     -        [compile and install the realtime testsuite (default=3Dno)=
])],
> >     -      [with_realtime_testsuite=3Dyes]
> >     -    )
> >     -fi
> >     +# TODO: testcases/realtime requires bash and python.
> >
> >
> > Why remove the judgment of bash/python here?
> It simply does not work as intended. See last part of my patch descriptio=
n:
>

Ah, sorry for missing this part.


> Defining AC_ARG_WITH within an if to express dependencies does not work.
> ./configure --with-realtime-testsuite set with_realtime_testsuite=3Dyes,
> even if with_bash=3Dno or with_python=3Dno. The check is removed complete=
ly.
>

Or, maybe we can make use of AS_IF here? and I noticed there are many
places that use "if test ..." in the configure.ac file. That looks tangly..=
.


>
> I though removing it is better than leaving something that does nothing
> anyway
>

Indeed.

--=20
Regards,
Li Wang

--000000000000d37149059749dd9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Joerg,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Nov 14, 2019 at 2:31 PM Joerg Vehlow =
&lt;<a href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l_default" style=3D"font-size:small">...</span><br>
&gt; From the original intention, it likely to set yes as the default, so <=
br>
&gt; maybe the=C2=A0[action-if-not-given] should as =C2=A0[with_expect=3Dye=
s]?<br>
Maybe, but I did not want to change the current behavior here. This <br>
should be done in another patch.<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Ok, sure.</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# testcases/realtime requires bash and python.<br>
&gt;=C2=A0 =C2=A0 =C2=A0-if test &quot;x$with_bash&quot; =3D xyes &amp;&amp=
; test &quot;x$with_python&quot; =3D xyes; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 AC_ARG_WITH([realtime-testsuite],<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 [AC_HELP_STRING([--with-realt=
ime-testsuite],<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [compile and install t=
he realtime testsuite (default=3Dno)])],<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 [with_realtime_testsuite=3Dye=
s]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0-fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0+# TODO: testcases/realtime requires bash and pytho=
n.<br>
&gt;<br>
&gt;<br>
&gt; Why remove the judgment=C2=A0of bash/python here?<br>
It simply does not work as intended. See last part of my patch description:=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Ah, sorry for missing this part.</div></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
Defining AC_ARG_WITH within an if to express dependencies does not work.<br=
>
./configure --with-realtime-testsuite set with_realtime_testsuite=3Dyes,<br=
>
even if with_bash=3Dno or with_python=3Dno. The check is removed completely=
.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Or, maybe we can make use of AS_IF here? and I noticed th=
ere are many places that use &quot;if test ...&quot; in the <a href=3D"http=
://configure.ac">configure.ac</a> file. That looks=C2=A0tangly...</div></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I though removing it is better than leaving something that does nothing <br=
>
anyway<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Indeed.</div></div><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000d37149059749dd9f--


--===============2036852366==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2036852366==--

