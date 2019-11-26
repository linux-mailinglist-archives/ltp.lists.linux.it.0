Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE8109A16
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 09:19:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 682413C23E6
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 09:19:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CE6063C1813
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 09:18:52 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8F32014060A4
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 09:18:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574756329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=syZOrmtcSkNGo6rOw6by2dIWYTm1JBeMaCEU0P99Sck=;
 b=a0U/o2R3T3yqRLXEukINeegwfsIVtwh34NaYmENJVHNg1pp72d5sZhr0mFHCY5/zz2Pepi
 HgpeYbUcC3xD6dydWdXsYNWFMwpbCjJ9Uf6Z+GFsMsm87iRhTCdaBCD9IWk1pO2iiuobpr
 gy3VhgA5P8bYLTeOZAjLTQFkEVMFL2o=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-VK4vZvG9PHuxuDj3MyI6sw-1; Tue, 26 Nov 2019 03:18:48 -0500
Received: by mail-ot1-f71.google.com with SMTP id a10so4199299oto.14
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 00:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=syZOrmtcSkNGo6rOw6by2dIWYTm1JBeMaCEU0P99Sck=;
 b=HP9yEyoMhQTdjz2qa5Ik6nRI1ztP5i3/Wt1MTg9XSUubwVa/HvWrSvql4oYjrBtY3r
 /5SKKN7e3xLjlITxEPg4qHx8YAcog1fggyYeVQNQKs9uKMljor1b4QDsrXlungCGiqLw
 xZr1HTmNxrOPt/77Fw1Gh5MqUp8Tsk4moIKuI+5HWZbv0yIYaou0FzTm5cYn6eLwAv2v
 PmW8NExvjwtzGkBYo+eGAGTV9qvQgjY3lWc2nmLhweLZh676KQsSx7o27n/tmC5V7N+T
 PIYJYNuRlK7ZAl8Pk25t7lLCL/XhQRi46TH/pWUewz9UqlbzWoel9DoShBAzIanCJJnL
 o4ZA==
X-Gm-Message-State: APjAAAUeCcfcscgCv3AAq0zF96FoJ061wOgfC02KuPOyPzL08arFZmDG
 Bz558rmXQfWXVZN2W/a4mcBxveOy1Pewhw3xqvX+O33/XEvu1BDGA7RZN2dYMdW5dDgZXOBnl6V
 np84Ni93S51oPveGECI32+nankVA=
X-Received: by 2002:a9d:8d2:: with SMTP id 76mr24389630otf.17.1574756327531;
 Tue, 26 Nov 2019 00:18:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2FGlSN3JAswdpsbbjn9md1iBQQU8sjh4lvyWj/YvQGNJRDAT0fsa7DIfx7Rsu9xuRWZqmWFkpt91pP/7gmc8=
X-Received: by 2002:a9d:8d2:: with SMTP id 76mr24389616otf.17.1574756327217;
 Tue, 26 Nov 2019 00:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20191107153458.16917-1-rpalethorpe@suse.com>
 <20191107153458.16917-2-rpalethorpe@suse.com>
In-Reply-To: <20191107153458.16917-2-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 Nov 2019 16:18:36 +0800
Message-ID: <CAEemH2f=_oGD8Zo=EDE6D096EEP=jCjzEUPOszJ7W7j8vbV7XA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-MC-Unique: VK4vZvG9PHuxuDj3MyI6sw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Wrapper for Syzkaller reproducers
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
Cc: Dmitry Vyukov <dvyukov@google.com>, syzkaller <syzkaller@googlegroups.com>,
 automated-testing@yoctoproject.org, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0667053979=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0667053979==
Content-Type: multipart/alternative; boundary="0000000000007dfbd005983b87a4"

--0000000000007dfbd005983b87a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Some more queries below.

On Thu, Nov 7, 2019 at 11:36 PM Richard Palethorpe <rpalethorpe@suse.com>
wrote:

