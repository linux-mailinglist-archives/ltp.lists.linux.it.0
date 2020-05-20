Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B40C51DAA0A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 07:43:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 681703C4DF3
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 07:43:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 48F8B3C2055
 for <ltp@lists.linux.it>; Wed, 20 May 2020 07:43:50 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 95D6A1A01545
 for <ltp@lists.linux.it>; Wed, 20 May 2020 07:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589953428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WST3kB+6tDlY9bmw8/f6Z6DTd7NJie/eyMtJCoVXIeA=;
 b=JgC0WXK/6GK2TZQvfe2kuHg5p1cCdqTiFnVhe55hq7Shs2Xj/Lbx9XPsYpBdDtgzfkeKeA
 SB/LoeZ3JhDkijCDoB11K2EVjiBVDiVJdzO/PMoGz8KERwnS2jSeCfx8nMZWhnMK4PKw68
 WX7ajvaMBTv3mnIsPZYNCmioCdeQRGY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-0yhjEj06OQiCgg38rg661A-1; Wed, 20 May 2020 01:43:45 -0400
X-MC-Unique: 0yhjEj06OQiCgg38rg661A-1
Received: by mail-lf1-f72.google.com with SMTP id x4so622236lff.21
 for <ltp@lists.linux.it>; Tue, 19 May 2020 22:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WST3kB+6tDlY9bmw8/f6Z6DTd7NJie/eyMtJCoVXIeA=;
 b=NJ3zMwE45dVK9e3UvAoc6fbXg5m1UuNVvqojjxjz+zFQYsa0C+y8o3JJiLzGTeX9Zq
 mLhBVI46rDwgvv3yKuKeQEToPcgPt/Pas8reIKjIt3tjhXQGZMKmmsbVM4g2heokCBUL
 7Box2GsN+wZI6RfDOfSqOXuUk+reWzr5zjQuTEjUjrDjWiIu6YOjPAhBpp/Dam+yVAIF
 zoDZMXlePShIV7WrhTgCvSDKiLQ8vS+/jJPa/ahRo/765rPiRP35AaCmHpAURSPVpquZ
 8UoCv/1ZI5RrnlIAgUlNX8H+ahs31mcrLLp1FcnbYTqQbQOeP7SHIy3bBVON7s6t5mVv
 TdMw==
X-Gm-Message-State: AOAM531gSjG5/hV2jxURkJtEZPJCcxqSk43clQ31oJUtIuJAiDJnN6wv
 Q7ppdyz3ypu6L8LyqJ1uBE0vg6bKny1OlsRF11VwlopNjhx4+R52j3jukGgZzYKbqLHpY5QBN2F
 m8e3nW9OoPrYYOsbUdQG4bxvUhYE=
X-Received: by 2002:a19:23d2:: with SMTP id j201mr1565580lfj.83.1589953423969; 
 Tue, 19 May 2020 22:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6rEZO+DUvStonH+enCUhVqv2/bGyamkzzN1RppLR+xUh9sFOooSoRJWsCYzLQ/hZXlxd1OKicshawSpnxxOo=
X-Received: by 2002:a19:23d2:: with SMTP id j201mr1565570lfj.83.1589953423764; 
 Tue, 19 May 2020 22:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200520052318.3261805-1-raj.khem@gmail.com>
In-Reply-To: <20200520052318.3261805-1-raj.khem@gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 May 2020 13:43:31 +0800
Message-ID: <CAEemH2dt1NzeOmCogzw3YA2pT07tRN-VjRn1eaHJuYuyWudaKw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ptrace01: Fix missing format string
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
Content-Type: multipart/mixed; boundary="===============1104843486=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1104843486==
Content-Type: multipart/alternative; boundary="00000000000008883f05a60de167"

--00000000000008883f05a60de167
Content-Type: text/plain; charset="UTF-8"

On Wed, May 20, 2020 at 1:23 PM Khem Raj <raj.khem@gmail.com> wrote:

> Fixes
> | ptrace01.c:89:2: error: format string is not a string literal
> (potentially insecure) [-Werror,-Wformat-security]
> |         tst_res(TINFO, tc->message);
> |         ^              ~~~~~~~~~~~
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Pushed.


-- 
Regards,
Li Wang

--00000000000008883f05a60de167
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, May 20, 2020 at 1:23 PM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Fixes<br>
| ptrace01.c:89:2: error: format string is not a string literal<br>
(potentially insecure) [-Werror,-Wformat-security]<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, tc-&gt;message);<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~~~~~~~~~~~<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">Pushed.</div><br></div>=
<div>=C2=A0</div><div>--=C2=A0</div></div><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--00000000000008883f05a60de167--


--===============1104843486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1104843486==--

