Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D65D223A150
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 10:55:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 557D63C6AC6
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 10:55:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 118FD3C2599
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 10:55:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E2DCB6008DD
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 10:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596444936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/jm1h8rHPw2AI6487cD6kPP7XIrtUR13qwJo12hfyU0=;
 b=TTk5EeW4o7U1/7uOtJGsYVb3omKJNn7BJdFz68P48iKYaKnpZ2PAMc4Ymegt2ERRQX5AUm
 tTOyKkylewzl+ej24aKivOFbqKOgUXgZFtYXLmEpDstVVKFXPyca1DfYQhZhsiJPd0BvRe
 ustr3jBoICGk7TiVBCqIWV6Pc6emPSU=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-x6CWyJhVM2aemdl9jrk-zw-1; Mon, 03 Aug 2020 04:55:33 -0400
X-MC-Unique: x6CWyJhVM2aemdl9jrk-zw-1
Received: by mail-lj1-f199.google.com with SMTP id r28so2681025ljm.6
 for <ltp@lists.linux.it>; Mon, 03 Aug 2020 01:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jm1h8rHPw2AI6487cD6kPP7XIrtUR13qwJo12hfyU0=;
 b=e7ZBkZutu65AmdL89f6OPfsADYl6j+/i0LjWd7+f0XRqqvMaF4mGFYYfK0U7WfM64O
 Hs+bYpeJUnj1fFCeJXyzsIk6HUbkSULJRxMA5f7Lg9sLB6vOjIIOJXGLJAUSs9huqD+b
 T1KBpTYuB8t7RIqckx2u5lJtv0dsi6hl66aZ1vOEPa8/sPUUgZYbqCXer1d/oO2A1dP6
 LuPKmnrieyJkUJgVWO074eWeBtftd34N2LCRmam7dL2dSiNYKFh6dctaAlI+W0quMHo2
 iYcTW+ymA0v9EW/qE7+wF3OQWSioJF4yvoeErwPBVHc169j68OzuDNMTqmbwVNrF2UMW
 qiQA==
X-Gm-Message-State: AOAM531U14hangwbh2ABdrzQwm702NYmrvXF9sQqbC8hqad9qLFC/qmQ
 zq3agSyt2QxfBWHtM2ripctK4JnNvJogkYb0+qa6q3RA7Ad7zQRIy4OfsfSOee7AVocbNw0u7i3
 j0dzMVFY4AYyfOvckdIoS2KbevyM=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr4302077ljg.100.1596444931524; 
 Mon, 03 Aug 2020 01:55:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo/vRfXWxkb9ohVa6by7isIOxDqM6dZ0WRslrEqEvPf8FrZ7/tzlbgJvwk2TwLxwRbyeMNMVAc4sVGMAwSty4=
X-Received: by 2002:a2e:8144:: with SMTP id t4mr4302067ljg.100.1596444931354; 
 Mon, 03 Aug 2020 01:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <1596424914-3762-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1596424914-3762-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 3 Aug 2020 16:55:19 +0800
Message-ID: <CAEemH2cw8LPZOAypOwde22PuHAFv4mUb=QCRUyPCL+t+ZuK1OA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/timer_settime01: Use correct linux git
 tag
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
Content-Type: multipart/mixed; boundary="===============0870444891=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0870444891==
Content-Type: multipart/alternative; boundary="000000000000099e1905abf54dd6"

--000000000000099e1905abf54dd6
Content-Type: text/plain; charset="UTF-8"

>
>  #include <stdlib.h>
> @@ -188,7 +188,7 @@ static struct tst_test test = {
>         .setup = setup,
>         .tags = (const struct tst_tag[]) {
>                 {"linux-git", "f18ddc13af98"},
> -               {"linux-git", "d78c9300c51d"},
> +               {"linux-git", "e86fea764991"},
>
>
Confirmed and pushed.

-- 
Regards,
Li Wang

--000000000000099e1905abf54dd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0#include &lt;stdlib.h&gt;<br>
@@ -188,7 +188,7 @@ static struct tst_test test =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .tags =3D (const struct tst_tag[]) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;linux-git&qu=
ot;, &quot;f18ddc13af98&quot;},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;linux-git&qu=
ot;, &quot;d78c9300c51d&quot;},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;linux-git&qu=
ot;, &quot;e86fea764991&quot;},<br>
<br></blockquote><div>=C2=A0</div></div><div class=3D"gmail_default" style=
=3D"font-size:small">Confirmed and pushed.</div><div><br></div>-- <br><div =
dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></d=
iv><div>Li Wang<br></div></div></div></div>

--000000000000099e1905abf54dd6--


--===============0870444891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0870444891==--

