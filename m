Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC9A16035C
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 11:11:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E0F53C246B
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 11:11:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EB2C53C1D32
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 11:11:57 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 670D3600955
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 11:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581847911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7TbEW5wEKOyLNCSAU9kBdl3M/fhewgXsNnRucV5Ggo=;
 b=A/fT5NA3Hot8Iyek8A6jYxNoKBD5dRue3VAxM2h2ps0Z0R7wxEluISMl9LgaQ1pzFfarQW
 RSM+nZQPZBkcl/CmY4GQrZqLuZj7o5VKxeGVhQ+27BNDOHVgsuaHsd/tZ+a9mbZzRT0DdF
 4OFxEnGjMkal22dURaZ0E2JjFIonPd4=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50--y9pU1D0OBqUf7wN5T6Atg-1; Sun, 16 Feb 2020 05:11:36 -0500
Received: by mail-oi1-f198.google.com with SMTP id m127so6742364oig.19
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 02:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QFU7xz1fkLAzHpHTC7ihSALlNs6RYWzPG0bt6k562os=;
 b=h81u5tjRXrWHE54ncr0uKftOegkpNrBFRmnB8FcWznR1yONbzNIB15OC4JYUXb3L4Z
 +SytgYH4YTqIx9a+KcSS6Kh3MkjYxeSwgun98bFJj02R5f1oCA9NzHZRGoCnEHMrnDod
 cBlBJK8WNu/p9OVENBmXOVnYrNPrIgffMPji32bxjMK8zyL6Y+39StzDnURHRYmynMY6
 wrnMEVHuEWvbVl2EKf/vLXxb/WzjCSXdL1kIl/6f/srnyPZ6IrQAKUAeFM0hhpsFYSVe
 7q/dqq3IoOSnJqhemkxZMgOfh6CFM7KDbBwunATH0X7+50YyPysOk/+ElJnBeXW9v1nc
 T4xA==
X-Gm-Message-State: APjAAAX66o4SJd4sShjk036VMHB7rlH6ULvrVo1sdggIqFpEMW/r2Pg+
 5Oa7eCktHXbpcdG90yJGnXF/yRnFWnlkgYCIX6mtfDnRbz94hsC9xXF5xNdWqLfhKkf1dustkGd
 6sBUn+3WLk7nu0c/BH7SLaKOtLE0=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr6700846oie.144.1581847895043; 
 Sun, 16 Feb 2020 02:11:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwowyQY82HHf6lfOehAmyB+I549BTmbWWQE/Hqxz07TBvJdeSeRco/ZSz4Rf3j+KLe4BkwjOYMh1ghwVU/coTE=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr6700834oie.144.1581847894821; 
 Sun, 16 Feb 2020 02:11:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
In-Reply-To: <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Sun, 16 Feb 2020 18:11:23 +0800
Message-ID: <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: -y9pU1D0OBqUf7wN5T6Atg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fsopen: New tests
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1431139223=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1431139223==
Content-Type: multipart/alternative; boundary="000000000000dc288e059eaea96a"

