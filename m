Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8947FEAB78
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 09:17:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4CB1F3C22BC
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 09:17:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id BF47C3C1C8A
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 09:17:55 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E5A4314016B0
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 09:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572509872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQAR55gmuCuOsc38fAhZimZdKxkZEVeEZg/YCXc3Pfc=;
 b=JPbLAr6GxGHzlBwKF0UdjIC2y3DY0V4PMy/10AO5tcyGWvot2zfQrzYS/fU98gti/NOcwX
 ylQhjcNUh6CgIf2VS6jesTRRKiPLYmPz/i/WC8lVhSEEoJe3Z4JAtD+2USL5pth0Sp1+5g
 c/lZhmk/PACkIDlbDeevFEY/w81r/GE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-_inDIGcpNNu_lSE2I1mCMw-1; Thu, 31 Oct 2019 04:17:47 -0400
Received: by mail-oi1-f200.google.com with SMTP id 67so3237340oid.16
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 01:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9TRCIdm7NxUe9XuX0RFSV3tNC8K7IyCDBvdHYwaAU4=;
 b=aDIRseG1Nrvt8FBmsEnRQY4qw+9LxKkMm5La8Dz3BS3ZewTPFJv4yYYeR48GfIQ11h
 Itqucz1eTNu7+iIiPtIol3PrIfofNA/TK0Xmn1ZioAYLlZAGzbc7BBS3NdsTKZuQBONd
 fkdXy0CKcpjSIHz0kgVOLNYEjoFwr7+B/1HGIxEG+MLOS/hFWBSL41dQ3LJisMpVrkeu
 gdnhiFEQFeDw1L8/fWFoO4pPnvzE6quKpNlDPEL0oJja+nNVnPCi2YpnHDAb1zlAxJ54
 coWqhzmfRO7ZvgJn/9EZVPaV7tELG7Y/g0fH0gCIkOuLNaxePgzM9w+rP4nFml/ELXTB
 6BlQ==
X-Gm-Message-State: APjAAAV3G0Pz7a9bGFb1iR9wvxt6DDoiPYZsUvMRU9AzFUHx3CVWIvW9
 kI6ay/8dL9AfroRDoMmYmH2dgk22TN2RHaubZ1QpvQ0is1AauEzarr8IdsUf2aR+R4sGu8TSpQE
 dykFWgBE4HExkMqf5w0thgHBYH7M=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr2929684oia.153.1572509866632; 
 Thu, 31 Oct 2019 01:17:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxj5vvgGF9/OILJP4y6qFBO4hYjzBEGRPgH90znqOV3DuwVgWmYXgYyKtiC+4vdh8GR2dtNN79+XikDLp/zg6I=
X-Received: by 2002:aca:3c86:: with SMTP id j128mr2929670oia.153.1572509866362; 
 Thu, 31 Oct 2019 01:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191031064451.14966-1-tesheng@andestech.com>
In-Reply-To: <20191031064451.14966-1-tesheng@andestech.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Oct 2019 16:17:34 +0800
Message-ID: <CAEemH2dOwoE2YMXn-+Ugb=-3=V5b-Q-X0KU+xDdRogWF-5ViWQ@mail.gmail.com>
To: Eric Lin <tesheng@andestech.com>
X-MC-Unique: _inDIGcpNNu_lSE2I1mCMw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] hugetlb: Initialize orig_shmmax and orig_shmmni
 value
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
Cc: alankao@andestech.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1992533036=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1992533036==
Content-Type: multipart/alternative; boundary="000000000000fd9f840596307b3b"

--000000000000fd9f840596307b3b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 2:45 PM Eric Lin <tesheng@andestech.com> wrote:

> When doing save_nr_hugepages() in setup() and there
> is no Huge page support in system, it will call
> cleanup() and write wrong orig_shmmax and orig_shmmni
> value back to file.
>
> To fix it, we initialize the orig_shmmax and
> orig_shmmni to -1 and check it in cleanup().
>
> Signed-off-by: Eric Lin <tesheng@andestech.com>
>
Reviewed-by: Li Wang <liwang@redhat.com>


