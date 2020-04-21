Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6021B234D
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:53:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B09D3C29B8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 11:53:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8592A3C29A1
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:53:51 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 656DF10005C0
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 11:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587462828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hxgDIy61mERnPVNwBOBGXbeYM/wMe8xuDGYpLh4WwIg=;
 b=dDSXjRqYNhAaZu1/knjPvwlyRQoNQt2Qd+isTK00o4HKZga6+0YhQdK+4/qc78n8cvAi/Q
 O2779g+wPI5eTDW/IPFX2u9i1iv70TevaLzzr91d6AlDOqa0n5lM0nhnqPVZ5WCxglFSXh
 AZF32JVjNvMVwmjekZgswfjhNNVCsZM=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-xr_YFGCFPMq5nJcokOesNQ-1; Tue, 21 Apr 2020 05:53:42 -0400
X-MC-Unique: xr_YFGCFPMq5nJcokOesNQ-1
Received: by mail-lj1-f198.google.com with SMTP id b26so1978990ljp.0
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 02:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9ZR/4R/cCyt4H7CC90EVbaa3pYnXcAyWHw/dJpgZ+8=;
 b=hpQinM9EWqEccPcMXDktnmFLxbF9wYOJrvTPaDj85tuZplHAzvsR8allqlR8J/PUrd
 7yRuVdqhylmVFdylsiMYfz7wCp9woNzXLnNlWvY/Bv0zv2KmIQZtOXg44hX8NEJ5um/6
 Ezy9nEsKw7OHUD9yvqRIpW60DSbraYknt3SWgSyOjCrfA2iTeO6EqOCrTFbjaliXarCu
 0WSAiEjOMLv4ShlxgwH2qjXqEJrWaa3wfftVwkOhPe2L87T2BuKcU5fR2fVUSFnzIkWB
 ErbN2bItc27QPEYuPADpYH4L6nt+8XaE75UbD0QgERRIS8lSHZG4Z9+eaHPrG+GXUpcF
 MzXw==
X-Gm-Message-State: AGi0PuabW8sPYuPpTOc7QmrODlyZcj5UJc42jrhwlrEic2bWgSZx06qR
 x+KmgEyIdNZAQ/BovNTJFfmDld3TXpaQM4P36pc1/+nbk6EK4yB8JXpXhTdHCzS5lvp1xtDgNQr
 WwzIDZxf+jOiKRJ+KIv+GRSJHIxw=
X-Received: by 2002:ac2:4551:: with SMTP id j17mr13214755lfm.147.1587462821086; 
 Tue, 21 Apr 2020 02:53:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypI9y4sgZBbBbAC4OWoPwTHcTOlyD8Y8zeF0hJHFtcz84prrqTOJLgt4otnqBvxG0WSetKDH8PHmi5BvcsDfCPk=
X-Received: by 2002:ac2:4551:: with SMTP id j17mr13214743lfm.147.1587462820847; 
 Tue, 21 Apr 2020 02:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1587022142-32122-4-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 21 Apr 2020 17:53:29 +0800
Message-ID: <CAEemH2eeUa0XJSGeyid2J373FnvqSAQCjdO1AkbpHGTFisGGNA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/pipe2_03: Add new test for pipe2
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
Content-Type: multipart/mixed; boundary="===============0946420079=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0946420079==
Content-Type: multipart/alternative; boundary="00000000000088138c05a3c9fdf2"

