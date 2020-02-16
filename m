Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 41337160256
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 08:33:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 803003C2557
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 08:33:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 025043C0429
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 08:33:16 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 85A0E60095E
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 08:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581838390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yvtVd2B4ipmqATFS+AlysG4oOcrk5oBuM465cemUE08=;
 b=GkWmQ1hCaWqxhkKCAwrpPsW1CtNcY7VzhD9vmegoNwKnOnW9Ra0177VxZyperYTtxRzQ0l
 K+Y8fmTr73uWu/uxSHvqdxLS8EhXSYo0okaPThQD+kpt19AFnuq7sYFLAq3LFoYcz4BbbQ
 z26t3cI156lE2TH0z5S68gDE+BKEUw4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-r6mcYMM-O9aeynpGfUhwug-1; Sun, 16 Feb 2020 02:32:59 -0500
Received: by mail-ot1-f69.google.com with SMTP id n22so8427731otr.23
 for <ltp@lists.linux.it>; Sat, 15 Feb 2020 23:32:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=78ZaSRSo4SdxktTklDaV/gswyc6uHD/5g6kYKzQ0VB4=;
 b=HK8NlOKhX6/X0kf/NVfmfXETac5DSuNDLZaN0bDNXqzJKF6W3l8Yx9RseKMpzxSDdb
 RwVCEpeG38KmOb7O1JrYWomvmhkwP1VZXIAr2PJA+k7SbGLVfoha6b+4mNJUX2ie7cLn
 cebxErkVX7MfgORQ1PWi7+1u8ssmm0+2z0y+TqRwkW/jp+gtdsoUhgZWjJ92Yx3hjUCy
 wcAyNeK6qNnLxvoKpR6G+ByEy93ZLQ4z0PgBxy8zkoWY1zPI5VUlciEyXadkNrNrviY4
 NFOFKXxwnALF4lZwBlj8Kms/CQa0a7vgz2U6PpfiGhqnEY3/WRQScIhSf3aTsFp4NUPm
 WHwA==
X-Gm-Message-State: APjAAAXGCIgngTqfYD4DEsvq3wYxtAvlp+LEmH7OF+9oINeBtBBSyy1l
 XjxE2w251XfOiQ8iOXNDdPNV21dG6aQZJPtMQfQJj8auJcfZ2D1b5mg/qeqMnvMPHXWJFCIoQnG
 FRQmn8v1mUbLH7y7pt7Bdu0rDa0g=
X-Received: by 2002:a9d:7:: with SMTP id 7mr7865715ota.26.1581838378681;
 Sat, 15 Feb 2020 23:32:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4ARpWbIppiZNNj3oDB32AMHAASmm1vYMn7D5d55QoxJK667rp3vBAqAg5UluZ6iULRk979xAG3v/DxY4ekDc=
X-Received: by 2002:a9d:7:: with SMTP id 7mr7865709ota.26.1581838378429; Sat,
 15 Feb 2020 23:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
In-Reply-To: <20200207144105.19947-2-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Sun, 16 Feb 2020 15:32:47 +0800
Message-ID: <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: r6mcYMM-O9aeynpGfUhwug-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Cc: viresh.kumar@linaro.org, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0159616193=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0159616193==
Content-Type: multipart/alternative; boundary="000000000000a37fdf059eac7274"

--000000000000a37fdf059eac7274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

[CC Viresh Kumar]

Patch v6 looks almost good besides tiny issues:

I don't like the commit summary with kernel version number, can we just
note as:
    "syscalls/fsmount01: Add test for fsmount series API"?

On Fri, Feb 7, 2020 at 10:41 PM Petr Vorel <pvorel@suse.cz> wrote:

> From: Zorro Lang <zlang@redhat.com>
>
> Add basic tests tests for new mount API from kernel v5.2.
> Testing mount and umount filesystems with fsopen(), fsconfig(),
> fsmount() and move_mount().
>
> Signed-off-by: Zorro Lang <zlang@redhat.com>
> Reported-by: Cyril Hrubis <chrubis@suse.cz>
> [ pvorel: cleanup autotools and other fixes ]
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  configure.ac                                  |  4 +
>  include/lapi/newmount.h                       | 95 +++++++++++++++++++
>  include/lapi/syscalls/powerpc64.in            |  4 +
>

Is there any reason why only add syscall num for ppc64?


