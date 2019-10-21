Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38828DE513
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 09:04:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A72A13C24A1
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 09:04:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 935013C234B
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 09:04:26 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 295A96007A9
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 09:04:23 +0200 (CEST)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF7EC76A0B
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 07:04:21 +0000 (UTC)
Received: by mail-ot1-f69.google.com with SMTP id g6so6274981otn.3
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 00:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qYJUSXnb0wz+Q2rv836EOuDXgbYQzQGkt/NYGaHXYAs=;
 b=D657Vz7CNWOlm8FDh1M6L/2K5Whr6dSQmzq6IT79axmBBR4XEUbwWKTyAoixNxSem+
 VvlJ07FS2Fv3jx5sgaLq5yH3KOW09Px+wwDPNei4GxTvOgY0cA4k3qQfZ4isUTswGhi3
 xZaauJbCUirQn+g10j71HvOtR5ttl9Ue8jM0UAb9TuILm+3RVyme2M2Z5Sf/f18iRjRj
 zFu146k5dRqZhH7FXIp/1oT9wNweo6qJmqNauoeYpLFMaAeQM6/IRcDtq5gBMfYDuY5p
 Wa4j/XyXb+Xge06hGiVy7hFda+pjPkYbRNjfkKuFmr+pdHBAuxu/rhWjxjGFr9PcuNmR
 653Q==
X-Gm-Message-State: APjAAAW9qX37Wf5eb2FV9SrXj7YnPDMzQlpBGU1VGZG0RYImzRtWinNH
 AuTWdXXBWjd2kL7lzrtGDU5I1nX30s5NEMguOfgRGBx9igTH5DLJ2oJMk+4ny8yvhZ2hMSa5GKU
 uzJBC+fWxRun5fG2xfms0ppFzCB0=
X-Received: by 2002:aca:d508:: with SMTP id m8mr17099988oig.144.1571641461338; 
 Mon, 21 Oct 2019 00:04:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxAR6J91bhFmZk0Q/998pfGulJp0nLyLzyXfVjjT3ab86zh1HfHQ3BnceL0r7nbhsCKFIzZhoOHJWWGF8Cw06w=
X-Received: by 2002:aca:d508:: with SMTP id m8mr17099963oig.144.1571641461035; 
 Mon, 21 Oct 2019 00:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <651aa5d59504efe89ee8428afd95fe90a9bbea38.1571412608.git.jstancek@redhat.com>
In-Reply-To: <651aa5d59504efe89ee8428afd95fe90a9bbea38.1571412608.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 21 Oct 2019 15:04:09 +0800
Message-ID: <CAEemH2dUt+7Z3_da-pvSaSkBnrf6xHddkW3ZfFHAzHNk-D_=hQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] thp02: simplify test to lower memory requirements
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
Content-Type: multipart/mixed; boundary="===============1802542868=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1802542868==
Content-Type: multipart/alternative; boundary="000000000000fff32a0595664ad3"

--000000000000fff32a0595664ad3
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 18, 2019 at 11:30 PM Jan Stancek <jstancek@redhat.com> wrote:

> Test is using 4 hugepages per allocation, and makes 4*3 allocations
> in total. This is problem for aarch64, where default huge page size
> is 512M. Systems are running into unexpected OOMs, because there
> is no check for available memory.
>
> Simplify test by:
> - dropping 3rd allocation, it's used only for pattern comparison
> - run test function in new child process, so we don't need to worry
>   about cleaning up after mremap() and it lowers overall memory
>   requirements
> - add a simple check if there's enough memory to setup()
> - drop .needs_root, there's no need for it
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/mem/thp/thp02.c | 79
> +++++++++++++++++++++++++---------------
>  1 file changed, 50 insertions(+), 29 deletions(-)
>
> diff --git a/testcases/kernel/mem/thp/thp02.c
> b/testcases/kernel/mem/thp/thp02.c
> index 6502210e50de..4d0c929f91ff 100644
> --- a/testcases/kernel/mem/thp/thp02.c
> +++ b/testcases/kernel/mem/thp/thp02.c
> @@ -47,46 +47,62 @@
>  #ifdef HAVE_MREMAP_FIXED
>  static int ps;
>  static long hps, size;
> -static void *p, *p2, *p3, *p4;
> +
> +/*
> + * Will try to do the following 4 mremaps cases:
> + *   mremap(p, size-ps, size-ps, flag, p3);
> + *   mremap(p, size-ps, size-ps, flag, p3+ps);
> + *   mremap(p+ps, size-ps, size-ps, flag, p3);
> + *   mremap(p+ps, size-ps, size-ps, flag, p3+ps);
> + */
>

