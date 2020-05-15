Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1C31D469F
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:04:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DFBCE3C53A8
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:04:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 31F563C539E
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:04:25 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 856A5601F76
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589526262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+4ZP/sJGDeYGTChocoG8lQKmakXAY/u9gIebFGYdCw=;
 b=VchRZemdiFcEQXV4R0/wueg1pt9EtbE30Kd0uE7cCFiXP7oe3cbDVWhFI7H/dVWO5hmGzj
 Q+T7NZgW9/sx0894EL062mxK+mjN4q/9L7zZ32wvWf77d7epvEUHfE+lMMHD4VCVGZhzRk
 LjQgmMAIzowd/GSwvZo2b4FKiPDObd4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-nCFS_k0oMfeNW6NCRZauyg-1; Fri, 15 May 2020 03:04:20 -0400
X-MC-Unique: nCFS_k0oMfeNW6NCRZauyg-1
Received: by mail-lf1-f71.google.com with SMTP id p9so518045lfh.6
 for <ltp@lists.linux.it>; Fri, 15 May 2020 00:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+4ZP/sJGDeYGTChocoG8lQKmakXAY/u9gIebFGYdCw=;
 b=U/VVuY7WIdLJ/JiOCG4HgIAQEOAD1rRhebzJlb6A/dJsmfCorwHAKwuEZZpGj8RKQs
 Uv1DSEc9D1QLWIvYf+XA5/EzGxe/9oxteAttvOhib+vF12y2HaKIwUt7qbW4eHkJqBn0
 NknGad0XX617WM3bPlDhBkyf4gOKFm9YhL7rFizSifTVl49eQlC8DxpqyJIOUdhIZ/YQ
 /GcymiHO9D15Ugk6IRumR5zhnwD6W+/lkx0BPSgsg8hr7oRey0FFYExSaHEJkhoDALfZ
 Yi2k3YwgxcYyb0OugPU7x5J2KsmzODFgYZAIGBh6KidbTXsPg9DDKwK0vbTURyCGF+6L
 laAw==
X-Gm-Message-State: AOAM531gj8fA4YqixBMo1o/KNhLpapPMNzrmEliANtD56NO5MR5KtY69
 cDLsX+7F79A85ojF4HWxpneKMDFbnnoFz+nHWTHSz2d68d6qzmXeayUeSHxr7obvl9Tn0zQHWqr
 alr0JtiUQQFq6FkI0ohZOuGXo+0Y=
X-Received: by 2002:a2e:5451:: with SMTP id y17mr1320644ljd.6.1589526258823;
 Fri, 15 May 2020 00:04:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6XcmjOe99XygMLE6puAgJASLpdh3aYZzyxBDCNnETwOvsL7lvWK8fEqIf/v6z2f74S6f7chJ97J723zOaRS4=
X-Received: by 2002:a2e:5451:: with SMTP id y17mr1320632ljd.6.1589526258555;
 Fri, 15 May 2020 00:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200514190906.27130-1-pvorel@suse.cz>
 <CAEemH2e5G53VPLp4bOe_i-2_4eRSF9dbTC378rqN-AwGanUTEw@mail.gmail.com>
 <20200515062221.GB5117@dell5510>
In-Reply-To: <20200515062221.GB5117@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Fri, 15 May 2020 15:04:06 +0800
Message-ID: <CAEemH2fQ3yfDfNqNeUfLAAWY6hUDcEybbU+dK=hwrwg2rFj60A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] INSTALL: Update requirements
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
Content-Type: multipart/mixed; boundary="===============0736781460=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0736781460==
Content-Type: multipart/alternative; boundary="00000000000000b99305a5aa6c64"

