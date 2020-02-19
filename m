Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTP id F2A60163BBE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 05:02:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DBF863C20CF
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 05:02:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0B03E3C07D0
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 05:02:19 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A099260066C
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 05:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582084937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ulb1A23Dxs+l5KqKY0jBmtz5HDGAn+pr8XvisMyaLi8=;
 b=g/gOzZphj9CTck3F0F4ro0L0ec+DA9rDX4J907gwff8XVWVs4MROFV9EPXkjN63lJEceHJ
 O9VdaLJRmsf/uPRyqD0CG0Frss10+rik8csp2YiftkPbBx2LZw89MAT16o1t21GUUCk58O
 7f/SrReZhCZUbJ5o2x1bhD/GRhSfhTc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-APkiBYbwNRSirm2bfAIbcw-1; Tue, 18 Feb 2020 23:02:14 -0500
Received: by mail-oi1-f198.google.com with SMTP id 21so1379179oiy.15
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 20:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1GU7r5O/YdXUuQFqF0d//DyU3BfkzC+R+pfeHYl7EE=;
 b=fbYyzPBqGsTycW6bCM/a8nQDyJp9+tBEBgJGW1oaA+fL+BXMF8DgURYp4rzouCHjQM
 2xt1y0AAO/opxz9rZGjvrGDmQxHxruxGAoPoJWXnVuChe4pvvgUN3F/ezZpeUXtrpOXd
 SQQFGMOBCw7HwZfzvppjOGEiv6Th81I6Fzv/XWHv+g7nnO6ikx1MaIl4Kd9/dvSyKfo2
 C5fCbSmjeigOLlXGU+zMAcAFy9rQFMz20eJOzTV5AZsXijStuiSsBnyvYzVrt0+v/gFa
 lfmINNpwfIgsGaxudzxDLtHSo8tZsEbyUmBr5oTa0DNwAklMIC2UZqMgKjJf1oq4QLUX
 OAvQ==
X-Gm-Message-State: APjAAAVZSV7mA2S7H6xPJJKctT7LwlTmIBhwp281Q9/jKD05FPBmPCgR
 GkD2x4YG10+OFhyTKNrcbYOrMcJx7ZasVhZUEKhwiZndN1yUCPWGzLTnLLAGdo/zmSksglpIe5Z
 1e2gK/uy2FplPJ5oUXn15IgNATaE=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr3258064oic.138.1582084934010; 
 Tue, 18 Feb 2020 20:02:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFJCSYjqTh5KY5zPDijTFn3jp0zadc9Es5n5R8XGPIWKKPBS86fDgPpcus54ydVSu1Bt1R352ZulV6VKgoJn0=
X-Received: by 2002:a05:6808:8ee:: with SMTP id
 d14mr3258041oic.138.1582084933642; 
 Tue, 18 Feb 2020 20:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20200208092014.24824-1-liwang@redhat.com>
 <20200218162739.GA9985@rei.lan>
In-Reply-To: <20200218162739.GA9985@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 Feb 2020 12:02:02 +0800
Message-ID: <CAEemH2c1KJnBEizhB6_7Hqnkryg2QdhKeiWeZEc7oorPvmjgnQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: APkiBYbwNRSirm2bfAIbcw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] lib: add .request_hugepages to reserve
 hugepage
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
Content-Type: multipart/mixed; boundary="===============0654917269=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0654917269==
Content-Type: multipart/alternative; boundary="000000000000798e9e059ee5da25"

--000000000000798e9e059ee5da25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cyril Hrubis <chrubis@suse.cz> wrote:

...
> > +
> > +             mem_avail =3D SAFE_READ_MEMINFO("MemFree:");
> > +     }
>
> I guess that we don't have to bother with MemAvailable here, since we do
> drop the system caches the MemFree should be equal to MemAvailable. So I
> would be for reading just MemFree unconditionally here.
>

+1 yes, that's right.


> If you agree with this change I can change it before applying.
>

Of course yes, feel free to do that (and remember to add the changes which
Petr suggested).

--=20
Regards,
Li Wang

--000000000000798e9e059ee5da25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@s=
use.cz</a>&gt; wrote:<br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-si=
ze:small">...</span><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem_avail =3D SAFE_RE=
AD_MEMINFO(&quot;MemFree:&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
I guess that we don&#39;t have to bother with MemAvailable here, since we d=
o<br>
drop the system caches the MemFree should be equal to MemAvailable. So I<br=
>
would be for reading just MemFree unconditionally here.<br></blockquote><di=
v>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small">=
+1 yes, that&#39;s right.</span></div><div><span class=3D"gmail_default" st=
yle=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
If you agree with this change I can change it before applying.<br></blockqu=
ote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">O=
f course yes, feel free to do that (and remember to add the changes which P=
etr suggested).</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<b=
r></div></div></div></div>

--000000000000798e9e059ee5da25--


--===============0654917269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0654917269==--