The comment should be updated too, otherwise patch LGTM.


> +static void do_child(int i)
> +{
> +       long j, remap_size;
> +       unsigned char *p1, *p2, *ret, *old_addr, *new_addr;
> +
> +       p1 = SAFE_MEMALIGN(hps, size);
> +       p2 = SAFE_MEMALIGN(hps, size);
> +
> +       memset(p1, 0xff, size);
> +       memset(p2, 0x77, size);
> +
> +       old_addr = p1 + ps * (i >> 1);
> +       new_addr = p2 + ps * (i & 1);
> +       remap_size = size - ps;
> +
> +       tst_res(TINFO, "mremap (%p-%p) to (%p-%p)",
> +               old_addr, old_addr + remap_size,
> +               new_addr, new_addr + remap_size);
> +
> +       ret = mremap(old_addr, remap_size, remap_size,
> +                   MREMAP_FIXED | MREMAP_MAYMOVE, new_addr);
> +       if (ret == MAP_FAILED)
> +               tst_brk(TBROK | TERRNO, "mremap");
> +
> +       for (j = 0; j < size - ps; j++) {
> +               if (ret[j] != 0xff)
> +                       tst_brk(TBROK, "mremap bug");
> +       }
> +
> +       exit(0);
> +}
>
>  static void do_mremap(void)
>  {
>         int i;
> -       void *old_addr, *new_addr;
>
>         for (i = 0; i < 4; i++) {
> -               p = SAFE_MEMALIGN(hps, size);
> -               p2 = SAFE_MEMALIGN(hps, size);
> -               p3 = SAFE_MEMALIGN(hps, size);
> -
> -               memset(p, 0xff, size);
> -               memset(p2, 0xff, size);
> -               memset(p3, 0x77, size);
> -
> -               /*
> -                * Will try to do the following 4 mremaps cases:
> -                *   mremap(p, size-ps, size-ps, flag, p3);
> -                *   mremap(p, size-ps, size-ps, flag, p3+ps);
> -                *   mremap(p+ps, size-ps, size-ps, flag, p3);
> -                *   mremap(p+ps, size-ps, size-ps, flag, p3+ps);
> -                */
> -               old_addr = p + ps * (i >> 1);
> -               new_addr = p3 + ps * (i & 1);
> -               tst_res(TINFO, "mremap %p to %p", old_addr, new_addr);
> -
> -               p4 = mremap(old_addr, size - ps, size - ps,
> -                           MREMAP_FIXED | MREMAP_MAYMOVE, new_addr);
> -               if (p4 == MAP_FAILED)
> -                       tst_brk(TBROK | TERRNO, "mremap");
> -               if (memcmp(p4, p2, size - ps))
> -                       tst_brk(TBROK, "mremap bug");
> +               if (SAFE_FORK() == 0)
> +                       do_child(i);
> +               tst_reap_children();
>         }
> -
>         tst_res(TPASS, "Still alive.");
>  }
>
>  static void setup(void)
>  {
> +       long memfree;
> +
>         if (access(PATH_THP, F_OK) == -1)
>                 tst_brk(TCONF, "THP not enabled in kernel?");
>
> @@ -95,12 +111,17 @@ static void setup(void)
>         ps = sysconf(_SC_PAGESIZE);
>         hps = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
>         size = hps * 4;
> +
> +       memfree = (SAFE_READ_MEMINFO("MemFree:") * 1024 +
> +               SAFE_READ_MEMINFO("Cached:") * 1024);
> +       if (memfree < size * 2)
> +               tst_brk(TCONF, "not enough memory");
>  }
>
>  static struct tst_test test = {
> -       .needs_root = 1,
>         .setup = setup,
>         .test_all = do_mremap,
> +       .forks_child = 1,
>  };
>
>  #else
> --
> 1.8.3.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--000000000000fff32a0595664ad3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Oct 18, 2019 at 11:30 PM Jan Stancek &lt;<a=
 href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Test is using 4 hug=
