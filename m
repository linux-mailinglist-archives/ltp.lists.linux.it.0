Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AD12279BD
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 09:47:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 876463C292B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 09:47:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 831CB3C26C4
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 09:47:10 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5B3351A019D2
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 09:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595317628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2XNbU6NlAm/C+T9rbBjkeN9/PgajS656euKypUoyALE=;
 b=cuH5k62x5swK5YsWb73PNtW8g17kxZLJ0GkXPChVOpze1qFzL+4zFLZGJ1H89Z9OCyMP0R
 XlZlYewrv3TsEMGjmaPpg+lpguAVT0z5LqfgxLrYY1zRORZ/47dTLkdu/M4X6wOoBmlgO2
 r2Hceugffpezn1veT4wq8OstirdCHKQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-hoh9ICfjMXSjQGZALNuwWA-1; Tue, 21 Jul 2020 03:47:01 -0400
X-MC-Unique: hoh9ICfjMXSjQGZALNuwWA-1
Received: by mail-lj1-f198.google.com with SMTP id 206so4926785ljj.14
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 00:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2XNbU6NlAm/C+T9rbBjkeN9/PgajS656euKypUoyALE=;
 b=tgi10+ha/CbOqc4HZtLETj0ZkRzX4zsI14H/fwLVZkQ6T3Y6wWbikC7Euy4qVUnj4X
 G0aWJBozinp1wy7g32h7HtbLqWu1tS5f0UO1vec2S35Y1tzsmdHWCDD0zzeWRcz6hgAC
 TFpFKJVJDifGaRY7WPwyJqy/Dka1+q9vPsInqa0Jur5YCCNaRIDKK7unkadBxEIE1v4h
 eliQUH1veOwJ5lWg48AmRN4cqlvz/s8Pdf/3BlyguAstETdI5NmI41dWCunQA/C4VNnI
 7PZOhIQFDSC7pF+w2ngXt+N4aW85vuBOoIBlnWmNGOodt6li86XXQYIqfKuvidLRHxQy
 ibYQ==
X-Gm-Message-State: AOAM530mGRnRPiBv7YdZ3hqdiXaAUtCdxtFK5IMvQFAD09VcvrlKm3YU
 v366/f1esBYQ9p5zz1/OmvzDguzUNUjEI6lCfkVkDtwzO2hhD8ikV/5ttVSSd+3M/XHx7auP+AR
 AVKX2v8jRuAkJW+/xDSfrxQLds1Y=
X-Received: by 2002:a05:6512:3047:: with SMTP id
 b7mr12889336lfb.110.1595317620084; 
 Tue, 21 Jul 2020 00:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl1+/fovWUZUGRkVWZaUxsJOVklDAxYO55n7Ut/IXlCUYTp8HNO5qvWSriwGnLIsXVWu2c23osty6QUSAgx3A=
X-Received: by 2002:a05:6512:3047:: with SMTP id
 b7mr12889324lfb.110.1595317619771; 
 Tue, 21 Jul 2020 00:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200720194920.22784-1-ernunes@redhat.com>
In-Reply-To: <20200720194920.22784-1-ernunes@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Jul 2020 15:46:47 +0800
Message-ID: <CAEemH2c1Sz+pkcLnCoWWCaMCte7QsmUTOoUxU6fzCF32nrrG+w@mail.gmail.com>
To: Erico Nunes <ernunes@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: add function to check for kernel lockdown
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
Content-Type: multipart/mixed; boundary="===============0510819129=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0510819129==
Content-Type: multipart/alternative; boundary="00000000000007f2b605aaeed4b6"

--00000000000007f2b605aaeed4b6
Content-Type: text/plain; charset="UTF-8"

Hi Erico,

Thanks for working on this fix. Comments as below:

On Tue, Jul 21, 2020 at 3:50 AM Erico Nunes <ernunes@redhat.com> wrote:

> Some syscalls are not available if the kernel is booted using the
> 'lockdown' feature. That can cause some tests to report fail, showing
> a message like:
>
>   Lockdown: iopl01: iopl is restricted; see man kernel_lockdown.7
>
> This patch adds a function that can be used by tests to check for this
> case, so tests can be skipped rather than reporting a test failure.
>
> Signed-off-by: Erico Nunes <ernunes@redhat.com>
> ---
>  include/tst_lockdown.h |  8 ++++++++
>  include/tst_test.h     |  1 +
>  lib/tst_lockdown.c     | 28 ++++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)
>  create mode 100644 include/tst_lockdown.h
>  create mode 100644 lib/tst_lockdown.c
>
> diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h
> new file mode 100644
> index 000000000..8db26d943
> --- /dev/null
> +++ b/include/tst_lockdown.h
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#ifndef TST_LOCKDOWN_H
> +#define TST_LOCKDOWN_H
> +
> +void tst_lockdown_skip(void);
> +
> +#endif /* TST_LOCKDOWN_H */
> diff --git a/include/tst_test.h b/include/tst_test.h
> index b84f7b9dd..b02de4597 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -40,6 +40,7 @@
>  #include "tst_hugepage.h"
>  #include "tst_assert.h"
>  #include "tst_cgroup.h"
> +#include "tst_lockdown.h"
>
>  /*
>   * Reports testcase result.
> diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c
> new file mode 100644
> index 000000000..d57a6bdf3
> --- /dev/null
> +++ b/lib/tst_lockdown.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#define TST_NO_DEFAULT_MAIN
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/mount.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +#include "tst_safe_stdio.h"
> +#include "tst_lockdown.h"
> +
> +void tst_lockdown_skip(void)
>

Maybe renaming the function to tst_lockdown_enabled() is better? Then we
can return 1 if confirm kernel under lockdown mode otherwise 0.

+{
> +       char line[BUFSIZ];
> +       FILE *file;
> +
> +       if (access("/sys/kernel/security/lockdown", F_OK) != 0)
>

After thinking over, I guess it's not enough to only check /sys/../lockdown
file. Seems we need to consider the situation that system without
supporting this file?

i.e.
  Test on RHEL8 (no /sys/../lockdown file) with kernel parameter "lockdown"
and got the restriction error too.

# cat /proc/cmdline
BOOT_IMAGE=(hd0,msdos1)/vmlinuz-4.18.0-226.el8.x86_64
root=/dev/mapper/rhel_bootp--73--3--209-root ro console=ttyS0,115200 ...
 lockdown

# ll /sys/kernel/security/lockdown
ls: cannot access '/sys/kernel/security/lockdown': No such file or directory

# ./iopl01
...
iopl01.c:37: FAIL: iopl() failed for level 1, errno=1 : EPERM: EPERM (1)
iopl01.c:37: FAIL: iopl() failed for level 2, errno=1 : EPERM: EPERM (1)



> +               return;
> +
> +       file = SAFE_FOPEN("/sys/kernel/security/lockdown", "r");
> +       fgets(line, sizeof(line), file);
> +       SAFE_FCLOSE(file);
> +
> +       if (strstr(line, "[none]") == NULL)
> +               tst_brk(TCONF, "Kernel is locked down, skip this test.");
> +}
> --
> 2.26.2
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--00000000000007f2b605aaeed4b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Erico,</div></div><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">Thanks for working on this fix. Comments=
 as below:</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 21, 2020 at 3:50 AM Erico Nunes &lt;<a href=3D"=
mailto:ernunes@redhat.com">ernunes@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Some syscalls are not availabl=
e if the kernel is booted using the<br>
&#39;lockdown&#39; feature. That can cause some tests to report fail, showi=
ng<br>
a message like:<br>
<br>
=C2=A0 Lockdown: iopl01: iopl is restricted; see man kernel_lockdown.7<br>
<br>
This patch adds a function that can be used by tests to check for this<br>
case, so tests can be skipped rather than reporting a test failure.<br>
<br>
Signed-off-by: Erico Nunes &lt;<a href=3D"mailto:ernunes@redhat.com" target=
=3D"_blank">ernunes@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/tst_lockdown.h |=C2=A0 8 ++++++++<br>
=C2=A0include/tst_test.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0lib/tst_lockdown.c=C2=A0 =C2=A0 =C2=A0| 28 ++++++++++++++++++++++++++=
++<br>
=C2=A03 files changed, 37 insertions(+)<br>
=C2=A0create mode 100644 include/tst_lockdown.h<br>
=C2=A0create mode 100644 lib/tst_lockdown.c<br>
<br>
diff --git a/include/tst_lockdown.h b/include/tst_lockdown.h<br>
new file mode 100644<br>
index 000000000..8db26d943<br>
--- /dev/null<br>
+++ b/include/tst_lockdown.h<br>
@@ -0,0 +1,8 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+<br>
+#ifndef TST_LOCKDOWN_H<br>
+#define TST_LOCKDOWN_H<br>
+<br>
+void tst_lockdown_skip(void);<br>
+<br>
+#endif /* TST_LOCKDOWN_H */<br>
diff --git a/include/tst_test.h b/include/tst_test.h<br>
index b84f7b9dd..b02de4597 100644<br>
--- a/include/tst_test.h<br>
+++ b/include/tst_test.h<br>
@@ -40,6 +40,7 @@<br>
=C2=A0#include &quot;tst_hugepage.h&quot;<br>
=C2=A0#include &quot;tst_assert.h&quot;<br>
=C2=A0#include &quot;tst_cgroup.h&quot;<br>
+#include &quot;tst_lockdown.h&quot;<br>
<br>
=C2=A0/*<br>
=C2=A0 * Reports testcase result.<br>
diff --git a/lib/tst_lockdown.c b/lib/tst_lockdown.c<br>
new file mode 100644<br>
index 000000000..d57a6bdf3<br>
--- /dev/null<br>
+++ b/lib/tst_lockdown.c<br>
@@ -0,0 +1,28 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+<br>
+#define TST_NO_DEFAULT_MAIN<br>
+<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;sys/mount.h&gt;<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;tst_safe_macros.h&quot;<br>
+#include &quot;tst_safe_stdio.h&quot;<br>
+#include &quot;tst_lockdown.h&quot;<br>
+<br>
+void tst_lockdown_skip(void)<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Maybe renaming the function t=
o tst_lockdown_enabled() is better? Then we can return=C2=A01 if confirm ke=
rnel under lockdown mode otherwise 0.</div></div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char line[BUFSIZ];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *file;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (access(&quot;/sys/kernel/security/lockdown&=
quot;, F_OK) !=3D 0)<br></blockquote><div><br></div><div><div class=3D"gmai=
l_default" style=3D"font-size:small">After thinking over, I guess it&#39;s =
not enough to only check /sys/../lockdown file. Seems we need to consider t=
he situation that system without supporting this file?=C2=A0</div></div><di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">i.e.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small">=C2=A0 Test on RHEL8 (no /sys/=
../lockdown file) with kernel parameter &quot;lockdown&quot; and got the re=
striction error too.</div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small"># cat /proc/cmdline=C2=A0</div>BOOT_IMAGE=3D(hd0,msdos=
1)/vmlinuz-4.18.0-226.el8.x86_64 root=3D/dev/mapper/rhel_bootp--73--3--209-=
root ro console=3DttyS0,115200 <span class=3D"gmail_default" style=3D"font-=
size:small">...</span>=C2=A0lockdown<br>=C2=A0 =C2=A0=C2=A0<br></div><div>#=
 ll /sys/kernel/security/lockdown<br>ls: cannot access &#39;/sys/kernel/sec=
urity/lockdown&#39;: No such file or directory</div><div><br><div class=3D"=
gmail_default" style=3D"font-size:small"># ./iopl01=C2=A0</div><span class=
=3D"gmail_default" style=3D"font-size:small">...</span><br>iopl01.c:37: FAI=
L: iopl() failed for level 1, errno=3D1 : EPERM: EPERM (1)<br>iopl01.c:37: =
FAIL: iopl() failed for level 2, errno=3D1 : EPERM: EPERM (1)<br><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file =3D SAFE_FOPEN(&quot;/sys/kernel/security/=
lockdown&quot;, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fgets(line, sizeof(line), file);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FCLOSE(file);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstr(line, &quot;[none]&quot;) =3D=3D NUL=
L)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TCONF, &quo=
t;Kernel is locked down, skip this test.&quot;);<br>
+}<br>
-- <br>
2.26.2<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000007f2b605aaeed4b6--


--===============0510819129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0510819129==--

