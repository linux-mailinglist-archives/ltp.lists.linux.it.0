Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC84357C
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 13:27:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 817F0294AE8
	for <lists+linux-ltp@lfdr.de>; Thu, 13 Jun 2019 13:27:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 095D9294AAD
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 13:27:05 +0200 (CEST)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0BC68140135D
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 13:27:03 +0200 (CEST)
Received: by mail-ua1-f66.google.com with SMTP id 34so2841193uar.8
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KmdLIyCHhQBclI09Z7XtVtTvUZ8ZX0KdMIe8gebQiK0=;
 b=J3/8CrvU8fGNuDQIEccar1lfFNpExskG5MMRtVWxvnef+s6OdnGCrx0GjHFNjz1rU2
 p43QJYDxi5r6EOGeQbmC2ScC+42juNkuCThC/jA1cN8h/jlnNer2/ip0BNxmjg80T+x9
 JvaVlM/DHAZZAAyVXCxzrkWR5xoKEuAr66nud6A3pMOSDDzaIlxx8EVFdayrZ46wYsWP
 cXqQDdDATyuHLeWMfcv72bRnzLdKGvoxcNxFuDRSkQSuuEgyNJnLemI0WSFjNea+Fuvk
 ls/ZXp457mIPsoD08Ie3hSKu4xYGXjX2UK/IDCULYMkm8WZUi1N7iP8HpiroTY9FTtFb
 TUqQ==
X-Gm-Message-State: APjAAAUv5v0ffmlcnd2xfnBEDFEyBg+uiv4JGV+kxYUEIS2QKvAuA8rs
 lkz3iul4RvFC0UrpohKaVcF99GFVrThkzP2kOolisQ==
X-Google-Smtp-Source: APXvYqwBewWrQnus8FzNflPZxAl3fnIripsZP3D6usyJDrqzT/QEfeX7gqnl7nxnf8QzOn1dJY5NC1PX8d+gF5YahOo=
X-Received: by 2002:ab0:67d6:: with SMTP id w22mr348262uar.68.1560425222823;
 Thu, 13 Jun 2019 04:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <1b6ddab9cd8e3620da9e37b1132e911280c22e32.1560410182.git.jstancek@redhat.com>
 <CAEemH2frt_zGSdSRL3d_J+km74p8ruQTNF6bVhEpaiTdMLCC6A@mail.gmail.com>
 <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
In-Reply-To: <1320546599.27920597.1560420988025.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 13 Jun 2019 19:26:51 +0800
Message-ID: <CAEemH2c2=K-5pzt=s18_oZ0gojiXcTfJ5-xfyFjexkJe1W+MLQ@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1346217391=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1346217391==
Content-Type: multipart/alternative; boundary="0000000000001b11ed058b32cf24"

--0000000000001b11ed058b32cf24
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 13, 2019 at 6:16 PM Jan Stancek <jstancek@redhat.com> wrote:

>
>
> ----- Original Message -----
> > On Thu, Jun 13, 2019 at 3:25 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> > > Test crashes (SIGBUS) when using child stack have been observed for
> > > ioctl_ns01. This is because stack isn't aligned. Use ltp_alloc_stack()
> > > for stack allocation.
> > >
> > > Add SIGCHLD to clone flags, so that LTP library can reap all children
> > > and check their return code.  Also check ltp_clone() return value.
> > >
> > > Suppress warning for unused *arg in child().
> > >
> > > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > > ---
> > >  testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 13 +++++++++----
> > >  testcases/kernel/syscalls/ioctl/ioctl_ns05.c | 12 +++++++++---
> > >  testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 15 +++++++++++----
> > >  3 files changed, 29 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> > > b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> > > index dfde4da6c5d6..d241a5d0fa53 100644
> > > --- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> > > +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> > > @@ -23,7 +23,7 @@
> > >
> > >  #define STACK_SIZE (1024 * 1024)
> > >
> > > -static char child_stack[STACK_SIZE];
> > > +static char *child_stack;
> > >
> > >  static void setup(void)
> > >  {
> > > @@ -31,6 +31,10 @@ static void setup(void)
> > >
> > >         if (exists < 0)
> > >                 tst_res(TCONF, "namespace not available");
> > > +
> > > +       child_stack = ltp_alloc_stack(STACK_SIZE);
> > >
> >
> > As you commented that "User is responsible for freeing allocated memory",
> > but you forget to do that in each of these test cases :).
>
> I omitted it on purpose. OS will clean it up on exit, since it's called
> only in setup() it's not going to keep leaking more memory.
>

