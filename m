Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA4A419F8
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 03:28:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79EAB3EAEB9
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Jun 2019 03:28:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5BD503EA9F5
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 03:28:18 +0200 (CEST)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 27E94601AC6
 for <ltp@lists.linux.it>; Wed, 12 Jun 2019 03:28:16 +0200 (CEST)
Received: by mail-ua1-f65.google.com with SMTP id z13so5038906uaa.4
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 18:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YVCJ85yZP8x3mHaXn8PXjqICyE5SXvzFQmMJmSp0+OM=;
 b=XgntLLSe3RYgTuZasNIfmimKkgj5vmljVreqpqdrp0kxabupkz7APD/jQ3TCvCETKR
 f/YQn7DGPv8eW/nzKoy8bgxgSUwADsf0Rr25wEP0+Q9KixF6+RM1wSoFH8NAV2jB9htv
 LUMbKGh2/UDE4aBSM51nEI8QuzHXjqREcbCQKgTrxsCjxowfwuZTV09AENJbfxL9OcJ5
 28M32ApG9EXofIfquWpF8yx8LLj2kIWBOp5j7nbYGRHrFRdKdRhxE8FJXTFZt4auJE2j
 R3ihME/sh4RgU4c9lj/NFCOKESJJB33WlRhjojcqfrLxoYsT6jtIiWSVw3Lymu7Dbes6
 tXoQ==
X-Gm-Message-State: APjAAAVXISvdN66+cGnrF6QFN9GVtvI7G+wSh/Y2zftnjqwGxGnzb3zt
 hXvnQe1h+L2h7DbVXI4KBGrY10axKft/XOgMuZGlBxlTr1Q=
X-Google-Smtp-Source: APXvYqyrzhw9bZfZyz106AL3pYInbK2iaORHwTqTEGCTEKv4ll8FIFSc1TlVYU9inomkWd1p68wj0iVbvHxKv7mtMWw=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr23849524uaq.106.1560302895053; 
 Tue, 11 Jun 2019 18:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <916c20b9a379badd37a85aa1e1339566c9807d23.1560248542.git.jstancek@redhat.com>
In-Reply-To: <916c20b9a379badd37a85aa1e1339566c9807d23.1560248542.git.jstancek@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Wed, 12 Jun 2019 09:28:03 +0800
Message-ID: <CAEemH2dD0TLb0EO1n6iHrzEkYqKd8ueO+20KKWLnVEjLRe+1SQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_ns0[156]: align stack and wait
	for child
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
Content-Type: multipart/mixed; boundary="===============1115255413=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1115255413==
Content-Type: multipart/alternative; boundary="000000000000cd5669058b1653fa"

--000000000000cd5669058b1653fa
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 11, 2019 at 6:25 PM Jan Stancek <jstancek@redhat.com> wrote:

> Test crashes (SIGBUS) when using child stack have been observed for
> ioctl_ns01. Align stack to 64 bytes for all testcases using clone,
> which should work for any arch.


> Add SIGCHLD to clone flags, so that LTP library can reap all children
> and check their return code.  Also check ltp_clone() return value.
>
> Suppress warning for unused *arg in child().
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>

