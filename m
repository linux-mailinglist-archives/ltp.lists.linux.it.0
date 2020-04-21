Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0158D1B21FC
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:49:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B94B73C29B5
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:49:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 2600B3C299E
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:49:44 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2CC2B10014B9
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:49:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587458982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5HI6wxZbbg71PwVib0m9sxOsn/b4u2xuNxsnsvoP6sA=;
 b=LVHlwuGdR9pDWOWG/mD626LNw2ZMCOlIxsOahMrdMoID/fBKB4b9D8CpzxWkpCUWFl1XsR
 G31fzu+A4vSNuebXyFjqXs7F33pFMdcW7EEGcAdLTi/sbg99X/6JrulLz39kU5iWmnrbvW
 5h9yy5gSYisz6gEKOPm2HychK3kiF6c=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-lFXyVxyaM2-NtSTu3y1f-w-1; Tue, 21 Apr 2020 04:49:39 -0400
X-MC-Unique: lFXyVxyaM2-NtSTu3y1f-w-1
Received: by mail-lf1-f71.google.com with SMTP id d5so5540188lfb.5
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 01:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qD7Z8eQfIVUNbhgOUSmJxnEYmPeEunYnAzV9y42uG6A=;
 b=QJIRkA4xr42JQigK8xt3kWpx0FT58bNio9sZzYbYvJ3cK3BkauGjnWMQFriclQ2ui8
 yN1kfzi8lL9V6WimDld6UeE1pih1J/dqbPFJwZe2XWICPR7qxBYf5k2aFx92r8wwhvhy
 WVKJjX4bjciOG+kqW67unGrvJSDJdM/cSKk89V3OJ3FymHFYyOdt5MvI+gHWTSFel38t
 pg6FrTAw7aHEgsDnIP/amf7zX5I+z6D+SyKjmlIWLCGZR4bfxXY4VVjAbUhjknFrnYsa
 M+CxhAgiBm+bZnf40t6F65PM1FAQfZyS+ZLZuWDnIint7T1ZcYlXQv6xn0Gb3v/SLdeF
 aBZA==
X-Gm-Message-State: AGi0Puac6ljPozkmLo+0QH0smrpQLp7Jyh0K6ewcQoGY7V3N71bSNzwq
 6sEEiZork2uz5uoapg5NybSAoe5bpzLGafOfvgzlH/lDd9jYLiL//2jPKBX4zXLXowuYlsnaw2G
 weYGReD7LPy/WF4JfwzBD9sjY6oY=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr12916335lfp.138.1587458978050; 
 Tue, 21 Apr 2020 01:49:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypKRZyHTm4fTum/UI5uXF2A0CJiW2h3yMmDJm/3Bb3p+zx7mtyVDF4D19efDVRZx18HL8HPRQS5KLTpvKw5VOT0=
X-Received: by 2002:a05:6512:1c5:: with SMTP id
 f5mr12916323lfp.138.1587458977772; 
 Tue, 21 Apr 2020 01:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1587022142-32122-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Apr 2020 16:49:25 +0800
Message-ID: <CAEemH2eN1gJ8p2EWts4qj=tDaV0QUoHrNX36cqkPM0xf92KDuw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] syscalls/pipe2_02: Add new test for pipe2
 O_CLOEXEC flag
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
Content-Type: multipart/mixed; boundary="===============0216626363=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0216626363==
Content-Type: multipart/alternative; boundary="0000000000007747ff05a3c9189f"

