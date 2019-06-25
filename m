Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2825352829
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 11:33:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F01363C1424
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 11:33:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1989D3C0502
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 11:33:40 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B92E8200BD6
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 11:33:38 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id z13so6783388uaa.4
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 02:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h1FCfb3DayW5j9PHfVO3J+PqcAkUnAK65Tp6dxby5ro=;
 b=PTthGl5u+DCroYEx+nNUgq6+XiDhqQWngWr92Sq3gz9RVDYE1coFbqxpjoRg6267WL
 7BTEATQhqb5v0TPQ2vGSD7gmV7KKLAheTzN3b9rdfBE07ZmetgmcmV+g2AMQyLjA6Otn
 RlGRF0iubziLQtSmiTnURL10Xfr+3BiZdtqiZREPpgzFEa35WRWHgVF9lfq9PD/hYdqu
 ns4NusdJ8Zfwhfl+Q+s96nEKALQGrmQoid/AYCq+yfXcSkOMOB+BBFFlK7PJ/Yt5BEfo
 vrXoDcpPJOq/zM89x8LHGn0VGg9dG/MzUZANZkveIQX7EcJgtvmHt91iY1Y/PCKc38bc
 mVjA==
X-Gm-Message-State: APjAAAUcONkhuBM+lEuvc9OCZWNRIAJWC6kwcfd2abNqYMnHbVtvFGNi
 D7KuU5z4v8N7oAoFY9HRX6IKF2zig4cRnwWhQf6mDw==
X-Google-Smtp-Source: APXvYqx74Zx5YMzZq+jtgoVYiZc8/uwml5YR6/3MyklnW3O0kYRt1GU0418Vz2RZV7NdbJ2UsD6GiySM2BpaMIcfX6E=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr65349644uaq.106.1561455217580; 
 Tue, 25 Jun 2019 02:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190625070737.30408-1-liwang@redhat.com>
 <20190625070737.30408-2-liwang@redhat.com>
 <20190625070737.30408-3-liwang@redhat.com>
 <123680949.29869386.1561453262485.JavaMail.zimbra@redhat.com>
In-Reply-To: <123680949.29869386.1561453262485.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 25 Jun 2019 17:33:26 +0800
Message-ID: <CAEemH2fkzKd0a3oRasBy46KMtveg1UekUbYOh=6ne1W5J1a4yQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] pkey: add test for memory protection keys
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
Content-Type: multipart/mixed; boundary="===============2143255765=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2143255765==
Content-Type: multipart/alternative; boundary="00000000000093cc5c058c229f4c"

