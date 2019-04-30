Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C639F1E0
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:14:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AE853EACAD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 10:14:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id AC9F83EACA1
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:14:36 +0200 (CEST)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A2D84600E4C
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:14:37 +0200 (CEST)
Received: by mail-vs1-f68.google.com with SMTP id w13so7492054vsc.4
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 01:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EFQ2kaCdVbV7dGEMPUqWTFoEnuxUMPWjlGs44OS9S/4=;
 b=A/LOxjoUICW9YP0ljzv/DhXC7bc4+zLWyhjHgUvTUQMgWUePzziVUNfo8ALpeYjOBy
 AZhmxE1KCEmhJtLVRfu2ZGwvxaiLMUbb+nLfytZu1vc2n0xCIPhGyj4rgHtoW61dyfAy
 oSoqncgGmZ9r95lsIVDTM5nJrleKjhZy3bXVMbRWgo3kdbE33DDQmvxqd8CYGD+Hp6A4
 5csq1m1rNj00poJ+nUmvuUV4oLKlYXGu/ZcmxK2hJI8kQmTULOZTqcntSQG8xVqhr/2q
 ClvPzebRcdyKGxl3rOH/159Q42Z8hUSh76AFjtFHNhsg/JlXWQlZ2989OJu30GqWDjFo
 hakg==
X-Gm-Message-State: APjAAAXGhHNb/f9uUtKcXU86ZDGxwSe00vk6EpoTmkFm1z3ldXFr5y4r
 hanf9rJtFnAN6lGlj/kZvm1/wc2vme+ifYSne8q3CjG7iOk=
X-Google-Smtp-Source: APXvYqxwjTt79/yRIJ3+lT8ENRAZ/Ek7qUepdQUo8HbpB0pZzmRPUMZyC3zKs0/XkMoY6p6o6rAbN0GQpaVRNHFgu8U=
X-Received: by 2002:a67:fe91:: with SMTP id b17mr19046889vsr.217.1556612074246; 
 Tue, 30 Apr 2019 01:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190430071446.13716-1-xzhou@redhat.com>
In-Reply-To: <20190430071446.13716-1-xzhou@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 30 Apr 2019 16:14:23 +0800
Message-ID: <CAEemH2c0FYg+WoCJfzWmaUiANE3pcpdXT2fHVGXsL_qnRJUn+A@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] syscalls/swapon02: Do not fail on overlayfs
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
Content-Type: multipart/mixed; boundary="===============1183635341=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1183635341==
Content-Type: multipart/alternative; boundary="000000000000bd36960587bafdeb"

--000000000000bd36960587bafdeb
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 3:21 PM Murphy Zhou <xzhou@redhat.com> wrote:

> Currently swapfiles on Overlayfs are not supported.
>
> So if we are on overlayfs and we get EINVAL from swapon() we return TCONF.
>
> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> ---
>  testcases/kernel/syscalls/swapon/swapon02.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/swapon/swapon02.c
> b/testcases/kernel/syscalls/swapon/swapon02.c
> index 4af5105c6..211cdfc4e 100644
> --- a/testcases/kernel/syscalls/swapon/swapon02.c
> +++ b/testcases/kernel/syscalls/swapon/swapon02.c
> @@ -86,6 +86,11 @@ static void verify_swapon(struct test_case_t *test)
>                         return;
>         }
>
> +       if (fs_type == TST_OVERLAYFS_MAGIC && errno == EINVAL) {
> +               tst_resm(TCONF, "Swapfile on overlayfs not implemeted");
> +                       return;
> +       }
>

The code looks correct.

But it already has a test skipping for BTRFS, is there any possibility to
combine these filesystems check together?


> +
>         tst_resm(TFAIL, "swapon(2) failed to produce expected error:"
>                  " %d, errno: %s and got %d.", test->exp_errno,
>                  test->exp_errval, TEST_ERRNO);
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

--000000000000bd36960587bafdeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Apr 30, 2019 at 3:21 PM Murphy Zhou &lt;<a =
href=3D"mailto:xzhou@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Currently swapfiles on Ove=
rlayfs are not supported.<br>
<br>
So if we are on overlayfs and we get EINVAL from swapon() we return TCONF.<=
br>
<br>
Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com" target=
=3D"_blank">xzhou@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/swapon/swapon02.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/testcases/kernel/syscalls/swapon/swapon02.c b/testcases/kernel=
/syscalls/swapon/swapon02.c<br>
index 4af5105c6..211cdfc4e 100644<br>
--- a/testcases/kernel/syscalls/swapon/swapon02.c<br>
+++ b/testcases/kernel/syscalls/swapon/swapon02.c<br>
@@ -86,6 +86,11 @@ static void verify_swapon(struct test_case_t *test)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fs_type =3D=3D TST_OVERLAYFS_MAGIC &amp;&am=
p; errno =3D=3D EINVAL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(TCONF, &qu=
ot;Swapfile on overlayfs not implemeted&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">The code looks correct.</div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">But i=
t already has a test skipping for BTRFS, is there any possibility to combin=
e these filesystems check together?</div></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;swapon(2) failed to produ=
ce expected error:&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; %d, er=
rno: %s and got %d.&quot;, test-&gt;exp_errno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test-&gt;exp_=
errval, TEST_ERRNO);<br>
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

--000000000000bd36960587bafdeb--

--===============1183635341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1183635341==--
