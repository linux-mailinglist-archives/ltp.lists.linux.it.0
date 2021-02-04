Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C930F429
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 14:51:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 522893C734B
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Feb 2021 14:51:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C8A4C3C711B
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 14:51:35 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C5E7B6008C2
 for <ltp@lists.linux.it>; Thu,  4 Feb 2021 14:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612446693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ujPxii7xsNZd/wWawkBrolO8ZBj52U670ziakGg0Dzo=;
 b=Y3QT0TdbZye69JrFAgxTJru7hBrsICaF7TKyvBMKZ1uwnvgahdghIuDdomWZcp4qNNMRnE
 /CXhD0/Zv85PGqJoRp5eJD2EEgriY5P/UUATc3aelf2G54uHhVgc/jdR54VtYDsVzZ7m7c
 JnXPJTaty7lfK5Ju+LDAVrgNMgw5GHI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-BrDS78tjNKOqGCXqMD9Oag-1; Thu, 04 Feb 2021 08:51:31 -0500
X-MC-Unique: BrDS78tjNKOqGCXqMD9Oag-1
Received: by mail-yb1-f199.google.com with SMTP id m7so3331990ybm.19
 for <ltp@lists.linux.it>; Thu, 04 Feb 2021 05:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ujPxii7xsNZd/wWawkBrolO8ZBj52U670ziakGg0Dzo=;
 b=OY5u/1TA+KVzctvvsuSrLjCT3NPMbxHkOqdMs/zfENWwerDxmVApnPlLCf57UhCiSL
 kE8GUVJed+q5XLCtlTFTahHE2JsSwTcxx6dXCHGa0WrQ61lkEO0Rlyc989+TozcdbvFG
 DfVx28wGdp70Qti6SqyKO4nmMcYrJGUM8SFzLqW/nilJMlh26YuIxZ/E/fm7YuFw9klh
 YlJi2YTDKx2vWIRjDHG2e4S/ZL3E55bOJ3LlX8i7GW/w+3oQEvBH1hlWEAKCOst8DigU
 qW+gYfb7iPzZA5ytuCaroMzGZ2odTMQ5KVb/KL+TDCm1g5qmBDF4l+8VcbQ2tBpcgNg7
 fqkw==
X-Gm-Message-State: AOAM531i3KJLgSP3D6Yt/04SJvRbQhGA4ZhQkmbznCuR+fV2TVkAS3Sa
 +16mzK4jqKqLxbtXQYu3eQRlk4g2BoFHb1DyeHiBohq+MDtXdJcALRTmIN04NDcpq4WE3mDqh95
 h+nArMyXFLRp4wkbbACGcohhgboQ=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr12026252ybb.252.1612446690585; 
 Thu, 04 Feb 2021 05:51:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFKtHun7E6zWtDDxWBPjA2tDtNjwfWqDloCgARMcUbiuVn1F1thpQ02GodQPdseMO5JUVW6yF3Rr5bW7DXcUU=
X-Received: by 2002:a25:5ac2:: with SMTP id
 o185mr12026229ybb.252.1612446690368; 
 Thu, 04 Feb 2021 05:51:30 -0800 (PST)
MIME-Version: 1.0
References: <CAEemH2eiTY7YgSYLr6_skK6PaRZb2_GchbmHUJKVuW7btA15rQ@mail.gmail.com>
 <1612440762-22389-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1612440762-22389-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1612440762-22389-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 4 Feb 2021 21:51:18 +0800
Message-ID: <CAEemH2ehgnR0Ad5VzR63KgtjFBoqH5N_1b13T7f5Gw6n3EkzdA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/5] syscalls/mallinfo02: Add a basic test to
 check use mmap or sbrk
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
Content-Type: multipart/mixed; boundary="===============1858935823=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1858935823==
Content-Type: multipart/alternative; boundary="00000000000032f53c05ba830099"

