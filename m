Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 556E92ACF4A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 06:54:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 122A53C2F47
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Nov 2020 06:54:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A5DC73C2358
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 06:54:48 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7A25C200B9F
 for <ltp@lists.linux.it>; Tue, 10 Nov 2020 06:54:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604987685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yp0JK6H17OZin7aeWmVwsWhIcDo1251vRjFuBSSzMms=;
 b=X2EzLkcCIvy3Afa5QLzDhSkYn/2di2fO2d14GbDgvIZx6T2jktTd3iZK5I0vd2EgQTg/rs
 Hlkno6oH3373wwuKEbJZcxx2hgvfK4y/cafErSx0zIOKV2gXscThH6uYvuhRx0X2Q9RJgu
 5/kn/8V46TOk6uUGm78Y3gTKNCfGink=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-LK-_yaNNP0-y78s4R6xpXQ-1; Tue, 10 Nov 2020 00:54:42 -0500
X-MC-Unique: LK-_yaNNP0-y78s4R6xpXQ-1
Received: by mail-yb1-f199.google.com with SMTP id y11so13671366ybm.22
 for <ltp@lists.linux.it>; Mon, 09 Nov 2020 21:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yp0JK6H17OZin7aeWmVwsWhIcDo1251vRjFuBSSzMms=;
 b=rGsmgjl/LFNZ2PSwrMWQPrKyIM2EYdFcs64k2SP1jE0mzfHquFYmp5WxfJDv9S1cBH
 Gt/w2u24Wd77zQeu6IpDc/G3QXxYXIsQbWe0yZMY9Mj/cwglN1TQXN2Y7IxT+6eHgLxR
 YEiIwYYDZlLlK38XfkURoEcaAf9uCqjdf6yDe1e8eQYA/ZQjA60/zE9GZh3xQXtv0qY2
 gQJENjjJv4aU1YAjEzy4TbWyoODt1nPnEwLHeoJhRWRYIBfW68K3vCWGL0cV8VpK48q5
 8/yVXzl/XxcC8UxJowNDcGuZi+A/Ve/jYShAUanFWee7ivFVhWZQetlmdqNCiv1JRxgf
 1EAw==
X-Gm-Message-State: AOAM531nKGA76cncU11ALdAcIryunB8lyi9fpdIPdGzPkKB8fkxdOBip
 ZOyHHXUlb3BIUtRH2rBAzy28Su8HVVtH19MR5MJ3OIWDqthIPufpwg35KbKthMwgV7uSXswWB6u
 UxGRx5ql/t4+CSWdfIkMWsKJvsRU=
X-Received: by 2002:a25:d9cf:: with SMTP id
 q198mr13679531ybg.243.1604987681967; 
 Mon, 09 Nov 2020 21:54:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLcDzjSw0oUlh4q6/TBolUOKORINdcmPiFHAr4MwBZPVKrP6SrEpKai7hia6LYHVW9XNu/gF9aDu/V4+hOjag=
X-Received: by 2002:a25:d9cf:: with SMTP id
 q198mr13679512ybg.243.1604987681757; 
 Mon, 09 Nov 2020 21:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20201109164605.25965-1-mdoucha@suse.cz>
 <20201109164605.25965-2-mdoucha@suse.cz>
In-Reply-To: <20201109164605.25965-2-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 10 Nov 2020 13:54:30 +0800
Message-ID: <CAEemH2egUaO=ebaRFOZDNCZYi1QKZN168xE=_J_U_yoBH5PyLQ@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/iopl,
 ioperm: Check for SecureBoot lockdown
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
Content-Type: multipart/mixed; boundary="===============1421883370=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1421883370==
Content-Type: multipart/alternative; boundary="000000000000a3f88b05b3ba5025"

--000000000000a3f88b05b3ba5025
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 10, 2020 at 12:46 AM Martin Doucha <mdoucha@suse.cz> wrote:

> ...
>
>  include $(top_srcdir)/include/mk/testcases.mk
>
> +CFLAGS                 += $(EFIVAR_CFLAGS)
> +LDLIBS                 += $(EFIVAR_LIBS)
>

Where can we get the value of these two variables? Shouldn't we
add AC_SUBST() in the m4 file?



> --- a/testcases/kernel/syscalls/ioperm/ioperm02.c
> +++ b/testcases/kernel/syscalls/ioperm/ioperm02.c
> @@ -22,6 +22,7 @@
>  #include <pwd.h>
>  #include "tst_test.h"
>  #include "tst_safe_macros.h"
> +#include "tst_secureboot.h"
>
>  #if defined __i386__ || defined(__x86_64__)
>  #include <sys/io.h>
> @@ -45,6 +46,10 @@ static struct tcase_t {
>
>  static void setup(void)
>  {
> +       /* ioperm() is restricted under kernel lockdown. */
> +       if (tst_lockdown_enabled() || tst_secureboot_enabled() > 0)
> +               tst_brk(TCONF, "Kernel is locked down, skip this test");
>

The ioperm02 is an error test for ioperm(), it doesn't matter without the
lockdown/secure-boot status. Better to remove this from setup().

iopl02 as well.

-- 
Regards,
Li Wang

--000000000000a3f88b05b3ba5025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 10, 2020 at 12:46 AM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
=C2=A0include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=
=3D"noreferrer" target=3D"_blank">testcases.mk</a><br>
<br>
+CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D $=
(EFIVAR_CFLAGS)<br>
+LDLIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D $=
(EFIVAR_LIBS)<br></blockquote><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Where can we get the value of these two varia=
bles? Shouldn&#39;t we add=C2=A0AC_SUBST() in the m4 file?</div></div><div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
--- a/testcases/kernel/syscalls/ioperm/ioperm02.c<br>
+++ b/testcases/kernel/syscalls/ioperm/ioperm02.c<br>
@@ -22,6 +22,7 @@<br>
=C2=A0#include &lt;pwd.h&gt;<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_safe_macros.h&quot;<br>
+#include &quot;tst_secureboot.h&quot;<br>
<br>
=C2=A0#if defined __i386__ || defined(__x86_64__)<br>
=C2=A0#include &lt;sys/io.h&gt;<br>
@@ -45,6 +46,10 @@ static struct tcase_t {<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ioperm() is restricted under kernel lockdown=
. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_lockdown_enabled() || tst_secureboot_en=
abled() &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;Kernel is locked down, skip this test&quot;);<br></blockquote><div><br></=
div><div><div class=3D"gmail_default" style=3D"font-size:small">The ioperm0=
2 is an error test for ioperm(), it doesn&#39;t matter without the</div><di=
v class=3D"gmail_default" style=3D"font-size:small">lockdown/secure-boot st=
atus. Better to remove this from setup().</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">iopl02 as well.</div></div><div><br></div></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br><=
/div><div>Li Wang<br></div></div></div></div>

--000000000000a3f88b05b3ba5025--


--===============1421883370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1421883370==--