--00000000000093cc5c058c229f4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2019 at 5:01 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > +
> > +#ifndef PKEYS_H
> > +#define PKEYS_H
> > +
> > +#include "tst_test.h"
> > +#include "lapi/syscalls.h"
> > +
> > +#ifndef PKEY_DISABLE_ACCESS
> > +# define PKEY_DISABLE_ACCESS 0x1
> > +# define PKEY_DISABLE_WRITE  0x2
> > +#endif
> > +
> > +#ifndef HAVE_PKEY_MPROTECT
> > +static inline int pkey_mprotect(void *addr, size_t len, int prot, int
> pkey)
> > +{
> > +     return tst_syscall(SYS_pkey_mprotect, addr, len, prot, pkey);
>
> Hi,
>
> This should be __NR_*:
>

Exactly. Sorry about that mistake.


>
> In file included from pkey01.c:32:
> pkey.h: In function =E2=80=98pkey_mprotect=E2=80=99:
> pkey.h:20: error: =E2=80=98SYS_pkey_mprotect=E2=80=99 undeclared (first u=
se in this
> function)
> pkey.h:20: error: (Each undeclared identifier is reported only once
> pkey.h:20: error: for each function it appears in.)
> pkey.h: In function =E2=80=98pkey_alloc=E2=80=99:
> pkey.h:25: error: =E2=80=98SYS_pkey_alloc=E2=80=99 undeclared (first use =
in this function)
> pkey.h: In function =E2=80=98pkey_free=E2=80=99:
> pkey.h:30: error: =E2=80=98SYS_pkey_free=E2=80=99 undeclared (first use i=
n this function)
>
> > +static void setup(void)
> > +{
> > +     int i, fd;
> > +
> > +     if (access("/proc/sys/vm/nr_hugepages", F_OK)) {
> > +             tst_res(TINFO, "Huge page is not supported");
> > +             size =3D getpagesize();
> > +             no_hugepage =3D 1;
> > +     } else {
> > +             SAFE_FILE_PRINTF("/proc/sys/vm/nr_hugepages", "%d", 1);
>
> There are 2 problems here, both related to fact that this file exists,
> but may return EOPNOTSUPP on read/write.
>
> 1. save_restore should ignore also read/open errors if path is prefixed
> with '?'
>    I'll send this separately.
>

Thank you for that patch.



>
> 2. SAFE_FILE_PRINTF in pkey01.c shouldn't be safe, because we need to
> somehow
>    detect that write worked
>

Yes, we should verify if that value has been wrote.

>
> # ls -la /proc/sys/vm/nr_hugepages
> -rw-r--r--. 1 root root 0 Jun 25 04:12 /proc/sys/vm/nr_hugepages
>
> # cat /proc/sys/vm/nr_hugepages
> cat: /proc/sys/vm/nr_hugepages: Operation not supported
>
> > +static struct tst_test test =3D {
> > +     .tcnt =3D ARRAY_SIZE(tcases),
> > +     .forks_child =3D 1,
> > +     .test =3D verify_pkey,
> > +     .setup =3D setup,
> > +     .cleanup =3D cleanup,
> > +     .save_restore =3D save_restore,
>
> .needs_root =3D 1 as well, since we write to /proc and mount tmpfs
>

Agree.

>
> Rest looks good to me, but I haven't found yet system that could run the
> test.
>
> Regards,
> Jan
>


--=20
Regards,
Li Wang

--00000000000093cc5c058c229f4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 25, 2019 at 5:01 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; +<br>
&gt; +#ifndef PKEYS_H<br>
&gt; +#define PKEYS_H<br>
&gt; +<br>
&gt; +#include &quot;tst_test.h&quot;<br>
&gt; +#include &quot;lapi/syscalls.h&quot;<br>
&gt; +<br>
&gt; +#ifndef PKEY_DISABLE_ACCESS<br>
&gt; +# define PKEY_DISABLE_ACCESS 0x1<br>
&gt; +# define PKEY_DISABLE_WRITE=C2=A0 0x2<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifndef HAVE_PKEY_MPROTECT<br>
&gt; +static inline int pkey_mprotect(void *addr, size_t len, int prot, int=
 pkey)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return tst_syscall(SYS_pkey_mprotect, addr, len, =
prot, pkey);<br>
<br>
Hi,<br>
<br>
This should be __NR_*:<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">Exactly. Sorry about that mistake.</=
div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
In file included from pkey01.c:32:<br>
pkey.h: In function =E2=80=98pkey_mprotect=E2=80=99:<br>
pkey.h:20: error: =E2=80=98SYS_pkey_mprotect=E2=80=99 undeclared (first use=
 in this function)<br>
pkey.h:20: error: (Each undeclared identifier is reported only once<br>
pkey.h:20: error: for each function it appears in.)<br>
pkey.h: In function =E2=80=98pkey_alloc=E2=80=99:<br>
pkey.h:25: error: =E2=80=98SYS_pkey_alloc=E2=80=99 undeclared (first use in=
 this function)<br>
pkey.h: In function =E2=80=98pkey_free=E2=80=99:<br>
pkey.h:30: error: =E2=80=98SYS_pkey_free=E2=80=99 undeclared (first use in =
this function)<br>
<br>
&gt; +static void setup(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i, fd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (access(&quot;/proc/sys/vm/nr_hugepages&quot;,=
 F_OK)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;=
Huge page is not supported&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D getpagesize(=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no_hugepage =3D 1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(&quo=
t;/proc/sys/vm/nr_hugepages&quot;, &quot;%d&quot;, 1);<br>
<br>
There are 2 problems here, both related to fact that this file exists,<br>
but may return EOPNOTSUPP on read/write.<br>
<br>
1. save_restore should ignore also read/open errors if path is prefixed wit=
h &#39;?&#39;<br>
=C2=A0 =C2=A0I&#39;ll send this separately.<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Thank you for t=
hat patch.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
2. SAFE_FILE_PRINTF in pkey01.c shouldn&#39;t be safe, because we need to s=
omehow<br>
=C2=A0 =C2=A0detect that write worked<br></blockquote><div><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">Yes, we should verify if t=
hat value has been wrote.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
# ls -la /proc/sys/vm/nr_hugepages<br>
-rw-r--r--. 1 root root 0 Jun 25 04:12 /proc/sys/vm/nr_hugepages<br>
<br>
# cat /proc/sys/vm/nr_hugepages<br>
cat: /proc/sys/vm/nr_hugepages: Operation not supported<br>
<br>
&gt; +static struct tst_test test =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.tcnt =3D ARRAY_SIZE(tcases),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.forks_child =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.test =3D verify_pkey,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.save_restore =3D save_restore,<br>
<br>
.needs_root =3D 1 as well, since we write to /proc and mount tmpfs<br></blo=
ckquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Agree.</div><div class=3D"gmail_default" style=3D"font-size:small"></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Rest looks good to me, but I haven&#39;t found yet system that could run th=
e test.<br>
<br>
Regards,<br>
Jan<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000093cc5c058c229f4c--

--===============2143255765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2143255765==--