--00000000000088138c05a3c9fdf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 3:29 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  runtest/syscalls                           |   1 +
>  testcases/kernel/syscalls/pipe2/.gitignore |   1 +
>  testcases/kernel/syscalls/pipe2/pipe2_03.c | 157 +++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 44254d7da..4d8ebc5a3 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -912,6 +912,7 @@ pipe13 pipe13
>
>  pipe2_01 pipe2_01
>  pipe2_02 pipe2_02
> +pipe2_03 pipe2_03
>
>  pivot_root01 pivot_root01
>
> diff --git a/testcases/kernel/syscalls/pipe2/.gitignore
> b/testcases/kernel/syscalls/pipe2/.gitignore
> index 786222de2..4cc5acaf1 100644
> --- a/testcases/kernel/syscalls/pipe2/.gitignore
> +++ b/testcases/kernel/syscalls/pipe2/.gitignore
> @@ -1,3 +1,4 @@
>  /pipe2_01
>  /pipe2_02
>  /pipe2_02_child
> +/pipe2_03
> diff --git a/testcases/kernel/syscalls/pipe2/pipe2_03.c
> b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> new file mode 100644
> index 000000000..0b5d37dd0
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c
> @@ -0,0 +1,157 @@
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
> +       for (i =3D 0; i < packet_num; i++)
> +               SAFE_WRITE(1, fds[1], "x", 1);
> +
> +       TEST(write(fds[1], "x", 1));
> +       if (TST_RET !=3D -1) {
> +               tst_res(TFAIL, "write succeeded unexpectedly");
> +       } else {
> +               if (TST_ERR =3D=3D EAGAIN)
> +                       tst_res(TPASS, "Each write(2) uses a separate
> packet");
> +               else
> +                       tst_res(TFAIL | TTERRNO, "write failed, expected
> EAGAIN but got");
> +       }
> +       pid =3D SAFE_FORK();
> +       if (!pid) {
> +               memset(rdbuf, 0, pipe_size);
> +               for (i =3D 0; i < packet_num; i++) {
> +                       TEST(SAFE_READ(0, fds[0], rdbuf, pipe_size));
> +                       if (TST_RET !=3D 1)
> +                               tst_res(TFAIL,
> +                                       "Each read(2) doesn't read a
> separate packet, return %ld", TST_RET);
> +               }
> +               tst_res(TPASS, "Each read(2) reads a separate packet");
>

I would add _exit(0); at the end of the child.
+               _exit(0);

+       }
>

And move the tst_reap_children() from the main process to here.

+       tst_reap_children();
+       SAFE_CLOSE(fds[0]);
+       SAFE_CLOSE(fds[1]);



> +}
> +
> +static void check_split(void)
> +{
> +       int i, pid;
> +
> +       SAFE_PIPE2(fds, O_DIRECT);
> +       SAFE_WRITE(1, fds[1], wrbuf, PIPE_BUF * 2);
> +
> +       pid =3D SAFE_FORK();
> +       if (!pid) {
> +               memset(rdbuf, 0, pipe_size);
> +               for (i =3D 0; i < 2; i++) {
> +                       TEST(SAFE_READ(0, fds[0], rdbuf, pipe_size));
> +                       if (TST_RET !=3D PIPE_BUF)
> +                               tst_res(TFAIL,
> +                                       "write(higner than PIPE_BUF) spli=
t
> into multiple packet, return %ld", TST_RET);
> +               }
> +               tst_res(TPASS, "write(higner than PIPE_BUF) split into
> multiple packet");
>

+               _exit(0);

+       }
>

+       tst_reap_children();
+       SAFE_CLOSE(fds[0]);
+       SAFE_CLOSE(fds[1]);


> +}
> +
> +static void check_discard(void)
> +{
> +       int pid;
> +       char tmp_buf[20];
> +       char tmp_secondbuf[20];
> +
> +       SAFE_PIPE2(fds, O_DIRECT);
> +       SAFE_WRITE(1, fds[1], wrbuf, PIPE_BUF);
> +       SAFE_WRITE(1, fds[1], "1", 1);
> +
> +       pid =3D SAFE_FORK();
> +       if (!pid) {
> +               TEST(SAFE_READ(0, fds[0], tmp_buf, 20));
> +               if (TST_RET !=3D 20)
> +                       tst_res(TFAIL,
> +                               "the excess bytes in the packet isn't
> discarded by read, return %ld", TST_RET);
> +               TEST(SAFE_READ(0, fds[0], tmp_secondbuf, 20));
> +               if (TST_RET =3D=3D 1) {
> +                       if (!strcmp(tmp_secondbuf, "1"))
> +                               tst_res(TPASS,
> +                                       "the excess bytes in the packet i=
s
> discarded by read, only read 1");
> +                       else
> +                               tst_res(TFAIL,
> +                                       "the excess bytes in the packet i=
s
> discarded by read, expect 1 got %s", tmp_secondbuf);
> +               }
>

+               _exit(0);


> +       }
>

+       tst_reap_children();
+       SAFE_CLOSE(fds[0]);
+       SAFE_CLOSE(fds[1]);

+}
> +
> +static void verify_pipe2(unsigned int n)
> +{
> +       int pid;
> +
> +       pid =3D SAFE_FORK();
>

Why we need fork() here? I don't see any necessary reason for twice fork in
the main process.



> +       if (pid =3D=3D 0) {
> +               (*test_func[n])();
>


> +               tst_reap_children();
> +               SAFE_CLOSE(fds[0]);
> +               SAFE_CLOSE(fds[1]);
>

I tend to move the cloese(fd) to the test process to nearby pipe2().
Otherwise, it causes an unclear error like:

# ./pipe2_03
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
pipe2_03.c:48: PASS: Each write(2) uses a separate packet
pipe2_03.c:61: PASS: Each read(2) reads a separate packet
pipe2_03.c:81: PASS: write(higner than PIPE_BUF) split into multiple packet
pipe2_03.c:108: FAIL: the excess bytes in the packet is discarded by read,
expect 1 got 1%A



> +       }
> +       tst_reap_children();
> +}
> +
> +static void setup(void)
> +{
> +       SAFE_PIPE2(fds, O_DIRECT);
> +       pipe_size =3D SAFE_FCNTL(fds[1], F_GETPIPE_SZ);
> +       wrbuf =3D SAFE_MALLOC(PIPE_BUF * 2);
> +       rdbuf =3D SAFE_MALLOC(pipe_size);
> +       memset(wrbuf, 'x', PIPE_BUF * 2);
> +       packet_num =3D pipe_size / PIPE_BUF;
> +       SAFE_CLOSE(fds[0]);
> +       SAFE_CLOSE(fds[1]);
> +}
> +
> +static void cleanup(void)
> +{
> +       if (fds[0] > 0)
> +               SAFE_CLOSE(fds[0]);
> +       if (fds[1] > 0)
> +               SAFE_CLOSE(fds[1]);
> +       if (wrbuf)
> +               free(wrbuf);
> +       if (rdbuf)
> +               free(rdbuf);
> +}
> +
> +static struct tst_test test =3D {
> +       .setup =3D setup,
> +       .cleanup =3D cleanup,
> +       .forks_child =3D 1,
> +       .test =3D verify_pipe2,
> +       .tcnt =3D ARRAY_SIZE(test_func),
> +};
> --
> 2.23.0
>
>
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--00000000000088138c05a3c9fdf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Apr 16, 2020 at 3:29 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed=
-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=
=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0testcases/kernel/syscalls/pipe2/.gitignore |=C2=A0 =C2=A01 +<br>
=C2=A0testcases/kernel/syscalls/pipe2/pipe2_03.c | 157 ++++++++++++++++++++=
+<br>
=C2=A03 files changed, 159 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/pipe2/pipe2_03.c<br>
<br>
diff --git a/runtest/syscalls b/runtest/syscalls<br>
index 44254d7da..4d8ebc5a3 100644<br>
--- a/runtest/syscalls<br>
+++ b/runtest/syscalls<br>
@@ -912,6 +912,7 @@ pipe13 pipe13<br>
<br>
=C2=A0pipe2_01 pipe2_01<br>
=C2=A0pipe2_02 pipe2_02<br>
+pipe2_03 pipe2_03<br>
<br>
=C2=A0pivot_root01 pivot_root01<br>
<br>
diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/=
syscalls/pipe2/.gitignore<br>
index 786222de2..4cc5acaf1 100644<br>
--- a/testcases/kernel/syscalls/pipe2/.gitignore<br>
+++ b/testcases/kernel/syscalls/pipe2/.gitignore<br>
@@ -1,3 +1,4 @@<br>
=C2=A0/pipe2_01<br>
=C2=A0/pipe2_02<br>
=C2=A0/pipe2_02_child<br>
+/pipe2_03<br>
diff --git a/testcases/kernel/syscalls/pipe2/pipe2_03.c b/testcases/kernel/=
syscalls/pipe2/pipe2_03.c<br>
new file mode 100644<br>
index 000000000..0b5d37dd0<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/pipe2/pipe2_03.c<br>
@@ -0,0 +1,157 @@<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; packet_num; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fds[1=
], &quot;x&quot;, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(write(fds[1], &quot;x&quot;, 1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;write succeeded unexpectedly&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_ERR =3D=3D =
EAGAIN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TPASS, &quot;Each write(2) uses a separate packet&quot;);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL | TTERRNO, &quot;write failed, expected EAGAIN but =
got&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(rdbuf, 0, pi=
pe_size);<br>
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
t;Each read(2) reads a separate packet&quot;);<br></blockquote><div><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">I would add _exit=
(0); at the end of the child.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(0);=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div><div clas=
s=3D"gmail_default" style=3D"font-size:small">And move the tst_reap_childre=
n() from the main process to here.</div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">+ =C2=A0 =C2=A0 =C2=A0 tst_reap_children=
();<br>+ =C2=A0 =C2=A0 =C2=A0 SAFE_CLOSE(fds[0]);<br>+ =C2=A0 =C2=A0 =C2=A0=
 SAFE_CLOSE(fds[1]);<br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+}<br>
+<br>
+static void check_split(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, pid;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PIPE2(fds, O_DIRECT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fds[1], wrbuf, PIPE_BUF * 2);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(rdbuf, 0, pi=
pe_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; 2; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TEST(SAFE_READ(0, fds[0], rdbuf, pipe_size));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (TST_RET !=3D PIPE_BUF)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;wri=
te(higner than PIPE_BUF) split into multiple packet, return %ld&quot;, TST_=
RET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;write(higner than PIPE_BUF) split into multiple packet&quot;);<br></block=
quote><div>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-siz=
e:small"></span>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _exit(0)=
;<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div>=C2=A0</div><div><span c=
lass=3D"gmail_default" style=3D"font-size:small"></span>+ =C2=A0 =C2=A0 =C2=
=A0 tst_reap_children();</div>+ =C2=A0 =C2=A0 =C2=A0 SAFE_CLOSE(fds[0]);<br=
><div><span class=3D"gmail_default" style=3D"font-size:small">+ =C2=A0 =C2=
=A0 =C2=A0 SAFE_CLOSE(fds[1]);</span></div><div><span class=3D"gmail_defaul=
t" style=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
+}<br>
+<br>
+static void check_discard(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int pid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char tmp_buf[20];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char tmp_secondbuf[20];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PIPE2(fds, O_DIRECT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fds[1], wrbuf, PIPE_BUF);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_WRITE(1, fds[1], &quot;1&quot;, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!pid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(SAFE_READ(0, f=
ds[0], tmp_buf, 20));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D 20=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;the excess bytes in the packet =
isn&#39;t discarded by read, return %ld&quot;, TST_RET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(SAFE_READ(0, f=
ds[0], tmp_secondbuf, 20));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D =
1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!strcmp(tmp_secondbuf, &quot;1&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;the=
 excess bytes in the packet is discarded by read, only read 1&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;the=
 excess bytes in the packet is discarded by read, expect 1 got %s&quot;, tm=
p_secondbuf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><=
div>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small=
"></span><span class=3D"gmail_default"></span>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 _exit(0);</div><div><span class=3D"gmail_default"></s=
pan>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div>=C2=A0</div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><span class=3D"gmail_defaul=
t"></span>+ =C2=A0 =C2=A0 =C2=A0 tst_reap_children();</div>+ =C2=A0 =C2=A0 =
=C2=A0 SAFE_CLOSE(fds[0]);<br><div class=3D"gmail_default" style=3D"font-si=
ze:small">+ =C2=A0 =C2=A0 =C2=A0 SAFE_CLOSE(fds[1]);</div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+static void verify_pipe2(unsigned int n)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int pid;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D SAFE_FORK();<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Why we nee=
d fork() here? I don&#39;t see any necessary reason for twice fork in the m=
ain process.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(*test_func[n])();<=
br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_reap_children()=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[0]);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[1]);=
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I tend to move the cloese(fd) to the test process to nearb=
y=C2=A0pipe2(). Otherwise, it causes an unclear error like:</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small"># ./pipe2_03<br>tst_test.c:1246: INFO: T=
imeout per run is 0h 05m 00s<br>pipe2_03.c:48: PASS: Each write(2) uses a s=
eparate packet<br>pipe2_03.c:61: PASS: Each read(2) reads a separate packet=
<br>pipe2_03.c:81: PASS: write(higner than PIPE_BUF) split into multiple pa=
cket<br>pipe2_03.c:108: FAIL: the excess bytes in the packet is discarded b=
y read, expect 1 got 1%A<br></div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_reap_children();<br>
+}<br>
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PIPE2(fds, O_DIRECT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_size =3D SAFE_FCNTL(fds[1], F_GETPIPE_SZ);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wrbuf =3D SAFE_MALLOC(PIPE_BUF * 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rdbuf =3D SAFE_MALLOC(pipe_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(wrbuf, &#39;x&#39;, PIPE_BUF * 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0packet_num =3D pipe_size / PIPE_BUF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[1]);<br>
+}<br>
+<br>
+static void cleanup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fds[0] &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[0]);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fds[1] &gt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fds[1]);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (wrbuf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(wrbuf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rdbuf)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(rdbuf);<br>
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.forks_child =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test =3D verify_pipe2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tcnt =3D ARRAY_SIZE(test_func),<br>
+};<br>
-- <br>
2.23.0<br>
<br>
<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--00000000000088138c05a3c9fdf2--


--===============0946420079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0946420079==--