--00000000000000b99305a5aa6c64
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 2:22 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> thanks for your review!
>
> > As we know most distributions provide the requirements packages already,
> > so I'm thinking if we can replace the download link only by installing
> > commands, that will make people easily prepare their test environment.
>
> > Which something maybe likes:
> > --------------------------------------
>
> > +       #### Debian/Ubuntu
> > +       ```
> > +       sudo apt-get install make
> > +       sudo apt-get install pkgconf
> > +       sudo apt-get install autoconf
> > +       sudo apt-get install automake
> > +       sudo apt-get install byacc
> > +       sudo apt-get install flex
> > +       sudo apt-get install m4
> > +       ```
> Maybe this:
>
> Debian / Ubuntu
> # apt install gcc make pkgconf autoconf automake bison flex m4
> linux-headers-$(uname -r) libc6-dev
>
> OpenSUSE / SLES
> # zypper install gcc make pkgconf autoconf automake bison flex m4
> linux-glibc-devel glibc-devel
>
> Fedora / CentOS / RHEL
> # yum install gcc make pkgconf autoconf automake bison flex m4
> kernel-headers glibc-headers
>
> I'd prefer it in simple form (single line) + I thought bison is more
> common than
> byacc (but maybe I'm wrong). I'm not a big fan of sudo (but can add it
> there).
>

Sure, I have no preference here :). I added the 'sudo' just because I
noticed that the INSTALL use many $ before commands which means in non-root
user.



> + Added headers and gcc. But on the other hand I wanted to have package
> reference in
> travis/*.sh (where are missing some packages which are installed by
> default with
> gcc, e.g. , but it does not harm to have it offline.
>
+1

>
> Should I remove links to the tools? And we obviously don't list a compiler.
>

Personally I think links are useless, people opened this INSTALL could also
have the ability to use google for finding the package link:).

-- 
Regards,
Li Wang

--00000000000000b99305a5aa6c64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 15, 2020 at 2:22 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
thanks for your review!<br>
<br>
&gt; As we know most distributions provide the requirements packages alread=
y,<br>
&gt; so I&#39;m thinking if we can replace the download link only by instal=
ling<br>
&gt; commands, that will make people easily prepare their test environment.=
<br>
<br>
&gt; Which something maybe likes:<br>
&gt; --------------------------------------<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0#### Debian/Ubuntu<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0```<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo apt-get install make<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo apt-get install pkgconf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo apt-get install autoconf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo apt-get install automake<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo apt-get install byacc<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo apt-get install flex<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sudo apt-get install m4<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0```<br>
Maybe this:<br>
<br>
Debian / Ubuntu<br>
# apt install gcc make pkgconf autoconf automake bison flex m4 linux-header=
s-$(uname -r) libc6-dev<br>
<br>
OpenSUSE / SLES<br>
# zypper install gcc make pkgconf autoconf automake bison flex m4 linux-gli=
bc-devel glibc-devel<br>
<br>
Fedora / CentOS / RHEL<br>
# yum install gcc make pkgconf autoconf automake bison flex m4 kernel-heade=
rs glibc-headers<br>
<br>
I&#39;d prefer it in simple form (single line) + I thought bison is more co=
mmon than<br>
byacc (but maybe I&#39;m wrong). I&#39;m not a big fan of sudo (but can add=
 it there).<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Sure, I have no preference here :). I added the=
 &#39;sudo&#39; just because I noticed that the INSTALL use many $ before c=
ommands which means in non-root user.=C2=A0</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
+ Added headers and gcc. But on the other hand I wanted to have package ref=
erence in<br>
travis/*.sh (where are missing some packages which are installed by default=
 with<br>
gcc, e.g. , but it does not harm to have it offline.<br></blockquote><div c=
lass=3D"gmail_default" style=3D"font-size:small">+1</div><div class=3D"gmai=
l_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Should I remove links to the tools? And we obviously don&#39;t list a compi=
ler.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Personally I think links are useless, people opened th=
is INSTALL could also have the ability to use google for finding the packag=
e link:).</div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--00000000000000b99305a5aa6c64--


--===============0736781460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0736781460==--

