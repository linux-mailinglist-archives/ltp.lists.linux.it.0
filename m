Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5343470
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 10:55:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B171B3EA7DD
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 10:55:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 570553EA1E5
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 10:55:32 +0200 (CEST)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B93091A016F7
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 10:55:31 +0200 (CEST)
Received: by mail-vs1-f65.google.com with SMTP id j26so214008vsn.10
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 01:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePkcRfc7Wrmm/zS237g9tdS3AFJOc0yGnp6OdguS944=;
 b=Pmtr7KHGNQvEhFXnvlAQcVM/2PP3Qx6pAFtEajUkj7eDDcKFsUdMO1VWzSAjIgakUD
 GWfJA51QJpMGz2etkU2ebcVuUmIPWIRT7gErcdzIav2bnq5bqL0QUYvSJkokcdY1qnei
 6bOxuRjT87h+85PSE8+6betDQyhQ1rK2+P/gcSjI358kT9dOiI1mb9JKCd73frsp8wku
 uLEf4vNHR8lCO/BkuIk09LqeUk/uYpfldgieImuwCenuSQne2TXonTA9WegyluRRLSTl
 w/ig6dLCoLOBrWOWuffz4XeGoNjmtzzcgfmA3wQtYMsXB+GNV8MBxTGZmCtsxnxD24YC
 UI2Q==
X-Gm-Message-State: APjAAAWDJUMZ9cVhCOVSHsGhUObXG88tpY7UIwmmpq80t8xsztE/3Qqr
 80HLpeQ1vyWsF+vddHSBsjZjT/0IfbLnMJwjEVTLFg==
X-Google-Smtp-Source: APXvYqy4TIMsZVyMQTUOWQcdOloqqDAxn/LxzZhdwa5/A+bTBtazs8ICq7kONOqXSeSpYJ6mIuiVgyijb5kCIrsaZ1o=
X-Received: by 2002:a67:6d45:: with SMTP id i66mr20566136vsc.130.1560416130549; 
 Thu, 13 Jun 2019 01:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <fd8b05453a0c72f2810a53e49ca1dc9467d9dbf9.1560410182.git.jstancek@redhat.com>
In-Reply-To: <fd8b05453a0c72f2810a53e49ca1dc9467d9dbf9.1560410182.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 13 Jun 2019 16:55:19 +0800
Message-ID: <CAEemH2f_oMYubEDLdOmhxrEguKkc+3smx682LF7D9uiwZ26OAQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 2/3] lib: rename ltp_clone_malloc to
	ltp_clone_alloc
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
Content-Type: multipart/mixed; boundary="===============0142931234=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0142931234==
Content-Type: multipart/alternative; boundary="00000000000029e4b1058b30b131"

--00000000000029e4b1058b30b131
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 13, 2019 at 3:25 PM Jan Stancek <jstancek@redhat.com> wrote:

