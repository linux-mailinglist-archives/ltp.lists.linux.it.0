Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D25830C46
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 12:02:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8BD43EA298
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 12:02:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 56BA73EA05E
 for <ltp@lists.linux.it>; Fri, 31 May 2019 12:02:50 +0200 (CEST)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0B3541A01177
 for <ltp@lists.linux.it>; Fri, 31 May 2019 12:02:49 +0200 (CEST)
Received: by mail-vk1-f194.google.com with SMTP id l73so1373408vkl.8
 for <ltp@lists.linux.it>; Fri, 31 May 2019 03:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/s52rvaexv4SsskWnfPJroucQ9fnMPRMoNiYthtsNg=;
 b=t9+eBFoGZyrY69KUp58HQ68EXDn36Mx0bz3Xyv3IA+frNh+onkfXhun+9DsxtlbYVJ
 pP8h3B35Kzf4GLjWY32eF4yRvNa6OZ+zggMafnaGB5eaF2fsp930e0vfjrm2Tt81lMxQ
 2cjkBcz937puuCmJm0L8cnguR5XWR4YgQgTAGrjslDZpfVOPuBewv1JDBQJFMnlMj4HO
 3SC6Xpefkf8ITxgffGTm8w6Va/kdbkMGQGy/5Ga3LUd4aBmCe37Y/ggyG7u7OWbQ9cFk
 W1nXxIDj2sXCIHgwE44KKQPH/qFCjxyf7JVlSeh0/Q7vbp4EbzM9KEZw/Zn/+HWgIKi6
 i1Sg==
X-Gm-Message-State: APjAAAUMp+b5ehN+7EWicJu0/0zyoJrzN83dBuTqW4jMu2JPYE+7TZaT
 k6BAMssX5frDUQbjuJrEv44OFN4k/BySW0nzhgqqYi78yvs5uw==
X-Google-Smtp-Source: APXvYqwg9dXCQdnSxhNtjMhdu2Xlw9RrGqdokQHHTm60mE9GJw/HfLsL586rmquM4orWJ4A4j47JuUmnT0uDIo02T54=
X-Received: by 2002:a1f:23d6:: with SMTP id j205mr3639660vkj.52.1559296967777; 
 Fri, 31 May 2019 03:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
In-Reply-To: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 31 May 2019 18:02:36 +0800
Message-ID: <CAEemH2eupy=uOYFpUFg3mDF0M06SZ07XW9+kw2e_B=wrY5-QOQ@mail.gmail.com>
To: Jinhui huang <huangjh.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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
Content-Type: multipart/mixed; boundary="===============1633341155=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1633341155==
Content-Type: multipart/alternative; boundary="000000000000dd3ebb058a2c1de2"

--000000000000dd3ebb058a2c1de2
Content-Type: text/plain; charset="UTF-8"

On Fri, May 31, 2019 at 4:44 PM Jinhui huang <huangjh.jy@cn.fujitsu.com>
wrote:

> On new kernels, copy_file_range() returned EISDIR when copyed contents
> to directory, but on old kernels, it returned EBADF, we should accept
> EBADF to be compatible with new and old kernels.
>
> The patch as follows:
> commit 11cbfb10775a ("vfs: deny copy_file_range() for non regular files")
>

Patch makes sense.

Reviewed-by: Li Wang <liwang@redhat.com>