> ---
>  testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c   | 5 +++--
>  testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
> b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
> index d375810cb..c76e4167f 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c
> @@ -38,7 +38,7 @@
>  static long huge_free;
>  static long huge_free2;
>  static long hugepages;
> -static long orig_shmmax, new_shmmax;
> +static long orig_shmmax =3D -1, new_shmmax;
>
>  static void shared_hugepage(void);
>
> @@ -106,7 +106,8 @@ static void setup(void)
>  static void cleanup(void)
>  {
>         restore_nr_hugepages();
> -       SAFE_FILE_PRINTF(PATH_SHMMAX, "%ld", orig_shmmax);
> +       if (orig_shmmax !=3D -1)
> +               SAFE_FILE_PRINTF(PATH_SHMMAX, "%ld", orig_shmmax);
>  }
>
>  static struct tst_test test =3D {
> diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
> b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
> index d5255228b..f2ecc465d 100644
> --- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
> +++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
> @@ -39,7 +39,7 @@ static int num_shms;
>  static int shm_id_arr[MAXIDS];
>
>  static long hugepages =3D 128;
> -static long orig_shmmni;
> +static long orig_shmmni =3D -1;
>  static struct tst_option options[] =3D {
>         {"s:", &nr_opt, "-s   num  Set the number of the been allocated
> hugepages"},
>         {NULL, NULL, NULL}
> @@ -105,7 +105,8 @@ static void cleanup(void)
>         for (i =3D 0; i < num_shms; i++)
>                 rm_shm(shm_id_arr[i]);
>
> -       FILE_PRINTF(PATH_SHMMNI, "%ld", orig_shmmni);
> +       if (orig_shmmni !=3D -1)
> +               FILE_PRINTF(PATH_SHMMNI, "%ld", orig_shmmni);
>         restore_nr_hugepages();
>  }
>
> --
> 2.17.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


--=20
Regards,
Li Wang

--000000000000fd9f840596307b3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Oct 31, 2019 at 2:45 PM Eric Lin &lt;<a hre=
f=3D"mailto:tesheng@andestech.com">tesheng@andestech.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">When doing save_nr_=
hugepages() in setup() and there<br>
is no Huge page support in system, it will call<br>
cleanup() and write wrong orig_shmmax and orig_shmmni<br>
value back to file.<br>
<br>
To fix it, we initialize the orig_shmmax and<br>
orig_shmmni to -1 and check it in cleanup().<br>
<br>
Signed-off-by: Eric Lin &lt;<a href=3D"mailto:tesheng@andestech.com" target=
=3D"_blank">tesheng@andestech.com</a>&gt;<br></blockquote><div><span class=
=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a hr=
ef=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div>=
<span class=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c=C2=A0 =C2=A0| 5 =
+++--<br>
=C2=A0testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c | 5 +++--<br>
=C2=A02 files changed, 6 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c b/testcas=
es/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c<br>
index d375810cb..c76e4167f 100644<br>
--- a/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c<br>
+++ b/testcases/kernel/mem/hugetlb/hugeshmat/hugeshmat04.c<br>
@@ -38,7 +38,7 @@<br>
=C2=A0static long huge_free;<br>
=C2=A0static long huge_free2;<br>
=C2=A0static long hugepages;<br>
-static long orig_shmmax, new_shmmax;<br>
+static long orig_shmmax =3D -1, new_shmmax;<br>
<br>
=C2=A0static void shared_hugepage(void);<br>
<br>
@@ -106,7 +106,8 @@ static void setup(void)<br>
=C2=A0static void cleanup(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 restore_nr_hugepages();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(PATH_SHMMAX, &quot;%ld&quot;, =
orig_shmmax);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (orig_shmmax !=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(PA=
TH_SHMMAX, &quot;%ld&quot;, orig_shmmax);<br>
=C2=A0}<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c b/testc=
ases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c<br>
index d5255228b..f2ecc465d 100644<br>
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c<br>
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c<br>
@@ -39,7 +39,7 @@ static int num_shms;<br>
=C2=A0static int shm_id_arr[MAXIDS];<br>
<br>
=C2=A0static long hugepages =3D 128;<br>
-static long orig_shmmni;<br>
+static long orig_shmmni =3D -1;<br>
=C2=A0static struct tst_option options[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;s:&quot;, &amp;nr_opt, &quot;-s=C2=A0 =
=C2=A0num=C2=A0 Set the number of the been allocated hugepages&quot;},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {NULL, NULL, NULL}<br>
@@ -105,7 +105,8 @@ static void cleanup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; num_shms; i++)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm_shm(shm_id_arr[i=
]);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE_PRINTF(PATH_SHMMNI, &quot;%ld&quot;, orig_=
shmmni);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (orig_shmmni !=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FILE_PRINTF(PATH_SH=
MMNI, &quot;%ld&quot;, orig_shmmni);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 restore_nr_hugepages();<br>
=C2=A0}<br>
<br>
-- <br>
2.17.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fd9f840596307b3b--


--===============1992533036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1992533036==--