Okay. I believe that, but it is not a recommended coding habit which I had
been told ;-).


>
> >
> > We need free(child_stack) in the cleanup function.
>
> Can you elaborate?
>

Nothing else. It is just a supplementary as above comment. If we do memory
release, then add:

static void cleanup(viod)
{
    if (child_stack)
        free(child_stack);
}

-- 
Regards,
Li Wang

--0000000000001b11ed058b32cf24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 13, 2019 at 6:16 PM Jan Stancek &lt;<a =
href=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><b=
r>
<br>
----- Original Message -----<br>
&gt; On Thu, Jun 13, 2019 at 3:25 PM Jan Stancek &lt;<a href=3D"mailto:jsta=
ncek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Test crashes (SIGBUS) when using child stack have been observed f=
or<br>
&gt; &gt; ioctl_ns01. This is because stack isn&#39;t aligned. Use ltp_allo=
c_stack()<br>
&gt; &gt; for stack allocation.<br>
&gt; &gt;<br>
&gt; &gt; Add SIGCHLD to clone flags, so that LTP library can reap all chil=
dren<br>
&gt; &gt; and check their return code.=C2=A0 Also check ltp_clone() return =
value.<br>
&gt; &gt;<br>
&gt; &gt; Suppress warning for unused *arg in child().<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.=
com" target=3D"_blank">jstancek@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 13 +++++++++=
----<br>
&gt; &gt;=C2=A0 testcases/kernel/syscalls/ioctl/ioctl_ns05.c | 12 +++++++++=
---<br>
&gt; &gt;=C2=A0 testcases/kernel/syscalls/ioctl/ioctl_ns06.c | 15 +++++++++=
++----<br>
&gt; &gt;=C2=A0 3 files changed, 29 insertions(+), 11 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
&gt; &gt; b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
&gt; &gt; index dfde4da6c5d6..d241a5d0fa53 100644<br>
&gt; &gt; --- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
&gt; &gt; +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
&gt; &gt; @@ -23,7 +23,7 @@<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 #define STACK_SIZE (1024 * 1024)<br>
&gt; &gt;<br>
&gt; &gt; -static char child_stack[STACK_SIZE];<br>
&gt; &gt; +static char *child_stack;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 static void setup(void)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; @@ -31,6 +31,10 @@ static void setup(void)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (exists &lt; 0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_=
res(TCONF, &quot;namespace not available&quot;);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0child_stack =3D ltp_alloc_stack(STACK=
_SIZE);<br>
&gt; &gt;<br>
&gt; <br>
&gt; As you commented that &quot;User is responsible for freeing allocated =
memory&quot;,<br>
&gt; but you forget to do that in each of these test cases :).<br>
<br>
I omitted it on purpose. OS will clean it up on exit, since it&#39;s called=
<br>
only in setup() it&#39;s not going to keep leaking more memory.<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Okay. I believe that, but it is not a recommended coding habit which I=
 had been told ;-).</div></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt; <br>
&gt; We need free(child_stack) in the cleanup function.<br>
<br>
Can you elaborate?<br></blockquote><div><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Nothing else. It is just a supplementary as a=
bove comment. If we do memory release, then add:</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">static void cleanup(viod)</div><div class=3D"gmail_=
default" style=3D"font-size:small">{</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0 =C2=A0 if (child_stack)</div><div class=3D"gma=
il_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(chil=
d_stack);</div><div class=3D"gmail_default" style=3D"font-size:small">}</di=
v></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"m_69965758594776311=
96gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br>=
</div></div></div></div>

--0000000000001b11ed058b32cf24--

--===============1346217391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1346217391==--
