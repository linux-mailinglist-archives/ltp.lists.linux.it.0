Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 614452F2F65
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 13:54:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48D653C644C
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 13:54:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C93703C2365
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 13:54:07 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id F138F1A00E32
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 13:54:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610456045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZJ8Xw8q99/RdodyaAHJXOMaWoGdqVcEQ5ZoSs7zoQk=;
 b=BiC/izdTXrynzC5HH0ArL3BbYOnYFpD7CwtHtivgN9IGa5gsxJlCCsruSttW3hno2CI0aE
 gV2SOwAS+vEV/TtoNu0a2OzePO2v3Y/i4TkGL7RRpSBDuUD9JjMbGqRPfYjPXguoe1zij3
 oWTQFJzLAhtCxLMnj0s3COFgBEAjoh0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-COjSjNemPnCAEMAFnaT3zw-1; Tue, 12 Jan 2021 07:54:02 -0500
X-MC-Unique: COjSjNemPnCAEMAFnaT3zw-1
Received: by mail-yb1-f199.google.com with SMTP id b123so2339518ybh.17
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 04:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iZJ8Xw8q99/RdodyaAHJXOMaWoGdqVcEQ5ZoSs7zoQk=;
 b=R/MliBBccBzDtgaEcLJ9BEX8Dg3jDF5K1oCfQ9R8LRLR9xQ791aECK0AW/Ct+f6Oo8
 OZQEM/ZD6VvIZ3JGNTlc1W0z0R1BtZuBxU0r/JE77Fz6xzaQucfGrd0tGJP9UxFPf/pL
 8hrp8qnHk820d21AIajwUaHXBno58O10kkvDidvfRWDDHXCgXiTdBIJEQSVg3VoxaT4d
 ImY1kmqK6YAOSAkee08p0ntVhoNC5SILC/Xc5WhTntHluNJAtkXMLDxPOSCPI2lKHqfO
 X1z+rf7QizsBnKkikBDhZDA0h9AV0QI4+0hajLEzqX756qoWTgtVimg0opJw3jyWHGoP
 gcvw==
X-Gm-Message-State: AOAM533hXI0u4gBfYt0tq1CuGAEUQsTEQCImPViWoNjlcjzYF1CYeTNM
 P/xwZCRoeF7qco+kQAM3l1gsI+h16U8VUlzQz6Ho2WqdF53lbyy9ScpwgbaDTZONhAL0oRephp7
 OOLN1ylLqriW2AFKdu/V3LE/itn4=
X-Received: by 2002:a25:6902:: with SMTP id e2mr6403707ybc.97.1610456042232;
 Tue, 12 Jan 2021 04:54:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCdqcPaSM/QsygsGacuQ9WYm8JBgjsMmvvEKZN/0cvgZnoiY617rQkwyKwS595yGpEG/gIv0gMBhoaw9q7moU=
X-Received: by 2002:a25:6902:: with SMTP id e2mr6403676ybc.97.1610456041945;
 Tue, 12 Jan 2021 04:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20210111123626.28932-1-pvorel@suse.cz>
 <CAEemH2eTEEZVZc71=HF+251t_d7Rnu7XdFY2t54u=ORwY3M-7A@mail.gmail.com>
 <X/2E2GD/wimgo5Hi@pevik>
In-Reply-To: <X/2E2GD/wimgo5Hi@pevik>
From: Li Wang <liwang@redhat.com>
Date: Tue, 12 Jan 2021 20:53:50 +0800
Message-ID: <CAEemH2cmHrUGx3WXWfh6huNh-sv_GY56A+EvGVj-BiXT3WQ32A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] autoconf: Use pkg-config for keyutils
 detection
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
Content-Type: multipart/mixed; boundary="===============0337721282=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0337721282==
Content-Type: multipart/alternative; boundary="0000000000004e99d305b8b384df"

--0000000000004e99d305b8b384df
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

Petr Vorel <pvorel@suse.cz> wrote:

> > +
> > > +AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [
> > > +    PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [
>
>
> > I guess the list-of-modules should be [keyutils-libs] but not
> [libkeyutils]?
> No problem to change that, but can you explain why?
>

From what I understanding, this macro runs the pkg-config tool to check
for the presence of packages against keyutils-libs and sets two variables:
LIBKEYUTILS_CFLAGS, LIBKEYUTILS_LIBS accordingly.

So the list-of-modules should be the precise name(or version) of the
library, am I right?
See: https://autotools.io/pkgconfig/pkg_check_modules.html



> Tested: https://travis-ci.org/github/pevik/ltp/builds/753925166


The reason for test all get passed is the "include/lapi/keyctl.h" has the
second choice to include <linux/keyctl.h> I guess.

#if defined(HAVE_KEYUTILS_H) && defined(HAVE_LIBKEYUTILS)
# include <keyutils.h>
#else
# ifdef HAVE_LINUX_KEYCTL_H
#  include <linux/keyctl.h>
# endif /* HAVE_LINUX_KEYCTL_H */

-- 
Regards,
Li Wang

--0000000000004e99d305b8b384df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.=
cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:</div><div dir=3D"ltr" c=
lass=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; &gt; +<br>
&gt; &gt; +AC_DEFUN([LTP_CHECK_LIBKEYUTILS], [<br>
&gt; &gt; +=C2=A0 =C2=A0 PKG_CHECK_MODULES([LIBKEYUTILS], [libkeyutils], [<=
br>
<br>
<br>
&gt; I guess the list-of-modules should be [keyutils-libs] but not [libkeyu=
tils]?<br>
No problem to change that, but can you explain why?<br></blockquote><br>Fro=
m what I understanding, this macro runs the pkg-config tool to check<br>for=
 the presence of packages against keyutils-libs and sets two variables:<br>=
LIBKEYUTILS_CFLAGS, LIBKEYUTILS_LIBS accordingly.<div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">So the list-of-modules should be the precise name(or v=
ersion) of the library, am I right?</div><div class=3D"gmail_default" style=
=3D"font-size:small">See: <a href=3D"https://autotools.io/pkgconfig/pkg_che=
ck_modules.html" target=3D"_blank">https://autotools.io/pkgconfig/pkg_check=
_modules.html</a><br></div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Tested: <a href=3D"https://travis-ci.org/github/pevik/ltp/builds/753925166"=
 rel=3D"noreferrer" target=3D"_blank">https://travis-ci.org/github/pevik/lt=
p/builds/753925166</a></blockquote><div><br></div><div>The reason for test =
all get passed is the &quot;include/lapi/keyctl.h&quot; has the</div><div>s=
econd choice to include &lt;linux/keyctl.h&gt; I guess.</div><div><br></div=
><div>#if defined(HAVE_KEYUTILS_H) &amp;&amp; defined(HAVE_LIBKEYUTILS)<br>=
# include &lt;keyutils.h&gt;<br>#else<br># ifdef HAVE_LINUX_KEYCTL_H<br># =
=C2=A0include &lt;linux/keyctl.h&gt;<br># endif /* HAVE_LINUX_KEYCTL_H */<b=
r></div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"=
><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004e99d305b8b384df--


--===============0337721282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0337721282==--

