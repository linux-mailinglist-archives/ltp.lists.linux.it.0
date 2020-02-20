Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5AC1657AD
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:35:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E8BF93C223A
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:35:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F14C53C07D0
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:35:01 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D6C0B600839
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:35:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582180499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IgQfKdDPqKxXSQhFjJIP4lITD5qs7vKlldJNUbjFSHw=;
 b=L/qYqNclwBX/iU5OCVY0JxD9VVARpWHulZSEl1Q/KNdbvjub9M8sTXjL029BAzaqh/64RK
 ZeNobhlm2gORvG1QGl58bJWYoD3yaTWla8ye3RPECilqnKLYCuKt9yDkaqJwWmrzmBFgOH
 brkbXEMrJkTZ0/cC29/Y2vGhmpbCUw8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-Aeg-GBDJNjevoS2VQAxOwg-1; Thu, 20 Feb 2020 01:34:57 -0500
Received: by mail-ot1-f69.google.com with SMTP id t10so1641435otc.9
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 22:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HV7oqXJXiAl8+VgEcI0P/bjwA7ZuIu776IvHf6ifTnY=;
 b=QSUoXKlrhRWlHs6aSOE9x9pIVVWTmi9MX5uzWinlN2RNNQ80/BkhnwdBaRXjatkthc
 2c1DnKbRMnUV44u75iwPxPg8Nt1v2DHzqM+FIA9lb05HyAj3ariSnBT3gOhXkVMAqqE3
 GZ7f50DKuwBGE7/3jH17TXCfKWSPwtF2J/wg6A6CGJlYeFQXLGOKCS+QHUzf7YlMxbA6
 uUsiskhX3jFZgKiKNySHFkbKh6panFmkJSCeF8ZUjN91qgGsyqaLDTA06kY/+i0EJVtB
 m7+czWTDZneB1PHcI2EOGpP4snaZRLhG12adIeUnum61AK+1ezFCMq6FwWZOIT0BNFJB
 Pspg==
X-Gm-Message-State: APjAAAX0qz9grIY1AXEVyKnsQE3oh3DRCksEARBVWuXkakyCCNgLlcnj
 NrMXGJwC17rS/K+jCCc+BnoMDwS+EfDs8T3ceqsHwByhKFmUzGWXShSEmQC+Op1tv5gJW7l+JT7
 KXAi91US2R7kmA25G5c7/0uSQDv0=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr921775oia.153.1582180496040; 
 Wed, 19 Feb 2020 22:34:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrpIfZ9hn27NblJje8SshJFy0KzouKw0NNSeUphLTCn9O8yD2wWdV/X44M7cmkdxxd9AA2u6KQPuzfhAbUlBM=
X-Received: by 2002:aca:4b0f:: with SMTP id y15mr921761oia.153.1582180495714; 
 Wed, 19 Feb 2020 22:34:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <9706f359006ea409d2f85c111d3e001ca6f6d128.1582104018.git.viresh.kumar@linaro.org>
In-Reply-To: <9706f359006ea409d2f85c111d3e001ca6f6d128.1582104018.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 14:34:44 +0800
Message-ID: <CAEemH2cG-OCNmAybYOebbmr=HNoSQ-gBsd7xa9ANGPiOXEHyDg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: Aeg-GBDJNjevoS2VQAxOwg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 06/10] syscalls/fsmount: Improve fsmount01 test
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
Content-Type: multipart/mixed; boundary="===============1894689472=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1894689472==
Content-Type: multipart/alternative; boundary="0000000000006b0748059efc1aa0"

--0000000000006b0748059efc1aa0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar <viresh.kumar@linaro.org>
wrote:

