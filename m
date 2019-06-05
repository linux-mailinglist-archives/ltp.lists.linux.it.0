Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9B3566C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:51:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F33913EA6D7
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jun 2019 07:51:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 611623EA1E6
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:51:20 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 698521A00E4A
 for <ltp@lists.linux.it>; Wed,  5 Jun 2019 07:51:18 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id j2so4809648uaq.5
 for <ltp@lists.linux.it>; Tue, 04 Jun 2019 22:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BUV3pWhUNas57kkC2w5fZBIxEeGMDEz3xP4R9PFmYec=;
 b=r3f4JDQVA435G4pz4mVkHLWnIrzLfENynVSKV8Akl9YuNYtM1bW41/Qvu8Gj4Gii4Z
 kb1rsvndmiLxNS1RlUesysjxOvOzQHYeb8xQQLwAcaIVBF8WeaA+AFOYy1+/W59a3lln
 fwGPC6nd+/Z5yCDlu5UuUtUA6webDweKZVnwnpSoXRy4pujCcPQphyPp+nFZkoqms7Yk
 vAMSy6uIg0ykZUiB08P1QUKmeD6n0rwTtGpMGJtaooRFeP6LMLjDQawwg+AZuIr0BgRr
 StuPOsZEogi5jqRkx0DjjOVsDymXpEcwPv+4gXooAz4dRdJu0SbFH1fY/oYmi08Rj4Y2
 wB3Q==
X-Gm-Message-State: APjAAAXR6mEyrjvlsH69UQmmwhSqIf8PgD1VdV5fs78uuU698pSc2DRC
 XNUFoz0yKsomPpNjJQMsu8WtEciV6Wn257o3hb0tEA==
X-Google-Smtp-Source: APXvYqxrNW5zJNY7EV6zeemqttx0DvXMzmtzePyaCvS3wJgRa6JXCz9labqDZtm6toHamjodq7tZo/Cx55vrQRxz1Ug=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr1126421uaq.106.1559713877282; 
 Tue, 04 Jun 2019 22:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
 <20190528141214.18752-2-xzhou@redhat.com>
In-Reply-To: <20190528141214.18752-2-xzhou@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 5 Jun 2019 13:51:05 +0800
Message-ID: <CAEemH2fcM18gLbM3bWRu7ddR+8QbmYCL+4U83Z5tiWgZ4suz_A@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v6 2/4] swapon/libswapon: add helper
	is_swap_supported
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0356306815=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0356306815==
Content-Type: multipart/alternative; boundary="0000000000009b789e058a8d2f08"

--0000000000009b789e058a8d2f08
Content-Type: text/plain; charset="UTF-8"

On Tue, May 28, 2019 at 10:13 PM Murphy Zhou <xzhou@redhat.com> wrote:

