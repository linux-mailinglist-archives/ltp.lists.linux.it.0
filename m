Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F6B2B7A60
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 10:30:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61B4F3C30AA
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 10:30:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 366B03C64A6
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 17:07:26 +0100 (CET)
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D72291000B08
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 17:07:25 +0100 (CET)
Received: by mail-qv1-xf41.google.com with SMTP id y11so8977193qvu.10
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 08:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brn0Ul7CxD9Ld7ryLRlzBn8cgzKDnYooxP11Bw5KBtk=;
 b=VjS6nZOrdd6QPKTeZ9Gl6mVsWzB1tORXTADyataa2vxrpJypdNCF8rPemlYsz3F5TD
 8JyAkxhG9uCpckZYVzZ3xEWOK2ShgZb+jrecmwJ5CXFx5Cg4K9HiberlWQP95xn7cXhk
 SutC/9FbI8d2xdNJeskFW4k3XY9q1+Xnjn1cZxrIWQ020iCXylz3PR7ouy0jCoO5zL6J
 9AX8k6QOpnPzQ9AhwmipNiZ+m3G32iyIOP04AEzSe9XG6yiTHs74yovgDwc/ekJMvykX
 05qfhUkghN6y27c1/MYLn+YZ16vb+z3rKMK0FlLebiRNbDvkyhsP6QtxR4Yh3Up+KoN7
 FWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brn0Ul7CxD9Ld7ryLRlzBn8cgzKDnYooxP11Bw5KBtk=;
 b=CnTiSwBCl6hlfhDHNvMSgLeQcWXzRUIGwrnaQwqEx8WqCkERUN2DjT8JRzbbYxZNIz
 u9aM3z+njnlScTu9bfJC6tpoIHxWDtIlY01BzWEkUtzCIExM4KXE5WGzXhDxNnCQ9tSo
 k/Nrbog5iEgkPL33qdbGef0z2RPQtwu3zcJDXONeIghKQ9ysDNuEyOMwqcEu1MFpApv4
 2xNnQBkv2dPcB4GoyZATmeHbDZZUBNUyz72aNGEUb7hu4lNp2r7N7edVHem8JOXTaIcp
 bR2gze7n8/UrWXWtQhpIsmVvIGyA5RSI/Pjg8+M4Kl03/Ssu0ttVodEgLa/w91B8PsdQ
 9Uzg==
X-Gm-Message-State: AOAM531MDQn01ecy2pcRgfTcwrcUvFLO5AM6I+jN1yCnGSMRibv45Y3P
 MYOEsSI9qX/X2IaHr07x347HolMKzPgr9EmH6XI=
X-Google-Smtp-Source: ABdhPJxuMlP/h9kBrjdhcT9gbqvosnSftKK+3FOQ27ba0cytKWYjOe7Df6H7EtBh1G58Ym3oaomsCq1PXC1bpOxo+9Q=
X-Received: by 2002:ad4:524d:: with SMTP id s13mr16012063qvq.19.1605542844679; 
 Mon, 16 Nov 2020 08:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20201116003345.3261577-1-raj.khem@gmail.com>
 <20201116070857.GB81864@pevik>
In-Reply-To: <20201116070857.GB81864@pevik>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Nov 2020 08:07:13 -0800
Message-ID: <CAMKF1sqjVMexm38VVt=grmL-K63=hyfA-0aoNyi=53TyFVXJ0w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 18 Nov 2020 10:30:37 +0100
Subject: Re: [LTP] [PATCH] Define SYS_futex on 32bit arches using 64-bit
 time_t
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0161396498=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0161396498==
Content-Type: multipart/alternative; boundary="000000000000edde9f05b43b92ff"

--000000000000edde9f05b43b92ff
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2020 at 11:08 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Khem,
>
> > Newer 32bit arches like RISCV32 and ARC are using 64bit time_t
> > from get go unlike other 32bit architecture therefore aliasing
> __NR_futex to
> > __NR_futex_time64 helps avoid the below errors
>
> > tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'
>
> Thanks for your fix.
>
> I wonder if this could be defined just in include/lapi/futex.h and this:
>
>
> https://github.com/pevik/ltp/commit/a20107ab47554798e0de0347dd4d7259f01675af
>

It could be but it did not work everywhere when I tried it I guess this
header has to be included in all needed placed

>
> Kind regards,
> Petr
>

--000000000000edde9f05b43b92ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Nov 15, 2020 at 11:08 PM Petr Vorel &lt;<a href=3D"=
mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Hi Khem,<br>
<br>
&gt; Newer 32bit arches like RISCV32 and ARC are using 64bit time_t<br>
&gt; from get go unlike other 32bit architecture therefore aliasing __NR_fu=
tex to<br>
&gt; __NR_futex_time64 helps avoid the below errors<br>
<br>
&gt; tst_checkpoint.c:99:17: error: use of undeclared identifier &#39;SYS_f=
utex&#39;<br>
<br>
Thanks for your fix.<br>
<br>
I wonder if this could be defined just in include/lapi/futex.h and this:<br=
>
<br>
<a href=3D"https://github.com/pevik/ltp/commit/a20107ab47554798e0de0347dd4d=
7259f01675af" rel=3D"noreferrer" target=3D"_blank">https://github.com/pevik=
/ltp/commit/a20107ab47554798e0de0347dd4d7259f01675af</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It could be but =
it did not work everywhere when I tried it I guess this header has to be in=
cluded in all needed placed=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Kind regards,<br>
Petr<br>
</blockquote></div></div>

--000000000000edde9f05b43b92ff--

--===============0161396498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0161396498==--
