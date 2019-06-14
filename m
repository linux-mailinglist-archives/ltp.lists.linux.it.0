Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8E451FC
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 04:47:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 359B8294AFF
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 04:47:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 171B2294A36
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 04:46:56 +0200 (CEST)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 84D8A2003B0
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 04:46:54 +0200 (CEST)
Received: by mail-vs1-f65.google.com with SMTP id n2so833886vso.6
 for <ltp@lists.linux.it>; Thu, 13 Jun 2019 19:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jsRMIz0VOewRbHDtjw80cWCg9nA3liUTAcja9M2HXU=;
 b=nTxkVoc8/Of3YXeFQWvWPl00MHfJGS05VGn5/DfadW+jX5t3hqameBVv3z1jjyx3zG
 qE/0923EGUL4xKOE53wuUVSt2jJEWadoFqe8bQNiO/iIiGTt2zlQ9oFfyEfw81ptmbUS
 Au381KiVifmkah44P/V6pBa5MbKFvg1GHbNJn7+EHBUd4ari5Q2bAlmbPmKmy0RHnHk7
 yboNNv5+E0C3PdqvrRCG4GRpKPDOh3vb8IMCxhoLJ7EsdOSKRiocqgibaC2javOKU2jg
 xCdn4yOtrM7E0DtbSBjY1ywCxhMK+x8zs+yvPIrGY7lieMjk3U7rciqX08CH+EEOWdVy
 4A3w==
X-Gm-Message-State: APjAAAW6H9KkNcns4lBf+WhYTPBBOOXGchMmXWXHvZfY/PTUNjOcVw8+
 i2ZdLa85j1OeuIPzCpfQp93V6g+s60b3nKnDgYrYKg==
X-Google-Smtp-Source: APXvYqwoSNAPVYbsTm/DOHXDzivgSzhAcx72i9IPwH39NGmdaatmhQyD8Br3VBaLLxKJDS/jqRb/pTTtmm6J+HNhh7E=
X-Received: by 2002:a67:6d45:: with SMTP id i66mr24253515vsc.130.1560480413342; 
 Thu, 13 Jun 2019 19:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <adca7c08dbf20805da9b99a7fa03d498de70235d.1560410182.git.jstancek@redhat.com>
 <fd8b05453a0c72f2810a53e49ca1dc9467d9dbf9.1560410182.git.jstancek@redhat.com>
 <CAEemH2f_oMYubEDLdOmhxrEguKkc+3smx682LF7D9uiwZ26OAQ@mail.gmail.com>
 <20190613135740.GB29926@rei.lan>
In-Reply-To: <20190613135740.GB29926@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Fri, 14 Jun 2019 10:46:42 +0800
Message-ID: <CAEemH2e7yfW3fd2kRFh-6tq8Y+sZeBvSB4Eu4JN6Htdo4_=K5g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1741360723=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1741360723==
Content-Type: multipart/alternative; boundary="000000000000b77c81058b3fa89a"

--000000000000b77c81058b3fa89a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 13, 2019 at 9:58 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > @@ -170,5 +170,5 @@ int ltp_clone_quick(unsigned long clone_flags, int
> > > (*fn) (void *arg), void *arg)
> > >  {
> > >         size_t stack_size = getpagesize() * 6;
> > >
> > > -       return ltp_clone_malloc(clone_flags, fn, arg, stack_size);
> > > +       return ltp_clone_alloc(clone_flags, fn, arg, stack_size);
> > >  }
> > >
> >
> > There is another legacy problem maybe we need take care.
> >
> > Any thought about how releasing the stack memory[1] after calling
> > ltp_clone_quick() in a test?
> >
> > [1] which allocated memory in ltp_clone_alloc().
>
> Well, we can free the memory in ltp_clone_alloc() if the child runs in a
> separate memory space, but if CLONE_VM was passed in flags there is no
> way how to free the memory...
>

A stupid way come up to my mind is just to export the stack as global
pointer and releasing in do_cleanup() if possible.

diff --git a/include/tst_clone.h b/include/tst_clone.h
index fd52097..c98eb44 100644
--- a/include/tst_clone.h
+++ b/include/tst_clone.h
diff --git a/include/tst_clone.h b/include/tst_clone.h
index fd52097..c98eb44 100644
--- a/include/tst_clone.h
+++ b/include/tst_clone.h
@@ -24,6 +24,8 @@
 #ifndef TST_CLONE_H__
 #define TST_CLONE_H__

+void *tst_clone_stack;
+
 /* Functions from lib/cloner.c */
 int ltp_clone(unsigned long flags, int (*fn)(void *arg), void *arg,
                size_t stack_size, void *stack);