> To check if the filesystem we are testing on supports FIBMAP, mkswap,
> swapon and swapoff operations.
> Modify make_swapfile function to test mkswap support status safely.
>
> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> ---
>  testcases/kernel/syscalls/swapon/libswapon.c | 45 +++++++++++++++++++-
>  testcases/kernel/syscalls/swapon/libswapon.h |  7 ++-
>  2 files changed, 49 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/swapon/libswapon.c
> b/testcases/kernel/syscalls/swapon/libswapon.c
> index cf6a98891..f66d19548 100644
> --- a/testcases/kernel/syscalls/swapon/libswapon.c
> +++ b/testcases/kernel/syscalls/swapon/libswapon.c
> @@ -19,13 +19,15 @@
>   *
>   */
>
> +#include <errno.h>
> +#include "lapi/syscalls.h"
>  #include "test.h"
>  #include "libswapon.h"
>
>  /*
>   * Make a swap file
>   */
> -void make_swapfile(void (cleanup)(void), const char *swapfile)
> +int make_swapfile(void (cleanup)(void), const char *swapfile, int safe)
>  {
>         if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) * 10,
>             TST_BYTES)) {
> @@ -45,5 +47,44 @@ void make_swapfile(void (cleanup)(void), const char
> *swapfile)
>         argv[1] = swapfile;
>         argv[2] = NULL;
>
> -       tst_run_cmd(cleanup, argv, "/dev/null", "/dev/null", 0);
> +       return tst_run_cmd(cleanup, argv, "/dev/null", "/dev/null", safe);
> +}
> +
> +/*
> + * Check swapon/swapoff support status of filesystems or files
> + * we are testing on.
> + */
> +void is_swap_supported(void (cleanup)(void), const char *filename)
> +{
> +       int fibmap = tst_fibmap(filename);
> +       long fs_type = tst_fs_type(cleanup, filename);
> +       const char *fstype = tst_fs_type_name(fs_type);
> +
> +       int ret = make_swapfile(NULL, filename, 1);
> +       if (ret != 0) {
> +               if (fibmap != 0) {
>

As I replied in patch 1/4, how do we know that means FIBMAP not support if
just verify fibmap != 0?
So I would suggest to make the return value of tst_fibmap() is more precise
and do if (fibmap == 1) check here.

+                       tst_brkm(TCONF, cleanup,
> +                               "mkswap on %s not supported", fstype);
> +               } else {
> +                       tst_brkm(TFAIL, cleanup,
> +                               "mkswap on %s failed", fstype);
> +               }
> +       }
> +
> +       TEST(ltp_syscall(__NR_swapon, filename, 0));
> +       if (TEST_RETURN == -1) {
> +               if (fibmap != 0 && errno == EINVAL) {
> +                       tst_brkm(TCONF, cleanup,
> +                               "Swapfile on %s not implemented", fstype);
>

Maybe there is unnecessary to check fibmap value again? Since if the fibmap
is 1, it has already broken in make_swapfile() error handler and never
coming here?



> +               } else {
> +                       tst_brkm(TFAIL | TERRNO, cleanup,
> +                                "swapon on %s failed", fstype);
> +               }
> +       }
> +
> +       TEST(ltp_syscall(__NR_swapoff, filename, 0));
> +       if (TEST_RETURN == -1) {
> +               tst_brkm(TFAIL | TERRNO, cleanup,
> +                       "swapoff on %s failed", fstype);
> +       }
>  }
> diff --git a/testcases/kernel/syscalls/swapon/libswapon.h
> b/testcases/kernel/syscalls/swapon/libswapon.h
> index 7f7211eb4..a51833ec1 100644
> --- a/testcases/kernel/syscalls/swapon/libswapon.h
> +++ b/testcases/kernel/syscalls/swapon/libswapon.h
> @@ -29,6 +29,11 @@
>  /*
>   * Make a swap file
>   */
> -void make_swapfile(void (cleanup)(void), const char *swapfile);
> +int make_swapfile(void (cleanup)(void), const char *swapfile, int safe);
>
> +/*
> + * Check swapon/swapoff support status of filesystems or files
> + * we are testing on.
> + */
> +void is_swap_supported(void (cleanup)(void), const char *filename);
>  #endif /* __LIBSWAPON_H__ */
> --
> 2.21.0
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--0000000000009b789e058a8d2f08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, May 28, 2019 at 10:13 PM Murphy Zhou &lt;<a=
 href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">To check if the filesyste=
