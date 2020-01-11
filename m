Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FE3138244
	for <lists+linux-ltp@lfdr.de>; Sat, 11 Jan 2020 17:09:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 780983C23B0
	for <lists+linux-ltp@lfdr.de>; Sat, 11 Jan 2020 17:09:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6C9813C2390
 for <ltp@lists.linux.it>; Sat, 11 Jan 2020 17:09:08 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id ADD9E200395
 for <ltp@lists.linux.it>; Sat, 11 Jan 2020 17:09:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578758944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y/UGvKBgoJwGiq8sUxGcyCY/TXBJj3w/7389a9fGg8Y=;
 b=HyqSpbCRNj2XCDY4WQw/ODkuXcnbz9SR987SsbD4l8gHKRefwtzUGFNw8Hx5I5skUacQcM
 ZOILww9Otuir1ickkfVaWVWG8Sm8HLovY4H611VXn4eTKHsL8QCv9JvxtWF+/X4XXZljqk
 b5ZSYOP6gLO80tgsVBaf7wwnEwt9svU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-rLG_Ri19NoynpDZcpqKK0g-1; Sat, 11 Jan 2020 11:08:59 -0500
Received: by mail-oi1-f200.google.com with SMTP id q204so2117942oic.12
 for <ltp@lists.linux.it>; Sat, 11 Jan 2020 08:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mTHyKhNPyRlZXCyUGzWLNqLBeR6xV435TeMmYqukn+E=;
 b=NDnLis+ONgF4Q34W/4KjSH+qx4rJZOHbeQ/2Tr00dWK8+r3Ae43X3yK8pAatJEYX50
 HOBmQl5bVgxnc7+QXpPNv65vdw881/cyAHI19Ja3ivXjvL0KaMs7bwsmkBpgtfAg65IY
 qp6PoRnCO/IPvb/FCnJNkwYWj/dAmErXzboq2vsJtf9X7Ypp0ko0yzMhXb6GLuyIBC1F
 dbxv4VZRogGsk+Q/siWPZ31jSgWx+I1qw5dUd5CIDM8OZIfqFRPFoQC0Guh/FCG++Qol
 BNm3uMxjH+7X27eeYjItNR8tzHD1DYfgCkD2wn96DvLR6KZV2Nxj/wlULySMDVMot2yu
 Ygvg==
X-Gm-Message-State: APjAAAWHnHa5DFe4BwJynaPTUqBWjUym7K/HcuvMSAsk4OMwi6xNLlax
 C+hPuf2NZoLSuFFkjbpSNZ7IESluGQXU6hO9OqFmnVO3P2KeesIHV3TU1NXF9+jeUG0eQoqKVws
 Rg818jDaqy0vUNLZ3M6+gpzoMM14=
X-Received: by 2002:a9d:7:: with SMTP id 7mr6822560ota.26.1578758938695;
 Sat, 11 Jan 2020 08:08:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRG0o3eB8gSwozkTtw0bo8hqRpz5HZD8+yVhMEGsBGQHgDG8yisgULAQOk15W3VbjSCyqnotZ/njPbhrjhmM8=
X-Received: by 2002:a9d:7:: with SMTP id 7mr6822540ota.26.1578758938437; Sat,
 11 Jan 2020 08:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20200110151443.212842-1-pvorel@suse.cz>
In-Reply-To: <20200110151443.212842-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sat, 11 Jan 2020 17:08:46 +0100
Message-ID: <CAEemH2fHz9NEcy9_zDpEQUGTRrx_j0zceY7zwAE9_j1Xgqx8+Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: rLG_Ri19NoynpDZcpqKK0g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_device: use raw syscall in the
 tst_device.h
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0211303909=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0211303909==
Content-Type: multipart/alternative; boundary="000000000000b64dd7059bdf754e"

--000000000000b64dd7059bdf754e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Petr for help doing this, I'm on the way to visit Brno. Not
convenient to connect internet until next week.

--  sending by my ph1 phone.

On Fri, Jan 10, 2020, 16:14 Petr Vorel <pvorel@suse.cz> wrote:

> From: Li Wang <liwang@redhat.com>
>
> To follow up commit 447c223db ("tst_device: include unistd.h").
>
> Reported-by: Petr Vorel <pvorel@suse.cz>
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Li Wang <liwang@redhat.com>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> [pvorel: Removed _XOPEN_SOURCE from affected tests to really fix
> the issue and aren't needed]
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
>
> Fixes: eca0fa3c3 ("tst_device: add new tst_dev_sync")
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> tested on
> https://travis-ci.org/pevik/ltp/builds/635305638
>
> Please anybody ack and merge, so we can move on with merging other
> things before git freeze.
>
> NOTE: Debian failures are caused by bug in libtirpc 1.2.5,
> will be fixed by https://patchwork.ozlabs.org/patch/1216506/
>
> Kind regards,
> Petr
>
>  include/tst_device.h                                | 5 +++--
>  testcases/kernel/syscalls/fadvise/posix_fadvise01.c | 1 -
>  testcases/kernel/syscalls/fadvise/posix_fadvise02.c | 1 -
>  testcases/kernel/syscalls/fadvise/posix_fadvise03.c | 1 -
>  testcases/kernel/syscalls/fadvise/posix_fadvise04.c | 1 -
>  testcases/kernel/syscalls/pwrite/pwrite02.c         | 2 --
>  6 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/include/tst_device.h b/include/tst_device.h
> index f277afd77..3db5275c9 100644
> --- a/include/tst_device.h
> +++ b/include/tst_device.h
> @@ -19,6 +19,7 @@
>  #define TST_DEVICE_H__
>
>  #include <unistd.h>
> +#include <sys/syscall.h>
>
>  struct tst_device {
>         const char *dev;
> @@ -75,9 +76,9 @@ int tst_detach_device(const char *dev_path);
>   * simply before the tst_dev_bytes_written invocation. For easy to use,
>   * we create this inline function tst_dev_sync.
>   */
> -static inline void tst_dev_sync(int fd)
> +static inline int tst_dev_sync(int fd)
>  {
> -       syncfs(fd);
> +       return syscall(__NR_syncfs, fd);
>  }
>
>  /*
> diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> index 2af040840..71e6454d8 100644
> --- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> @@ -20,7 +20,6 @@
>   *     None
>   */
>
> -#define _XOPEN_SOURCE 600
>  #include <fcntl.h>
>
>  #include <unistd.h>
> diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
> b/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
> index d533a7953..303f776e4 100644
> --- a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
> +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
> @@ -20,7 +20,6 @@
>   *     None
>   */
>
> -#define _XOPEN_SOURCE 600
>  #include <fcntl.h>
>  #include <unistd.h>
>  #include <signal.h>
> diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
> b/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
> index 5bada5f3d..98d8d2930 100644
> --- a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
> +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
> @@ -20,7 +20,6 @@
>   *     None
>   */
>
> -#define _XOPEN_SOURCE 600
>  #include <fcntl.h>
>  #include <unistd.h>
>  #include <signal.h>
> diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
> b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
> index d8d8fb601..f389a219b 100644
> --- a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
> +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
> @@ -20,7 +20,6 @@
>   *     None
>   */
>
> -#define _XOPEN_SOURCE 600
>  #include <fcntl.h>
>  #include <unistd.h>
>  #include <signal.h>
> diff --git a/testcases/kernel/syscalls/pwrite/pwrite02.c
> b/testcases/kernel/syscalls/pwrite/pwrite02.c
> index 056d44da2..221904cd7 100644
> --- a/testcases/kernel/syscalls/pwrite/pwrite02.c
> +++ b/testcases/kernel/syscalls/pwrite/pwrite02.c
> @@ -18,8 +18,6 @@
>   *      accessible address space, returns EFAULT.
>   */
>
> -#define _XOPEN_SOURCE 500
> -
>  #include <errno.h>
>  #include <unistd.h>
>  #include <string.h>
> --
> 2.24.0
>
>

--000000000000b64dd7059bdf754e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks Petr for help doing this, I&#39;m on the way =
to visit Brno. Not convenient to connect internet until next week.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">--=C2=A0 sending by my ph1 phone=
.</div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 10, 2020, 16:14 Petr Vorel &lt;=
<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">From: Li Wang &lt;<a href=3D"mailto:liwang@red=
hat.com" target=3D"_blank" rel=3D"noreferrer">liwang@redhat.com</a>&gt;<br>
<br>
To follow up commit 447c223db (&quot;tst_device: include unistd.h&quot;).<b=
r>
<br>
Reported-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank" rel=3D"noreferrer">pvorel@suse.cz</a>&gt;<br>
Suggested-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank" rel=3D"noreferrer">chrubis@suse.cz</a>&gt;<br>
Signed-off-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_=
blank" rel=3D"noreferrer">liwang@redhat.com</a>&gt;<br>
Reviewed-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"=
_blank" rel=3D"noreferrer">chrubis@suse.cz</a>&gt;<br>
[pvorel: Removed _XOPEN_SOURCE from affected tests to really fix<br>
the issue and aren&#39;t needed]<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank" rel=3D"noreferrer">pvorel@suse.cz</a>&gt;<br>
Tested-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blan=
k" rel=3D"noreferrer">pvorel@suse.cz</a>&gt;<br>
<br>
Fixes: eca0fa3c3 (&quot;tst_device: add new tst_dev_sync&quot;)<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank" rel=3D"noreferrer">pvorel@suse.cz</a>&gt;<br>
---<br>
Hi,<br>
<br>
tested on<br>
<a href=3D"https://travis-ci.org/pevik/ltp/builds/635305638" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://travis-ci.org/pevik/ltp/builds/63=
5305638</a><br>
<br>
Please anybody ack and merge, so we can move on with merging other<br>
things before git freeze.<br>
<br>
NOTE: Debian failures are caused by bug in libtirpc 1.2.5,<br>
will be fixed by <a href=3D"https://patchwork.ozlabs.org/patch/1216506/" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/=
patch/1216506/</a><br>
<br>
Kind regards,<br>
Petr<br>
<br>
=C2=A0include/tst_device.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 +++--<br=
>
=C2=A0testcases/kernel/syscalls/fadvise/posix_fadvise01.c | 1 -<br>
=C2=A0testcases/kernel/syscalls/fadvise/posix_fadvise02.c | 1 -<br>
=C2=A0testcases/kernel/syscalls/fadvise/posix_fadvise03.c | 1 -<br>
=C2=A0testcases/kernel/syscalls/fadvise/posix_fadvise04.c | 1 -<br>
=C2=A0testcases/kernel/syscalls/pwrite/pwrite02.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 --<br>
=C2=A06 files changed, 3 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/include/tst_device.h b/include/tst_device.h<br>
index f277afd77..3db5275c9 100644<br>
--- a/include/tst_device.h<br>
+++ b/include/tst_device.h<br>
@@ -19,6 +19,7 @@<br>
=C2=A0#define TST_DEVICE_H__<br>
<br>
=C2=A0#include &lt;unistd.h&gt;<br>
+#include &lt;sys/syscall.h&gt;<br>
<br>
=C2=A0struct tst_device {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *dev;<br>
@@ -75,9 +76,9 @@ int tst_detach_device(const char *dev_path);<br>
=C2=A0 * simply before the tst_dev_bytes_written invocation. For easy to us=
e,<br>
=C2=A0 * we create this inline function tst_dev_sync.<br>
=C2=A0 */<br>
-static inline void tst_dev_sync(int fd)<br>
+static inline int tst_dev_sync(int fd)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0syncfs(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return syscall(__NR_syncfs, fd);<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c b/testcase=
s/kernel/syscalls/fadvise/posix_fadvise01.c<br>
index 2af040840..71e6454d8 100644<br>
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c<br>
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0None<br>
=C2=A0 */<br>
<br>
-#define _XOPEN_SOURCE 600<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
<br>
=C2=A0#include &lt;unistd.h&gt;<br>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c b/testcase=
s/kernel/syscalls/fadvise/posix_fadvise02.c<br>
index d533a7953..303f776e4 100644<br>
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c<br>
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise02.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0None<br>
=C2=A0 */<br>
<br>
-#define _XOPEN_SOURCE 600<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
=C2=A0#include &lt;signal.h&gt;<br>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c b/testcase=
s/kernel/syscalls/fadvise/posix_fadvise03.c<br>
index 5bada5f3d..98d8d2930 100644<br>
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c<br>
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise03.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0None<br>
=C2=A0 */<br>
<br>
-#define _XOPEN_SOURCE 600<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
=C2=A0#include &lt;signal.h&gt;<br>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c b/testcase=
s/kernel/syscalls/fadvise/posix_fadvise04.c<br>
index d8d8fb601..f389a219b 100644<br>
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c<br>
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0None<br>
=C2=A0 */<br>
<br>
-#define _XOPEN_SOURCE 600<br>
=C2=A0#include &lt;fcntl.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
=C2=A0#include &lt;signal.h&gt;<br>
diff --git a/testcases/kernel/syscalls/pwrite/pwrite02.c b/testcases/kernel=
/syscalls/pwrite/pwrite02.c<br>
index 056d44da2..221904cd7 100644<br>
--- a/testcases/kernel/syscalls/pwrite/pwrite02.c<br>
+++ b/testcases/kernel/syscalls/pwrite/pwrite02.c<br>
@@ -18,8 +18,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 accessible address space, returns EFAULT.<br>
=C2=A0 */<br>
<br>
-#define _XOPEN_SOURCE 500<br>
-<br>
=C2=A0#include &lt;errno.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
-- <br>
2.24.0<br>
<br>
</blockquote></div></div></div>

--000000000000b64dd7059bdf754e--


--===============0211303909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0211303909==--

