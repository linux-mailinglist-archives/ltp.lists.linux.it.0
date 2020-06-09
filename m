Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ECF1F3B3A
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:56:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 77F053C2E57
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 14:56:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 20C033C2E4A
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:56:08 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 18229140172B
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 14:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591707365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aI+aZgqPVPYz7CdTFsbcu+D1RFJUqaUr14Gsrk+8Nkk=;
 b=Ijnr9PFm4mfCACo9QxeMLS34eIhhngZLFhbsy+AP2aKuCDx2AmR2wZyXV1GQB0SV3oGJsO
 ruyBBC7cOHCqfo/tZkplfbhtIwsYkkLFphaWZb37DMaZhVdIuzC00d2As2tX0qgqz80yoV
 WPXZfZnuDkIhml3a9gz29Hp2XMun3s4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-g0xd_mTDNBS5_4H0OnBftQ-1; Tue, 09 Jun 2020 08:56:03 -0400
X-MC-Unique: g0xd_mTDNBS5_4H0OnBftQ-1
Received: by mail-lj1-f200.google.com with SMTP id d17so1555702ljo.6
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 05:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aI+aZgqPVPYz7CdTFsbcu+D1RFJUqaUr14Gsrk+8Nkk=;
 b=K8QvZRom6m+neJcoZ+LnwcxDrQ+QQbtgFJZvah13PTwJcA8vgp3baOD97zk9irhOcx
 b75dwk2I3lg9MssfdnKb/oddr5z7z7PnrRehXBxqZcX13ucT9RtfDVjbJBAmuGyH7VlW
 5RwzEKgPNMoMbX0mZwi1/QH+GR8jRGpyKi0tpfARYssoGJbyJxHjxqpQWhEGP5UeLmmr
 XTgZXRmuSLIn5CbHN5Xj5WHyI0zEhXlQz+dUmf6dkhwG+RbgDGu7BY5l4BX1dkKD+sne
 JEFS1H96Ri2uxd1zVxo1KU6mtd0tV0eB+BFiZYjFWEED7O+Mqttyna+rU8PMHvsoX2qc
 7fSw==
X-Gm-Message-State: AOAM5322x7OfxTc3Oc1mg0drHDgQQ30r8sx1mFMhU8z/wZX9/bQqUeMV
 mSAEdpKYQ0dhVsx8PyRI4K5PCkRoMPHi+ewPfBjadP1B+ApxkKNsl/pghVJI8gAxOylu8bWa6Vy
 mFbNAvn3rW3EHo1YDb/jFxPl+AvU=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr14578534ljc.100.1591707361585; 
 Tue, 09 Jun 2020 05:56:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvACOZKt2s6DHzpcRo2nrnzOx2R/GJXHbKaiYIXSP7pqf3ujTiYQ0ooakpKnlcWVyFhoydjHLafUHtBgNlupQ=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr14578524ljc.100.1591707361285; 
 Tue, 09 Jun 2020 05:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590144577.git.viresh.kumar@linaro.org>
 <ff8a9eee3642f28a365437c9a42e5126e90bc242.1590144577.git.viresh.kumar@linaro.org>
In-Reply-To: <ff8a9eee3642f28a365437c9a42e5126e90bc242.1590144577.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Tue, 9 Jun 2020 20:55:49 +0800
Message-ID: <CAEemH2fmr+jXW3kZ5LAMrGH0ReHND2jr-TqoSHm9p9WBePtE3g@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 06/17] syscalls/futex: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1228982036=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1228982036==
Content-Type: multipart/alternative; boundary="000000000000db37d705a7a63ff4"

--000000000000db37d705a7a63ff4
Content-Type: text/plain; charset="UTF-8"

On Fri, May 22, 2020 at 6:53 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> ...
> diff --git a/testcases/kernel/syscalls/futex/futex_wake04.c
> b/testcases/kernel/syscalls/futex/futex_wake04.c
> index f92bda53f6c7..edbb9c644c57 100644
> --- a/testcases/kernel/syscalls/futex/futex_wake04.c
> +++ b/testcases/kernel/syscalls/futex/futex_wake04.c
> ...
>
>  static void wakeup_thread2(void)
>  {
> +       struct test_variants *tv = &variants[tst_variant];
>         void *addr;
>         int hpsz, pgsz, res;
>         pthread_t th1, th2;
>
>         hpsz = read_hugepagesize();
> -       tst_resm(TINFO, "Hugepagesize %i", hpsz);
> +       tst_res(TINFO, "Hugepagesize %i", hpsz);
>
>         /*allocate some shared memory*/
>         addr = mmap(NULL, hpsz, PROT_WRITE | PROT_READ,
>                     MAP_SHARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
>
>         if (addr == MAP_FAILED) {
> -               if (errno == ENOMEM) {
> -                       tst_brkm(TCONF, NULL,
> -                                "Cannot allocate hugepage, memory too
> fragmented?");
> -               }
> +               if (errno == ENOMEM)
> +                       tst_res(TCONF, "Cannot allocate hugepage, memory
> too fragmented?");
>

Here we can use tst_brk(TCONF, ...), otherwise, the if condition will out
of action for ENOMEM.

-               tst_brkm(TBROK | TERRNO, NULL, "Cannot allocate hugepage");
> +               tst_res(TFAIL | TERRNO, "Cannot allocate hugepage");
> +               return;
>

tst_brk(TBROK | TERRNO, ...)

-- 
Regards,
Li Wang

--000000000000db37d705a7a63ff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 22, 2020 at 6:53 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail_default" style=3D"font-size:small">...</span><br>
diff --git a/testcases/kernel/syscalls/futex/futex_wake04.c b/testcases/ker=
nel/syscalls/futex/futex_wake04.c<br>
index f92bda53f6c7..edbb9c644c57 100644<br>
--- a/testcases/kernel/syscalls/futex/futex_wake04.c<br>
+++ b/testcases/kernel/syscalls/futex/futex_wake04.c<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
=C2=A0static void wakeup_thread2(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct test_variants *tv =3D &amp;variants[tst_=
variant];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int hpsz, pgsz, res;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_t th1, th2;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 hpsz =3D read_hugepagesize();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(TINFO, &quot;Hugepagesize %i&quot;, hp=
sz);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Hugepagesize %i&quot;, hps=
z);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*allocate some shared memory*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D mmap(NULL, hpsz, PROT_WRITE | PROT_REA=
D,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_S=
HARED | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr =3D=3D MAP_FAILED) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D EN=
OMEM) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TCONF, NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Cannot allocate hugepage, memo=
ry too fragmented?&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (errno =3D=3D EN=
OMEM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TCONF, &quot;Cannot allocate hugepage, memory too fragmen=
ted?&quot;);<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Here we can use tst_brk(TCONF, ...), otherwise=
, the if condition=C2=A0will out of action for ENOMEM.</div></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(<span clas=
s=3D"gmail_default" style=3D"font-size:small"></span>TBROK | TERRNO, NULL, =
&quot;Cannot allocate hugepage&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TER=
RNO, &quot;Cannot allocate hugepage&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br></blockq=
uote><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
tst_brk(<span class=3D"gmail_default"></span>TBROK | TERRNO, ...)</div><div=
><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000db37d705a7a63ff4--


--===============1228982036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1228982036==--