m we are testing on supports FIBMAP, mkswap,<br>
swapon and swapoff operations.<br>
Modify make_swapfile function to test mkswap support status safely.<br>
<br>
Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com" target=
=3D"_blank">xzhou@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/swapon/libswapon.c | 45 +++++++++++++++++++=
-<br>
=C2=A0testcases/kernel/syscalls/swapon/libswapon.h |=C2=A0 7 ++-<br>
=C2=A02 files changed, 49 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/swapon/libswapon.c b/testcases/kerne=
l/syscalls/swapon/libswapon.c<br>
index cf6a98891..f66d19548 100644<br>
--- a/testcases/kernel/syscalls/swapon/libswapon.c<br>
+++ b/testcases/kernel/syscalls/swapon/libswapon.c<br>
@@ -19,13 +19,15 @@<br>
=C2=A0 *<br>
=C2=A0 */<br>
<br>
+#include &lt;errno.h&gt;<br>
+#include &quot;lapi/syscalls.h&quot;<br>
=C2=A0#include &quot;test.h&quot;<br>
=C2=A0#include &quot;libswapon.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * Make a swap file<br>
=C2=A0 */<br>
-void make_swapfile(void (cleanup)(void), const char *swapfile)<br>
+int make_swapfile(void (cleanup)(void), const char *swapfile, int safe)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_fs_has_free(NULL, &quot;.&quot;, sysco=
nf(_SC_PAGESIZE) * 10,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_BYTES)) {<br>
@@ -45,5 +47,44 @@ void make_swapfile(void (cleanup)(void), const char *swa=
pfile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[1] =3D swapfile;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[2] =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_run_cmd(cleanup, argv, &quot;/dev/null&quot=
;, &quot;/dev/null&quot;, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return tst_run_cmd(cleanup, argv, &quot;/dev/nu=
ll&quot;, &quot;/dev/null&quot;, safe);<br>
+}<br>
+<br>
+/*<br>
+ * Check swapon/swapoff support status of filesystems or files<br>
+ * we are testing on.<br>
+ */<br>
+void is_swap_supported(void (cleanup)(void), const char *filename)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fibmap =3D tst_fibmap(filename);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long fs_type =3D tst_fs_type(cleanup, filename)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *fstype =3D tst_fs_type_name(fs_type=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D make_swapfile(NULL, filename, 1);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fibmap !=3D 0) =
{<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">As I replied in patch 1/4, how do we know that means FIBMAP no=
t support if just verify fibmap !=3D 0?</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">So I would suggest to make the return value of tst=
_fibmap() is more precise and do if (fibmap =3D=3D 1) check here.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small"></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TCONF, cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mkswap on %s not supported&quot=
;, fstype);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TFAIL, cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mkswap on %s failed&quot;, fsty=
pe);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(ltp_syscall(__NR_swapon, filename, 0));<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TEST_RETURN =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fibmap !=3D 0 &=
amp;&amp; errno =3D=3D EINVAL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TCONF, cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Swapfile on %s not implemented&=
quot;, fstype);<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Maybe there is unnecessary to check fibmap =
value again? Since if the fibmap is 1, it has already broken in make_swapfi=
le() error handler and never coming here?</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TFAIL | TERRNO, cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;swapon on %s failed&quot;, fst=
ype);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(ltp_syscall(__NR_swapoff, filename, 0));<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TEST_RETURN =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TFAIL | TE=
RRNO, cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;swapoff on %s failed&quot;, fstype);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
diff --git a/testcases/kernel/syscalls/swapon/libswapon.h b/testcases/kerne=
l/syscalls/swapon/libswapon.h<br>
index 7f7211eb4..a51833ec1 100644<br>
--- a/testcases/kernel/syscalls/swapon/libswapon.h<br>
+++ b/testcases/kernel/syscalls/swapon/libswapon.h<br>
@@ -29,6 +29,11 @@<br>
=C2=A0/*<br>
=C2=A0 * Make a swap file<br>
=C2=A0 */<br>
-void make_swapfile(void (cleanup)(void), const char *swapfile);<br>
+int make_swapfile(void (cleanup)(void), const char *swapfile, int safe);<b=
r>
<br>
+/*<br>
+ * Check swapon/swapoff support status of filesystems or files<br>
+ * we are testing on.<br>
+ */<br>
+void is_swap_supported(void (cleanup)(void), const char *filename);<br>
=C2=A0#endif /* __LIBSWAPON_H__ */<br>
-- <br>
2.21.0<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000009b789e058a8d2f08--

--===============0356306815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0356306815==--
