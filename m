Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F9130E5A
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 09:06:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5BA53C249E
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jan 2020 09:06:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B3AA53C2452
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 09:06:49 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4974F1401452
 for <ltp@lists.linux.it>; Mon,  6 Jan 2020 09:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578298006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XRo/LxKQsJDAxCnfbuycODCY/bZVt0ZbtrGJikj40ig=;
 b=dCxcWSiZ35o6ysJADeRYYw4PswJrZTDLh8t/52wpBDzWtyYX+Fl0P+UIC1I65UjR9Pu+SE
 XpDQ+IiG97PujRvY2BbXIbWQE4NpFwZpi0GPA8miZcPHHneL4SIWiKgZ7MSFwWd0NLpAfa
 RfFnOX7cn2q1vJaiH1xt961xb6VmkrY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-hKo2PCVFOGm0IBzqFrIX9g-1; Mon, 06 Jan 2020 03:06:42 -0500
Received: by mail-ot1-f70.google.com with SMTP id e11so24183177otq.1
 for <ltp@lists.linux.it>; Mon, 06 Jan 2020 00:06:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tE2ohvCvNh6rcW/V606YotAyjAb+n0FVk232zopKYBY=;
 b=Tlw3DssCVHtsAFByS+2UHT7molOXl+UPkTYEnHG2klgE7P0pyo1EiZz0fwBU6jmKE0
 mJuv513RjiA0Heq8EOv6gH4eRSuJzY9B7hfLwCChR2taxjGpRxI4fvob++55pSmM5pix
 o8dKpk+HjVrQhjlvFM+weHC1FDfzUSk708UJjHtfTf0DUkzic9jQgjou8zTe1Pw9a1cJ
 IwrrIS+BqZ0fHsX4tBHRrEnM9lpd87gGAbotUJZIzqcq/K4WeWTfetJI6tizmHzVjoXG
 GAHdp/wZPQ4bTFx65r3xPrpPxF1soRlXVJoRWtMcKm8zOx4GEpN+wwjxUyfwfnZVpLNg
 Az9A==
X-Gm-Message-State: APjAAAWl3LIJW34fvdMMACwBpCdxfWlHHLLV7p1cUUWQj+QWbKZoK4L8
 YvnzmYS8ISnWURvhN+ip/sBd7BuwaAUBXKlZfwXI64yd2wWRi9/rWZGSBpRvuKr1V8G/q1c1oVJ
 j/QEp4Co+XTWssHbZr4nx9Ackf60=
X-Received: by 2002:a05:6830:3003:: with SMTP id
 a3mr8963524otn.118.1578298001439; 
 Mon, 06 Jan 2020 00:06:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqyRH9H5ezuf/zRoTg9cwjfXbgt7BTSp3zeLJ2mi6I12twTxExdgjoz4QgMjMA66eddDIbPAkGg5D0zWweUv0s8=
X-Received: by 2002:a05:6830:3003:: with SMTP id
 a3mr8963495otn.118.1578298001107; 
 Mon, 06 Jan 2020 00:06:41 -0800 (PST)
MIME-Version: 1.0
References: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 6 Jan 2020 16:06:30 +0800
Message-ID: <CAEemH2eKbbXjonuiKMdHcRda98hJikmGW4=YtWft0-1QAj0oBQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: hKo2PCVFOGm0IBzqFrIX9g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/userfaultfd01: add hint about
 unprivileged_userfaultfd
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
Content-Type: multipart/mixed; boundary="===============0097827264=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0097827264==
Content-Type: multipart/alternative; boundary="000000000000b4cca3059b7423ea"

