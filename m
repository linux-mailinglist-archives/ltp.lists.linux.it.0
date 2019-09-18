Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3418B5B6E
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 07:56:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 095F63C20F7
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 07:56:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8165A3C2082
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 07:56:32 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B0F291401AA4
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 07:56:31 +0200 (CEST)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C03458665D
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 05:56:29 +0000 (UTC)
Received: by mail-oi1-f198.google.com with SMTP id b187so2951217oii.23
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 22:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oQCHe3mbWP01JHCkMNNqBhRY5kJ+8YJ9btG6ceLoYQ=;
 b=i1u2ZlA58zc661C96jbexUGoB/FULxCijaPGftj7Umf1Qdp0scPkfsXrbiv0UvdT7a
 zh2Qdj6ILJcSSRt0lfwBXuLJDhLTefJIWeFIM573xOHJttMDhgz9KSR7IfSOipKNrMlj
 Ab72Q1XnwvimYGJRFkK+S1IDqKNJZEHEYFEdA9C7CsmFSE3n4Qb5w3FcggWccabsnHeD
 hl2ttKVxvRSb5dp2IW56Dh3oxRhvS3UkMdpoOpw5DIykh+mUrSB7a9zdGahmX0fQcSNY
 cG+iyh1egOnTK/Nj4005DDGHV8B8yhGZsqfqeQWr/wL2kfOkvEsRZoSBTc8u+NREXvyd
 uPBA==
X-Gm-Message-State: APjAAAX4saul8lx64gaZQYCvDXppiBfx9nMb9DYTRHaBfmmyAp+lIViI
 tlzZUhSG7qgH/cZEql3ErZ28jfsSGrpy2W3lS00Vki+GvI8akPc8JTc+NAzzF8GeEaOh9Palbk9
 VJnHQKsIysh/T77EeOXEIaZn0rDA=
X-Received: by 2002:aca:5bd4:: with SMTP id p203mr1001910oib.153.1568786189044; 
 Tue, 17 Sep 2019 22:56:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzchGy9DVdu2evZrJ2TLU/h2rN8S+fySCkDpmR4s4qwajWWX9sNvWGae4pqSwN8wGCjSGNiw9yMacasP+NYNx4=
X-Received: by 2002:aca:5bd4:: with SMTP id p203mr1001901oib.153.1568786188711; 
 Tue, 17 Sep 2019 22:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190918053519.26244-1-liwang@redhat.com>
In-Reply-To: <20190918053519.26244-1-liwang@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 18 Sep 2019 13:56:17 +0800
Message-ID: <CAEemH2de4T6+rRuBrYaQDA-ubXaX6nfCykY+EbGi-Sj_tu-3Sw@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, Michael Moese <mmoese@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] tst_taint: TCONF when kernel is alreay tainted
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
Cc: Chang Yin <cyin@redhat.com>
Content-Type: multipart/mixed; boundary="===============1168375479=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1168375479==
Content-Type: multipart/alternative; boundary="00000000000081d98e0592cd7f5a"

--00000000000081d98e0592cd7f5a
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 18, 2019 at 1:35 PM Li Wang <liwang@redhat.com> wrote:

> As the tst_taint_init comments described, If the tainted-flags are already
> set
> by the kernel, there is no reason to continue and TCONF is generated. But
> in
> the function achieve, it uses TBROK.
>
>   cmdline="cve-2017-17053"
>   tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s
>   tst_taint.c:88: BROK: Kernel is already tainted: 536871424
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Chang Yin <cyin@redhat.com>
> Cc: Michael Moese <mmoese@suse.de>
> ---
>
> Notes:
>     Hi Cyril & Michael,
>
>     I'm not sure if that's a good choice to skip whole test if the kernel
> already
>     tainted, so maybe we could also perform it but not do a strict
> tainted-flags
>     check after testing? The reason I think is it probably have chance to
> find
>     new issue even with a tainted kernel.
>

Something maybe change like below, which way is better?

--- a/lib/tst_taint.c
+++ b/lib/tst_taint.c
@@ -7,6 +7,7 @@
 #define TAINT_FILE "/proc/sys/kernel/tainted"

 static unsigned int taint_mask = -1;