> This patch updates the fsmount01.c file to make it look similar to all
> other fsmount related syscall tests and here is the list of all changes:
>
> - Test all fsmount flags and mount attributes
> - Remove extra PASS messages as all we want to test here is fsmount()
>   and not other syscalls.
> - On the same lines, print TFAIL for fsmount() syscall and TBROK for
>   other calls.
> - close sfd on failures
> - Make the file look similar to other fsmount related tests
> - General cleanup
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  testcases/kernel/syscalls/fsmount/fsmount01.c | 92 ++++++++++++-------
>  1 file changed, 60 insertions(+), 32 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c
> b/testcases/kernel/syscalls/fsmount/fsmount01.c
> index c3cf8106f63b..b746a14ba472 100644
> --- a/testcases/kernel/syscalls/fsmount/fsmount01.c
> +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
> @@ -3,67 +3,95 @@
>   * Copyright (C) 2020 Red Hat, Inc.  All rights reserved.
>   * Author: Zorro Lang <zlang@redhat.com>
>   *
> - * Use new mount API from v5.2 (fsopen(), fsconfig(), fsmount(),
> move_mount())
> - * to mount a filesystem without any specified mount options.
> + * Description:
> + * Basic fsmount() test.
>   */
>
> -#include <sys/mount.h>
> -
>  #include "tst_test.h"
>  #include "lapi/fsmount.h"
>
> -#define MNTPOINT "newmount_point"
> -static int sfd, mfd, is_mounted;
> +#define MNTPOINT       "mntpoint"
> +
> +static struct tcase {
> +       char *name;
> +       unsigned int flags;
> +       unsigned int mount_attrs;
> +} tcases[] =3D {
> +       {"Flag 0, attr RDONLY", 0, MOUNT_ATTR_RDONLY},
> +       {"Flag 0, attr NOSUID", 0, MOUNT_ATTR_NOSUID},
> +       {"Flag 0, attr NODEV", 0, MOUNT_ATTR_NODEV},
> +       {"Flag 0, attr NOEXEC", 0, MOUNT_ATTR_NOEXEC},
> +       {"Flag 0, attr RELATIME", 0, MOUNT_ATTR_RELATIME},
> +       {"Flag 0, attr NOATIME", 0, MOUNT_ATTR_NOATIME},
> +       {"Flag 0, attr STRICTATIME", 0, MOUNT_ATTR_STRICTATIME},
> +       {"Flag 0, attr NODIRATIME", 0, MOUNT_ATTR_NODIRATIME},
> +       {"Flag CLOEXEC, attr RDONLY", FSMOUNT_CLOEXEC, MOUNT_ATTR_RDONLY}=
,
> +       {"Flag CLOEXEC, attr NOSUID", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOSUID}=
,
> +       {"Flag CLOEXEC, attr NODEV", FSMOUNT_CLOEXEC, MOUNT_ATTR_NODEV},
> +       {"Flag CLOEXEC, attr NOEXEC", FSMOUNT_CLOEXEC, MOUNT_ATTR_NOEXEC}=
,
> +       {"Flag CLOEXEC, attr RELATIME", FSMOUNT_CLOEXEC,
> MOUNT_ATTR_RELATIME},
> +       {"Flag CLOEXEC, attr NOATIME", FSMOUNT_CLOEXEC,
> MOUNT_ATTR_NOATIME},
> +       {"Flag CLOEXEC, attr STRICTATIME", FSMOUNT_CLOEXEC,
> MOUNT_ATTR_STRICTATIME},
> +       {"Flag CLOEXEC, attr NODIRATIME", FSMOUNT_CLOEXEC,
> MOUNT_ATTR_NODIRATIME},
> +};
>

Again, if you move the 'Flag & attr' to print info, this patch looks pretty
good to me.

> +       if (!tst_ismount(MNTPOINT))
> +               tst_res(TPASS, "%s: fsmount() passed", tc->name);
>

What about:
        tst_res(TPASS, "'Flag & mount_attr: %s': fsmount() passed",
tc->name);

--=20
Regards,
Li Wang

--0000000000006b0748059efc1aa0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 19, 2020 at 5:28 PM Viresh Kumar &lt;<a=
 href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch =
