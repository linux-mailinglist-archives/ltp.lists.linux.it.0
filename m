Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D71E160B73
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 08:18:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D37333C25BB
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 08:18:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 556C83C2387
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 08:18:02 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A98FD1401321
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 08:18:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581923879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ko2jmMk0urNdDVCbzYeQJXxDaFtk/ZZxnlkgXevW7ug=;
 b=S0JssJkRdjuGPPmCThtn07u7tBRQBUvi7okTgiiGy/NmBXiHwkB0aa6y0R53U/IWQ+twHR
 0ERA458Ru41W1rVbz5X7BScQ4i1oOS7URSG4ai5MpGsvPqV/JZ7YT9LxTZVT33CKR2wyXl
 fJ8lciHOptGtkphNjTKLs3xgDnC5ewQ=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-xXvAtCXuN1GlsTJ4YO7VTg-1; Mon, 17 Feb 2020 02:17:54 -0500
Received: by mail-oi1-f199.google.com with SMTP id 10so7802525oir.11
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 23:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKoxf2CAlNEDthWXZDjZBuZZvMAuEH8FoFyCJHpTfl0=;
 b=jqYq3rUO/yRbVdAFEV8LO2FJh0UNOrFMVPLskeN97wSFfJX1zfSZnvfKi7Mk5sp14h
 VgrDjisybBi2z5+mLZ/yVN0ooMtmL9g35gauh1GcVikJUqQlF+TO1ZbwVIwNmLu/Hd/9
 cl1TCc9/dmcKEC5/IOWy7BlXKjLUfUU1leNo46MSrByubOsJGq22qY5Y1Q3kTCuAWZPb
 3Y2yzjpuVhDa1Cyxa2YdRrxdTyHNVxPiMmw9FjWFSUSa+TA3NFBXVJl73f+ELuMTtkRI
 dY7mh9RYQPIeYTSU4K19JJJWldZCDqDmHaVq+yCSjuM3CJITOwTJfYMMbi7iaZvU23sm
 GkKA==
X-Gm-Message-State: APjAAAUBE8yvzaSzU72DepCfJyr1yv/BhFmVUu51MWwl7SPmgsXyA09+
 Nny7GrmgUyAMHzCRkred2S0vCl5TeNN4Ewdb2phRL0Nro70Ugf4323kjuRnk/AFI90ZUA/JjRW8
 ARZZJZoFLs/HyPLUw4cKl2vAM5hY=
X-Received: by 2002:aca:1913:: with SMTP id l19mr8638552oii.47.1581923873687; 
 Sun, 16 Feb 2020 23:17:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUZcDt5f6+URNyx5d0E5FzI/SmVonO/TVvukgESi3SfSDqXS/POeNbyEFRNqcvMmOcF4oc2GTew2mP2yZfVRI=
X-Received: by 2002:aca:1913:: with SMTP id l19mr8638540oii.47.1581923873390; 
 Sun, 16 Feb 2020 23:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
 <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
 <20200216131723.GA2725117@x230>
In-Reply-To: <20200216131723.GA2725117@x230>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Feb 2020 15:17:42 +0800
Message-ID: <CAEemH2cqvBnUQPpQdER0QhPc2mka47SDHoMNDqB_0wwo_S-bgQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: xXvAtCXuN1GlsTJ4YO7VTg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1500600382=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1500600382==
Content-Type: multipart/alternative; boundary="0000000000008914f5059ec05a4e"

--0000000000008914f5059ec05a4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Petr Vorel <pvorel@suse.cz> wrote:

...
> > >  include/lapi/syscalls/powerpc64.in            |  4 +
> > Is there any reason why only add syscall num for ppc64?
> The other numbers are already there:
> 01e4dc222 lapi/syscalls: Add MIPS support
> c2f27f6e9 Add syscall numbers for new file-system related syscalls
>

[sorry, forget to mention in last email]

I have checked the powerpc64.in, the series syscall number already exists
there, so this patch also includes the redundant work for powerpc64 :).

--=20
Regards,
Li Wang

--0000000000008914f5059ec05a4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz">pvorel=
@suse.cz</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"gmai=
l_default" style=3D"font-size:small">...</span><br>
&gt; &gt;=C2=A0 include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=
=3D"noreferrer" target=3D"_blank">powerpc64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +<br>
&gt; Is there any reason why only add syscall num for ppc64?<br>
The other numbers are already there:<br>
01e4dc222 lapi/syscalls: Add MIPS support<br>
c2f27f6e9 Add syscall numbers for new file-system related syscalls<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">[sorry, for=
get to mention in last email]</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I have checked the <a href=3D"http://powerpc64.in">powerpc64.in</a>, t=
he series syscall number already exists there, so this patch also includes =
the redundant=C2=A0work for powerpc64 :).</div><div><br></div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></di=
v><div>Li Wang<br></div></div></div></div>

--0000000000008914f5059ec05a4e--


--===============1500600382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1500600382==--

