Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D241E165718
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:41:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 816113C2238
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 06:41:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0B9093C0271
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:41:40 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 729BB1000A39
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 06:40:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582177297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VAow5apiiLAVRPhdYkZ/jOw9pTDHi4ySKmIny2BQrEk=;
 b=hiGLqoNRwAegBemO0fGPl9zG8bYT1q1XtSpzsdVbB87UA0QU7ZzItCeFgvbQNc9YQS24Cl
 ijIF4xtxQcmZSvmdPsy+B91w0Vx4JTVSzgGQnIY5bMKJeGKxM+agZsJqdaaKdxHU63PcxZ
 FjzT/Mn9eB7LuaGFwyJhV7HybLXRXWM=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-GBQ3f0_cO_eZkl6D5PTx0Q-1; Thu, 20 Feb 2020 00:41:31 -0500
Received: by mail-ot1-f70.google.com with SMTP id 75so1589052otc.6
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 21:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRIkqyoavCVSQMsno0W6B2pvLUHmLMKftZJY074EfHo=;
 b=t1qtOZHw2QmtzWT4+lEohj8JwycVnNG/ikM13/vHMPnAvjlNtz54rfa1dfBUOOELvv
 VCe3708Km7Zn0b4kA5Irjo4WdqVlWzTNgFO4XX8uHgzRklsTh7awvJkMVqM7PjHvLK1+
 BjmeXoNK5ys9J6fw1p8/Hbze5jhM5RK03dB2XbN0Abs4OvX7fUyx8X2OgU2OjnorM/Ez
 e6KZWlhQHzmQ7OJTjD27Ye5VSXHhRrumi71RmFjxgBa6qUPsrl54aKURRzMTrIcmxy5c
 t/VtBbudvmAjQigj+9nWlXDbYaV7jUxOX5gQYpnrKfWeiBbC3/iJdZD25WyycmYxOOm2
 OcGg==
X-Gm-Message-State: APjAAAUB7vasR+s16XMhNvTUvUxvTngaW9aR/mfDd0X4NQU1/KH+fKfi
 TL5LcH40+WbuMdpZ70Xs7Fygy1f8DFJNr1cFh2xzAX4ZIF+APzlXCtXhOOUTTnuH2cVniVaqPj9
 vCk9fn2mM684dGfjFqZKeFtHFNKg=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr21439494otl.118.1582177290501; 
 Wed, 19 Feb 2020 21:41:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxd64DMXjYsufH6prIsH4gb/PZ0/TQ+ueODS6jrY1UW6uWss3ar5CzyOJbAwstLGhFf3PSTcFCtm2BnYUqe/ug=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr21439484otl.118.1582177290285; 
 Wed, 19 Feb 2020 21:41:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <6ac7573e8ea5ab6f0ab9256b73802126d72b5156.1582104018.git.viresh.kumar@linaro.org>
In-Reply-To: <6ac7573e8ea5ab6f0ab9256b73802126d72b5156.1582104018.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 13:41:19 +0800
Message-ID: <CAEemH2f6gudJjZ1HAsVFVKkuR3FUyBVHf1JQDHeQMdavQqc+2A@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: GBQ3f0_cO_eZkl6D5PTx0Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 05/10] syscalls/fsconfig: New tests
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
Content-Type: multipart/mixed; boundary="===============1406105990=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1406105990==
Content-Type: multipart/alternative; boundary="0000000000005c0bcf059efb5b50"