>
> diff --git a/configure.ac b/configure.ac
> index df4e8c832..05b7d0a72 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -80,6 +80,9 @@ AC_CHECK_FUNCS([ \
>      execveat \
>      fallocate \
>      fchownat \
> +    fsconfig \
> +    fsmount \
> +    fsopen \
>      fstatat \
>      getdents \
>      getdents64 \
> @@ -88,6 +91,7 @@ AC_CHECK_FUNCS([ \
>      mkdirat \
>      mknodat \
>      modify_ldt \
> +    move_mount \
>      name_to_handle_at \
>      openat \
>      pidfd_open \
> diff --git a/include/lapi/newmount.h b/include/lapi/newmount.h
> new file mode 100644
> index 000000000..d4efdb300
> --- /dev/null
> +++ b/include/lapi/newmount.h
>

Maybe rename to fsmount.h is better? Now we think it new since mainline
v5.2 is new to us, one year later it probably not new actually, to use a
name can indicate the functionality is wiser I guess.

BTW, I like the way Viresh Kumar gives in his fsmount.h, it looks more tidy
and clean.
http://lists.linux.it/pipermail/ltp/2020-February/015413.html



> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> + * Author: Zorro Lang <zlang@redhat.com>
> + *
> + * Use new mount API from v5.2 (fsopen(), fsconfig(), fsmount(),
> move_mount())
> + * to mount a filesystem without any specified mount options.
> + */
> +
> +#include <sys/mount.h>
> +
> +#include "tst_test.h"
> +#include "lapi/newmount.h"
> +#include "tst_safe_stdio.h"
> +
> +#define LINELENGTH 256
> +#define MNTPOINT "newmount_point"
> +static int sfd, mfd, is_mounted;
> +
> +static int ismount(char *mntpoint)
> +{
> +       int ret =3D 0;
> +       FILE *file;
> +       char line[LINELENGTH];
> +
> +       file =3D SAFE_FOPEN("/proc/mounts", "r");
> +
> +       while (fgets(line, sizeof(line), file)) {
> +               if (strstr(line, mntpoint) !=3D NULL) {
> +                       ret =3D 1;
> +                       break;
> +               }
> +       }
> +       SAFE_FCLOSE(file);
> +       return ret;
> +}
> +
> +static void cleanup(void)
> +{
> +       if (is_mounted)
> +               SAFE_UMOUNT(MNTPOINT);
> +}
> +
> +static void test_newmount(void)
>

static void test_fsmount(void)? Or, static void run(void).


> +{
> +       TEST(fsopen(tst_device->fs_type, FSOPEN_CLOEXEC));
> +       if (TST_RET < 0)
> +               tst_brk(TBROK | TTERRNO, "fsopen %s", tst_device->fs_type=
);
> +       sfd =3D TST_RET;
> +       tst_res(TPASS, "fsopen %s", tst_device->fs_type);
> +
> +       TEST(fsconfig(sfd, FSCONFIG_SET_STRING, "source", tst_device->dev=
,
> 0));
> +       if (TST_RET < 0)
> +               tst_brk(TBROK | TTERRNO,
> +                       "fsconfig set source to %s", tst_device->dev);
> +       tst_res(TPASS, "fsconfig set source to %s", tst_device->dev);
> +
> +
> +       TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, NULL, 0));
> +       if (TST_RET < 0)
> +               tst_brk(TBROK | TTERRNO, "fsconfig create superblock");
> +       tst_res(TPASS, "fsconfig create superblock");
> +
> +       TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));
> +       if (TST_RET < 0)
> +               tst_brk(TBROK | TTERRNO, "fsmount");
> +       mfd =3D TST_RET;
> +       tst_res(TPASS, "fsmount");
> +       SAFE_CLOSE(sfd);
> +
> +       TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT,
> MOVE_MOUNT_F_EMPTY_PATH));
> +       if (TST_RET < 0)
> +               tst_brk(TBROK | TTERRNO, "move_mount attach to mount
> point");
> +       is_mounted =3D 1;
> +       tst_res(TPASS, "move_mount attach to mount point");
> +       SAFE_CLOSE(mfd);
> +
> +       if (ismount(MNTPOINT)) {
> +               tst_res(TPASS, "new mount API from v5.2 works");
>

Can we avoid appearance the v5.2? I guess many Enterprise Linux
Distributions will backport the fsmount() series API, v5.2 in test log
looks strange if the kernel is older than it.



> +               SAFE_UMOUNT(MNTPOINT);
> +               is_mounted =3D 0;
> +       } else
> +               tst_res(TFAIL, "new mount API from v5.2 works");
>
no v5.2


> +}
> +
> +static struct tst_test test =3D {
> +       .test_all =3D test_newmount,
> +       .cleanup =3D cleanup,
> +       .needs_root =3D 1,
> +       .mntpoint =3D MNTPOINT,
> +       .format_device =3D 1,
> +       .all_filesystems =3D 1,
> +       .dev_fs_flags =3D TST_FS_SKIP_FUSE,
> +};
> --
> 2.24.1
>
>