+static unsigned int taint_check = 1;

 static unsigned int tst_taint_read(void)
 {
@@ -84,8 +85,10 @@ void tst_taint_init(unsigned int mask)
        taint_mask = mask;

        taint = tst_taint_read();
-       if ((taint & mask) != 0)
-               tst_brk(TCONF, "Kernel is already tainted: %u", taint);
+       if ((taint & mask) != 0) {
+               tst_res(TINFO, "Kernel is already tainted: %u", taint);
+               taint_check = 0;
+       }
 }


@@ -98,5 +101,5 @@ unsigned int tst_taint_check(void)

        taint = tst_taint_read();

-       return (taint & taint_mask);
+       return (taint & taint_mask & taint_check);
 }
-- 
Regards,
Li Wang

--00000000000081d98e0592cd7f5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 18, 2019 at 1:35 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">As the tst_taint_init commen=
ts described, If the tainted-flags are already set<br>
by the kernel, there is no reason to continue and TCONF is generated. But i=
n<br>
the function achieve, it uses TBROK.<br>
<br>
=C2=A0 cmdline=3D&quot;cve-2017-17053&quot;<br>
=C2=A0 tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s<br>
=C2=A0 tst_taint.c:88: BROK: Kernel is already tainted: 536871424<br>
<br>
Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_=
blank">liwang@redhat.com</a>&gt;<br>
Cc: Chang Yin &lt;<a href=3D"mailto:cyin@redhat.com" target=3D"_blank">cyin=
@redhat.com</a>&gt;<br>
Cc: Michael Moese &lt;<a href=3D"mailto:mmoese@suse.de" target=3D"_blank">m=
moese@suse.de</a>&gt;<br>
---<br>
<br>
Notes:<br>
=C2=A0 =C2=A0 Hi Cyril &amp; Michael,<br>
<br>
=C2=A0 =C2=A0 I&#39;m not sure if that&#39;s a good choice to skip whole te=
st if the kernel already<br>
=C2=A0 =C2=A0 tainted, so maybe we could also perform it but not do a stric=
t tainted-flags<br>
=C2=A0 =C2=A0 check after testing? The reason I think is it probably have c=
hance to find<br>
=C2=A0 =C2=A0 new issue even with a tainted kernel.<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Somethi=
ng maybe change like below, which way is better?</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div>--- a/lib/tst_taint.c<br>+++ b/=
lib/tst_taint.c<br>@@ -7,6 +7,7 @@<br>=C2=A0#define TAINT_FILE &quot;/proc/=
sys/kernel/tainted&quot;<br>=C2=A0<br>=C2=A0static unsigned int taint_mask =
=3D -1;<br>+static unsigned int taint_check =3D 1;<br>=C2=A0<br>=C2=A0stati=
c unsigned int tst_taint_read(void)<br>=C2=A0{<br>@@ -84,8 +85,10 @@ void t=
st_taint_init(unsigned int mask)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 taint_mask =
=3D mask;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 taint =3D tst_taint_read=
();<br>- =C2=A0 =C2=A0 =C2=A0 if ((taint &amp; mask) !=3D 0)<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brk(TCONF, &quot;Kernel is al=
ready tainted: %u&quot;, taint);<br>+ =C2=A0 =C2=A0 =C2=A0 if ((taint &amp;=
 mask) !=3D 0) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_=
res(TINFO, &quot;Kernel is already tainted: %u&quot;, taint);<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 taint_check =3D 0;<br>+ =C2=A0 =
=C2=A0 =C2=A0 }<br>=C2=A0}<br>=C2=A0<br>=C2=A0<br>@@ -98,5 +101,5 @@ unsign=
ed int tst_taint_check(void)<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 taint=
 =3D tst_taint_read();<br>=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 return (taint &a=
mp; taint_mask);<br>+ =C2=A0 =C2=A0 =C2=A0 return (taint &amp; taint_mask &=
amp; taint_check);<br>=C2=A0}<br><div class=3D"gmail_default" style=3D"font=
-size:small"></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--00000000000081d98e0592cd7f5a--

--===============1168375479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1168375479==--
