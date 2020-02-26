Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB916FA1A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:00:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 170803C2555
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:00:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0F4AC3C253A
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:00:35 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E23666021B8
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:00:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582707632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kvEh3o1PxTvn+NF53I2ioRQw3sB6A+n8RDec4sgGfwU=;
 b=LBfia5HLT/kSsp7z0QsuxP3+pacclRVf3rbWf6cCWeXFYsOPRT08Btv/1lHVBmcy6MK/Cx
 H9SB7tNkzfaKjx+eFzSA3BlSu/vaIwX/iRJJNbQSIzYmfk+lKhiseTYUpnO/jK4r3ZmZiF
 Mrhw7Ap+xf033hn8fTWtTjYuJGwJSXI=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-_giImvTFPkSWf5rVsMZkiA-1; Wed, 26 Feb 2020 04:00:28 -0500
X-MC-Unique: _giImvTFPkSWf5rVsMZkiA-1
Received: by mail-ot1-f71.google.com with SMTP id o14so1080291otp.4
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 01:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A0JAFivYPvD/fyG+mQywk0K2Sxjicx1BKrL/7RFnuNM=;
 b=cBabtWkGafqu2MkR2pSFxu1SdplChVMtPfd6yXtcJUzwk5n9Q/6ZER2ntVBfz5mWrY
 XxDHObCCJblcLtkCDwij2ajawzcMrHQhOqJOezpKcfMdC2FzG3orqJbCxN4LoBeOaTzW
 /tO6y1TyUdR9bsUSpW3JvpRK0q6WPO/q80zxcuIEUuzxz2a5dBMAJ2rs+XUapT5RaHJ4
 PCk7JfQhi7rMnXtZXIXEYTYJL5lBqIo4P/iWpusepWKXmJZLBu3eM2e9UGOUmn8I0bXb
 QdBCp5UysAPTUzAZnbJBebvhWWUA/jVpK8e3dlA19f1C1UoxQRtBuk0wz77xDPMyqBZQ
 b6Sw==
X-Gm-Message-State: APjAAAX7vyrp/qhr1IergzRDlf7KrXBLS6PrB2zbK/MSvYyavVht/sC9
 n0C0onLdru9IKQveLqXDmHcrSY2HepnusF9NBlGIoRTNfF8sFUA0d4ATK9u8aAdi3XC7YzmMwXC
 CNtAVLDx5DOJZN/N5P6qAeRUYeYg=
X-Received: by 2002:aca:330b:: with SMTP id z11mr2121743oiz.96.1582707627541; 
 Wed, 26 Feb 2020 01:00:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqwafIZdc0jMXKDharXHEWZo/6fLnM8JkjAqOWWj6F00ujQeEfvyeVJ9Q9PmlFxf8pcixsN3S71DDamDGZbSsUw=
X-Received: by 2002:aca:330b:: with SMTP id z11mr2121734oiz.96.1582707627284; 
 Wed, 26 Feb 2020 01:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20200226084249.29561-1-pvorel@suse.cz>
In-Reply-To: <20200226084249.29561-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 26 Feb 2020 17:00:15 +0800
Message-ID: <CAEemH2cMBtVV-1_RZb_UHN9rQF3sD2w-H2gS11BD2WHPTPzvgQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] request_key04: Use TFAIL instead of TBROK
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
Content-Type: multipart/mixed; boundary="===============1682968608=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1682968608==
Content-Type: multipart/alternative; boundary="000000000000e878eb059f76d560"

--000000000000e878eb059f76d560
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 4:43 PM Petr Vorel <pvorel@suse.cz> wrote:

> To fix unreported results error:
> tst_test.c:1036: BROK: Test haven't reported results!
>
> which also prevents to display kernel commit fix and CVE.
>
> Fixes: 8ac26843e ("syscalls/request_key04: new test for request_key()
> permission check bug")
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> obvious fix which I'd normally merge without sending to ML.
> But there are 19 tests which use tst_res(TBROK, and at least some of
> them are affected by this (i.e. don't unconditionally report any result
> before tst_res(TBROK), so we might want to fix it different way.
>
+1 for this fix.

By the way, do you think it makes sense to add build check parameters for
tst_res() too? Just like what we do for tst_brk() in commit 0738e3753c51.

Any thoughts?



>
> Kind regards,
> Petr
>
>  testcases/kernel/syscalls/request_key/request_key04.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/request_key/request_key04.c
> b/testcases/kernel/syscalls/request_key/request_key04.c
> index da036bf3a..c125f4261 100644
> --- a/testcases/kernel/syscalls/request_key/request_key04.c
> +++ b/testcases/kernel/syscalls/request_key/request_key04.c
> @@ -65,7 +65,7 @@ static void do_test(void)
>         if (TST_ERR =3D=3D EACCES) {
>                 tst_res(TPASS, "request_key() failed with EACCES as
> expected");
>         } else {
> -               tst_res(TBROK | TTERRNO,
> +               tst_res(TFAIL | TTERRNO,
>                         "request_key() failed with unexpected error code"=
);
>         }
>  }
> --
> 2.25.1
>
>

--=20
Regards,
Li Wang

--000000000000e878eb059f76d560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 26, 2020 at 4:43 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">To fix unreported results error=
:<br>
tst_test.c:1036: BROK: Test haven&#39;t reported results!<br>
<br>
which also prevents to display kernel commit fix and CVE.<br>
<br>
Fixes: 8ac26843e (&quot;syscalls/request_key04: new test for request_key()<=
br>
permission check bug&quot;)<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Hi,<br>
<br>
obvious fix which I&#39;d normally merge without sending to ML.<br>
But there are 19 tests which use tst_res(TBROK, and at least some of<br>
them are affected by this (i.e. don&#39;t unconditionally report any result=
<br>
before tst_res(TBROK), so we might want to fix it different way.<br></block=
quote><div><div class=3D"gmail_default" style=3D"font-size:small">+1 for th=
is fix.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">By the way, do yo=
u think it makes sense to add build check parameters for tst_res() too? Jus=
t like what we do for tst_brk() in commit=C2=A00738e3753c51.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Any thoughts?</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
=C2=A0testcases/kernel/syscalls/request_key/request_key04.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/request_key/request_key04.c b/testca=
ses/kernel/syscalls/request_key/request_key04.c<br>
index da036bf3a..c125f4261 100644<br>
--- a/testcases/kernel/syscalls/request_key/request_key04.c<br>
+++ b/testcases/kernel/syscalls/request_key/request_key04.c<br>
@@ -65,7 +65,7 @@ static void do_test(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TST_ERR =3D=3D EACCES) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quo=
t;request_key() failed with EACCES as expected&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TBROK | TTE=
RRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTE=
RRNO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;request_key() failed with unexpected error code&quot;);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000e878eb059f76d560--


--===============1682968608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1682968608==--