> Allows one to run the Syzkaller reproducers as part of the LTP.
>
> ...
>
> +AC_ARG_WITH([syzkaller-repros],
> +  [AC_HELP_STRING([--with-syzkaller-repros],
> +    [compile and install Syzkaller reproducers (default=3Dno)])],
> +  [with_syzkaller_repros=3D$withval]
>

To strictly, the [action-if-not-given] should be added too?


> +)
> +if test "x$with_syzkaller_repros" =3D xyes; then
> +    AC_SUBST([WITH_SYZKALLER_REPROS],["yes"])
> +else
> +    AC_SUBST([WITH_SYZKALLER_REPROS],["no"])
> +fi
> ...
> diff --git a/runtest/.gitignore b/runtest/.gitignore
> new file mode 100644
> index 000000000..2ae05bfac
> --- /dev/null
> +++ b/runtest/.gitignore
> @@ -0,0 +1 @@
> +syzkaller*
>

Why adding syzkaller* in here?


> diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
> index 3319b3163..0150cfb4f 100644
> --- a/testcases/kernel/Makefile
> +++ b/testcases/kernel/Makefile
> @@ -53,6 +53,7 @@ SUBDIRS                       +=3D connectors \
>                            sched \
>                            security \
>                            sound \
> +                          syzkaller-repros \
>                            tracing \
>                            uevents \
>
> diff --git a/testcases/kernel/syzkaller-repros/.gitignore
> b/testcases/kernel/syzkaller-repros/.gitignore
> new file mode 100644
> index 000000000..dbda1c71f
> --- /dev/null
> +++ b/testcases/kernel/syzkaller-repros/.gitignore
> @@ -0,0 +1 @@
> +syzwrap
> diff --git a/testcases/kernel/syzkaller-repros/Makefile
> b/testcases/kernel/syzkaller-repros/Makefile
> new file mode 100644
> ...
> +# Some useful compiler flags for the LTP will cause problems with the
> +# syzkaller repros so the repros have seperate flags
> +SYZKALLER_CFLAGS ?=3D -pthread
> +SYZKALLER_REPROS =3D $(subst
> $(abs_top_srcdir),$(abs_top_builddir),$(SYZKALLER_REPROS_SRCS:.c=3D))
> +$(SYZKALLER_REPROS): %: %.c
> +       -@if grep -q "__NR_mmap2" $^; then \
> +               M32=3D"-m32"; \
>

I got compiling errors on s390x:
  gcc: error: unrecognized command line option =E2=80=98-m32=E2=80=99; did =
you mean =E2=80=98-m31=E2=80=99?

My other concern is syzkaller (I guess maybe) have some package
dependencies, and that will break the compiler phase on the embedded system=
.


> ....
> +       while (!waitpid(pid, &status, WNOHANG)) {
> +               rem =3D tst_timeout_remaining();
> +
> +               if (!sent_kill && rem / exec_time_start < 0.5) {
> +                       tst_res(TINFO, "Timeout; killing reproducer");
> +
> +                       TEST(kill(pid, SIGKILL));
> +                       if (TST_RET =3D=3D -1)
> +                               tst_res(TWARN | TTERRNO, "kill() failed")=
;
> +                       else
> +                               sent_kill =3D 1;
> +               }
> +
> +               usleep(backoff);
> +               backoff =3D MIN(2 * backoff, 1000000);
> +       }
>

Force to kill a timeout test process is fine, but one thing makes me
worried is that we don't do any cleanup work(e.g. release hugepage, devices
or other resources) for the children, that very probably causes many
additional issues in the next testing and not easy to reproduce it in a new
run.


> +
> +       if (tst_taint_check()) {
> +               tst_res(TFAIL, "Kernel is tainted");
> +       } else {
> +               tst_res(TPASS, "Kernel is not tainted");
> +       }


If this is the only condition to judge if all tests pass or not, we may
miss some test failure logs after running, unless we don't care about that.

Btw, I can't even finish one round for the test then system panic there.

--=20
Regards,
Li Wang