--0000000000007747ff05a3c9189f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 3:29 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  runtest/syscalls                              |  1 +
>  testcases/kernel/syscalls/pipe2/.gitignore    |  2 +
>  testcases/kernel/syscalls/pipe2/pipe2_02.c    | 69 +++++++++++++++++++
>  .../kernel/syscalls/pipe2/pipe2_02_child.c    | 26 +++++++
>  4 files changed, 98 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02.c
>  create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02_child.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 79b671d50..44254d7da 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -911,6 +911,7 @@ pipe12 pipe12
>  pipe13 pipe13
>
>  pipe2_01 pipe2_01
> +pipe2_02 pipe2_02
>
>  pivot_root01 pivot_root01
>
> diff --git a/testcases/kernel/syscalls/pipe2/.gitignore
> b/testcases/kernel/syscalls/pipe2/.gitignore
> index 42350bbdc..786222de2 100644
> --- a/testcases/kernel/syscalls/pipe2/.gitignore
> +++ b/testcases/kernel/syscalls/pipe2/.gitignore
> @@ -1 +1,3 @@
>  /pipe2_01
> +/pipe2_02
> +/pipe2_02_child
> diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02.c
> b/testcases/kernel/syscalls/pipe2/pipe2_02.c
> new file mode 100644
> index 000000000..743d78c58
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_02.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * This case is designed to test the basic functionality about the
> + * O_CLOEXEC flag of pipe2.
> + */
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include "lapi/fcntl.h"
> +#include "tst_test.h"
> +
> +#define TESTBIN "pipe2_02_child"
> +static int fds[2];
> +
> +static void cleanup(void)
> +{
> +       if (fds[0] > 0)
> +               SAFE_CLOSE(fds[0]);
> +       if (fds[1] > 0)
> +               SAFE_CLOSE(fds[1]);
> +}
> +
> +static void verify_pipe2(void)
> +{
> +       int pid, status;
> +       char buf[20];
> +
> +       SAFE_PIPE2(fds, O_CLOEXEC);
> +       sprintf(buf, "%d", fds[1]);
> +       pid =3D SAFE_FORK();
> +       if (pid =3D=3D 0) {
> +               if (execlp(TESTBIN, TESTBIN, buf, NULL))
> +                       exit(2);
>

Do we really need the if() condition and exit(2)? AFAIK, the exec() family
of functions replaces the current process image with a new process and
returns zero if succeeded.


> +       }
> +
> +       SAFE_WAIT(&status);
> +       if (WIFEXITED(status)) {
> +               switch (WEXITSTATUS(status)) {
> +               case 0:
> +                       tst_res(TPASS, "test O_CLOEXEC for pipe2 success"=
);
> +               break;
> +               case 1:
> +                       tst_res(TFAIL, "test O_CLOEXEC for pipe2 failed")=
;
> +               break;
> +               default:
> +                       tst_brk(TBROK, "execlp() failed");
> +               }
> +       } else {
> +               tst_brk(TBROK, "%s exits with unexpected error", TESTBIN)=
;
> +       }
> +       cleanup();
> +}
> +
> +static const char *const resfile[] =3D {
> +       TESTBIN,
> +       NULL,
> +};
> +
> +static struct tst_test test =3D {
> +       .resource_files =3D resfile,
> +       .cleanup =3D cleanup,
> +       .forks_child =3D 1,
> +       .needs_root =3D 1,
> +       .test_all =3D verify_pipe2,
> +};
> diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02_child.c
> b/testcases/kernel/syscalls/pipe2/pipe2_02_child.c
> new file mode 100644
> index 000000000..d5ed68cf7
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_02_child.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com
> + */
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <unistd.h>
> +
> +int main(int argc, char **argv)
> +{
> +       int ret;
> +       int fd;
> +
> +       if (argc !=3D 2) {
> +               fprintf(stderr, "Only two arguments: %s <fd>\n", argv[0])=
;
> +               exit(1);
> +       }
> +
> +       fd =3D atoi(argv[1]);
> +       ret =3D write(fd, "x", 1);
> +
> +       return ret !=3D -1;


To check if the return value equals -1 maybe not a good idea to confirm the
'fd' is closed. That only proof it failed to write "x" to the fd, we are
not sure if that exists other errors.

What about using the fcntl() in the fd status check?

    if (fcntl(fd, F_GETFL) < 0 && errno =3D=3D EBADF)
            return 0;

--=20
Regards,
Li Wang

--0000000000007747ff05a3c9189f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Apr 16, 2020 at 3:29 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn=
.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.f=
ujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0testcases/kernel/syscalls/pipe2/.gitignore=C2=A0 =C2=A0 |=C2=A0 2 +<b=
r>
=C2=A0testcases/kernel/syscalls/pipe2/pipe2_02.c=C2=A0 =C2=A0 | 69 ++++++++=
+++++++++++<br>
=C2=A0.../kernel/syscalls/pipe2/pipe2_02_child.c=C2=A0 =C2=A0 | 26 +++++++<=
br>
=C2=A04 files changed, 98 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02.c<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_02_child.c<b=
r>
<br>
diff --git a/runtest/syscalls b/runtest/syscalls<br>
index 79b671d50..44254d7da 100644<br>
--- a/runtest/syscalls<br>
+++ b/runtest/syscalls<br>
@@ -911,6 +911,7 @@ pipe12 pipe12<br>
=C2=A0pipe13 pipe13<br>
<br>
=C2=A0pipe2_01 pipe2_01<br>
+pipe2_02 pipe2_02<br>
<br>
=C2=A0pivot_root01 pivot_root01<br>
<br>
diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/=
syscalls/pipe2/.gitignore<br>
index 42350bbdc..786222de2 100644<br>
--- a/testcases/kernel/syscalls/pipe2/.gitignore<br>
+++ b/testcases/kernel/syscalls/pipe2/.gitignore<br>
@@ -1 +1,3 @@<br>
=C2=A0/pipe2_01<br>
+/pipe2_02<br>
+/pipe2_02_child<br>
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02.c b/testcases/kernel/=
syscalls/pipe2/pipe2_02.c<br>
new file mode 100644<br>
index 000000000..743d78c58<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/pipe2/pipe2_02.c<br>
@@ -0,0 +1,69 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.<br>
+ * Author: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" tar=
get=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
+ *<br>
+ * This case is designed to test the basic functionality about the<br>
+ * O_CLOEXEC flag of pipe2.<br>
+ */<br>
+#define _GNU_SOURCE<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;unistd.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &quot;lapi/fcntl.h&quot;<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+#define TESTBIN &quot;pipe2_02_child&quot;<br>
+static int fds[2];<br>
+<br>
+static void cleanup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fds[0] &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[0]);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fds[1] &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[1]);=
<br>
+}<br>
+<br>
+static void verify_pipe2(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int pid, status;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[20];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PIPE2(fds, O_CLOEXEC);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(buf, &quot;%d&quot;, fds[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (execlp(TESTBIN,=
 TESTBIN, buf, NULL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0exit(2);<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">Do we really need the if() condition and=
 exit(2)? AFAIK, the exec() family of functions replaces the current proces=
s image with a new process and returns zero if succeeded.</div></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WAIT(&amp;status);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (WIFEXITED(status)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (WEXITSTATUS=
(status)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TPASS, &quot;test O_CLOEXEC for pipe2 success&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL, &quot;test O_CLOEXEC for pipe2 failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brk(TBROK, &quot;execlp() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quo=
t;%s exits with unexpected error&quot;, TESTBIN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup();<br>
+}<br>
+<br>
+static const char *const resfile[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TESTBIN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
+};<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.resource_files =3D resfile,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.forks_child =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D verify_pipe2,<br>
+};<br>
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_02_child.c b/testcases/k=
ernel/syscalls/pipe2/pipe2_02_child.c<br>
new file mode 100644<br>
index 000000000..d5ed68cf7<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/pipe2/pipe2_02_child.c<br>
@@ -0,0 +1,26 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.<br>
+ * Author: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" tar=
get=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a><br>
+ */<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;string.h&gt;<br>
+#include &lt;errno.h&gt;<br>
+#include &lt;unistd.h&gt;<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (argc !=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &qu=
ot;Only two arguments: %s &lt;fd&gt;\n&quot;, argv[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D atoi(argv[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D write(fd, &quot;x&quot;, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret !=3D -1;</blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">To check if the=
 return value equals -1 maybe not a good idea to confirm the &#39;fd&#39; i=
s closed. That only proof it failed to write &quot;x&quot; to the fd, we ar=
e not sure if that exists=C2=A0other errors.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">What about using the fcntl() in the fd status check?</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 if (fcntl(fd=
, F_GETFL) &lt; 0 &amp;&amp; errno =3D=3D EBADF) </div><div class=3D"gmail_=
default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0;</div></div></div><div><br></div>-- <br><div dir=3D"ltr"><div =
dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007747ff05a3c9189f--


--===============0216626363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0216626363==--

