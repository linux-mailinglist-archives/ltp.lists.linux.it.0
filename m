Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD671B56F1
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 10:09:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FFF13C2984
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 10:09:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 549EB3C2934
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 10:09:12 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 71F2D1000DD3
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 10:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587629349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QJiY3DAZqVDTzJyQ5LaXsoF/WmE8vQ3Nub6bl13U2B8=;
 b=O1COXVzewIYExg+hH0TmorBymVu3jrXBUl6d/7J/yvgo9se+Dfy4ZbOMtx7E734+vhUEdw
 6eiPNRM4aFRNR/c3BSgr4mQAQDEjfV/yldIRkkJ9QeN7SetHzzSkqcwFvTYPhLyolXcpAo
 wYw5KoaFqqfeyOZ5rESOpD20VclaKjE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-8dKd2y_NPuaBveYHrUX-kg-1; Thu, 23 Apr 2020 04:09:07 -0400
X-MC-Unique: 8dKd2y_NPuaBveYHrUX-kg-1
Received: by mail-lf1-f72.google.com with SMTP id y19so2024229lfk.13
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 01:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/GLdJVI2xEdCcpC5/BBEMrKgfv6GForbD+pSp1eVXFI=;
 b=CT2r2F1W6ttJ6Xrw+H4MzofmRbpLvU6sKwnkKg/+GECjvi8B0LLYkrR0cEN9OFcVXs
 FPsyT6aLXhCmy340o0+6lZHDEbAkt5tRAa1srglUKdTtT9MKQ9bZDXdID2QxvUYSgAwk
 LF0klI8HYBWr2EJVYWM5WYDhz+jjfrLkhiHL44kq+trxW1FTHPOIU+db3Eg++u5NgYdn
 HP3sWCMEVo6EDwEtDXCgXcS83XPwpk6QN6fErlkgSG1FMBw1jO63RT0TQHNqfTE7TA/N
 38G7IfLa1KjYcOCp7Ehnv9t7n18PRFElQ/IwggHjzPhofK80rjL7Ry4RXfrjBhm0hggm
 r6LQ==
X-Gm-Message-State: AGi0PuZlhKlQ5Z3kIyQ1KMLH9adC47Zbf8SOcW2x0hKFLOCNvoYwu1j0
 qrb7sPbMMM1GPP4zqGOv6Ht/T8wabrcGi/ew53z+2u1CjvsQd+WnVCuYxtlzHbI4Hc95huw+7NH
 gCvej/0OOcI0h+JIW5u6ifz6uZAg=
X-Received: by 2002:a05:651c:8a:: with SMTP id 10mr1674395ljq.6.1587629345765; 
 Thu, 23 Apr 2020 01:09:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypKTzXoFnlS4mmnYiPH8sy1ONtEv9kBp/7NreBpnt/Wgppo9WB3HAa+1ade4epeAvygWFk0CWAnDC4XO49R6Uec=
X-Received: by 2002:a05:651c:8a:: with SMTP id 10mr1674386ljq.6.1587629345529; 
 Thu, 23 Apr 2020 01:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <1587552329-21738-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1587552329-21738-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 23 Apr 2020 16:08:53 +0800
Message-ID: <CAEemH2ea_CtRyP9KtpJDjpEzobRyhrodiycDCAxhLbCjuOwhCQ@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] syscalls/pipe2_03: Add new test for pipe2
 O_DIRECT flag
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
Content-Type: multipart/mixed; boundary="===============1659544389=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1659544389==
Content-Type: multipart/alternative; boundary="0000000000002d00c005a3f0c323"