--000000000000b4cca3059b7423ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 12:02 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Since commit cefdca0a86be ("userfaultfd/sysctl: add
> vm.unprivileged_userfaultfd").
> , it adds a global sysctl knob "vm.unprivileged_userfaultfd" to control
> whether
> unprivileged users can use the userfaultfd system calls. Set this to 1 to
> allow
> unprivileged users to use the userfaultfd system calls, or set this to 0 =
to
> restrict userfaultfd to only privileged users (with SYS_CAP_PTRACE
> capability). The
> default value is 1. Add hint about it.
>

Can we do the "vm.unprivileged_userfaultfd" check in the setup() and do set
to 1 if it exists?
And maybe we need more tests for the global sysctl knob
"vm.unprivileged_userfaultfd".


> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .../syscalls/userfaultfd/userfaultfd01.c      | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> index a5e142209..4e178b4f8 100644
> --- a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> +++ b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
> @@ -82,12 +82,19 @@ static void run(void)
>
>         set_pages();
>
> -       uffd =3D sys_userfaultfd(O_CLOEXEC | O_NONBLOCK);
> -
> -       if (uffd =3D=3D -1)
> -               tst_brk(TBROK | TERRNO,
> -                       "Could not create userfault file descriptor");
> -
> +       TEST(sys_userfaultfd(O_CLOEXEC | O_NONBLOCK));
> +
> +       if (TST_RET =3D=3D -1) {
> +               if (TST_ERR =3D=3D EPERM) {
> +                       tst_res(TCONF, "Hint: check
> /proc/sys/vm/unprivileged_userfaultfd");
> +                       tst_brk(TCONF | TTERRNO,
> +                               "userfaultfd() requires CAP_SYS_PTRACE on
> this system");
> +               } else
> +                       tst_brk(TBROK | TTERRNO,
> +                               "Could not create userfault file
> descriptor");
> +       }
> +
> +       uffd =3D TST_RET;
>         uffdio_api.api =3D UFFD_API;
>         uffdio_api.features =3D 0;
>         SAFE_IOCTL(uffd, UFFDIO_API, &uffdio_api);
> --
> 2.18.0
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--000000000000b4cca3059b7423ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Dec 18, 2019 at 12:02 PM Yang Xu &lt;<a hre=
f=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since=
 commit cefdca0a86be (&quot;userfaultfd/sysctl: add vm.unprivileged_userfau=
ltfd&quot;).<br>
, it adds a global sysctl knob &quot;vm.unprivileged_userfaultfd&quot; to c=
ontrol whether<br>
unprivileged users can use the userfaultfd system calls. Set this to 1 to a=
llow<br>
unprivileged users to use the userfaultfd system calls, or set this to 0 to=
<br>
restrict userfaultfd to only privileged users (with SYS_CAP_PTRACE capabili=
ty). The<br>
default value is 1. Add hint about it.<br></blockquote><div><br></div>Can w=
e do the <span class=3D"gmail_default" style=3D"font-size:small">&quot;</sp=
an>vm.unprivileged_userfaultfd<span class=3D"gmail_default" style=3D"font-s=
ize:small">&quot;</span> check in the setup() and do set to 1 if it exists?=
<br>And <span class=3D"gmail_default" style=3D"font-size:small">maybe</span=
>=C2=A0we need=C2=A0<span class=3D"gmail_default" style=3D"font-size:small"=
>more</span> tests for the global sysctl knob &quot;vm.unprivileged_userfau=
ltfd&quot;.<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../syscalls/userfaultfd/userfaultfd01.c=C2=A0 =C2=A0 =C2=A0 | 19 +++=
++++++++++------<br>
=C2=A01 file changed, 13 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c b/testca=
ses/kernel/syscalls/userfaultfd/userfaultfd01.c<br>
index a5e142209..4e178b4f8 100644<br>
--- a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c<br>
+++ b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c<br>
@@ -82,12 +82,19 @@ static void run(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_pages();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uffd =3D sys_userfaultfd(O_CLOEXEC | O_NONBLOCK=
);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (uffd =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Could not create userfault file descriptor&quot;);<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(sys_userfaultfd(O_CLOEXEC | O_NONBLOCK));<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_ERR =3D=3D =
EPERM) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TCONF, &quot;Hint: check /proc/sys/vm/unprivileged_userfa=
ultfd&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TCONF | TTERRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;userfaultfd() requires CAP_SYS_=
PTRACE on this system&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK | TTERRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could not create userfault file=
 descriptor&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uffd =3D TST_RET;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uffdio_api.api =3D UFFD_API;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uffdio_api.features =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_IOCTL(uffd, UFFDIO_API, &amp;uffdio_api);<=
br>
-- <br>
2.18.0<br>
<br>
<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000b4cca3059b7423ea--


--===============0097827264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0097827264==--

