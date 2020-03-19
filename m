Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F04018ADBD
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 08:56:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B6A893C5487
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 08:56:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AD41F3C5453
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 08:56:05 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 62889601A8D
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 08:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584604562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7zAtjlMKV9KItJASD1BTWQNMIRRBO+Odix4emcf6+Js=;
 b=CL+iw2X0bimBYCEcZzoWwPWfoUgDSQcHpfPRCDKnwjGXOc+aZkh7OQ/vBjmMwxy3X6BOhq
 SGe4hHzrnsHBeH9xRsMP9KNPy3BolQ9V4wwPndrdJIKaCsgpMVOxZkrSFWmq1mOkZuI5fm
 aYyTccmsxAHV/EA+Y9aFvNhmChNO8lA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-Bf6FW3kYNhuOIJj90IWVFA-1; Thu, 19 Mar 2020 03:55:57 -0400
X-MC-Unique: Bf6FW3kYNhuOIJj90IWVFA-1
Received: by mail-ot1-f71.google.com with SMTP id k1so997817otn.8
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 00:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31Q4IbzSHy6AX0dd0LHF1850WuKSvmzs4u2697kzIrg=;
 b=PXv9DGHDUxH0cb8PoNofNPtZw25I2dDH8jnoLk+TEviH5clqb3zWuSL1O7Py1xzvQS
 6l99T+yweEB+QrbThYuXD3Dp/XsmdceDww8xxJjVRfEvfkILIcTdoSIGgimEUyFvRDcp
 zRxANbb1cTGfsNuy/CQdJt/sAvDqVnvRMiw2oYx1dfZkqFrj5weQ+RAC/z0sJSm/X+nQ
 qUPjU7HKzQ4tU7KHTijxyGA5X9x2R/759ZK90x+P/abA9Kj2L8HPP1icAEULLGVEY3nQ
 aNbEOhSYCm0vHCAUn7jiUpHjEoljJCTa8ZvWNb6rIpb3IZo6mfoYjCmMnewf7P8J+C2n
 Fr9A==
X-Gm-Message-State: ANhLgQ1yAbOsapzlWrRlZ8m1FeGPbjHhWV/6A5ee6mpNBsQwMSQktXhb
 4Ge0HfxEKk9ueVIMFWTkypTR8PmPwkFav4mX6TP0fPvi/u4vT2OugPfD+v4v+69aKvdEzzPI6sX
 6qT6DEiVhefuokL55LTFUTQKYhaY=
X-Received: by 2002:aca:5e88:: with SMTP id s130mr1345124oib.47.1584604555394; 
 Thu, 19 Mar 2020 00:55:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vssONk0e4bOiKaLvIvO9Lbs5WeJcQ1YyYrbQKbF74iuazuwKijxzTmE8Lkvmk0yfkpKgkTn06OFZ4o1/sJIR4s=
X-Received: by 2002:aca:5e88:: with SMTP id s130mr1345113oib.47.1584604554957; 
 Thu, 19 Mar 2020 00:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200318153801.3529-1-chrubis@suse.cz>
 <20200318153801.3529-6-chrubis@suse.cz>
In-Reply-To: <20200318153801.3529-6-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Mar 2020 15:55:43 +0800
Message-ID: <CAEemH2f_Md7hkEWgLYABD+TLbDJvvR-aMfuuNqLNeyWSWK1EnQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/9] syscalls/sysinfo03: Add time namespace test
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
Content-Type: multipart/mixed; boundary="===============0147983814=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0147983814==
Content-Type: multipart/alternative; boundary="0000000000009bc12705a1307faf"