--0000000000005c0bcf059efb5b50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> Add tests to check working of fsconfig() syscall.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  runtest/syscalls                              |   3 +
>  testcases/kernel/syscalls/fsconfig/.gitignore |   2 +
>  testcases/kernel/syscalls/fsconfig/Makefile   |   6 +
>  .../kernel/syscalls/fsconfig/fsconfig01.c     | 110 ++++++++++++++++++
>  .../kernel/syscalls/fsconfig/fsconfig02.c     | 100 ++++++++++++++++
>  5 files changed, 221 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore
>  create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile
>  create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c
>  create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index f113342f0ded..4fcbd5f710eb 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -341,6 +341,9 @@ fpathconf01 fpathconf01
>  fremovexattr01 fremovexattr01
>  fremovexattr02 fremovexattr02
>
> +fsconfig01 fsconfig01
> +fsconfig02 fsconfig02
> +
>  fsmount01 fsmount01
>
>  fsopen01 fsopen01
> diff --git a/testcases/kernel/syscalls/fsconfig/.gitignore
> b/testcases/kernel/syscalls/fsconfig/.gitignore
> new file mode 100644
> index 000000000000..2bc54b82751b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsconfig/.gitignore
> @@ -0,0 +1,2 @@
> +/fsconfig01
> +/fsconfig02
> diff --git a/testcases/kernel/syscalls/fsconfig/Makefile
> b/testcases/kernel/syscalls/fsconfig/Makefile
> new file mode 100644
> index 000000000000..5ea7d67db123
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsconfig/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir             ?=3D ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> new file mode 100644
> index 000000000000..96bf8eef8e4b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Basic fsconfig() test which tries to configure and mount the
> filesystem as
> + * well.
> + */
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
> +
> +#define MNTPOINT       "mntpoint"
> +
> +static void setup(void)
> +{
> +       fsopen_supported_by_kernel();
> +}
> +
> +static void run(void)
> +{
> +       int fd, fsmfd;
> +
> +       TEST(fsopen(tst_device->fs_type, 0));
> +       fd =3D TST_RET;
> +
> +       if (fd =3D=3D -1)
> +               tst_brk(TBROK | TERRNO, "fsopen() failed");
> +
> +       TEST(fsconfig(fd, FSCONFIG_SET_FLAG, "rw", NULL, 0));
> +       if (TST_RET =3D=3D -1) {
> +               tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +               goto out;
> +       }
> +
> +       TEST(fsconfig(fd, FSCONFIG_SET_STRING, "source", tst_device->dev,
> 0));
> +       if (TST_RET =3D=3D -1) {
> +               tst_res(TFAIL | TERRNO, "fsconfig() failed");
> +               goto out;
> +       }
> +
> +       TEST(fsconfig(fd, FSCONFIG_SET_PATH, "foo", tst_device->dev,
> AT_FDCWD));
> +       if (TST_RET =3D=3D -1) {
> +               if (TST_ERR =3D=3D EOPNOTSUPP) {
> +                       tst_res(TINFO, "fsconfig(): FSCONFIG_SET_PATH not
> supported");
> +               } else {
> +                       tst_res(TFAIL | TERRNO, "fsconfig() failed");
>

The test reports an EINVAL error when testing fsconfig() with
'FSCONFIG_SET_PATH' on XFS. I'm now trying to look close to this issue.

kernel: 5.6.0-rc2+ x86_64

tst_test.c:1278: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop0 with xfs opts=3D'' extra opts=3D=
''
tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
fsconfig01.c:46: FAIL: fsconfig() failed: EINVAL (22)
--=20
Regards,
Li Wang

--0000000000005c0bcf059efb5b50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add tests t=
o check working of fsconfig() syscall.<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
---<br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0testcases/kernel/syscalls/fsconfig/.gitignore |=C2=A0 =C2=A02 +<br>
=C2=A0testcases/kernel/syscalls/fsconfig/Makefile=C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +<br>
=C2=A0.../kernel/syscalls/fsconfig/fsconfig01.c=C2=A0 =C2=A0 =C2=A0| 110 ++=
++++++++++++++++<br>
=C2=A0.../kernel/syscalls/fsconfig/fsconfig02.c=C2=A0 =C2=A0 =C2=A0| 100 ++=
++++++++++++++<br>
=C2=A05 files changed, 221 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsconfig/.gitignore<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsconfig/Makefile<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig01.c<br=
>
=C2=A0create mode 100644 testcases/kernel/syscalls/fsconfig/fsconfig02.c<br=
>
<br>
diff --git a/runtest/syscalls b/runtest/syscalls<br>
index f113342f0ded..4fcbd5f710eb 100644<br>
--- a/runtest/syscalls<br>
+++ b/runtest/syscalls<br>
@@ -341,6 +341,9 @@ fpathconf01 fpathconf01<br>
=C2=A0fremovexattr01 fremovexattr01<br>
=C2=A0fremovexattr02 fremovexattr02<br>
<br>
+fsconfig01 fsconfig01<br>
+fsconfig02 fsconfig02<br>
+<br>
=C2=A0fsmount01 fsmount01<br>
<br>
=C2=A0fsopen01 fsopen01<br>
diff --git a/testcases/kernel/syscalls/fsconfig/.gitignore b/testcases/kern=
el/syscalls/fsconfig/.gitignore<br>
new file mode 100644<br>
index 000000000000..2bc54b82751b<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsconfig/.gitignore<br>
@@ -0,0 +1,2 @@<br>
+/fsconfig01<br>
+/fsconfig02<br>
diff --git a/testcases/kernel/syscalls/fsconfig/Makefile b/testcases/kernel=
/syscalls/fsconfig/Makefile<br>
new file mode 100644<br>
index 000000000000..5ea7d67db123<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsconfig/Makefile<br>
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
diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c b/testcases/ke=
rnel/syscalls/fsconfig/fsconfig01.c<br>
new file mode 100644<br>
index 000000000000..96bf8eef8e4b<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c<br>
@@ -0,0 +1,110 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+ * Copyright (c) 2020 Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@lina=
ro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
+ *<br>
+ * Description:<br>
+ * Basic fsconfig() test which tries to configure and mount the filesystem=
 as<br>
+ * well.<br>
+ */<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;lapi/fsmount.h&quot;<br>
+<br>
+#define MNTPOINT=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mntpoint&quot;<br>
+<br>
+static void setup(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fsopen_supported_by_kernel();<br>
+}<br>
+<br>
+static void run(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, fsmfd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsopen(tst_device-&gt;fs_type, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D TST_RET;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;fsopen() failed&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fd, FSCONFIG_SET_FLAG, &quot;rw&q=
uot;, NULL, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TER=
RNO, &quot;fsconfig() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fd, FSCONFIG_SET_STRING, &quot;so=
urce&quot;, tst_device-&gt;dev, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TFAIL | TER=
RNO, &quot;fsconfig() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fd, FSCONFIG_SET_PATH, &quot;foo&=
quot;, tst_device-&gt;dev, AT_FDCWD));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_ERR =3D=3D =
EOPNOTSUPP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TINFO, &quot;fsconfig(): FSCONFIG_SET_PATH not supported&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL | TERRNO, &quot;fsconfig() failed&quot;);<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">The test reports an EINVAL error when testing fsconfig() with &#39;F=
SCONFIG_SET_PATH&#39; on XFS. I&#39;m now trying to look close to this issu=
e.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>kernel: =
5.6.0-rc2+ x86_64<br></div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div>tst_test.c:1278: INFO: Testing on xfs<br>tst_mkfs.c:90: IN=
FO: Formatting /dev/loop0 with xfs opts=3D&#39;&#39; extra opts=3D&#39;&#39=
;<br>tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s<br>fsconfig01.c:4=
6: FAIL: fsconfig() failed: EINVAL (22)<br><div class=3D"gmail_default" sty=
le=3D"font-size:small"></div></div></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></d=
iv></div></div></div>

--0000000000005c0bcf059efb5b50--


--===============1406105990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1406105990==--

