Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96377C12F4
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 05:47:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2ADB83C26F6
	for <lists+linux-ltp@lfdr.de>; Sun, 29 Sep 2019 05:47:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 300E43C18FB
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 05:47:43 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id DE6D3140054D
 for <ltp@lists.linux.it>; Sun, 29 Sep 2019 05:47:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1569728858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/flWQnQ/ve/zB4wKJ263sO3o52VPBXtZmKe5WlSHaBQ=;
 b=Ig9LVKyImPZ79bkd8RjTHhMSY5vkQ4UXcmIzRna+KLYOtRWWwQqp4mJtvX0berzuJkacLR
 lIbVjTlxKH3mfIgUAtwR5+P44dWeZBa87ATA/GUtw0Vo8Yip6KI+ZgRhcbgz+SZndEVsmC
 BRtJQQAyRokE0o82m5BlCALHsTn/YUs=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-pHN9aDA8Of-_pZlfuX73sg-1; Sat, 28 Sep 2019 23:47:34 -0400
Received: by mail-ot1-f71.google.com with SMTP id v51so3796806otb.5
 for <ltp@lists.linux.it>; Sat, 28 Sep 2019 20:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2q4uSVJhN3Yaktva0NFVSILYH0z1WIKy1CNVsVTX4Q=;
 b=WaK0JrOYmiVeez4JXbyCc5xJgNHwaizpzAb0oORs+m4e7ddwo1xOItDbVEO1q2/ULh
 O+uUz04FsQSY7xKo2x1lF+WIQ0TsWTSzlD5OP+dfOXcXLPKjfhyz3tW7laMcYMbhWrza
 23NUPTsx4GVVkaEl1rZt9WD5qyOlnOKhwVSUte30gLnXuQHLIbiZhvZmAOmzZiy7iVFE
 aOJGK+DIrlX9mPfGU+vA0VDhEPmMgBOYPqB3SR/cIEJBU1yJeWK6zLNG4bhOCqFsg5IJ
 m/pUp/DBZarIhx5j2ZcPZT9czug9kn2/c1Kdh46HNDi9MD9TTL/V+i7eFYb/zKViqHvQ
 +7NQ==
X-Gm-Message-State: APjAAAWWCj0gaGTU3x2t8ILfZ868Dy/iXzLq0wQ/abREvIalZYWKN9wu
 rsuRUxqqCdE0+P2TjjIXtdxzF2KorM5XhGcDMtQpJU1ZH+I++Kfz5GpVrjxT9ITh4x065CphMGN
 TdhMeUBKS8YIJ1Ul6oZgRwqUcnFY=
X-Received: by 2002:a9d:6a16:: with SMTP id g22mr8683525otn.118.1569728853328; 
 Sat, 28 Sep 2019 20:47:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxV+WTIu0ItlsWkAF9OmLqtqdMyoSQjB1v+NMb8qripj5H7NsaqK2zVD/MWcbja3g/5D+DU5Q1hJ0KiWYksjY=
X-Received: by 2002:a9d:6a16:: with SMTP id g22mr8683514otn.118.1569728853077; 
 Sat, 28 Sep 2019 20:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190927034635.28521-1-pengfei.xu@intel.com>
In-Reply-To: <20190927034635.28521-1-pengfei.xu@intel.com>
From: Li Wang <liwang@redhat.com>
Date: Sun, 29 Sep 2019 11:47:21 +0800
Message-ID: <CAEemH2dGOcpSmD=BkvQZW=JTtbpkoUSN+tqffkDu+jV=vJsUqA@mail.gmail.com>
To: Pengfei Xu <pengfei.xu@intel.com>
X-MC-Unique: pHN9aDA8Of-_pZlfuX73sg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] umip_basic_test.c: update umip basic test for new
 kernel v5.4
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0755154119=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0755154119==
Content-Type: multipart/alternative; boundary="000000000000ae89c80593a8fa2a"

--000000000000ae89c80593a8fa2a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 11:39 AM Pengfei Xu <pengfei.xu@intel.com> wrote:

