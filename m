Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D887A15FCF
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 10:52:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB3DA3EA448
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 10:52:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2A5913EA367
 for <ltp@lists.linux.it>; Tue,  7 May 2019 10:52:16 +0200 (CEST)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B299F1A00362
 for <ltp@lists.linux.it>; Tue,  7 May 2019 10:52:14 +0200 (CEST)
Received: by mail-ua1-f67.google.com with SMTP id f9so5724236ual.1
 for <ltp@lists.linux.it>; Tue, 07 May 2019 01:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UyfNzTK6JFx4NkHY2Z+h0djzzz5mj4KhGFLK705hU4=;
 b=J4T5oO48RarewB3fFYGNhk3m8d+o6j+7Gh1qsq04zzGoP7L8ReehNivjd8uXaRBm/Z
 MmSNmmWXI5oJNulce5q4PfTlCaIMYBEHMSqwvL0jOn3yG0UiRYPiwSN7Ptc1/0vvAQ6S
 FCgnBgstnj3TtUGckxNOYh8YzgffywUTnq89wq17YocYNHnlBdyMojKXc1Mks+JFsdqx
 vZt+5XQkXXRZaXI7bAjAF+72exgdiYIhlNzDJ5MaS4w0RLIgs0uWgWgKXHSu8bGWd7eB
 oTfk4yFg99ud3CsJVQVj/kqoZV1gql3aglYntPPby2Ixja+IVB04Thp/YSBtgNehbxtB
 TZLg==
X-Gm-Message-State: APjAAAUvNiBWy3UBLQKE2T8RltoS5HLglvtAXryNZbKdUTUgWhtMZd8p
 k5aqQjoBIpsb2TZriUVXd2UfwzH0MHQohcp+RNp5UGaRytfYCw==
X-Google-Smtp-Source: APXvYqxn5qxnh7vf/2nH22GBOkA5oxOl0IZHnInUB5icuCh8HUz6l398kLVZe8dsTJwystTxNeuELoQ4Z7gNvMWGBKI=
X-Received: by 2002:ab0:2b19:: with SMTP id e25mr15911428uar.68.1557219133538; 
 Tue, 07 May 2019 01:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190430152949.17723-1-xzhou@redhat.com>
 <20190430235915.19512-1-xzhou@redhat.com>
In-Reply-To: <20190430235915.19512-1-xzhou@redhat.com>
From: Li Wang <liwan@redhat.com>
Date: Tue, 7 May 2019 16:52:01 +0800
Message-ID: <CAEemH2f3Dq9tpoD8Cq+vJ5SYoaOfVQdP3FQU-6op52U+1p=Yeg@mail.gmail.com>
To: Murphy Zhou <xzhou@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/swap{on,
	off}: skip if FIBMAP ioctl trial fails
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
Content-Type: multipart/mixed; boundary="===============0671770446=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0671770446==
Content-Type: multipart/alternative; boundary="0000000000004aedaf05884855ec"

--0000000000004aedaf05884855ec
Content-Type: text/plain; charset="UTF-8"

Hi Murphy,

On Wed, May 1, 2019 at 7:59 AM Murphy Zhou <xzhou@redhat.com> wrote:

> That means swapfile in the test filesystem is not supported.
> Add a test helper to do a FIBMAP ioctl test. Remove old fs type whitelist
> code.
>
> Signed-off-by: Murphy Zhou <xzhou@redhat.com>
> ---
> v2:
>    Test FIBMAP instead of fstype whitelist.
> v3:
>    Fix fs_type undeclared in swapoff01.c.
>
>  include/tst_fs.h                              |  5 +++
>  lib/tst_ioctl.c                               | 41 +++++++++++++++++++
>  testcases/kernel/syscalls/swapoff/swapoff01.c | 13 ++----
>  testcases/kernel/syscalls/swapoff/swapoff02.c | 11 +++--
>  testcases/kernel/syscalls/swapon/swapon01.c   | 13 ++----
>  testcases/kernel/syscalls/swapon/swapon02.c   | 16 ++------
>  testcases/kernel/syscalls/swapon/swapon03.c   | 20 ++-------
>  7 files changed, 65 insertions(+), 54 deletions(-)
>  create mode 100644 lib/tst_ioctl.c
>
> diff --git a/include/tst_fs.h b/include/tst_fs.h
> index b2b19ada6..cc38b3547 100644
> --- a/include/tst_fs.h
> +++ b/include/tst_fs.h
> @@ -172,6 +172,11 @@ const char **tst_get_supported_fs_types(void);
>   */
>  void tst_fill_fs(const char *path, int verbose);
>
> +/*
> + * test if FIBMAP ioctl is supported
> + */
> +int tst_fibmap(void);
> +
>  #ifdef TST_TEST_H__
>  static inline long tst_fs_type(const char *path)
>  {
> diff --git a/lib/tst_ioctl.c b/lib/tst_ioctl.c
> new file mode 100644
> index 000000000..d468d5898
> --- /dev/null
> +++ b/lib/tst_ioctl.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/ioctl.h>
> +#include <linux/fs.h>
> +
> +#define TST_NO_DEFAULT_MAIN
> +
> +#include "tst_test.h"
> +
> +int tst_fibmap(void)
> +{
> +       /* test if FIBMAP ioctl is supported */
> +       int fd, block = 0;
> +       const char *tmpdir = getenv("TMPDIR");
> +       char buf[128];
> +
> +       tst_res(TINFO, "Testing if FIBMAP ioctl is supported in %s",
> tmpdir);
> +
> +       sprintf(buf, "%s/tst_fibmap", tmpdir);
> +
> +       fd = open(buf, O_RDWR | O_CREAT, 0666);
> +       if (fd < 0) {
> +               tst_res(TWARN | TERRNO,
> +                        "open(%s, O_RDWR | O_CREAT, 0666) failed", buf);
> +               return 1;
> +       }
> +
> +       if (ioctl(fd, FIBMAP, &block)) {
> +               close(fd);
> +               return 1;
> +       }
> +
> +       if (close(fd)) {
> +               tst_res(TWARN | TERRNO, "close(fd) failed");
> +               return 1;
> +       }
> +       return 0;
> +}
> diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c
> b/testcases/kernel/syscalls/swapoff/swapoff01.c
> index a63e661a5..a37cd9be1 100644
> --- a/testcases/kernel/syscalls/swapoff/swapoff01.c
> +++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
> @@ -55,11 +55,6 @@ int main(int ac, char **av)
>  static void verify_swapoff(void)
>  {
>         if (ltp_syscall(__NR_swapon, "./swapfile01", 0) != 0) {
> -               if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
> -                       tst_brkm(TCONF, cleanup,
> -                                "Swapfiles on BTRFS are not implemented");
> -               }
> -
>                 tst_resm(TBROK, "Failed to turn on the swap file"
>                          ", skipping test iteration");
>                 return;
> @@ -86,13 +81,11 @@ static void setup(void)
>
>         tst_tmpdir();
>
> -       switch ((fs_type = tst_fs_type(cleanup, "."))) {
> -       case TST_NFS_MAGIC:
> -       case TST_TMPFS_MAGIC:
> +       fs_type = tst_fs_type(cleanup, ".");
> +       if (tst_fibmap()) {
>                 tst_brkm(TCONF, cleanup,
> -                        "Cannot do swapoff on a file on %s filesystem",
> +                        "Cannot do FIBMAP ioctl on a file on %s
> filesystem",
>                          tst_fs_type_name(fs_type));
> -       break;
>         }
>
>         if (!tst_fs_has_free(NULL, ".", 64, TST_MB)) {
> diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c
> b/testcases/kernel/syscalls/swapoff/swapoff02.c
> index b5c6312a1..889f3c800 100644
> --- a/testcases/kernel/syscalls/swapoff/swapoff02.c
> +++ b/testcases/kernel/syscalls/swapoff/swapoff02.c
> @@ -43,6 +43,7 @@ char *TCID = "swapoff02";
>  int TST_TOTAL = 3;
>
>  static uid_t nobody_uid;
> +static long fs_type;
>
>  static struct test_case_t {
>         char *err_desc;
> @@ -138,13 +139,11 @@ static void setup(void)
>
>         tst_tmpdir();
>
> -       switch ((type = tst_fs_type(cleanup, "."))) {
> -       case TST_NFS_MAGIC:
> -       case TST_TMPFS_MAGIC:
> +       fs_type = tst_fs_type(cleanup, ".");
> +       if (tst_fibmap()) {
>                 tst_brkm(TCONF, cleanup,
> -                        "Cannot do swapoff on a file on %s filesystem",
> -                        tst_fs_type_name(type));
> -       break;
> +                        "Cannot do FIBMAP ioctl on a file on %s
> filesystem",
> +                        tst_fs_type_name(fs_type));
>         }
>
>         if (!tst_fs_has_free(NULL, ".", 1, TST_KB)) {
> diff --git a/testcases/kernel/syscalls/swapon/swapon01.c
> b/testcases/kernel/syscalls/swapon/swapon01.c
> index 32538f82b..0a5a3de86 100644
> --- a/testcases/kernel/syscalls/swapon/swapon01.c
> +++ b/testcases/kernel/syscalls/swapon/swapon01.c
> @@ -39,11 +39,6 @@ static void verify_swapon(void)
>         TEST(ltp_syscall(__NR_swapon, "./swapfile01", 0));
>
>         if (TEST_RETURN == -1) {
> -               if (fs_type == TST_BTRFS_MAGIC && errno == EINVAL) {
> -                       tst_brkm(TCONF, cleanup,
> -                                "Swapfile on BTRFS not implemeted");
> -                       return;
> -               }
>                 tst_resm(TFAIL | TTERRNO, "Failed to turn on swapfile");
>         } else {
>                 tst_resm(TPASS, "Succeeded to turn on swapfile");
> @@ -84,13 +79,11 @@ static void setup(void)
>
>         tst_tmpdir();
>
> -       switch ((fs_type = tst_fs_type(cleanup, "."))) {
> -       case TST_NFS_MAGIC:
> -       case TST_TMPFS_MAGIC:
> +       fs_type = tst_fs_type(cleanup, ".");
> +       if (tst_fibmap()) {
>

I'm not sure whether FIBMAP ioctl FAIL means that swapfile is unsupportted
on a filesystem.
If that's true, shouldn't we verify FIBMAP ioctl on the swapfile?  Here you
just test that in a tmp file, it probably not a correct way I guess.

IMO, maybe we can define the function API as:
    tst_fibmap(const char *filename);
And calling it in behind of make_swapfile(cleanup, "swapfile01");

Beside that, there is another issue in this patch, since the
getenv("TMPDIR"); depend on runltp script, so we cann't run the test
independently.

# ./swapon01
tst_ioctl.c:20: INFO: Testing if FIBMAP ioctl is supported in (null)
tst_ioctl.c:27: WARN: open((null)/tst_fibmap, O_RDWR | O_CREAT, 0666)
failed: ENOENT
swapon01    1  TCONF  :  swapon01.c:86: Cannot do FIBMAP ioctl on a file on
XFS filesystem
swapon01    2  TCONF  :  swapon01.c:86: Remaining cases not appropriate for
configuration

-- 
Regards,
Li Wang

--0000000000004aedaf05884855ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi Murphy,=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, May 1, 2019 at 7:59 AM Murphy Zhou &lt;<a href=3D"mailto:xzho=
u@redhat.com">xzhou@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">That means swapfile in the test filesystem is=
 not supported.<br>
Add a test helper to do a FIBMAP ioctl test. Remove old fs type whitelist c=
ode.<br>
<br>
Signed-off-by: Murphy Zhou &lt;<a href=3D"mailto:xzhou@redhat.com" target=
=3D"_blank">xzhou@redhat.com</a>&gt;<br>
---<br>
v2:<br>
=C2=A0 =C2=A0Test FIBMAP instead of fstype whitelist.<br>
v3:<br>
=C2=A0 =C2=A0Fix fs_type undeclared in swapoff01.c.<br>
<br>
=C2=A0include/tst_fs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++<br>
=C2=A0lib/tst_ioctl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 41 +++++++++++=
++++++++<br>
=C2=A0testcases/kernel/syscalls/swapoff/swapoff01.c | 13 ++----<br>
=C2=A0testcases/kernel/syscalls/swapoff/swapoff02.c | 11 +++--<br>
=C2=A0testcases/kernel/syscalls/swapon/swapon01.c=C2=A0 =C2=A0| 13 ++----<b=
r>
=C2=A0testcases/kernel/syscalls/swapon/swapon02.c=C2=A0 =C2=A0| 16 ++------=
<br>
=C2=A0testcases/kernel/syscalls/swapon/swapon03.c=C2=A0 =C2=A0| 20 ++------=
-<br>
=C2=A07 files changed, 65 insertions(+), 54 deletions(-)<br>
=C2=A0create mode 100644 lib/tst_ioctl.c<br>
<br>
diff --git a/include/tst_fs.h b/include/tst_fs.h<br>
index b2b19ada6..cc38b3547 100644<br>
--- a/include/tst_fs.h<br>
+++ b/include/tst_fs.h<br>
@@ -172,6 +172,11 @@ const char **tst_get_supported_fs_types(void);<br>
=C2=A0 */<br>
=C2=A0void tst_fill_fs(const char *path, int verbose);<br>
<br>
+/*<br>
+ * test if FIBMAP ioctl is supported<br>
+ */<br>
+int tst_fibmap(void);<br>
+<br>
=C2=A0#ifdef TST_TEST_H__<br>
=C2=A0static inline long tst_fs_type(const char *path)<br>
=C2=A0{<br>
diff --git a/lib/tst_ioctl.c b/lib/tst_ioctl.c<br>
new file mode 100644<br>
index 000000000..d468d5898<br>
--- /dev/null<br>
+++ b/lib/tst_ioctl.c<br>
@@ -0,0 +1,41 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+<br>
+#include &lt;errno.h&gt;<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;sys/ioctl.h&gt;<br>
+#include &lt;linux/fs.h&gt;<br>
+<br>
+#define TST_NO_DEFAULT_MAIN<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+int tst_fibmap(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* test if FIBMAP ioctl is supported */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, block =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *tmpdir =3D getenv(&quot;TMPDIR&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[128];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TINFO, &quot;Testing if FIBMAP ioctl is=
 supported in %s&quot;, tmpdir);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(buf, &quot;%s/tst_fibmap&quot;, tmpdir)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D open(buf, O_RDWR | O_CREAT, 0666);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TER=
RNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;open(%s, O_RDWR | O_CREAT, 0666) failed&quot;, buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ioctl(fd, FIBMAP, &amp;block)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (close(fd)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TWARN | TER=
RNO, &quot;close(fd) failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kern=
el/syscalls/swapoff/swapoff01.c<br>
index a63e661a5..a37cd9be1 100644<br>
--- a/testcases/kernel/syscalls/swapoff/swapoff01.c<br>
+++ b/testcases/kernel/syscalls/swapoff/swapoff01.c<br>
@@ -55,11 +55,6 @@ int main(int ac, char **av)<br>
=C2=A0static void verify_swapoff(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ltp_syscall(__NR_swapon, &quot;./swapfile01=
&quot;, 0) !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fs_type =3D=3D =
TST_BTRFS_MAGIC &amp;&amp; errno =3D=3D EINVAL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TCONF, cleanup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Swapfiles on BTRFS are not imp=
lemented&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TBROK, &qu=
ot;Failed to turn on the swap file&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;, skipping test iteration&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
@@ -86,13 +81,11 @@ static void setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_tmpdir();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((fs_type =3D tst_fs_type(cleanup, &quot=
;.&quot;))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_NFS_MAGIC:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_TMPFS_MAGIC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fs_type =3D tst_fs_type(cleanup, &quot;.&quot;)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_fibmap()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TCONF, cle=
anup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Cannot do swapoff on a file on %s filesystem&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Cannot do FIBMAP ioctl on a file on %s filesystem&quot;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tst_fs_type_name(fs_type));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_fs_has_free(NULL, &quot;.&quot;, 64, T=
ST_MB)) {<br>
diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c b/testcases/kern=
el/syscalls/swapoff/swapoff02.c<br>
index b5c6312a1..889f3c800 100644<br>
--- a/testcases/kernel/syscalls/swapoff/swapoff02.c<br>
+++ b/testcases/kernel/syscalls/swapoff/swapoff02.c<br>
@@ -43,6 +43,7 @@ char *TCID =3D &quot;swapoff02&quot;;<br>
=C2=A0int TST_TOTAL =3D 3;<br>
<br>
=C2=A0static uid_t nobody_uid;<br>
+static long fs_type;<br>
<br>
=C2=A0static struct test_case_t {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *err_desc;<br>
@@ -138,13 +139,11 @@ static void setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_tmpdir();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((type =3D tst_fs_type(cleanup, &quot;.&=
quot;))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_NFS_MAGIC:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_TMPFS_MAGIC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fs_type =3D tst_fs_type(cleanup, &quot;.&quot;)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_fibmap()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TCONF, cle=
anup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Cannot do swapoff on a file on %s filesystem&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_fs_type_name(type));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Cannot do FIBMAP ioctl on a file on %s filesystem&quot;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tst_fs_type_name(fs_type));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_fs_has_free(NULL, &quot;.&quot;, 1, TS=
T_KB)) {<br>
diff --git a/testcases/kernel/syscalls/swapon/swapon01.c b/testcases/kernel=
/syscalls/swapon/swapon01.c<br>
index 32538f82b..0a5a3de86 100644<br>
--- a/testcases/kernel/syscalls/swapon/swapon01.c<br>
+++ b/testcases/kernel/syscalls/swapon/swapon01.c<br>
@@ -39,11 +39,6 @@ static void verify_swapon(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(ltp_syscall(__NR_swapon, &quot;./swapfile0=
1&quot;, 0));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (TEST_RETURN =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fs_type =3D=3D =
TST_BTRFS_MAGIC &amp;&amp; errno =3D=3D EINVAL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TCONF, cleanup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Swapfile on BTRFS not implemet=
ed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL | TT=
ERRNO, &quot;Failed to turn on swapfile&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TPASS, &qu=
ot;Succeeded to turn on swapfile&quot;);<br>
@@ -84,13 +79,11 @@ static void setup(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_tmpdir();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch ((fs_type =3D tst_fs_type(cleanup, &quot=
;.&quot;))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_NFS_MAGIC:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case TST_TMPFS_MAGIC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fs_type =3D tst_fs_type(cleanup, &quot;.&quot;)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_fibmap()) {<br></blockquote><div><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m not sure=
 whether FIBMAP ioctl FAIL means that swapfile is unsupportted on a filesys=
tem.</div><div class=3D"gmail_default" style=3D"font-size:small">If that&#3=
9;s true, shouldn&#39;t we verify FIBMAP ioctl on the swapfile?=C2=A0 Here =
you just test that in a tmp file, it probably not a correct way I guess.</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">IMO, maybe we can define th=
e function API as:</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">=C2=A0 =C2=A0 tst_fibmap(const char *filename);</div><div class=3D"gmai=
l_default" style=3D"font-size:small">And calling it in behind of=C2=A0<span=
 class=3D"gmail_default"></span>make_swapfile(cleanup, &quot;swapfile01&quo=
t;);</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Beside that, there i=
s another issue in this patch, since the getenv(&quot;TMPDIR&quot;); depend=
 on runltp script, so we cann&#39;t run the test independently.=C2=A0</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small"><div class=3D"gmail_default">#=
 ./swapon01=C2=A0</div><div class=3D"gmail_default">tst_ioctl.c:20: INFO: T=
esting if FIBMAP ioctl is supported in (null)</div><div class=3D"gmail_defa=
ult">tst_ioctl.c:27: WARN: open((null)/tst_fibmap, O_RDWR | O_CREAT, 0666) =
failed: ENOENT</div><div class=3D"gmail_default">swapon01=C2=A0 =C2=A0 1=C2=
=A0 TCONF=C2=A0 :=C2=A0 swapon01.c:86: Cannot do FIBMAP ioctl on a file on =
XFS filesystem</div><div class=3D"gmail_default">swapon01=C2=A0 =C2=A0 2=C2=
=A0 TCONF=C2=A0 :=C2=A0 swapon01.c:86: Remaining cases not appropriate for =
configuration</div><div><br></div></div></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Regards,<br>Li =
Wang<br></div></div></div></div></div></div></div></div>

--0000000000004aedaf05884855ec--

--===============0671770446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0671770446==--