--00000000000032f53c05ba830099
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 8:12 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> According mallinfo man-page, hblkhd member represents
> "The number of bytes in blocks currently allocated using mmap(2).".
> For allocations greater than or equal to 128K and that can't be satisfied
> from
> the free list, the memory-allocation functions employ mmap(2) instead of
> increasing
> the program break using sbrk(2).
>
> In this case, we test 20k size to use sbrk and 128k size to use mmap.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
> v1->v2:
> 1.Use mallopt(M_MMAP_THRESHOLD, 131072) to avoid dynamic mmap threshold
> 2.Use tst_print_malinfo api
>  runtest/syscalls                              |  1 +
>  testcases/kernel/syscalls/mallinfo/.gitignore |  1 +
>  .../kernel/syscalls/mallinfo/mallinfo02.c     | 64 +++++++++++++++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/mallinfo/mallinfo02.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 753340068..a8fa3f7bf 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -683,6 +683,7 @@ lstat02 lstat02
>  lstat02_64 lstat02_64
>
>  mallinfo01 mallinfo01
> +mallinfo02 mallinfo02
>
>  mallopt01 mallopt01
>
> diff --git a/testcases/kernel/syscalls/mallinfo/.gitignore
> b/testcases/kernel/syscalls/mallinfo/.gitignore
> index a7e32a637..678ac277e 100644
> --- a/testcases/kernel/syscalls/mallinfo/.gitignore
> +++ b/testcases/kernel/syscalls/mallinfo/.gitignore
> @@ -1 +1,2 @@
>  /mallinfo01
> +/mallinfo02
> diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo02.c
> b/testcases/kernel/syscalls/mallinfo/mallinfo02.c
> new file mode 100644
> index 000000000..d5bed45a8
> --- /dev/null
> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo02.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Basic mallinfo() test for malloc() using sbrk or mmap.
> + * It size > MMAP_THRESHOLD, it will use mmap. Otherwise, use sbrk.
> +\*/
> +
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +#include "tst_mallinfo.h"
> +
> +#ifdef HAVE_MALLINFO
> +void test_mallopt(void)
>

what about renaming to test_mallinfo(void) ?



> +{
> +       struct mallinfo info;
> +       int size;
> +       char *buf;
> +
> +       buf = SAFE_MALLOC(20480);
> +
> +       info = mallinfo();
> +       if (info.uordblks > 20480 && info.hblkhd == 0) {
> +               tst_res(TPASS, "malloc() uses sbrk when size < 128k");
> +       } else {
> +               tst_res(TFAIL, "malloc() use mmap when size < 128k");
> +               tst_print_mallinfo("Test malloc(20480)", &info);
> +       }
> +       free(buf);
> +
> +       info = mallinfo();
> +       size = MAX(info.fordblks, 131072);
> +
> +       buf = SAFE_MALLOC(size);
> +       info = mallinfo();
> +       if (info.hblkhd > size && info.hblks > 0) {
> +               tst_res(TPASS, "malloc() uses mmap when size >= 128k");
> +       } else {
> +               tst_res(TFAIL, "malloc uses sbrk when size >= 128k");
>

Why not 'TFAIL | TERRNO' ?


> +               tst_print_mallinfo("Test malloc(1024*128)", &info);
> +       }
> +
> +       free(buf);
> +}
> +
> +static void setup(void)
> +{
> +       if (mallopt(M_MMAP_THRESHOLD, 131072) == 0)
> +               tst_res(TFAIL, "mallopt(M_MMAP_THRESHOLD, 128K) failed");
>

Here as well.


> +}
> +
> +static struct tst_test test = {
> +       .setup = setup,
> +       .test_all = test_mallopt,
> +};
> +
> +#else
> +TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo()");
> +#endif
> --
> 2.23.0
>
>
>
>

-- 
Regards,
Li Wang