--0000000000002d00c005a3f0c323
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2020 at 6:47 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  runtest/syscalls                           |   1 +
>  testcases/kernel/syscalls/pipe2/.gitignore |   1 +
>  testcases/kernel/syscalls/pipe2/pipe2_03.c | 172 +++++++++++++++++++++
>  3 files changed, 174 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 9bb72beb2..16add02d3 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -916,6 +916,7 @@ pipe13 pipe13
>
>  pipe2_01 pipe2_01
>  pipe2_02 pipe2_02
> +pipe2_03 pipe2_03
>  pipe2_04 pipe2_04
>
>  pivot_root01 pivot_root01
> diff --git a/testcases/kernel/syscalls/pipe2/.gitignore
> b/testcases/kernel/syscalls/pipe2/.gitignore
> index 773450a48..ede1da65e 100644
> --- a/testcases/kernel/syscalls/pipe2/.gitignore
> +++ b/testcases/kernel/syscalls/pipe2/.gitignore
> @@ -1,3 +1,4 @@
>  /pipe2_01
>  /pipe2_02
> +/pipe2_03
>  /pipe2_04
> diff --git a/testcases/kernel/syscalls/pipe2/pipe2_03.c
> b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> new file mode 100644
> index 000000000..0314f9eda
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> @@ -0,0 +1,172 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * This case is designed to test the basic functionality about the
> + * O_DIRECT flag of pipe2.
> + *
> + * It includes three sub tests.
> + * 1) Each write(2) to the pipe is dealt with as a separate packet, and
> + * read(2)s from the pipe will read one packet at a time.
> + * 2) Writes of greater than PIPE_BUF bytes (see pipe(7)) will be split
> + * into multiple packet.
> + * 3)If a read(2) specifies a buffer size that is smaller than the next
> + * packet, then the requested number of bytes are read, and the excess
> + * bytes in the packet are discarded.
> + */
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <linux/limits.h>
> +#include "lapi/fcntl.h"
> +#include "tst_test.h"
> +
> +static int fds[2], packet_num, pipe_size;
> +static char *wrbuf;
> +static char *rdbuf;
> +static void check_peer_rw(void);
> +static void check_split(void);
> +static void check_discard(void);
> +
> +static void (*test_func[])(void) =3D {check_peer_rw, check_split,
> check_discard};
> +
> +static void check_peer_rw(void)
> +{
> +       int i, pid;
> +
> +       SAFE_PIPE2(fds, O_DIRECT | O_NONBLOCK);
> +
> +       pid =3D SAFE_FORK();
> +       if (!pid) {
> +               SAFE_CLOSE(fds[1]);
> +               memset(rdbuf, 0, pipe_size);
> +               TST_CHECKPOINT_WAIT(0);
> +               for (i =3D 0; i < packet_num; i++) {
> +                       TEST(SAFE_READ(0, fds[0], rdbuf, pipe_size));
> +                       if (TST_RET !=3D 1)
> +                               tst_res(TFAIL,
> +                                       "Each read(2) doesn't read a
> separate packet, return %ld", TST_RET);
> +               }
> +               tst_res(TPASS, "Each read(2) reads a separate packet");
> +                _exit(0);
> +       }
> +
> +       SAFE_CLOSE(fds[0]);
> +       for (i =3D 0; i < packet_num; i++)
> +               SAFE_WRITE(1, fds[1], "x", 1);
> +
>

I got a failure on the ppc64le platform(page size: 65536kB).

# ./pipe2_03
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
pipe_size =3D 1048576
PIPE_BUF =3D 4096
packet_num =3D 256
safe_macros.c:457: BROK: pipe2_03.c:58:
write(4,0x1001d2b8,18446744073709551615) failed: EAGAIN/EWOULDBLOCK (11)
--=20
Regards,
Li Wang

--0000000000002d00c005a3f0c323
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Apr 22, 2020 at 6:47 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed=
-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=
=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0testcases/kernel/syscalls/pipe2/.gitignore |=C2=A0 =C2=A01 +<br>
=C2=A0testcases/kernel/syscalls/pipe2/pipe2_03.c | 172 ++++++++++++++++++++=
+<br>
=C2=A03 files changed, 174 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c<br>
<br>
diff --git a/runtest/syscalls b/runtest/syscalls<br>
index 9bb72beb2..16add02d3 100644<br>
--- a/runtest/syscalls<br>
+++ b/runtest/syscalls<br>
@@ -916,6 +916,7 @@ pipe13 pipe13<br>
<br>
=C2=A0pipe2_01 pipe2_01<br>
=C2=A0pipe2_02 pipe2_02<br>
+pipe2_03 pipe2_03<br>
=C2=A0pipe2_04 pipe2_04<br>
<br>
=C2=A0pivot_root01 pivot_root01<br>
diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/=
syscalls/pipe2/.gitignore<br>
index 773450a48..ede1da65e 100644<br>
--- a/testcases/kernel/syscalls/pipe2/.gitignore<br>
+++ b/testcases/kernel/syscalls/pipe2/.gitignore<br>
@@ -1,3 +1,4 @@<br>
=C2=A0/pipe2_01<br>
=C2=A0/pipe2_02<br>
+/pipe2_03<br>
=C2=A0/pipe2_04<br>
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_03.c b/testcases/kernel/=
syscalls/pipe2/pipe2_03.c<br>
new file mode 100644<br>
index 000000000..0314f9eda<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c<br>
@@ -0,0 +1,172 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.<br>
+ * Author: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" tar=
get=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
+ *<br>
+ * This case is designed to test the basic functionality about the<br>
+ * O_DIRECT flag of pipe2.<br>
+ *<br>
+ * It includes three sub tests.<br>
+ * 1) Each write(2) to the pipe is dealt with as a separate packet, and<br=
>
+ * read(2)s from the pipe will read one packet at a time.<br>
+ * 2) Writes of greater than PIPE_BUF bytes (see pipe(7)) will be split<br=
>
+ * into multiple packet.<br>
+ * 3)If a read(2) specifies a buffer size that is smaller than the next<br=
>
+ * packet, then the requested number of bytes are read, and the excess<br>
+ * bytes in the packet are discarded.<br>
+ */<br>
+#define _GNU_SOURCE<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;unistd.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;linux/limits.h&gt;<br>
+#include &quot;lapi/fcntl.h&quot;<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+static int fds[2], packet_num, pipe_size;<br>
+static char *wrbuf;<br>
+static char *rdbuf;<br>
+static void check_peer_rw(void);<br>
+static void check_split(void);<br>
+static void check_discard(void);<br>
+<br>
+static void (*test_func[])(void) =3D {check_peer_rw, check_split, check_di=
scard};<br>
+<br>
+static void check_peer_rw(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, pid;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PIPE2(fds, O_DIRECT | O_NONBLOCK);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[1]);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(rdbuf, 0, pi=
pe_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAIT=
(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; packet_num; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TEST(SAFE_READ(0, fds[0], rdbuf, pipe_size));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (TST_RET !=3D 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Eac=
h read(2) doesn&#39;t read a separate packet, return %ld&quot;, TST_RET);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;Each read(2) reads a separate packet&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; packet_num; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fds[1=
], &quot;x&quot;, 1);<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">I got a failure on the ppc64le platform(page size: 65536k=
B).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>#=
 ./pipe2_03 <br>tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s<br>pip=
e_size =3D 1048576<br>PIPE_BUF =3D 4096<br>packet_num =3D 256<br>safe_macro=
s.c:457: BROK: pipe2_03.c:58: write(4,0x1001d2b8,18446744073709551615) fail=
ed: EAGAIN/EWOULDBLOCK (11)<br><div class=3D"gmail_default" style=3D"font-s=
ize:small"></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></d=
iv></div>

--0000000000002d00c005a3f0c323--


--===============1659544389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1659544389==--