--=20
Regards,
Li Wang

--000000000000a37fdf059eac7274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Hi,</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">[CC Viresh Kumar]</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Patch v6 looks almost good besides tiny issues:</div><=
div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default">I don&#39;t like the commit summary with kernel version =
number, can we just note as:=C2=A0</div><div class=3D"gmail_default">=C2=A0=
 =C2=A0 &quot;syscalls/fsmount01: Add test for fsmount series API&quot;?</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Feb 7, 2020 at 10:41 PM Petr Vorel &lt;<a href=3D"mailto:pvorel@=
suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">From: Zorro Lang &lt;<a href=3D"ma=
ilto:zlang@redhat.com" target=3D"_blank">zlang@redhat.com</a>&gt;<br>
<br>
Add basic tests tests for new mount API from kernel v5.2.<br>
Testing mount and umount filesystems with fsopen(), fsconfig(),<br>
fsmount() and move_mount().<br>
<br>
Signed-off-by: Zorro Lang &lt;<a href=3D"mailto:zlang@redhat.com" target=3D=
"_blank">zlang@redhat.com</a>&gt;<br>
Reported-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"=
_blank">chrubis@suse.cz</a>&gt;<br>
[ pvorel: cleanup autotools and other fixes ]<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
=C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +<br>
=C2=A0include/lapi/newmount.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 95 +++++++++++++++++++<br>
=C2=A0include/lapi/syscalls/<a href=3D"http://powerpc64.in" rel=3D"noreferr=
er" target=3D"_blank">powerpc64.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 4 +<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">Is there any reason why only add syscall=
 num for ppc64?</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