--00000000000032f53c05ba830099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Feb 4, 2021 at 8:12 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn=
.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">According mallinfo man-page, hblkhd member represents<br>
&quot;The number of bytes in blocks currently allocated using mmap(2).&quot=
;.<br>
For allocations greater than or equal to 128K and that can&#39;t be satisfi=
ed from<br>
the free list, the memory-allocation functions employ mmap(2) instead of in=
creasing<br>
the program break using sbrk(2).<br>
<br>
In this case, we test 20k size to use sbrk and 128k size to use mmap.<br>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
v1-&gt;v2:<br>
1.Use mallopt(M_MMAP_THRESHOLD, 131072) to avoid dynamic mmap threshold<br>
2.Use tst_print_malinfo api <br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0testcases/kernel/syscalls/mallinfo/.gitignore |=C2=A0 1 +<br>
=C2=A0.../kernel/syscalls/mallinfo/mallinfo02.c=C2=A0 =C2=A0 =C2=A0| 64 +++=
++++++++++++++++<br>
=C2=A03 files changed, 66 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/mallinfo/mallinfo02.c<br=
>
<br>
diff --git a/runtest/syscalls b/runtest/syscalls<br>
index 753340068..a8fa3f7bf 100644<br>
--- a/runtest/syscalls<br>
+++ b/runtest/syscalls<br>
@@ -683,6 +683,7 @@ lstat02 lstat02<br>
=C2=A0lstat02_64 lstat02_64<br>
<br>
=C2=A0mallinfo01 mallinfo01<br>
+mallinfo02 mallinfo02<br>
<br>
=C2=A0mallopt01 mallopt01<br>
<br>
diff --git a/testcases/kernel/syscalls/mallinfo/.gitignore b/testcases/kern=
el/syscalls/mallinfo/.gitignore<br>
index a7e32a637..678ac277e 100644<br>
--- a/testcases/kernel/syscalls/mallinfo/.gitignore<br>
+++ b/testcases/kernel/syscalls/mallinfo/.gitignore<br>
@@ -1 +1,2 @@<br>
=C2=A0/mallinfo01<br>
+/mallinfo02<br>
diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo02.c b/testcases/ke=
rnel/syscalls/mallinfo/mallinfo02.c<br>
new file mode 100644<br>
index 000000000..d5bed45a8<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo02.c<br>
@@ -0,0 +1,64 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.<br>
+ * Author: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" tar=
get=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
+ */<br>
+<br>
+/*\<br>
+ * [DESCRIPTION]<br>
+ *<br>
+ * Basic mallinfo() test for malloc() using sbrk or mmap.<br>
+ * It size &gt; MMAP_THRESHOLD, it will use mmap. Otherwise, use sbrk.<br>
+\*/<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;tst_safe_macros.h&quot;<br>
+#include &quot;tst_mallinfo.h&quot;<br>
+<br>
+#ifdef HAVE_MALLINFO<br>
+void test_mallopt(void)<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">what about renaming to test_mallin=
fo(void) ?</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mallinfo info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D SAFE_MALLOC(20480);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D mallinfo();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info.uordblks &gt; 20480 &amp;&amp; info.hb=
lkhd =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;malloc() uses sbrk when size &lt; 128k&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;malloc() use mmap when size &lt; 128k&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_print_mallinfo(=
&quot;Test malloc(20480)&quot;, &amp;info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D mallinfo();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D MAX(info.fordblks, 131072);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D SAFE_MALLOC(size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D mallinfo();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (info.hblkhd &gt; size &amp;&amp; info.hblks=
 &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;malloc() uses mmap when size &gt;=3D 128k&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;malloc uses sbrk when size &gt;=3D 128k&quot;);<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">Why not &=
#39;TFAIL | TERRNO&#39;=C2=A0?</div></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_print_mallinfo(=
&quot;Test malloc(1024*128)&quot;, &amp;info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(buf);<br>
+}<br>
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mallopt(M_MMAP_THRESHOLD, 131072) =3D=3D 0)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;mallopt(M_MMAP_THRESHOLD, 128K) failed&quot;);<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Here as we=
ll.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D test_mallopt,<br>
+};<br>
+<br>
+#else<br>
+TST_TEST_TCONF(&quot;system doesn&#39;t implement non-POSIX mallinfo()&quo=
t;);<br>
+#endif<br>
-- <br>
2.23.0<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--00000000000032f53c05ba830099--


--===============1858935823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1858935823==--