epages per allocation, and makes 4*3 allocations<br>
in total. This is problem for aarch64, where default huge page size<br>
is 512M. Systems are running into unexpected OOMs, because there<br>
is no check for available memory.<br>
<br>
Simplify test by:<br>
- dropping 3rd allocation, it&#39;s used only for pattern comparison<br>
- run test function in new child process, so we don&#39;t need to worry<br>
=C2=A0 about cleaning up after mremap() and it lowers overall memory<br>
=C2=A0 requirements<br>
- add a simple check if there&#39;s enough memory to setup()<br>
- drop .needs_root, there&#39;s no need for it<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/mem/thp/thp02.c | 79 +++++++++++++++++++++++++------=
---------<br>
=C2=A01 file changed, 50 insertions(+), 29 deletions(-)<br>
<br>
diff --git a/testcases/kernel/mem/thp/thp02.c b/testcases/kernel/mem/thp/th=
p02.c<br>
index 6502210e50de..4d0c929f91ff 100644<br>
--- a/testcases/kernel/mem/thp/thp02.c<br>
+++ b/testcases/kernel/mem/thp/thp02.c<br>
@@ -47,46 +47,62 @@<br>
=C2=A0#ifdef HAVE_MREMAP_FIXED<br>
=C2=A0static int ps;<br>
=C2=A0static long hps, size;<br>
-static void *p, *p2, *p3, *p4;<br>
+<br>
+/*<br>
+ * Will try to do the following 4 mremaps cases:<br>
+ *=C2=A0 =C2=A0mremap(p, size-ps, size-ps, flag, p3);<br>
+ *=C2=A0 =C2=A0mremap(p, size-ps, size-ps, flag, p3+ps);<br>
+ *=C2=A0 =C2=A0mremap(p+ps, size-ps, size-ps, flag, p3);<br>
+ *=C2=A0 =C2=A0mremap(p+ps, size-ps, size-ps, flag, p3+ps);<br>
+ */<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">The comment should be updated too, otherwise patch LGT=
M.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+static void do_child(int i)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long j, remap_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *p1, *p2, *ret, *old_addr, *new_a=
ddr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p1 =3D SAFE_MEMALIGN(hps, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0p2 =3D SAFE_MEMALIGN(hps, size);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(p1, 0xff, size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(p2, 0x77, size);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0old_addr =3D p1 + ps * (i &gt;&gt; 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0new_addr =3D p2 + ps * (i &amp; 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0remap_size =3D size - ps;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;mremap (%p-%p) to (%p-%p)&=
quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_addr, old_addr =
+ remap_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_addr, new_addr =
+ remap_size);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mremap(old_addr, remap_size, remap_size=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MREMA=
P_FIXED | MREMAP_MAYMOVE, new_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D MAP_FAILED)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;mremap&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt; size - ps; j++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret[j] !=3D 0xf=
f)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK, &quot;mremap bug&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit(0);<br>
+}<br>
<br>
=C2=A0static void do_mremap(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0void *old_addr, *new_addr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 4; i++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D SAFE_MEMALIGN=
(hps, size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p2 =3D SAFE_MEMALIG=
N(hps, size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p3 =3D SAFE_MEMALIG=
N(hps, size);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(p, 0xff, siz=
e);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(p2, 0xff, si=
ze);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(p3, 0x77, si=
ze);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Will try to do t=
he following 4 mremaps cases:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0mrem=
ap(p, size-ps, size-ps, flag, p3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0mrem=
ap(p, size-ps, size-ps, flag, p3+ps);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0mrem=
ap(p+ps, size-ps, size-ps, flag, p3);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0mrem=
ap(p+ps, size-ps, size-ps, flag, p3+ps);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_addr =3D p + ps=
 * (i &gt;&gt; 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_addr =3D p3 + p=
s * (i &amp; 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quo=
t;mremap %p to %p&quot;, old_addr, new_addr);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p4 =3D mremap(old_a=
ddr, size - ps, size - ps,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0MREMAP_FIXED | MREMAP_MAYMOVE, new_addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p4 =3D=3D MAP_F=
AILED)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK | TERRNO, &quot;mremap&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(p4, p2, =
size - ps))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK, &quot;mremap bug&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (SAFE_FORK() =3D=
=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0do_child(i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_reap_children()=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;Still alive.&quot;);<br>
=C2=A0}<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long memfree;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (access(PATH_THP, F_OK) =3D=3D -1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quo=
t;THP not enabled in kernel?&quot;);<br>
<br>
@@ -95,12 +111,17 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ps =3D sysconf(_SC_PAGESIZE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hps =3D SAFE_READ_MEMINFO(&quot;Hugepagesize:&q=
uot;) * 1024;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D hps * 4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memfree =3D (SAFE_READ_MEMINFO(&quot;MemFree:&q=
uot;) * 1024 +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_READ_MEMINFO(&=
quot;Cached:&quot;) * 1024);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (memfree &lt; size * 2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;not enough memory&quot;);<br>
=C2=A0}<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .setup =3D setup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .test_all =3D do_mremap,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.forks_child =3D 1,<br>
=C2=A0};<br>
<br>
=C2=A0#else<br>
-- <br>
1.8.3.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000fff32a0595664ad3--

--===============1802542868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1802542868==--
