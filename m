Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB26E3C779
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 11:44:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 682D63EAECA
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 11:44:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AA1773EAEB9
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 11:44:00 +0200 (CEST)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2E215200AF3
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 11:43:58 +0200 (CEST)
Received: by mail-vs1-f66.google.com with SMTP id v129so7465446vsb.11
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 02:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8P0TNJxEqTjlh8JI5jnsCaYfjeK94+rYNmc9YWsgw4U=;
 b=l/jjmo9jVPX8s0JFU4198H0ScbaKnEkfl8esj+oboFVqxaw6pFJCvs3XbnVC1SSx7E
 L10RQ7O7tUkZe5xlTwn4hFoqJR8RzCi5dkYfcCGil1496EmxMpDfdTmmwovHMgKrYZag
 bHy65jzIGSEpQPN8rm97PEf0YAq9LBvHkNdqFOJgzlUUuquaqZAP0xuKpeGUYV7PFpL6
 AyBpuFELsxCwjO5WAiWye1FrShiqKvokJDYKANF52AbYZn/4aU9cDlORjyVDzwiWxh9n
 DmjC9Pv8/XXQwRVqSAPwQIvO7ylwSQNjLyPDfBl3mJmbnB8Zx++LP/8qLzJK9niAk5XK
 V2PA==
X-Gm-Message-State: APjAAAUWILmc8X0R+2oCz3SS6X1t3/a3rC9ngL07dm2S5fcEKjk6abMQ
 Pf6hjT9oZG+e5uVAGgF3Byb3T7h8Bcp1vHc0W/MYfuIzJjrq6A==
X-Google-Smtp-Source: APXvYqxTbVL7qlak51bYszqRZELXkZ2tYsK/U7GhemfRuesSqwqdJpFIje3PVFzgXl4oDCzk3BpUlpuYoij1tBpAQHs=
X-Received: by 2002:a67:6d45:: with SMTP id i66mr12200317vsc.130.1560246236925; 
 Tue, 11 Jun 2019 02:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <2abbf8596a01ea056f6e7c9e6c481d67093cea0c.1560238866.git.jstancek@redhat.com>
In-Reply-To: <2abbf8596a01ea056f6e7c9e6c481d67093cea0c.1560238866.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 11 Jun 2019 17:43:45 +0800
Message-ID: <CAEemH2fK7GnT5Pmo4r1ik4bV=7=F5ZOtM+UQYieeDUz4O1G0eQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/ioctl_ns01: fix crash on aarch64
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
Content-Type: multipart/mixed; boundary="===============0424931831=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0424931831==
Content-Type: multipart/alternative; boundary="000000000000b6f013058b0922a2"

--000000000000b6f013058b0922a2
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 11, 2019 at 3:44 PM Jan Stancek <jstancek@redhat.com> wrote:

> Test crashes with SIGBUS when using child stack. Align stack to 256 bytes,
> which is more than enough for any arch.


> Neither parent or library is waiting for child process. Add SIGCHLD to
> clone flags.
>
> Check return value of ltp_clone(), and TBROK on failure.
>
> Fix warning about unused *arg.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> index dfde4da6c5d6..625de9bd832d 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> @@ -23,7 +23,7 @@
>
>  #define STACK_SIZE (1024 * 1024)
>
> -static char child_stack[STACK_SIZE];
> +static char child_stack[STACK_SIZE] __attribute__((aligned(256)));
>

This patch makes sense. And maybe we'd better change that for
ioctl_nfs05/06 too?

BTW, another way we could try is to allocate the child_stack memory
dynamically via malloc(STACK_SIZE) in setup() function.


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
> @@ -61,10 +61,14 @@ static int child(void *arg)
>
>  static void run(void)
>  {
> +       int child_pid;
> +
>         test_ns_get_parent();
>
> -       ltp_clone(CLONE_NEWPID, &child, 0,
> +       child_pid = ltp_clone(CLONE_NEWPID | SIGCHLD, &child, 0,
>                 STACK_SIZE, child_stack);
> +       if (child_pid == -1)
> +               tst_brk(TBROK | TERRNO, "ltp_clone failed");
>  }
>
>  static struct tst_test test = {
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

--000000000000b6f013058b0922a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 11, 2019 at 3:44 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Test crashes with SI=
GBUS when using child stack. Align stack to 256 bytes,<br>
which is more than enough for any arch.</blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Neither parent or library is waiting for child process. Add SIGCHLD to<br>
clone flags.<br>
<br>
Check return value of ltp_clone(), and TBROK on failure.<br>
<br>
Fix warning about unused *arg.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 10 +++++++---<br>
=C2=A01 file changed, 7 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c b/testcases/kerne=
l/syscalls/ioctl/ioctl_ns01.c<br>
index dfde4da6c5d6..625de9bd832d 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
@@ -23,7 +23,7 @@<br>
<br>
=C2=A0#define STACK_SIZE (1024 * 1024)<br>
<br>
-static char child_stack[STACK_SIZE];<br>
+static char child_stack[STACK_SIZE] __attribute__((aligned(256)));<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default">This patch makes =
sense. And maybe we&#39;d better change that for ioctl_nfs05/06 too?</div><=
div class=3D"gmail_default"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">BTW, another way we could try is to allocate the child_st=
ack memory dynamically via malloc(STACK_SIZE) in setup() function.=C2=A0</d=
iv></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
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
@@ -61,10 +61,14 @@ static int child(void *arg)<br>
<br>
=C2=A0static void run(void)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int child_pid;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ns_get_parent();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ltp_clone(CLONE_NEWPID, &amp;child, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0child_pid =3D ltp_clone(CLONE_NEWPID | SIGCHLD,=
 &amp;child, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STACK_SIZE, child_s=
tack);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (child_pid =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;ltp_clone failed&quot;);<br>
=C2=A0}<br>
<br>
=C2=A0static struct tst_test test =3D {<br>
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

--000000000000b6f013058b0922a2--

--===============0424931831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0424931831==--