---
>  testcases/kernel/syscalls/ioctl/ioctl_ns01.c |  9 +++++----
>  testcases/kernel/syscalls/ioctl/ioctl_ns05.c |  8 +++++---
>  testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 11 +++++++----
>  3 files changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> index dfde4da6c5d6..a6ff57d4cbf9 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> @@ -23,7 +23,7 @@
>
>  #define STACK_SIZE (1024 * 1024)
>
> -static char child_stack[STACK_SIZE];
> +static char child_stack[STACK_SIZE] __attribute__((aligned(64)));
>
>  static void setup(void)
>  {
> @@ -53,7 +53,7 @@ static void test_ns_get_parent(void)
>         }
>  }
>
> -static int child(void *arg)
> +static int child(void *arg LTP_ATTRIBUTE_UNUSED)
>  {
>         test_ns_get_parent();
>         return 0;
> @@ -63,8 +63,9 @@ static void run(void)
>  {
>         test_ns_get_parent();
>
> -       ltp_clone(CLONE_NEWPID, &child, 0,
> -               STACK_SIZE, child_stack);
> +       if (ltp_clone(CLONE_NEWPID | SIGCHLD, &child, 0,
> +               STACK_SIZE, child_stack) == -1)
> +               tst_brk(TBROK | TERRNO, "ltp_clone failed");
>  }
>
>  static struct tst_test test = {
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
> b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
> index a8dee07a1154..685a5f683b25 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c
> @@ -22,7 +22,7 @@
>
>  #define STACK_SIZE (1024 * 1024)
>
> -static char child_stack[STACK_SIZE];
> +static char child_stack[STACK_SIZE] __attribute__((aligned(64)));
>
>  static void setup(void)
>  {
> @@ -32,7 +32,7 @@ static void setup(void)
>                 tst_res(TCONF, "namespace not available");
>  }
>
> -static int child(void *arg)
> +static int child(void *arg LTP_ATTRIBUTE_UNUSED)
>  {
>         if (getpid() != 1)
>                 tst_res(TFAIL, "child should think its pid is 1");
> @@ -44,8 +44,10 @@ static int child(void *arg)
>
>  static void run(void)
>  {
> -       pid_t pid = ltp_clone(CLONE_NEWPID, &child, 0,
> +       pid_t pid = ltp_clone(CLONE_NEWPID | SIGCHLD, &child, 0,
>                 STACK_SIZE, child_stack);
> +       if (pid == -1)
> +               tst_brk(TBROK | TERRNO, "ltp_clone failed");
>
>         char child_namespace[20];
>         int my_fd, child_fd, parent_fd;
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
> b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
> index 805a0a072e2f..bf5800434723 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c
> @@ -23,7 +23,7 @@
>
>  #define STACK_SIZE (1024 * 1024)
>
> -static char child_stack[STACK_SIZE];
> +static char child_stack[STACK_SIZE] __attribute__((aligned(64)));
>
>  static void setup(void)
>  {
> @@ -33,7 +33,7 @@ static void setup(void)
>                 tst_res(TCONF, "namespace not available");
>  }
>
> -static int child(void *arg)
> +static int child(void *arg LTP_ATTRIBUTE_UNUSED)
>  {
>         TST_CHECKPOINT_WAIT(0);
>         return 0;
> @@ -41,10 +41,13 @@ static int child(void *arg)
>
>  static void run(void)
>  {
> -       pid_t pid = ltp_clone(CLONE_NEWUSER, &child, 0,
> -               STACK_SIZE, child_stack);
>         char child_namespace[20];
>
> +       pid_t pid = ltp_clone(CLONE_NEWUSER | SIGCHLD, &child, 0,
> +               STACK_SIZE, child_stack);
> +       if (pid == -1)
> +               tst_brk(TBROK | TERRNO, "ltp_clone failed");
> +
>         sprintf(child_namespace, "/proc/%i/ns/user", pid);
>         int my_fd, child_fd, parent_fd;
>
> --
> 1.8.3.1
>
>

-- 
Regards,
Li Wang

--000000000000cd5669058b1653fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 6:25 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Te=
st crashes (SIGBUS) when using child stack have been observed for<br>
ioctl_ns01. Align stack to 64 bytes for all testcases using clone,<br>
which should work for any arch.</blockquote><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Add SIGCHLD to clone flags, so that LTP library can reap all children<br>
and check their return code.=C2=A0 Also check ltp_clone() return value.<br>
<br>
Suppress warning for unused *arg in child().<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br></blockquote><div><br></div><di=
v class=3D"gmail_default" style=3D"font-size:small">Reviewed-by: Li Wang &l=
t;<a href=3D"mailto:liwang@redhat.com" target=3D"_blank">liwang@redhat.com<=
/a>&gt;</div><br class=3D"m_7615400080412838853gmail-Apple-interchange-newl=
ine"><div class=3D"gmail_default" style=3D"font-size:small"></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_ns01.c |=C2=A0 9 +++++----<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_ns05.c |=C2=A0 8 +++++---<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 11 +++++++----<br>
=C2=A03 files changed, 17 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c b/testcases/kerne=
l/syscalls/ioctl/ioctl_ns01.c<br>
index dfde4da6c5d6..a6ff57d4cbf9 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
@@ -23,7 +23,7 @@<br>
<br>
=C2=A0#define STACK_SIZE (1024 * 1024)<br>
<br>
-static char child_stack[STACK_SIZE];<br>
+static char child_stack[STACK_SIZE] __attribute__((aligned(64)));<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
@@ -53,7 +53,7 @@ static void test_ns_get_parent(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
-static int child(void *arg)<br>
+static int child(void *arg LTP_ATTRIBUTE_UNUSED)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ns_get_parent();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
@@ -63,8 +63,9 @@ static void run(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ns_get_parent();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ltp_clone(CLONE_NEWPID, &amp;child, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STACK_SIZE, child_s=
tack);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ltp_clone(CLONE_NEWPID | SIGCHLD, &amp;chil=
d, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STACK_SIZE, child_s=
tack) =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;ltp_clone failed&quot;);<br>
=C2=A0}<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c b/testcases/kerne=
l/syscalls/ioctl/ioctl_ns05.c<br>
index a8dee07a1154..685a5f683b25 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns05.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns05.c<br>
@@ -22,7 +22,7 @@<br>
<br>
=C2=A0#define STACK_SIZE (1024 * 1024)<br>
<br>
-static char child_stack[STACK_SIZE];<br>
+static char child_stack[STACK_SIZE] __attribute__((aligned(64)));<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
@@ -32,7 +32,7 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF, &quo=
t;namespace not available&quot;);<br>
=C2=A0}<br>
<br>
-static int child(void *arg)<br>
+static int child(void *arg LTP_ATTRIBUTE_UNUSED)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (getpid() !=3D 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TFAIL, &quo=
t;child should think its pid is 1&quot;);<br>
@@ -44,8 +44,10 @@ static int child(void *arg)<br>
<br>
=C2=A0static void run(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid =3D ltp_clone(CLONE_NEWPID, &amp;chil=
d, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid =3D ltp_clone(CLONE_NEWPID | SIGCHLD,=
 &amp;child, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STACK_SIZE, child_s=
tack);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;ltp_clone failed&quot;);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char child_namespace[20];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int my_fd, child_fd, parent_fd;<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c b/testcases/kerne=
l/syscalls/ioctl/ioctl_ns06.c<br>
index 805a0a072e2f..bf5800434723 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns06.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns06.c<br>
@@ -23,7 +23,7 @@<br>
<br>
=C2=A0#define STACK_SIZE (1024 * 1024)<br>
<br>
-static char child_stack[STACK_SIZE];<br>
+static char child_stack[STACK_SIZE] __attribute__((aligned(64)));<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
@@ -33,7 +33,7 @@ static void setup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF, &quo=
t;namespace not available&quot;);<br>
=C2=A0}<br>
<br>
-static int child(void *arg)<br>
+static int child(void *arg LTP_ATTRIBUTE_UNUSED)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TST_CHECKPOINT_WAIT(0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
@@ -41,10 +41,13 @@ static int child(void *arg)<br>
<br>
=C2=A0static void run(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid =3D ltp_clone(CLONE_NEWUSER, &amp;chi=
ld, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STACK_SIZE, child_s=
tack);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char child_namespace[20];<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t pid =3D ltp_clone(CLONE_NEWUSER | SIGCHLD=
, &amp;child, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STACK_SIZE, child_s=
tack);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;ltp_clone failed&quot;);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(child_namespace, &quot;/proc/%i/ns/user=
&quot;, pid);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int my_fd, child_fd, parent_fd;<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_7615400080412838853gmail_signature"><div dir=3D"ltr"><div><div =
dir=3D"ltr">Regards,<br>Li Wang<br></div></div></div></div></div>

--000000000000cd5669058b1653fa--

--===============1115255413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1115255413==--
