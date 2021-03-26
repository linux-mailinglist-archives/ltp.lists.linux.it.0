Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA7D34A397
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 10:01:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6A1D3C27E3
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Mar 2021 10:01:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DBEFC3C27AF
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 10:01:56 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id E3E2B1A010F9
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 10:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616749314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w8GKU7J7u1/AahLCBhgexA15cBSKRZewtAxALHI5RGI=;
 b=Imlm3XAi0UUhU/mWWLXHPMklYnuByROhu7tG2UUzXiXeaJ1LUOIrSbE/OVrlso86Zf22CI
 1FMxBEzlPAN7hLDC0x+S5xmBc2XTPiN+Urb+tPy8yt+jReba7gqLMLfZx8GlcUp2aylzJM
 2XgqI3iY9frAQrwAP34sAXvSsxB6M7I=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-GyAfvn05MeOezYNtXjLwjA-1; Fri, 26 Mar 2021 05:01:50 -0400
X-MC-Unique: GyAfvn05MeOezYNtXjLwjA-1
Received: by mail-yb1-f197.google.com with SMTP id f75so9049782yba.8
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 02:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8GKU7J7u1/AahLCBhgexA15cBSKRZewtAxALHI5RGI=;
 b=m7/GSYUXrXiZiWKhWqyi90V9hV2Mabgymg+41ZFxYufWmgYlza7pc1UzEevviRZkTM
 lmtfBJ29vxsTW6i1n7Dvxx2OkZKG2KuCwR4y3o1pLVFPrqexlLlpXWMQLQqt1MRzfAKn
 5Auf8PfWmAk2mGTUYMy8j+j5ptqej5sJU3oJiajQwTJTEiejKjJznnapw6bE2OOf8IPH
 hmL0k1VW3EkcBuNllcd/i+Zs2QJx1JFWTOg7Jp8rNo5jxLJz+sfCZAiLs6XCcRvFw+t3
 KbX2+HigOiozC5hNk41Edsob+x9F8oPkjwP/vjEGr9FGddgJ6pQ+o2oUKxljqKGhaiFT
 RjUw==
X-Gm-Message-State: AOAM530jIEWuEv4IMTzzQd4tUEbYcv8SZW/18jo88WyaK1IYg0ZW24H1
 3Pg66UAv4VzPng7XpBf8gqmOnftc5m3ZJOa6CyiRBI3DIc08mkFeIS53LZWPqvvV6HN03yMniJb
 KK+g0iwpN99tdony0l5ZQtt45qSI=
X-Received: by 2002:a25:874c:: with SMTP id e12mr17192247ybn.403.1616749310476; 
 Fri, 26 Mar 2021 02:01:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvl5YECXf4ARoULjEwfF4YaWf3nBvE9XfvHLbD+4ATnCiA66r+glOKDca4ZPcVbQ/9zwJ390sAC88fJrhJTGw=
X-Received: by 2002:a25:874c:: with SMTP id e12mr17192226ybn.403.1616749310297; 
 Fri, 26 Mar 2021 02:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210325181906.40688-1-qi.fuli@fujitsu.com>
In-Reply-To: <20210325181906.40688-1-qi.fuli@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 26 Mar 2021 17:01:38 +0800
Message-ID: <CAEemH2fFciCEAdVFETCEuoWegiVrYL6pp9Vv_t3atXivPzhEDg@mail.gmail.com>
To: QI Fuli <fukuri.sai@gmail.com>
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
Subject: Re: [LTP] [PATCH 0/4] Convert swapon/swapon0{1..3} to the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1293247977=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1293247977==
Content-Type: multipart/alternative; boundary="00000000000054e27805be6cc836"

--00000000000054e27805be6cc836
Content-Type: text/plain; charset="UTF-8"

Hi Fuli,


On Fri, Mar 26, 2021 at 2:20 AM QI Fuli <fukuri.sai@gmail.com> wrote:

> From: QI Fuli <qi.fuli@fujitsu.com>
>
> Convert syscalls/swapon/swapon0{1..3} to the new API
>
> QI Fuli (4):
>   libs/libltpswap: Rename and Convert libs/libltpswapon to the new API
>

I appreciate your help to convert the libltpswapon to the new API, but at
the first sight of your patchset, I was quite curious why not complete the
leftover two test swapoff/ to new then we can remove the old API totally.

So in other words, it probably makes people confusing that there exist
libltpswap/ and libltpswapon/ at the same time.

Could you help finish the rest work? :)



>   syscalls/swapon/swapon01: Convert swapon01 to the new API
>   syscalls/swapon/swapon02: Convert swapon02 to the new API
>   syscalls/swapon/swapon03: Convert swapon03 to the new API
>
>  include/libswap.h                           |  24 +++
>  libs/libltpswap/Makefile                    |  12 ++
>  libs/libltpswap/libswap.c                   |  63 ++++++
>  testcases/kernel/syscalls/swapon/Makefile   |   4 +-
>  testcases/kernel/syscalls/swapon/swapon01.c |  83 ++-----
>  testcases/kernel/syscalls/swapon/swapon02.c | 145 +++++--------
>  testcases/kernel/syscalls/swapon/swapon03.c | 227 ++++++++------------
>  7 files changed, 258 insertions(+), 300 deletions(-)
>  create mode 100644 include/libswap.h
>  create mode 100644 libs/libltpswap/Makefile
>  create mode 100644 libs/libltpswap/libswap.c
>
> --
> 2.30.2
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--00000000000054e27805be6cc836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Fuli,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Mar 26, 2021 at 2:20 AM QI Fuli &lt;<a href=3D"ma=
ilto:fukuri.sai@gmail.com">fukuri.sai@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">From: QI Fuli &lt;<a href=3D=
"mailto:qi.fuli@fujitsu.com" target=3D"_blank">qi.fuli@fujitsu.com</a>&gt;<=
br>
<br>
Convert syscalls/swapon/swapon0{1..3} to the new API<br>
<br>
QI Fuli (4):<br>
=C2=A0 libs/libltpswap: Rename and Convert libs/libltpswapon to the new API=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I appreciate your help to convert the libltpswapon=C2=A0to=
 the new API, but at</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">the first sight of your patchset, I was quite curious why not complet=
e the</div><div class=3D"gmail_default" style=3D"font-size:small">leftover =
two test swapoff/ to new then we can remove the old API totally.</div></div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">So in other words, it probabl=
y makes people confusing that there exist=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">libltpswap/ and libltpswapon/ at the same =
time.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Could you hel=
p finish the rest work? :)</div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0 syscalls/swapon/swapon01: Convert swapon01 to the new API<br>
=C2=A0 syscalls/swapon/swapon02: Convert swapon02 to the new API<br>
=C2=A0 syscalls/swapon/swapon03: Convert swapon03 to the new API<br>
<br>
=C2=A0include/libswap.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +++<br>
=C2=A0libs/libltpswap/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<br>
=C2=A0libs/libltpswap/libswap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 63 ++++++<br>
=C2=A0testcases/kernel/syscalls/swapon/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=A04=
 +-<br>
=C2=A0testcases/kernel/syscalls/swapon/swapon01.c |=C2=A0 83 ++-----<br>
=C2=A0testcases/kernel/syscalls/swapon/swapon02.c | 145 +++++--------<br>
=C2=A0testcases/kernel/syscalls/swapon/swapon03.c | 227 ++++++++-----------=
-<br>
=C2=A07 files changed, 258 insertions(+), 300 deletions(-)<br>
=C2=A0create mode 100644 include/libswap.h<br>
=C2=A0create mode 100644 libs/libltpswap/Makefile<br>
=C2=A0create mode 100644 libs/libltpswap/libswap.c<br>
<br>
--<br>
2.30.2<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000054e27805be6cc836--


--===============1293247977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1293247977==--