--0000000000009bc12705a1307faf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2020 at 11:35 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> This tests that the uptime in sysinfo() is adjusted correctly by the
> namespace offset.
>
> Also check that /proc/uptime is consistent with the uptime from the
> sysinfo() syscall.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/containers                            |  3 +
>  runtest/syscalls                              |  1 +
>  testcases/kernel/syscalls/sysinfo/.gitignore  |  1 +
>  testcases/kernel/syscalls/sysinfo/sysinfo03.c | 81 +++++++++++++++++++
>  4 files changed, 86 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/sysinfo/sysinfo03.c
>
> diff --git a/runtest/containers b/runtest/containers
> index 871cd2a42..4dc05af93 100644
> --- a/runtest/containers
> +++ b/runtest/containers
> @@ -85,3 +85,6 @@ userns04 userns04
>  userns05 userns05
>  userns06 userns06
>  userns07 userns07
> +
> +# time namespaces
> +sysinfo03 sysinfo03
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 6f2dcd82a..fb0b9e539 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1465,6 +1465,7 @@ sysfs06 sysfs06
>
>  sysinfo01 sysinfo01
>  sysinfo02 sysinfo02
> +sysinfo03 sysinfo03
>
>  syslog01 syslog01
>  syslog02 syslog02
> diff --git a/testcases/kernel/syscalls/sysinfo/.gitignore
> b/testcases/kernel/syscalls/sysinfo/.gitignore
> index aa7c26946..8ad2279a4 100644
> --- a/testcases/kernel/syscalls/sysinfo/.gitignore
> +++ b/testcases/kernel/syscalls/sysinfo/.gitignore
> @@ -1,2 +1,3 @@
>  /sysinfo01
>  /sysinfo02
> +/sysinfo03
> diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> new file mode 100644
> index 000000000..af1024915
> --- /dev/null
> +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> +  Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
> + */
> +/*
> +
> +  Test if CLOCK_BOOTTIME namespace offset is applied to sysinfo uptime
> and that
> +  it's consistent with /proc/uptime as well.
> +
> +  After a call to unshare(CLONE_NEWTIME) a new timer namespace is
> created, the
> +  process that has called the unshare() can adjust offsets for
> CLOCK_MONOTONIC
> +  and CLOCK_BOOTTIME for its children by writing to the
> '/proc/self/timens_offsets'.
> +
> + */
> +
> +#include <sys/sysinfo.h>
> +#include "lapi/namespaces_constants.h"
> +#include "tst_test.h"
> +
> +static int offsets[] =3D {
> +       10,
> +       -10,
> +       3600,
> +};
> +
> +static long read_proc_uptime(void)
> +{
> +       long sec, sec_rem;
> +
> +       SAFE_FILE_SCANF("/proc/uptime", "%li.%li", &sec, &sec_rem);
> +
> +       return sec + (sec_rem ? 1 : 0);
> +}
> +
> +static void verify_sysinfo(unsigned int n)
> +{
> +       struct sysinfo si;
> +       long uptime;
> +       int off =3D offsets[n];
> +
> +       SAFE_UNSHARE(CLONE_NEWTIME);
> +
> +        SAFE_FILE_PRINTF("/proc/self/timens_offsets", "%d %d 0",
> +                        CLOCK_BOOTTIME, off);
> +
> +       sysinfo(&si);
> +
> +       uptime =3D si.uptime;
> +
> +       if (!SAFE_FORK()) {
> +               sysinfo(&si);
> +               long proc_uptime =3D read_proc_uptime();
> +
> +               long diff =3D si.uptime - uptime;
> +
> +               if (diff < off || diff > off + 1)
> +                       tst_res(TFAIL, "Wrong sysinfo uptime offset %li",
> diff);
> +               else
> +                       tst_res(TPASS, "Correct sysinfo uptime offset %i"=
,
> off);
> +
> +               if (si.uptime < proc_uptime || si.uptime > proc_uptime +
> 1) {
> +                       tst_res(TFAIL, "/proc/uptime %li differs from
> sysinfo %li",
> +                               proc_uptime, si.uptime);
> +               } else {
> +                       tst_res(TPASS, "/proc/uptime is consistent with
> sysinfo");
> +               }
> +       }
> +}
> +
> +static struct tst_test test =3D {
> +       .tcnt =3D ARRAY_SIZE(offsets),
> +       .test =3D verify_sysinfo,
> +       .needs_root =3D 1,
> +       .forks_child =3D 1,
> +       .needs_kconfigs =3D (const char *[]) {
> +               "CONFIG_TIME_NS=3Dy"
>

Shouldn't end with 'NULL' in kconfig struct?
If not that will mislead arrary_len to recognise wrong number of arrry(cnt)
and caused segmentation fault in test.



> +       }
>

A comma is required here ^, otherwise it'd be failing in the build phase.

+       .tags =3D (const struct tst_tag[]) {
> +               {"linux-git", "ecc421e05bab"},
>

Ending with '{}' in tags struct?


> +       }
> +};
> --
> 2.24.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

--=20
Regards,
Li Wang

--0000000000009bc12705a1307faf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 18, 2020 at 11:35 PM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This tes=
ts that the uptime in sysinfo() is adjusted correctly by the<br>
namespace offset.<br>
<br>
Also check that /proc/uptime is consistent with the uptime from the<br>
sysinfo() syscall.<br>
<br>
Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=
=3D"_blank">chrubis@suse.cz</a>&gt;<br>
---<br>
=C2=A0runtest/containers=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A0runtest/syscalls=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0testcases/kernel/syscalls/sysinfo/.gitignore=C2=A0 |=C2=A0 1 +<br>
=C2=A0testcases/kernel/syscalls/sysinfo/sysinfo03.c | 81 ++++++++++++++++++=
+<br>
=C2=A04 files changed, 86 insertions(+)<br>
=C2=A0create mode 100644 testcases/kernel/syscalls/sysinfo/sysinfo03.c<br>
<br>
diff --git a/runtest/containers b/runtest/containers<br>
index 871cd2a42..4dc05af93 100644<br>
--- a/runtest/containers<br>
+++ b/runtest/containers<br>
@@ -85,3 +85,6 @@ userns04 userns04<br>
=C2=A0userns05 userns05<br>
=C2=A0userns06 userns06<br>
=C2=A0userns07 userns07<br>
+<br>
+# time namespaces<br>
+sysinfo03 sysinfo03<br>
diff --git a/runtest/syscalls b/runtest/syscalls<br>
index 6f2dcd82a..fb0b9e539 100644<br>
--- a/runtest/syscalls<br>
+++ b/runtest/syscalls<br>
@@ -1465,6 +1465,7 @@ sysfs06 sysfs06<br>
<br>
=C2=A0sysinfo01 sysinfo01<br>
=C2=A0sysinfo02 sysinfo02<br>
+sysinfo03 sysinfo03<br>
<br>
=C2=A0syslog01 syslog01<br>
=C2=A0syslog02 syslog02<br>
diff --git a/testcases/kernel/syscalls/sysinfo/.gitignore b/testcases/kerne=
l/syscalls/sysinfo/.gitignore<br>
index aa7c26946..8ad2279a4 100644<br>
--- a/testcases/kernel/syscalls/sysinfo/.gitignore<br>
+++ b/testcases/kernel/syscalls/sysinfo/.gitignore<br>
@@ -1,2 +1,3 @@<br>
=C2=A0/sysinfo01<br>
=C2=A0/sysinfo02<br>
+/sysinfo03<br>
diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kern=
el/syscalls/sysinfo/sysinfo03.c<br>
new file mode 100644<br>
index 000000000..af1024915<br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c<br>
@@ -0,0 +1,81 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br>
+/*<br>
+=C2=A0 Copyright (c) 2020 Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.=
cz" target=3D"_blank">chrubis@suse.cz</a>&gt;<br>
+ */<br>
+/*<br>
+<br>
+=C2=A0 Test if CLOCK_BOOTTIME namespace offset is applied to sysinfo uptim=
e and that<br>
+=C2=A0 it&#39;s consistent with /proc/uptime as well.<br>
+<br>
+=C2=A0 After a call to unshare(CLONE_NEWTIME) a new timer namespace is cre=
ated, the<br>
+=C2=A0 process that has called the unshare() can adjust offsets for CLOCK_=
MONOTONIC<br>
+=C2=A0 and CLOCK_BOOTTIME for its children by writing to the &#39;/proc/se=
lf/timens_offsets&#39;.<br>
+<br>
+ */<br>
+<br>
+#include &lt;sys/sysinfo.h&gt;<br>
+#include &quot;lapi/namespaces_constants.h&quot;<br>
+#include &quot;tst_test.h&quot;<br>
+<br>
+static int offsets[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A010,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A03600,<br>
+};<br>
+<br>
+static long read_proc_uptime(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long sec, sec_rem;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_SCANF(&quot;/proc/uptime&quot;, &quot=
;%li.%li&quot;, &amp;sec, &amp;sec_rem);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return sec + (sec_rem ? 1 : 0);<br>
+}<br>
+<br>
+static void verify_sysinfo(unsigned int n)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sysinfo si;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long uptime;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int off =3D offsets[n];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_UNSHARE(CLONE_NEWTIME);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SAFE_FILE_PRINTF(&quot;/proc/self/timens_offse=
ts&quot;, &quot;%d %d 0&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CLOCK_BOOTTIME, off);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sysinfo(&amp;si);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uptime =3D si.uptime;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!SAFE_FORK()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysinfo(&amp;si);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long proc_uptime =
=3D read_proc_uptime();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long diff =3D si.up=
time - uptime;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (diff &lt; off |=
| diff &gt; off + 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL, &quot;Wrong sysinfo uptime offset %li&quot;, diff)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TPASS, &quot;Correct sysinfo uptime offset %i&quot;, off)=
;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (si.uptime &lt; =
proc_uptime || si.uptime &gt; proc_uptime + 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TFAIL, &quot;/proc/uptime %li differs from sysinfo %li&qu=
ot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0proc_uptime, si.uptime);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_res(TPASS, &quot;/proc/uptime is consistent with sysinfo&quot=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static struct tst_test test =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tcnt =3D ARRAY_SIZE(offsets),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test =3D verify_sysinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.forks_child =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_kconfigs =3D (const char *[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;CONFIG_TIME_N=
S=3Dy&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_default=
" style=3D"font-size:small">Shouldn&#39;t end with &#39;NULL&#39; in kconfi=
g struct?</div><div class=3D"gmail_default" style=3D"font-size:small">If no=
t that will mislead arrary_len to recognise wrong number of arrry(cnt) and =
caused segmentation fault in test.</div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">A comma is required here ^, otherw=
ise it&#39;d be failing in the build phase.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.tags =3D (const struct tst_tag[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;linux-git&qu=
ot;, &quot;ecc421e05bab&quot;},<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Ending with &#39;{}&#39; in=
 tags struct? </div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+};<br>
-- <br>
2.24.1<br>
<br>
<br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--0000000000009bc12705a1307faf--


--===============0147983814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0147983814==--