> After linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW will return
> dummy value and not trigger SIGSEGV due to kernel code change.
> For detailed kernel update info, you could check v5.4 commit:
> x86/umip: Add emulation (spoofing) for UMIP covered instructions in
> 64-bit processes as well
>
> Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
> ---
>  testcases/kernel/security/umip/umip_basic_test.c | 25
> ++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/security/umip/umip_basic_test.c
> b/testcases/kernel/security/umip/umip_basic_test.c
> index 37850ef9f..278ae92f6 100644
> --- a/testcases/kernel/security/umip/umip_basic_test.c
> +++ b/testcases/kernel/security/umip/umip_basic_test.c
> @@ -21,6 +21,7 @@
>  #include <string.h>
>  #include <sys/wait.h>
>  #include <signal.h>
> +#include <linux/version.h>
>
>  #include "tst_test.h"
>  #include "tst_safe_stdio.h"
> @@ -112,11 +113,31 @@ static void verify_umip_instruction(unsigned int n)
>
>         SAFE_WAITPID(pid, &status, 0);
>
> +       switch (n) {
> +       case 0:
> +       case 1:
> +       case 3:
> +               /* after linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW
> will return
> +                  dummy value and not trigger SIGSEGV due to kernel code
> change */
> +               #if LINUX_VERSION_CODE >=3D KERNEL_VERSION(5,4,0)
> +                       tst_res(TINFO, "Linux kernel version is after tha=
n
> v5.4");
> +                       if (WIFSIGNALED(status) && WTERMSIG(status) =3D=
=3D
> SIGSEGV) {
> +                               tst_res(TFAIL, "Got SIGSEGV\n\n");
> +                               return;
> +                       }
> +                       tst_res(TPASS, "Didn't receive SIGSEGV, child
> exited with %s\n\n",
> +                               tst_strstatus(status));
> +                               return;
> +               #else
> +                       tst_res(TINFO, "Linux kernel version is before
> than v5.4");
>

Thank you for fixing this.

My concern is that if an LTS distro backports the patch(commit e86c2c8b93),
then it will break this hardcode kernel-version comparing.



> +               #endif
> +       }
> +
>         if (WIFSIGNALED(status) && WTERMSIG(status) =3D=3D SIGSEGV) {
> -               tst_res(TPASS, "Got SIGSEGV");
> +               tst_res(TPASS, "Got SIGSEGV\n\n");
>

Why we need two '\n' here?


>                 return;
>         }
> -       tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s",
> +       tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s\n\n"=
,
>                 tst_strstatus(status));
>  }
>
> --
> 2.14.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>


--=20
Regards,
Li Wang

--000000000000ae89c80593a8fa2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Sep 27, 2019 at 11:39 AM Pengfei Xu &lt;<a =
href=3D"mailto:pengfei.xu@intel.com">pengfei.xu@intel.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">After linux kernel=
 v5.4 mainline, 64bit SGDT SIDT SMSW will return<br>
dummy value and not trigger SIGSEGV due to kernel code change.<br>
For detailed kernel update info, you could check v5.4 commit:<br>
x86/umip: Add emulation (spoofing) for UMIP covered instructions in<br>
64-bit processes as well<br>
<br>
Signed-off-by: Pengfei Xu &lt;<a href=3D"mailto:pengfei.xu@intel.com" targe=
t=3D"_blank">pengfei.xu@intel.com</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/security/umip/umip_basic_test.c | 25 +++++++++++++++=
+++++++--<br>
=C2=A01 file changed, 23 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/k=
ernel/security/umip/umip_basic_test.c<br>
index 37850ef9f..278ae92f6 100644<br>
--- a/testcases/kernel/security/umip/umip_basic_test.c<br>
+++ b/testcases/kernel/security/umip/umip_basic_test.c<br>
@@ -21,6 +21,7 @@<br>
=C2=A0#include &lt;string.h&gt;<br>
=C2=A0#include &lt;sys/wait.h&gt;<br>
=C2=A0#include &lt;signal.h&gt;<br>
+#include &lt;linux/version.h&gt;<br>
<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_safe_stdio.h&quot;<br>
@@ -112,11 +113,31 @@ static void verify_umip_instruction(unsigned int n)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_WAITPID(pid, &amp;status, 0);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (n) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case 3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* after linux kern=
el v5.4 mainline, 64bit SGDT SIDT SMSW will return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dummy value=
 and not trigger SIGSEGV due to kernel code change */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#if LINUX_VERSION_C=
ODE &gt;=3D KERNEL_VERSION(5,4,0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TINFO, &quot;Linux kernel version is after than v5.4&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (WIFSIGNALED(status) &amp;&amp; WTERMSIG(status) =3D=3D SIGSEG=
V) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;Got SIGSEGV\n\n&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TPASS, &quot;Didn&#39;t receive SIGSEGV, child exited wit=
h %s\n\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_strstatus(status));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TINFO, &quot;Linux kernel version is before than v5.4&quo=
t;);<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Thank you for fixing this.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">My concern is that if an LTS distro backports the pa=
tch(commit e86c2c8b93), then it will break this hardcode kernel-version com=
paring.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (WIFSIGNALED(status) &amp;&amp; WTERMSIG(sta=
tus) =3D=3D SIGSEGV) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;Got SIGSEGV&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;Got SIGSEGV\n\n&quot;);<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">Why we need two &#39;\n&#39; here=
?</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;Didn&#39;t receive SIGSEGV=
, child exited with %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quot;Didn&#39;t receive SIGSEGV=
, child exited with %s\n\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_strstatus(statu=
s));<br>
=C2=A0}<br>
<br>
-- <br>
2.14.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000ae89c80593a8fa2a--


--===============0755154119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0755154119==--