updates the fsmount01.c file to make it look similar to all<br>
other fsmount related syscall tests and here is the list of all changes:<br=
>
<br>
- Test all fsmount flags and mount attributes<br>
- Remove extra PASS messages as all we want to test here is fsmount()<br>
=C2=A0 and not other syscalls.<br>
- On the same lines, print TFAIL for fsmount() syscall and TBROK for<br>
=C2=A0 other calls.<br>
- close sfd on failures<br>
- Make the file look similar to other fsmount related tests<br>
- General cleanup<br>
<br>
Signed-off-by: Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" =
target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
---<br>
=C2=A0testcases/kernel/syscalls/fsmount/fsmount01.c | 92 ++++++++++++------=
-<br>
=C2=A01 file changed, 60 insertions(+), 32 deletions(-)<br>
<br>
diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kern=
el/syscalls/fsmount/fsmount01.c<br>
index c3cf8106f63b..b746a14ba472 100644<br>
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c<br>
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c<br>
@@ -3,67 +3,95 @@<br>
=C2=A0 * Copyright (C) 2020 Red Hat, Inc.=C2=A0 All rights reserved.<br>
=C2=A0 * Author: Zorro Lang &lt;<a href=3D"mailto:zlang@redhat.com" target=
=3D"_blank">zlang@redhat.com</a>&gt;<br>
=C2=A0 *<br>
- * Use new mount API from v5.2 (fsopen(), fsconfig(), fsmount(), move_moun=
t())<br>
- * to mount a filesystem without any specified mount options.<br>
+ * Description:<br>
+ * Basic fsmount() test.<br>
=C2=A0 */<br>
<br>
-#include &lt;sys/mount.h&gt;<br>
-<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;lapi/fsmount.h&quot;<br>
<br>
-#define MNTPOINT &quot;newmount_point&quot;<br>
-static int sfd, mfd, is_mounted;<br>
+#define MNTPOINT=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;mntpoint&quot;<br>
+<br>
+static struct tcase {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int mount_attrs;<br>
+} tcases[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr RDONLY&quot;, 0, MOUNT_ATTR=
_RDONLY},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr NOSUID&quot;, 0, MOUNT_ATTR=
_NOSUID},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr NODEV&quot;, 0, MOUNT_ATTR_=
NODEV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr NOEXEC&quot;, 0, MOUNT_ATTR=
_NOEXEC},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr RELATIME&quot;, 0, MOUNT_AT=
TR_RELATIME},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr NOATIME&quot;, 0, MOUNT_ATT=
R_NOATIME},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr STRICTATIME&quot;, 0, MOUNT=
_ATTR_STRICTATIME},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag 0, attr NODIRATIME&quot;, 0, MOUNT_=
ATTR_NODIRATIME},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr RDONLY&quot;, FSMOUNT=
_CLOEXEC, MOUNT_ATTR_RDONLY},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr NOSUID&quot;, FSMOUNT=
_CLOEXEC, MOUNT_ATTR_NOSUID},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr NODEV&quot;, FSMOUNT_=
CLOEXEC, MOUNT_ATTR_NODEV},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr NOEXEC&quot;, FSMOUNT=
_CLOEXEC, MOUNT_ATTR_NOEXEC},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr RELATIME&quot;, FSMOU=
NT_CLOEXEC, MOUNT_ATTR_RELATIME},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr NOATIME&quot;, FSMOUN=
T_CLOEXEC, MOUNT_ATTR_NOATIME},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr STRICTATIME&quot;, FS=
MOUNT_CLOEXEC, MOUNT_ATTR_STRICTATIME},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag CLOEXEC, attr NODIRATIME&quot;, FSM=
OUNT_CLOEXEC, MOUNT_ATTR_NODIRATIME},<br>
+};<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Again, if you move the &#39;Flag &amp; attr&#39; to print in=
fo, this patch looks pretty good to me.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tst_ismount(MNTPOINT))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quo=
t;%s: fsmount() passed&quot;, tc-&gt;name);<br></blockquote><div>=C2=A0</di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">What about:</=
div></div><div><span class=3D"gmail_default" style=3D"font-size:small">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPASS, &quot;&#39;Flag &amp; mount_attr: %=
s&#39;: fsmount() passed&quot;, tc-&gt;name);</span></div></div><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div=
>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000006b0748059efc1aa0--


--===============1894689472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1894689472==--