--0000000000007dfbd005983b87a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Richard,</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Some more queries below.</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Nov 7, 2019 at 11:36 PM Richard Pale=
thorpe &lt;<a href=3D"mailto:rpalethorpe@suse.com" target=3D"_blank">rpalet=
horpe@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Allows one to run the Syzkaller reproducers as part of the LT=
P.<br>
<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
<br>
+AC_ARG_WITH([syzkaller-repros],<br>
+=C2=A0 [AC_HELP_STRING([--with-syzkaller-repros],<br>
+=C2=A0 =C2=A0 [compile and install Syzkaller reproducers (default=3Dno)])]=
,<br>
+=C2=A0 [with_syzkaller_repros=3D$withval]<br></blockquote><div><br></div><=
div><div class=3D"gmail_default" style=3D"font-size:small">To strictly, the=
=C2=A0[action-if-not-given] should be added too?</div></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
+)<br>
+if test &quot;x$with_syzkaller_repros&quot; =3D xyes; then<br>
+=C2=A0 =C2=A0 AC_SUBST([WITH_SYZKALLER_REPROS],[&quot;yes&quot;])<br>
+else<br>
+=C2=A0 =C2=A0 AC_SUBST([WITH_SYZKALLER_REPROS],[&quot;no&quot;])<br>
+fi<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
diff --git a/runtest/.gitignore b/runtest/.gitignore<br>
new file mode 100644<br>
index 000000000..2ae05bfac<br>
--- /dev/null<br>
+++ b/runtest/.gitignore<br>
@@ -0,0 +1 @@<br>
+syzkaller*<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Why adding syzkaller* in here?</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile<br>
index 3319b3163..0150cfb4f 100644<br>
--- a/testcases/kernel/Makefile<br>
+++ b/testcases/kernel/Makefile<br>
@@ -53,6 +53,7 @@ SUBDIRS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D connectors \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sched \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0security \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0sound \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 syzkaller-repros \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tracing \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uevents \<br>
<br>
diff --git a/testcases/kernel/syzkaller-repros/.gitignore b/testcases/kerne=
l/syzkaller-repros/.gitignore<br>
new file mode 100644<br>
index 000000000..dbda1c71f<br>
--- /dev/null<br>
+++ b/testcases/kernel/syzkaller-repros/.gitignore<br>
@@ -0,0 +1 @@<br>
+syzwrap<br>
diff --git a/testcases/kernel/syzkaller-repros/Makefile b/testcases/kernel/=
syzkaller-repros/Makefile<br>
new file mode 100644<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+# Some useful compiler flags for the LTP will cause problems with the<br>
+# syzkaller repros so the repros have seperate flags<br>
+SYZKALLER_CFLAGS ?=3D -pthread<br>
+SYZKALLER_REPROS =3D $(subst $(abs_top_srcdir),$(abs_top_builddir),$(SYZKA=
LLER_REPROS_SRCS:.c=3D))<br>
+$(SYZKALLER_REPROS): %: %.c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-@if grep -q &quot;__NR_mmap2&quot; $^; then \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0M32=3D&quot;-m32&qu=
ot;; \<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">I got compiling errors on s390x:</div><div class=3D"=
gmail_default" style=3D"font-size:small">=C2=A0 gcc: error: unrecognized co=
mmand line option =E2=80=98-m32=E2=80=99; did you mean =E2=80=98-m31=E2=80=
=99?</div></div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">My other conce=
rn is=C2=A0syzkaller (I guess maybe) have some package dependencies, and th=
at will break the compiler phase on the embedded system.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D"gmail_default" style=3D"font-size:small">....</span><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!waitpid(pid, &amp;status, WNOHANG)) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rem =3D tst_timeout=
_remaining();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sent_kill &amp=
;&amp; rem / exec_time_start &lt; 0.5) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TINFO, &quot;Timeout; killing reproducer&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TEST(kill(pid, SIGKILL));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (TST_RET =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TTERRNO, &quot;kill()=
 failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sent_kill =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep(backoff);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backoff =3D MIN(2 *=
 backoff, 1000000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Force to kill a timeout test =
process is fine, but one thing makes me worried is that we don&#39;t do any=
 cleanup work(e.g. release hugepage, devices or other resources) for the ch=
ildren, that very probably causes many additional issues in the next testin=
g and not easy to reproduce it in a new run.</div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_taint_check()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;Kernel is tainted&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;Kernel is not tainted&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}</blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">If this is the only condition to =
judge if all tests pass or not, we may miss some test failure logs after ru=
nning, unless we don&#39;t care about that.</div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Btw, I can&#39;t even finish o=
ne round for the test then system panic there.=C2=A0</div></div></div><div>=
<br></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><=
div>Li Wang<br></div></div></div></div>

--0000000000007dfbd005983b87a4--


--===============0667053979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0667053979==--

