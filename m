Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C343415
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 10:26:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B54DF294ACE
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 10:26:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C3B2F3EA777
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 10:26:07 +0200 (CEST)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 281F6100174A
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 10:26:00 +0200 (CEST)
Received: by mail-vs1-f68.google.com with SMTP id j26so168502vsn.10
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 01:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTA9ln85xrtnFFbttLbwQFyfcms9T2elP31AiuZ/1SU=;
 b=HjfafEefReYk/LSZ2ig708gTU6X9KGsNo3WTCldbzOV2pnai4WwahysL2JttqBrwjt
 h1Zl41JQKOsXZ4lKdtHSJFGQkvavIctEDE+6GqVzOCw1SXOuPau9iuTYQ3tSH60NoOTG
 HyUSrL6fmYeyPl7twCtIgMZ364bMrkk+Kt6U/P6NDVIaJvjD3M02YDCtGrsvD6DPURn4
 Ft5GP8acXMDgFzL/wnKzi62ydR6RkAVxQ8UekwrlF6A/Vh+ZRFij9Gr/1gN8Wa9fqTwr
 ZkaGwKNGX5LYWqzjPQqDD5kl2lYnCFGVenafdS78ul7pDdZVOqRqYaK2sXl8Flk7ypmi
 cYQQ==
X-Gm-Message-State: APjAAAVh3fHeDiR9grrBWBHHhLGb6zZjIGixsFncKOlqJxwmkk4bx833
 fXkFWUt05PCI5GU94LjBkrBD+0lFE5gZyvIF+yjmdw==
X-Google-Smtp-Source: APXvYqw6o8rBPK/D3IK09lp/vO2+xkefMASga9qqHSbU2gqOA87Qe1ITXmHoNvbgStaySQF09/KCSOmJXk2RWqQO5cY=
X-Received: by 2002:a67:11c1:: with SMTP id 184mr19038766vsr.217.1560414362915; 
 Thu, 13 Jun 2019 01:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
In-Reply-To: <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 13 Jun 2019 16:25:52 +0800
Message-ID: <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/ioctl_ns0[156]: align stack and
 wait for child
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
Content-Type: multipart/mixed; boundary="===============0025977256=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0025977256==
Content-Type: multipart/alternative; boundary="000000000000cdf4ae058b304719"

--000000000000cdf4ae058b304719
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 13, 2019 at 3:25 PM Jan Stancek <jstancek@redhat.com> wrote:

> Test crashes (SIGBUS) when using child stack have been observed for
> ioctl_ns01. This is because stack isn't aligned. Use ltp_alloc_stack()
> for stack allocation.
>
> Add SIGCHLD to clone flags, so that LTP library can reap all children
> and check their return code.  Also check ltp_clone() return value.
>
> Suppress warning for unused *arg in child().
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 13 +++++++++----
>  testcases/kernel/syscalls/ioctl/ioctl_ns05.c | 12 +++++++++---
>  testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 15 +++++++++++----
>  3 files changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> index dfde4da6c5d6..d241a5d0fa53 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> @@ -23,7 +23,7 @@
>
>  #define STACK_SIZE (1024 * 1024)
>
> -static char child_stack[STACK_SIZE];
> +static char *child_stack;
>
>  static void setup(void)
>  {
> @@ -31,6 +31,10 @@ static void setup(void)
>
>         if (exists < 0)
>                 tst_res(TCONF, "namespace not available");
> +
> +       child_stack = ltp_alloc_stack(STACK_SIZE);
>

As you commented that "User is responsible for freeing allocated memory",
but you forget to do that in each of these test cases :).

We need free(child_stack) in the cleanup function.

-- 
Regards,
Li Wang

--000000000000cdf4ae058b304719
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 13, 2019 at 3:25 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Test crashes (SIGBUS=
) when using child stack have been observed for<br>
ioctl_ns01. This is because stack isn&#39;t aligned. Use ltp_alloc_stack()<=
br>
for stack allocation.<br>
<br>
Add SIGCHLD to clone flags, so that LTP library can reap all children<br>
and check their return code.=C2=A0 Also check ltp_clone() return value.<br>
<br>
Suppress warning for unused *arg in child().<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 13 +++++++++----<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_ns05.c | 12 +++++++++---<br>
=C2=A0testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 15 +++++++++++----<br>
=C2=A03 files changed, 29 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c b/testcases/kerne=
l/syscalls/ioctl/ioctl_ns01.c<br>
index dfde4da6c5d6..d241a5d0fa53 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
@@ -23,7 +23,7 @@<br>
<br>
=C2=A0#define STACK_SIZE (1024 * 1024)<br>
<br>
-static char child_stack[STACK_SIZE];<br>
+static char *child_stack;<br>
<br>
=C2=A0static void setup(void)<br>
=C2=A0{<br>
@@ -31,6 +31,10 @@ static void setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (exists &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TCONF, &quo=
t;namespace not available&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0child_stack =3D ltp_alloc_stack(STACK_SIZE);<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">As you commented that &quot;User is responsible for freeing a=
llocated memory&quot;, but you forget to do that in each of these test case=
s :).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">We need free(child_=
stack) in the cleanup function.</div></div><div><br></div></div>-- <br><div=
 dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></=
div><div>Li Wang<br></div></div></div></div>

--000000000000cdf4ae058b304719--

--===============0025977256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0025977256==--
