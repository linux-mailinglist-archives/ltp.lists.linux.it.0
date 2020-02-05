Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50375153256
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 14:58:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 190833C264C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 14:58:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A406C3C262A
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 14:58:12 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5031920004A
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 14:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580911089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iaFkzKYk8lbxcSItQiv8iUY19WQwHB+Joh2E4nP1iTM=;
 b=BgkxXl1NChfsWuLe0ioAwsTSDI1MdqilTOoeYy8a8H7LgQmfDIIgyIj3z121X4pG4is9N1
 uOyr1ti74XfXNJiNIU002SXdMXYFs7FpP1HjsXVHrZ8eRl77wIiPbTPbN4ltCKeYQXaWZA
 Cje0C77V/vhRHEh/arrBsZ0+GvecLk0=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236--Rk857ZrO-mMJ-Nz3akbzg-1; Wed, 05 Feb 2020 08:58:02 -0500
Received: by mail-oi1-f198.google.com with SMTP id o5so992078oif.9
 for <ltp@lists.linux.it>; Wed, 05 Feb 2020 05:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JjLyJO1X9NuiKNqNzNZqLFLd9yEIK5EjN5+q7zUc7KI=;
 b=sJnVcrrxfAtwZhcQEBPpWv4ThIGlyjpjCiPfw9uXtVkiFpnOSQBiEluBjYWooK0HZm
 NpYZKJcuHiNyWMCknH4T6t1hxhIFe/3Khnkwobf4GDmM+Wuhx2fkb+XToB6ZwmZFqXPK
 3ko4MT65sRouJ/g+Sm445YwTiK1G5UdTxAXTiffKBJ+x4MvRZnFVU5QcVYc1wun2xtnG
 O8GGX8rMpIN9fJPNj1yH1jsPEbiQs0MgKApU+xrDhZ70/jrwcMzneYYbFYTqGTKwVUNu
 h5CiiCuQ7LTNQoSJfg3Vs4SN4eQsZHmFA3hCK3TqtQl9/QwmyUSfZPaV4ycuMLSd0kAm
 uevA==
X-Gm-Message-State: APjAAAWyQmXakWhIjcVDY3oFyo2yFPfqLrvCxyywh8DHGvuRVYnGpbx4
 ReZv9lc9uHR7pdkXlIqCEBA4BWnbEuqZlPxBZg2+olOudJNbII9FHMxzJgeXMzKBWXfrJA2yDF/
 Ngbel+Zmf1CKNMM8URNtC5xzrMjg=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr2760145oie.96.1580911080813; 
 Wed, 05 Feb 2020 05:58:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwLp5vyqZhTZwIkjYGIXZv2fipjYLjwmnVLtN0NaHxSBthyaKpNjxFqx2Bh3Wbh1lKClHAA7yNFuWAzhv40p6s=
X-Received: by 2002:aca:afd8:: with SMTP id y207mr2760127oie.96.1580911080482; 
 Wed, 05 Feb 2020 05:58:00 -0800 (PST)
MIME-Version: 1.0
References: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
In-Reply-To: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Feb 2020 21:57:48 +0800
Message-ID: <CAEemH2fnu9nZiGDfa5LTTMA0a_-PJ35fjjLdZ2vXYNGRJqHfVA@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-MC-Unique: -Rk857ZrO-mMJ-Nz3akbzg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getrandom02: lower bufsize if low on
 entropy
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
Content-Type: multipart/mixed; boundary="===============0548327181=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0548327181==
Content-Type: multipart/alternative; boundary="0000000000005fc023059dd48b2e"

--0000000000005fc023059dd48b2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2020 at 5:19 PM Jan Stancek <jstancek@redhat.com> wrote:

> Some PPC KVM guests accumulate about 1 bit of entropy per second while id=
le
> and running getrandom02. Which isn't enough and test sporadically fails o=
n
> timeout.
>
> Adjust the buffer size by looking at entropy_avail. We want to run the
> test,
> even if all entropy is exhausted, but with smaller buffer we don't set
> as high expectations on how much entropy is generated within default test
> time.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/getrandom/getrandom02.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/getrandom/getrandom02.c
> b/testcases/kernel/syscalls/getrandom/getrandom02.c
> index ee0193df9897..1384fc5f32c0 100644
> --- a/testcases/kernel/syscalls/getrandom/getrandom02.c
> +++ b/testcases/kernel/syscalls/getrandom/getrandom02.c
> @@ -10,6 +10,8 @@
>  #include "lapi/syscalls.h"
>  #include "tst_test.h"
>
> +#define PROC_ENTROPY_AVAIL "/proc/sys/kernel/random/entropy_avail"
> +
>  static int modes[] =3D { 0, GRND_RANDOM, GRND_NONBLOCK,
>                        GRND_RANDOM | GRND_NONBLOCK };
>
> @@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int nb)
>  static void verify_getrandom(unsigned int n)
>  {
>         unsigned char buf[256];
> +       int bufsize =3D 64, entropy_avail;
>

I'm not sure why here initialize bufsize as 64? can you explain more?


>
> -       memset(buf, 0, sizeof(buf));
> +       if (access(PROC_ENTROPY_AVAIL, F_OK) =3D=3D 0) {
> +               SAFE_FILE_SCANF(PROC_ENTROPY_AVAIL, "%d", &entropy_avail)=
;
> +               if (entropy_avail > 256)
> +                       bufsize =3D sizeof(buf);
> +       }
>
> +       memset(buf, 0, sizeof(buf));
>         do {
> -               TEST(tst_syscall(__NR_getrandom, buf, sizeof(buf),
> modes[n]));
> +               TEST(tst_syscall(__NR_getrandom, buf, bufsize, modes[n]))=
;
>         } while ((modes[n] & GRND_NONBLOCK) && TST_RET =3D=3D -1
>                   && TST_ERR =3D=3D EAGAIN);
>
> --
> 2.18.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--0000000000005fc023059dd48b2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 5, 2020 at 5:19 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Some PPC KVM guests a=
ccumulate about 1 bit of entropy per second while idle<br>
and running getrandom02. Which isn&#39;t enough and test sporadically fails=
 on<br>
timeout.<br>
<br>
Adjust the buffer size by looking at entropy_avail. We want to run the test=
,<br>
even if all entropy is exhausted, but with smaller buffer we don&#39;t set<=
br>
as high expectations on how much entropy is generated within default test t=
ime.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/getrandom/getrandom02.c | 12 ++++++++++--<b=
r>
=C2=A01 file changed, 10 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/getrandom/getrandom02.c b/testcases/=
kernel/syscalls/getrandom/getrandom02.c<br>
index ee0193df9897..1384fc5f32c0 100644<br>
--- a/testcases/kernel/syscalls/getrandom/getrandom02.c<br>
+++ b/testcases/kernel/syscalls/getrandom/getrandom02.c<br>
@@ -10,6 +10,8 @@<br>
=C2=A0#include &quot;lapi/syscalls.h&quot;<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
<br>
+#define PROC_ENTROPY_AVAIL &quot;/proc/sys/kernel/random/entropy_avail&quo=
t;<br>
+<br>
=C2=A0static int modes[] =3D { 0, GRND_RANDOM, GRND_NONBLOCK,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0GRND_RANDOM | GRND_NONBLOCK };<br>
<br>
@@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int nb)<br=
>
=C2=A0static void verify_getrandom(unsigned int n)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char buf[256];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int bufsize =3D 64, entropy_avail;<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I&#39;m not sure why here initialize=C2=A0bufsize as 64? can you explai=
n more?</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(buf, 0, sizeof(buf));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (access(PROC_ENTROPY_AVAIL, F_OK) =3D=3D 0) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_SCANF(PRO=
C_ENTROPY_AVAIL, &quot;%d&quot;, &amp;entropy_avail);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (entropy_avail &=
gt; 256)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bufsize =3D sizeof(buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(buf, 0, sizeof(buf));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(tst_syscall(__=
NR_getrandom, buf, sizeof(buf), modes[n]));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(tst_syscall(__=
NR_getrandom, buf, bufsize, modes[n]));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } while ((modes[n] &amp; GRND_NONBLOCK) &amp;&a=
mp; TST_RET =3D=3D -1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; T=
ST_ERR =3D=3D EAGAIN);<br>
<br>
-- <br>
2.18.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000005fc023059dd48b2e--


--===============0548327181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0548327181==--