diff --git a/lib/cloner.c b/lib/cloner.c
index 8469745..4534982 100644
--- a/lib/cloner.c
+++ b/lib/cloner.c
@@ -142,19 +142,17 @@ int
 ltp_clone_alloc(unsigned long clone_flags, int (*fn) (void *arg), void
*arg,
                 size_t stack_size)
 {
-       void *stack;
        int ret;
        int saved_errno;
-
-       stack = ltp_alloc_stack(stack_size);
-       if (stack == NULL)
+       tst_clone_stack = ltp_alloc_stack(stack_size);
+       if (tst_clone_stack == NULL)
                return -1;

-       ret = ltp_clone(clone_flags, fn, arg, stack_size, stack);
+       ret = ltp_clone(clone_flags, fn, arg, stack_size, tst_clone_stack);

        if (ret == -1) {
                saved_errno = errno;
-               free(stack);
+               free(tst_clone_stack);
                errno = saved_errno;
        }

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 95f389d..e96a9c7 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -909,6 +909,9 @@ static void do_cleanup(void)
        if (mntpoint_mounted)
                tst_umount(tst_test->mntpoint);

+       if (tst_clone_stack)
+               free(tst_clone_stack);
+
        if (tst_test->needs_device && tdev.dev)
                tst_release_device(tdev.dev);

-- 
Regards,
Li Wang

--000000000000b77c81058b3fa89a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jun 13, 2019 at 9:58 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; @@ -170,5 +170,5 @@ int ltp_clone_quick(unsigned long clone_flags=
, int<br>
&gt; &gt; (*fn) (void *arg), void *arg)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t stack_size =3D getpagesiz=
e() * 6;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ltp_clone_malloc(clone_flags, =
fn, arg, stack_size);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ltp_clone_alloc(clone_flags, f=
n, arg, stack_size);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; <br>
&gt; There is another legacy problem maybe we need take care.<br>
&gt; <br>
&gt; Any thought about how releasing the stack memory[1] after calling<br>
&gt; ltp_clone_quick() in a test?<br>
&gt; <br>
&gt; [1] which allocated memory in ltp_clone_alloc().<br>
<br>
Well, we can free the memory in ltp_clone_alloc() if the child runs in a<br=
>
separate memory space, but if CLONE_VM was passed in flags there is no<br>
way how to free the memory...<br></blockquote><div><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">A stupid way come up to my mind is=
 just to export the stack as global pointer and releasing in do_cleanup() i=
f possible.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div>diff --git a/include/tst_clone.h b/include/tst_clone.h<br>index fd52=
097..c98eb44 100644<br>--- a/include/tst_clone.h<br>+++ b/include/tst_clone=
.h<br>diff --git a/include/tst_clone.h b/include/tst_clone.h<br>index fd520=
97..c98eb44 100644<br>--- a/include/tst_clone.h<br>+++ b/include/tst_clone.=
h<br>@@ -24,6 +24,8 @@<br>=C2=A0#ifndef TST_CLONE_H__<br>=C2=A0#define TST_=
CLONE_H__<br>=C2=A0<br>+void *tst_clone_stack;<br>+<br>=C2=A0/* Functions f=
rom lib/cloner.c */<br>=C2=A0int ltp_clone(unsigned long flags, int (*fn)(v=
oid *arg), void *arg,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 size_t stack_size, void *stack);<br>diff --git a/lib/cloner.c b/lib/=
cloner.c<br>index 8469745..4534982 100644<br>--- a/lib/cloner.c<br>+++ b/li=
b/cloner.c<br>@@ -142,19 +142,17 @@ int<br>=C2=A0ltp_clone_alloc(unsigned l=
ong clone_flags, int (*fn) (void *arg), void *arg,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t stack_size)<br>=C2=A0{<br>-=
 =C2=A0 =C2=A0 =C2=A0 void *stack;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 int saved_errno;<br>-<br>- =C2=A0 =C2=A0 =C2=
=A0 stack =3D ltp_alloc_stack(stack_size);<br>- =C2=A0 =C2=A0 =C2=A0 if (st=
ack =3D=3D NULL)<br>+ =C2=A0 =C2=A0 =C2=A0 tst_clone_stack =3D ltp_alloc_st=
ack(stack_size);<br>+ =C2=A0 =C2=A0 =C2=A0 if (tst_clone_stack =3D=3D NULL)=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>=
=C2=A0<br>- =C2=A0 =C2=A0 =C2=A0 ret =3D ltp_clone(clone_flags, fn, arg, st=
ack_size, stack);<br>+ =C2=A0 =C2=A0 =C2=A0 ret =3D ltp_clone(clone_flags, =
fn, arg, stack_size, tst_clone_stack);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (ret =3D=3D -1) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 saved_errno =3D errno;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 free(stack);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 free(tst_clone_stack);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 errno =3D saved_errno;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>=C2=A0<br>diff --git a/lib/tst_test.c b/lib/tst_test.c<br>index 95f389d..=
e96a9c7 100644<br>--- a/lib/tst_test.c<br>+++ b/lib/tst_test.c<br>@@ -909,6=
 +909,9 @@ static void do_cleanup(void)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
mntpoint_mounted)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 tst_umount(tst_test-&gt;mntpoint);<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 =
if (tst_clone_stack)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
free(tst_clone_stack);<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tst_test-&gt=
;needs_device &amp;&amp; <a href=3D"http://tdev.dev">tdev.dev</a>)<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_release_device(<a =
href=3D"http://tdev.dev">tdev.dev</a>);<br>=C2=A0</div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--000000000000b77c81058b3fa89a--

--===============1741360723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1741360723==--