--000000000000dc288e059eaea96a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 7:36 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> Add tests to check working of fsopen() syscall.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  configure.ac                                |  1 +
>  runtest/syscalls                            |  3 +
>  testcases/kernel/syscalls/fsopen/.gitignore |  2 +
>  testcases/kernel/syscalls/fsopen/Makefile   |  6 ++
>  testcases/kernel/syscalls/fsopen/fsopen01.c | 71 +++++++++++++++++++++
>  testcases/kernel/syscalls/fsopen/fsopen02.c | 56 ++++++++++++++++
>  6 files changed, 139 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/fsopen/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fsopen/Makefile
>  create mode 100644 testcases/kernel/syscalls/fsopen/fsopen01.c
>  create mode 100644 testcases/kernel/syscalls/fsopen/fsopen02.c
>
> diff --git a/configure.ac b/configure.ac
> index df4e8c8322fc..4125160a19bb 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -80,6 +80,7 @@ AC_CHECK_FUNCS([ \
>      execveat \
>      fallocate \
>      fchownat \
> +    fsopen \
>      fstatat \
>      getdents \
>      getdents64 \
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 0743cf4e3f74..0a56599ebad9 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -542,6 +542,9 @@ fanotify13 fanotify13
>  fanotify14 fanotify14
>  fanotify15 fanotify15
>
> +fsopen01 fsopen01
> +fsopen02 fsopen02
> +
>  ioperm01 ioperm01
>  ioperm02 ioperm02
>
> diff --git a/testcases/kernel/syscalls/fsopen/.gitignore
> b/testcases/kernel/syscalls/fsopen/.gitignore
> new file mode 100644
> index 000000000000..80089dd137a7
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsopen/.gitignore
> @@ -0,0 +1,2 @@
> +fsopen01
> +fsopen02
> diff --git a/testcases/kernel/syscalls/fsopen/Makefile
> b/testcases/kernel/syscalls/fsopen/Makefile
> new file mode 100644
> index 000000000000..5ea7d67db123
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsopen/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir             ?=3D ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/fsopen/fsopen01.c
> b/testcases/kernel/syscalls/fsopen/fsopen01.c
> new file mode 100644
> index 000000000000..3587c67636ea
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsopen/fsopen01.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Basic fsopen() test which tries to configure and mount the filesystem
> as
> + * well.
> + */
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
> +
> +#define MNTPOINT       "mntpoint"
> +
> +static void run(void)
> +{
> +       int fd, fsmfd;
> +
> +       TEST(fsopen(tst_device->fs_type, 0));
> +       fd =3D TST_RET;
> +
> +       if (fd =3D=3D -1)
> +               tst_brk(TFAIL | TERRNO, "fsopen() failed");
> +
> +       TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev,
> 0));
> +       if (TST_RET =3D=3D -1) {
> +               tst_res(TBROK | TERRNO, "fsconfig() failed");
> +               goto out;
> +       }
> +
> +       TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> +       if (TST_RET =3D=3D -1) {
> +               tst_res(TBROK | TERRNO, "fsconfig() failed");
> +               goto out;
> +       }
> +
> +       TEST(fsmount(fd, 0, 0));
> +       if (TST_RET =3D=3D -1) {
> +               tst_res(TBROK | TERRNO, "fsmount() failed");
> +               goto out;
> +       }
> +
> +       fsmfd =3D TST_RET;
> +
> +       TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> +                       MOVE_MOUNT_F_EMPTY_PATH));
> +
> +       SAFE_CLOSE(fsmfd);
> +
> +       if (TST_RET =3D=3D -1) {
> +               tst_res(TBROK | TERRNO, "move_mount() failed");
> +               goto out;
> +       }
> +
> +       SAFE_CLOSE(TST_RET);
> +
> +       TEST(umount(MNTPOINT));
> +
> +       tst_res(TPASS, "fsopen() passed");
> +
> +out:
> +       SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test =3D {
> +       .min_kver =3D "5.2",
>

I suggest removing .min_kver check in all of the tests to let they can be
running on many distributions(which backport the features).

+       .test_all =3D run,
> +       .needs_root =3D 1,
> +       .needs_tmpdir =3D 1,
>

.needs_tmpdir is not necessary because tst_test->mntpoint helps create that
too.


> +       .format_device =3D 1,
> +       .mntpoint =3D MNTPOINT,
>

Maybe to test more filesystems and skip on FUSE? Just like the way in zlang=
@'s
patch.

+       .all_filesystems =3D 1,
+       .dev_fs_flags =3D TST_FS_SKIP_FUSE,

+};
> diff --git a/testcases/kernel/syscalls/fsopen/fsopen02.c
> b/testcases/kernel/syscalls/fsopen/fsopen02.c
> new file mode 100644
> index 000000000000..6831a12c696b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsopen/fsopen02.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Basic fsopen() failure tests.
> + */
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
> +
> +const char *invalid_fs =3D "invalid";
> +const char *valid_fs;
> +
> +static struct tcase {
> +       char *name;
> +       const char **fs;
> +       unsigned int flags;
> +       int exp_errno;
> +} tcases[] =3D {
> +       {"invalid-fs", &invalid_fs, 0, ENODEV},
> +       {"invalid-flags", &valid_fs, 0x10, EINVAL},
> +};
> +
> +static void setup(void)
> +{
> +       valid_fs =3D tst_device->fs_type;
> +}
> +
> +static void run(unsigned int n)
> +{
> +       struct tcase *tc =3D &tcases[n];
> +
> +       TEST(fsopen(*tc->fs, tc->flags));
> +
> +       if (TST_RET !=3D -1) {
> +               SAFE_CLOSE(TST_RET);
> +               tst_brk(TFAIL, "%s: fsopen() succeeded unexpectedly
> (index: %d)",
> +                       tc->name, n);
> +       }
> +
> +       if (tc->exp_errno !=3D TST_ERR) {
> +               tst_brk(TFAIL | TTERRNO, "%s: fsopen() should fail with
> %s",
> +                       tc->name, tst_strerrno(tc->exp_errno));
> +       }
> +
> +       tst_res(TPASS | TTERRNO, "%s: fsopen() failed as expected",
> tc->name);
> +}
> +
> +static struct tst_test test =3D {
> +       .min_kver =3D "5.2",
>

To delete .min_kver.


> +       .tcnt =3D ARRAY_SIZE(tcases),
> +       .test =3D run,
> +       .setup =3D setup,
> +       .needs_root =3D 1,
> +       .needs_device =3D 1,
> +};
> --
> 2.21.0.rc0.269.g1a574e7a288b
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--000000000000dc288e059eaea96a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Feb 14, 2020 at 7:36 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Add tests to check working of fsopen() syscall.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
---<br>
=C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0testcases/kernel/syscalls/fsopen/.gitignore |=C2=A0 2 +<br>
=C2=A0testcases/kernel/syscalls/fsopen/Makefile=C2=A0 =C2=A0|=C2=A0 6 ++<br=
>
=C2=A0testcases/kernel/syscalls/fsopen/fsopen01.c | 71 ++++++++++++++++++++=
+<br>
=C2=A0testcases/kernel/syscalls/fsopen/fsopen02.c | 56 ++++++++++++++++<br>
=C2=A06 files changed, 139 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsopen/.gitignore<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsopen/Makefile<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsopen/fsopen01.c<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsopen/fsopen02.c<br>
<br>
diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
index df4e8c8322fc..4125160a19bb 100644<br>
--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
@@ -80,6 +80,7 @@ AC_CHECK_FUNCS([ \<br>
=C2=A0 =C2=A0 =C2=A0execveat \<br>
=C2=A0 =C2=A0 =C2=A0fallocate \<br>
=C2=A0 =C2=A0 =C2=A0fchownat \<br>
+=C2=A0 =C2=A0 fsopen \<br>
=C2=A0 =C2=A0 =C2=A0fstatat \<br>
=C2=A0 =C2=A0 =C2=A0getdents \<br>
=C2=A0 =C2=A0 =C2=A0getdents64 \<br>
diff --git a/runtest/syscalls b/runtest/syscalls<br>
index 0743cf4e3f74..0a56599ebad9 100644<br>
--- a/runtest/syscalls<br>
+++ b/runtest/syscalls<br>
@@ -542,6 +542,9 @@ fanotify13 fanotify13<br>
=C2=A0fanotify14 fanotify14<br>
=C2=A0fanotify15 fanotify15<br>
<br>
+fsopen01 fsopen01<br>
+fsopen02 fsopen02<br>
+<br>
=C2=A0ioperm01 ioperm01<br>
=C2=A0ioperm02 ioperm02<br>
<br>
diff --git a/testcases/kernel/syscalls/fsopen/.gitignore b/testcases/kernel=
/syscalls/fsopen/.gitignore<br>
new file mode 100644<br>
index 000000000000..80089dd137a7<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsopen/.gitignore<br>
@@ -0,0 +1,2 @@<br>
+fsopen01<br>
+fsopen02<br>
diff --git a/testcases/kernel/syscalls/fsopen/Makefile b/testcases/kernel/s=
yscalls/fsopen/Makefile<br>
new file mode 100644<br>
index 000000000000..5ea7d67db123<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsopen/Makefile<br>
@@ -0,0 +1,6 @@<br>
+# SPDX-License-Identifier: GPL-2.0-or-later<br>
+<br>
+top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D ../../../..=
<br>
+<br>
+include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=3D"no=
referrer" target=3D"_blank">testcases.mk</a><br>
+include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk"=
 rel=3D"noreferrer" target=3D"_blank">generic_leaf_target.mk</a><br>
diff --git a/testcases/kernel/syscalls/fsopen/fsopen01.c b/testcases/kernel=
/syscalls/fsopen/fsopen01.c<br>
new file mode 100644<br>
index 000000000000..3587c67636ea<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsopen/fsopen01.c<br>
@@ -0,0 +1,71 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2020 Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@lina=
ro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
+ *<br>
+ * Description:<br>
+ * Basic fsopen() test which tries to configure and mount the filesystem a=
s<br>
+ * well.<br>
+ */<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;lapi/fsmount.h&quot;<br>
+<br>
+#define MNTPOINT=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mntpoint&quot;<br>
+<br>
+static void run(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, fsmfd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsopen(tst_device-&gt;fs_type, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D TST_RET;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TFAIL | TER=
RNO, &quot;fsopen() failed&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fd, FSCONFIG_SET_STRING, &quot;so=
urce&quot;, tst_device-&gt;dev, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TBROK | TER=
RNO, &quot;fsconfig() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fd, FSCONFIG_CMD_CREATE, NULL, NU=
LL, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TBROK | TER=
RNO, &quot;fsconfig() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsmount(fd, 0, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TBROK | TER=
RNO, &quot;fsmount() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fsmfd =3D TST_RET;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(move_mount(fsmfd, &quot;&quot;, AT_FDCWD, =
MNTPOINT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MOVE_MOUNT_F_EMPTY_PATH));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fsmfd);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TBROK | TER=
RNO, &quot;move_mount() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(TST_RET);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(umount(MNTPOINT));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;fsopen() passed&quot;);<br=
>
+<br>
+out:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd);<br>
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.min_kver =3D &quot;5.2&quot;,<br></blockquote>=
<div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">=
I suggest removing .min_kver check in all of the tests to let they can be r=
unning on many distributions(which backport the features).</div></div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D run,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_tmpdir =3D 1,<br></blockquote><div>=C2=
=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small">.need=
s_tmpdir is not necessary because tst_test-&gt;mntpoint helps create that t=
oo.</span></div><div><span class=3D"gmail_default" style=3D"font-size:small=
"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.format_device =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mntpoint =3D MNTPOINT,<br></blockquote><div><b=
r></div><div><div class=3D"gmail_default" style=3D"font-size:small">Maybe t=
o test more filesystems and skip on FUSE? Just like the way in zlang@&#39;s=
 patch.</div><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">+ =C2=A0 =C2=A0 =C2=A0 .all_filesystems =3D 1,</div><div class=3D"gmail_=
default" style=3D"font-size:small">+ =C2=A0 =C2=A0 =C2=A0 .dev_fs_flags =3D=
 TST_FS_SKIP_FUSE,</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small"></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+};<br>
diff --git a/testcases/kernel/syscalls/fsopen/fsopen02.c b/testcases/kernel=
/syscalls/fsopen/fsopen02.c<br>
new file mode 100644<br>
index 000000000000..6831a12c696b<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsopen/fsopen02.c<br>
@@ -0,0 +1,56 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2020 Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@lina=
ro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
+ *<br>
+ * Description:<br>
+ * Basic fsopen() failure tests.<br>
+ */<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;lapi/fsmount.h&quot;<br>
+<br>
+const char *invalid_fs =3D &quot;invalid&quot;;<br>
+const char *valid_fs;<br>
+<br>
+static struct tcase {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char **fs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int exp_errno;<br>
+} tcases[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;invalid-fs&quot;, &amp;invalid_fs, 0, EN=
ODEV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;invalid-flags&quot;, &amp;valid_fs, 0x10=
, EINVAL},<br>
+};<br>
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0valid_fs =3D tst_device-&gt;fs_type;<br>
+}<br>
+<br>
+static void run(unsigned int n)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tcase *tc =3D &amp;tcases[n];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsopen(*tc-&gt;fs, tc-&gt;flags));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(TST_RET)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TFAIL, &quo=
t;%s: fsopen() succeeded unexpectedly (index: %d)&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tc-&gt;name, n);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;exp_errno !=3D TST_ERR) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TFAIL | TTE=
RRNO, &quot;%s: fsopen() should fail with %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tc-&gt;name, tst_strerrno(tc-&gt;exp_errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS | TTERRNO, &quot;%s: fsopen() fai=
led as expected&quot;, tc-&gt;name);<br>
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.min_kver =3D &quot;5.2&quot;,<br></blockquote>=
<div>=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-size:smal=
l">To delete .min_kver.</span></div><div><span class=3D"gmail_default"></sp=
an>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tcnt =3D ARRAY_SIZE(tcases),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test =3D run,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_device =3D 1,<br>
+};<br>
-- <br>
2.21.0.rc0.269.g1a574e7a288b<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000dc288e059eaea96a--


--===============1431139223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1431139223==--

