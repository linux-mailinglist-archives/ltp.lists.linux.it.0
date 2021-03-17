Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5633EF48
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:08:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A05713C61F0
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 12:08:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 713073C2D08
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:08:44 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BE83A68FF40
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 12:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615979322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vn/TgD07iFPcLtDJ9ulr8Vmr8d7RDKalNAxtlLAlWiY=;
 b=ic+xBDi271phRmSnf9exoHTm7HTIr2KuPDMdXyePUBefe2WvJj6uQdrK7t8Kx0GPQGOEbf
 QGlNI4CyK3tDoG+VgrmsgAkqOeFxJvMAQBEU6ZghUaCOfvU1yhJ3JPcjLPJnsPWRppR7+f
 ON9J3YI+ejmwKKEQq+QqwDbHL+ErG+0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-xkKmLt5nPeSATOAEDtVTvw-1; Wed, 17 Mar 2021 07:08:40 -0400
X-MC-Unique: xkKmLt5nPeSATOAEDtVTvw-1
Received: by mail-yb1-f199.google.com with SMTP id y7so44328291ybh.20
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 04:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vn/TgD07iFPcLtDJ9ulr8Vmr8d7RDKalNAxtlLAlWiY=;
 b=JHtXvhuC3p31d8iHg8zhoxrFEWsL4lkvEZu5tjtCf25fy94vh+aD0aGseBi5Bv+0ob
 y7hcXzqzSovZOSfCAOPce22NN9OIdez8IsS0+4Dz0fh/gwLCBqunBmGP77eZk99mXI+g
 T8VrOZyhHaFLKai4fq/kIjy27Bh09KqF5q1ctfFOFP4RAwMGhmUgwefZEEBjvEADTpfR
 wvzxJ+oe6AAEd4fwhQlRzMgoZn+H59Dij7y/eEHnc7WFNz+nAcyvKdhzHSwK5h/vnIyG
 JvQDSqu8RjFM5mDRGuL6HyS+z7FxdvjH1lAyl727bQ5t7WDGsF6ngWsbDlVOgB7ayKOm
 iX/g==
X-Gm-Message-State: AOAM531ybuICMxYEB9o67BfSDiLnNQ5RsPIogzUPEbHgTMcOqUNpCrt4
 BTreLowO7AK7/ZgnAaWIuk9+J0Nf6ILKBwTUkUyrGARyzk7eTa8hvRfyHZ/Y4AEfmu2n0Oh9Ea5
 +gFPCllt2nq5HNdCRsybPGUbTm5o=
X-Received: by 2002:a25:412:: with SMTP id 18mr3793964ybe.366.1615979319644;
 Wed, 17 Mar 2021 04:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxByTkgsJtFET/HsnCNJ5c1vYpymbBgKNi3puu5CCM8BpU0ymcxZ+mVO/NwSpAI718fmg73TiE8Z3ZLR861xsU=
X-Received: by 2002:a25:412:: with SMTP id 18mr3793952ybe.366.1615979319427;
 Wed, 17 Mar 2021 04:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
In-Reply-To: <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 17 Mar 2021 19:08:27 +0800
Message-ID: <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
To: Liam Howlett <liam.howlett@oracle.com>
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
Subject: Re: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0487613823=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0487613823==
Content-Type: multipart/alternative; boundary="0000000000004c9e0705bdb9818e"

--0000000000004c9e0705bdb9818e
Content-Type: text/plain; charset="UTF-8"

Hi Liam, Petr,

Liam Howlett <liam.howlett@oracle.com> wrote:


> ...
> +       if (mprotect(addr - page_size, page_size,
> +                    PROT_READ|PROT_WRITE|PROT_EXEC)) {
> +               tst_res(TFAIL, "Cannot mprotect new VMA.");
> +               return;
> +       }
>

We got permission denied here while performing the brk02 on
x86_64/s390x(kernel-4.18~). After looking at the manual page of
mprotect(), seems the access issue caused by PROT_EXEC.

"
POSIX says that the behavior of mprotect() is unspecified if it is applied
to a region of memory that was not obtained via mmap(2).
...
Whether  PROT_EXEC has any effect different from PROT_READ
depends on processor architecture, kernel version, and process state.
If READ_IMPLIES_EXEC is set in the process's personality flags
(see personality(2)), specifying PROT_READ will implicitly add PROT_EXEC.
"

# ./brk02
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
brk02.c:41: TFAIL: Cannot mprotect new VMA

After removing the PROT_EXEC:

# ./brk02
tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
brk02.c:56: TPASS: munmap at least two VMAs of brk() passed


-- 
Regards,
Li Wang

--0000000000004c9e0705bdb9818e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Liam, Petr,</div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Liam Howlett &lt;<a href=3D"mailto:liam.h=
owlett@oracle.com">liam.howlett@oracle.com</a>&gt; wrote:<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mprotect(addr - page_size, page_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROT=
_READ|PROT_WRITE|PROT_EXEC)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;Cannot mprotect new VMA.&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div>We got permiss=
ion denied<span class=3D"gmail_default" style=3D"font-size:small"> here whi=
le performing the brk02 on</span></div><div class=3D"gmail_quote"><span cla=
ss=3D"gmail_default" style=3D"font-size:small">x86_64/s390x(kernel-4.18~).=
=C2=A0</span>After looking at the manual page of</div><div class=3D"gmail_q=
uote">mprotect(), seems the access issue caused by<span class=3D"gmail_defa=
ult" style=3D"font-size:small"> </span>PROT_EXEC.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div>&quot;<div>POSIX says that the=
 behavior of mprotect() is unspecified if it is applied<div>to a region of =
memory that was not obtained via mmap(2).<br>...<br>Whether =C2=A0PROT_EXEC=
 has any effect different from PROT_READ=C2=A0</div><div>depends on process=
or architecture, kernel version, and process state.=C2=A0</div><div>If READ=
_IMPLIES_EXEC is set in the process&#39;s personality flags</div><div>(see =
personality(2)), specifying PROT_READ will<span class=3D"gmail_default" sty=
le=3D"font-size:small"> </span>implicitly add PROT_EXEC.<br>&quot;</div><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"># .=
/brk02</div>tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s<br>brk02.=
c:41: TFAIL: Cannot mprotect new VMA<br><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">After removing the PROT_EXEC:</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div># ./brk02 <br>tst_test.c:1291: TINFO: T=
imeout per run is 0h 05m 00s<br>brk02.c:56: TPASS: munmap at least two VMAs=
 of brk() passed<br><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
<div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div><=
/div></div></div>

--0000000000004c9e0705bdb9818e--


--===============0487613823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0487613823==--