> There are no users outside of lib.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  include/tst_clone.h | 2 +-
>  lib/cloner.c        | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/tst_clone.h b/include/tst_clone.h
> index 786cee5d1209..fd52097e2072 100644
> --- a/include/tst_clone.h
> +++ b/include/tst_clone.h
> @@ -29,7 +29,7 @@ int ltp_clone(unsigned long flags, int (*fn)(void *arg),
> void *arg,
>                 size_t stack_size, void *stack);
>  int ltp_clone7(unsigned long flags, int (*fn)(void *arg), void *arg,
>                 size_t stack_size, void *stack, ...);
> -int ltp_clone_malloc(unsigned long clone_flags, int (*fn)(void *arg),
> +int ltp_clone_alloc(unsigned long clone_flags, int (*fn)(void *arg),
>                 void *arg, size_t stacksize);
>  int ltp_clone_quick(unsigned long clone_flags, int (*fn)(void *arg),
>                 void *arg);
> diff --git a/lib/cloner.c b/lib/cloner.c
> index cf37184aa22a..8469745d004b 100644
> --- a/lib/cloner.c
> +++ b/lib/cloner.c
> @@ -135,11 +135,11 @@ void *ltp_alloc_stack(size_t size)
>  }
>
>  /*
> - * ltp_clone_malloc: also does the memory allocation for clone with a
> + * ltp_clone_alloc: also does the memory allocation for clone with a
>   * caller-specified size.
>   */
>  int
> -ltp_clone_malloc(unsigned long clone_flags, int (*fn) (void *arg), void
> *arg,
> +ltp_clone_alloc(unsigned long clone_flags, int (*fn) (void *arg), void
> *arg,
>                  size_t stack_size)
>  {
>         void *stack;
> @@ -162,7 +162,7 @@ ltp_clone_malloc(unsigned long clone_flags, int (*fn)
> (void *arg), void *arg,
>  }
>
>  /*
> - * ltp_clone_quick: calls ltp_clone_malloc with predetermined stack size.
> + * ltp_clone_quick: calls ltp_clone_alloc with predetermined stack size.
>   * Experience thus far suggests that one page is often insufficient,
>   * while 6*getpagesize() seems adequate.
>   */
> @@ -170,5 +170,5 @@ int ltp_clone_quick(unsigned long clone_flags, int
> (*fn) (void *arg), void *arg)
>  {
>         size_t stack_size = getpagesize() * 6;
>
> -       return ltp_clone_malloc(clone_flags, fn, arg, stack_size);
> +       return ltp_clone_alloc(clone_flags, fn, arg, stack_size);
>  }
>

There is another legacy problem maybe we need take care.

Any thought about how releasing the stack memory[1] after calling
ltp_clone_quick() in a test?

[1] which allocated memory in ltp_clone_alloc().

-- 
Regards,
Li Wang

--00000000000029e4b1058b30b131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 13, 2019 at 3:25 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">There are no users o=
utside of lib.<br>
<br>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/tst_clone.h | 2 +-<br>
=C2=A0lib/cloner.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 ++++----<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/include/tst_clone.h b/include/tst_clone.h<br>
index 786cee5d1209..fd52097e2072 100644<br>
--- a/include/tst_clone.h<br>
+++ b/include/tst_clone.h<br>
@@ -29,7 +29,7 @@ int ltp_clone(unsigned long flags, int (*fn)(void *arg), =
void *arg,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t stack_size, =
void *stack);<br>
=C2=A0int ltp_clone7(unsigned long flags, int (*fn)(void *arg), void *arg,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t stack_size, =
void *stack, ...);<br>
-int ltp_clone_malloc(unsigned long clone_flags, int (*fn)(void *arg),<br>
+int ltp_clone_alloc(unsigned long clone_flags, int (*fn)(void *arg),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *arg, size_t s=
tacksize);<br>
=C2=A0int ltp_clone_quick(unsigned long clone_flags, int (*fn)(void *arg),<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *arg);<br>
diff --git a/lib/cloner.c b/lib/cloner.c<br>
index cf37184aa22a..8469745d004b 100644<br>
--- a/lib/cloner.c<br>
+++ b/lib/cloner.c<br>
@@ -135,11 +135,11 @@ void *ltp_alloc_stack(size_t size)<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
- * ltp_clone_malloc: also does the memory allocation for clone with a<br>
+ * ltp_clone_alloc: also does the memory allocation for clone with a<br>
=C2=A0 * caller-specified size.<br>
=C2=A0 */<br>
=C2=A0int<br>
-ltp_clone_malloc(unsigned long clone_flags, int (*fn) (void *arg), void *a=
rg,<br>
+ltp_clone_alloc(unsigned long clone_flags, int (*fn) (void *arg), void *ar=
g,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t stack_=
size)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *stack;<br>
@@ -162,7 +162,7 @@ ltp_clone_malloc(unsigned long clone_flags, int (*fn) (=
void *arg), void *arg,<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
- * ltp_clone_quick: calls ltp_clone_malloc with predetermined stack size.<=
br>
+ * ltp_clone_quick: calls ltp_clone_alloc with predetermined stack size.<b=
r>
=C2=A0 * Experience thus far suggests that one page is often insufficient,<=
br>
=C2=A0 * while 6*getpagesize() seems adequate.<br>
=C2=A0 */<br>
@@ -170,5 +170,5 @@ int ltp_clone_quick(unsigned long clone_flags, int (*fn=
) (void *arg), void *arg)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t stack_size =3D getpagesize() * 6;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ltp_clone_malloc(clone_flags, fn, arg, s=
tack_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ltp_clone_alloc(clone_flags, fn, arg, st=
ack_size);<br>
=C2=A0}<br></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">There is another legacy problem maybe we need take car=
e.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Any thought about=
 how releasing the stack memory[1] after calling ltp_clone_quick() in a tes=
t?</div></div></div><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">[1] which allocated memory in ltp_clone_alloc().</div>=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000029e4b1058b30b131--

--===============0142931234==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0142931234==--