>
> Signed-off-by: Jinhui huang <huangjh.jy@cn.fujitsu.com>
> ---
>  .../syscalls/copy_file_range/copy_file_range02.c   | 33
> +++++++++++++++-------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> index 07c0207..9e6356c 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -54,19 +54,32 @@ static void verify_copy_file_range(unsigned int n)
>         TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
>                                 0, CONTSIZE, tc->flags));
>
> -       if (TST_RET == -1) {
> -               if (tc->exp_err == TST_ERR) {
> +       if (TST_RET != -1) {
> +               tst_res(TFAIL,
> +                       "copy_file_range returned wrong value: %ld",
> TST_RET);
> +               return;
> +       }
> +
> +       if (tc->exp_err == TST_ERR) {
> +               tst_res(TPASS | TTERRNO,
> +                       "copy_file_range failed as expected");
> +       } else {
> +               /* copy_file_range() returned EISDIR when copyed contents
> to
> +                * directory on new kernels, but on old kernels, it
> returned
> +                * EBADF.
> +                *
> +                * the patch as follws:
> +                * commit 11cbfb10775a ("vfs: deny copy_file_range() for
> non regular files")
> +                */
> +               if (tc->exp_err == EISDIR && TST_ERR == EBADF) {
>                         tst_res(TPASS | TTERRNO,
> -                                       "copy_file_range failed as
> expected");
> -               } else {
> -                       tst_res(TFAIL | TTERRNO,
> -                               "copy_file_range failed unexpectedly;
> expected %s, but got",
> -                               tst_strerrno(tc->exp_err));
> +                               "copy_file_range failed as expected");
>                         return;
>                 }
> -       } else {
> -               tst_res(TFAIL,
> -                       "copy_file_range returned wrong value: %ld",
> TST_RET);
> +
> +               tst_res(TFAIL | TTERRNO,
> +                       "copy_file_range failed unexpectedly; expected %s,
> but got",
> +                       tst_strerrno(tc->exp_err));
>         }
>  }
>
> --
> 1.8.3.1
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


-- 
Regards,
Li Wang

--000000000000dd3ebb058a2c1de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, May 31, 2019 at 4:44 PM Jinhui huang &lt;<a=
 href=3D"mailto:huangjh.jy@cn.fujitsu.com">huangjh.jy@cn.fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On new =
kernels, copy_file_range() returned EISDIR when copyed contents<br>
to directory, but on old kernels, it returned EBADF, we should accept<br>
EBADF to be compatible with new and old kernels.<br>
<br>
The patch as follows:<br>
commit 11cbfb10775a (&quot;vfs: deny copy_file_range() for non regular file=
s&quot;)<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Patch makes sense.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com=
">liwang@redhat.com</a>&gt;</div><div class=3D"gmail_default" style=3D"font=
-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Jinhui huang &lt;<a href=3D"mailto:huangjh.jy@cn.fujitsu.com=
" target=3D"_blank">huangjh.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../syscalls/copy_file_range/copy_file_range02.c=C2=A0 =C2=A0| 33 +++=
++++++++++++-------<br>
=C2=A01 file changed, 23 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c =
b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
index 07c0207..9e6356c 100644<br>
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c<br>
@@ -54,19 +54,32 @@ static void verify_copy_file_range(unsigned int n)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(sys_copy_file_range(fd_src, 0, *tc-&gt;cop=
y_to_fd,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, CONTSIZE, tc-&gt;flags));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_err =
=3D=3D TST_ERR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;copy_file_range returned wrong value: %ld&quot;, TST_RET);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_err =3D=3D TST_ERR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS | TTE=
RRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;copy_file_range failed as expected&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* copy_file_range(=
) returned EISDIR when copyed contents to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * directory on new=
 kernels, but on old kernels, it returned<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * EBADF.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the patch as fol=
lws:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * commit 11cbfb107=
75a (&quot;vfs: deny copy_file_range() for non regular files&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_err =
=3D=3D EISDIR &amp;&amp; TST_ERR =3D=3D EBADF) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_res(TPASS | TTERRNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cop=
y_file_range failed as expected&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL | TTERRNO,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;copy_file_range failed unexpect=
edly; expected %s, but got&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_strerrno(tc-&gt;exp_err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;copy_file_range failed as expec=
ted&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;copy_file_range returned wrong value: %ld&quot;, TST_RET);<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TTE=
RRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;copy_file_range failed unexpectedly; expected %s, but got&q=
uot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_strerrno(tc-&gt;exp_err));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
-- <br>
1.8.3.1<br>
<br>
<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000dd3ebb058a2c1de2--

--===============1633341155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1633341155==--