index df4e8c832..05b7d0a72 100644<br>
--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">=
configure.ac</a><br>
@@ -80,6 +80,9 @@ AC_CHECK_FUNCS([ \<br>
=C2=A0 =C2=A0 =C2=A0execveat \<br>
=C2=A0 =C2=A0 =C2=A0fallocate \<br>
=C2=A0 =C2=A0 =C2=A0fchownat \<br>
+=C2=A0 =C2=A0 fsconfig \<br>
+=C2=A0 =C2=A0 fsmount \<br>
+=C2=A0 =C2=A0 fsopen \<br>
=C2=A0 =C2=A0 =C2=A0fstatat \<br>
=C2=A0 =C2=A0 =C2=A0getdents \<br>
=C2=A0 =C2=A0 =C2=A0getdents64 \<br>
@@ -88,6 +91,7 @@ AC_CHECK_FUNCS([ \<br>
=C2=A0 =C2=A0 =C2=A0mkdirat \<br>
=C2=A0 =C2=A0 =C2=A0mknodat \<br>
=C2=A0 =C2=A0 =C2=A0modify_ldt \<br>
+=C2=A0 =C2=A0 move_mount \<br>
=C2=A0 =C2=A0 =C2=A0name_to_handle_at \<br>
=C2=A0 =C2=A0 =C2=A0openat \<br>
=C2=A0 =C2=A0 =C2=A0pidfd_open \<br>
diff --git a/include/lapi/newmount.h b/include/lapi/newmount.h<br>
new file mode 100644<br>
index 000000000..d4efdb300<br>
--- /dev/null<br>
+++ b/include/lapi/newmount.h<br></blockquote><div><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Maybe rename to fsmount.h is bette=
r? Now we think it new since mainline v5.2 is new to us, one year later it =
probably not new actually, to use a name can indicate the functionality=C2=
=A0is wiser I guess.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">BTW,=
 I like the way Viresh Kumar gives in his fsmount.h, it looks more tidy and=
 clean.</div><div class=3D"gmail_default" style=3D"font-size:small"><a href=
=3D"http://lists.linux.it/pipermail/ltp/2020-February/015413.html" target=
=3D"_blank">http://lists.linux.it/pipermail/ltp/2020-February/015413.html</=
a><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c<br>
@@ -0,0 +1,94 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (C) 2019 Red Hat, Inc.=C2=A0 All rights reserved.<br>
+ * Author: Zorro Lang &lt;<a href=3D"mailto:zlang@redhat.com" target=3D"_b=
lank">zlang@redhat.com</a>&gt;<br>
+ *<br>
+ * Use new mount API from v5.2 (fsopen(), fsconfig(), fsmount(), move_moun=
t())<br>
+ * to mount a filesystem without any specified mount options.<br>
+ */<br>
+<br>
+#include &lt;sys/mount.h&gt;<br>
+<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;lapi/newmount.h&quot;<br>
+#include &quot;tst_safe_stdio.h&quot;<br>
+<br>
+#define LINELENGTH 256<br>
+#define MNTPOINT &quot;newmount_point&quot;<br>
+static int sfd, mfd, is_mounted;<br>
+<br>
+static int ismount(char *mntpoint)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *file;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char line[LINELENGTH];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file =3D SAFE_FOPEN(&quot;/proc/mounts&quot;, &=
quot;r&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (fgets(line, sizeof(line), file)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strstr(line, mn=
tpoint) !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FCLOSE(file);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+<br>
+static void cleanup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_mounted)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_UMOUNT(MNTPOIN=
T);<br>
+}<br>
+<br>
+static void test_newmount(void)<br></blockquote><div>=C2=A0</div><div><spa=
n class=3D"gmail_default" style=3D"font-size:small">static void test_fsmoun=
t(void)? O</span>r<span class=3D"gmail_default" style=3D"font-size:small">,=
</span> static void run(void)<span class=3D"gmail_default" style=3D"font-si=
ze:small">.</span></div><div><span class=3D"gmail_default" style=3D"font-si=
ze:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsopen(tst_device-&gt;fs_type, FSOPEN_CLOE=
XEC));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TTE=
RRNO, &quot;fsopen %s&quot;, tst_device-&gt;fs_type);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sfd =3D TST_RET;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;fsopen %s&quot;, tst_devic=
e-&gt;fs_type);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(sfd, FSCONFIG_SET_STRING, &quot;s=
ource&quot;, tst_device-&gt;dev, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TTE=
RRNO,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;fsconfig set source to %s&quot;, tst_device-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;fsconfig set source to %s&=
quot;, tst_device-&gt;dev);<br>
+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(sfd, FSCONFIG_CMD_CREATE, NULL, N=
ULL, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TTE=
RRNO, &quot;fsconfig create superblock&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;fsconfig create superblock=
&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsmount(sfd, FSMOUNT_CLOEXEC, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TTE=
RRNO, &quot;fsmount&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mfd =3D TST_RET;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;fsmount&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(sfd);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(move_mount(mfd, &quot;&quot;, AT_FDCWD, MN=
TPOINT, MOVE_MOUNT_F_EMPTY_PATH));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TTE=
RRNO, &quot;move_mount attach to mount point&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0is_mounted =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;move_mount attach to mount=
 point&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(mfd);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ismount(MNTPOINT)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;new mount API from v5.2 works&quot;);<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">Can we avoid appear=
ance=C2=A0the v5.2? I guess many Enterprise Linux Distributions=C2=A0will b=
ackport the fsmount() series API, v5.2 in test log looks strange if the ker=
nel is older than it.</div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_UMOUNT(MNTPOIN=
T);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is_mounted =3D 0;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL, &quo=
t;new mount API from v5.2 works&quot;);<br></blockquote><div><span class=3D=
"gmail_default" style=3D"font-size:small">no v5.2</span></div><div><span cl=
ass=3D"gmail_default" style=3D"font-size:small"></span>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D test_newmount,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mntpoint =3D MNTPOINT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.format_device =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.all_filesystems =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.dev_fs_flags =3D TST_FS_SKIP_FUSE,<br>
+};<br>
-- <br>
2.24.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div></div></div>

--000000000000a37fdf059eac7274--


--===============0159616193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0159616193==--

