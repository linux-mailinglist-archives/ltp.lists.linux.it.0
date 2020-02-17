Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C2811160CBA
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:17:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92A073C23DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 09:17:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id CA84C3C23A6
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:17:44 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 6EA04600B8D
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 09:17:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581927461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3l4E7ySpsDB6bwyqmNAOCPrkbhAc6kVzADb4U9i/fDU=;
 b=gXttisVCWU5ik+7LFJ8WA7LUb7ws46epSwkLhYKr5WHwpj1xrPxncKfAbOjZpunLlejDym
 kJHRoBqONTsK/pUrE6TCmrzS2jQsJcyYW8OxuYJTsK/3R1D6EqyYezN7NfGyZsdzoptZvC
 GguvOlZiWHWdwwxrvW3BfBd4CRZCR+8=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-G2ne5rniOx61HuBsZ_SOzQ-1; Mon, 17 Feb 2020 03:17:40 -0500
Received: by mail-ot1-f69.google.com with SMTP id m18so10119060otp.20
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 00:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3l4E7ySpsDB6bwyqmNAOCPrkbhAc6kVzADb4U9i/fDU=;
 b=AQDp9e6DkdNcCx/m+eVMYWsldwSrlImwddSasahSjkY42C418jLEHBBD4wD4oeV9/j
 4/rHF+X+SzkEfsXCRBRv6J0X8BTIO2UxCplOMYK8vMrAvhXQql/aIOvZUKEOcQStQZyz
 Q8hSVY+UmRDoLCskTU/F1L+Op8x6eEgCTJ9NGWA7Rv1h+nwLnnrjV6e31lX8113BVpdA
 lEc6qUplkpSMbR5WtBXAwfif2wtChtERAEKYgv9kMHTQmOZ/N2REFS4lhDHRCm9hpsN7
 eZkDthq33xfyYOEqLMUnow7VxgsoB2oHPvI9r5Ar8pdXIM77e4jjfUoLuvkZ8hxqsA0Z
 OuOw==
X-Gm-Message-State: APjAAAXBzyglybcvCyxjxz/R0DsrM0pCPf0NTYfmT3lTmmMXUmUo9VC5
 kh4Cu9OMqE5/Oi4aP00wijhQcu+Uup7AVfUF46mt6e3SUb7j5dmBkTa2li6t3iQtcznQb9Bt3Jc
 MBLc1X3vDHtMWHK/K/cydTOcB5r8=
X-Received: by 2002:a9d:395:: with SMTP id f21mr11384650otf.67.1581927458983; 
 Mon, 17 Feb 2020 00:17:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGX+N3JWMCnjBlphIE6vzVXAmKeu3D8zVRV8rnHsd9LGTCgsuNPJFDEYuvkSprKR3BR2FSVuNEhQFFSxYti6s=
X-Received: by 2002:a9d:395:: with SMTP id f21mr11384631otf.67.1581927458465; 
 Mon, 17 Feb 2020 00:17:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
In-Reply-To: <1c61c673a02152c30edac0e25438257c23c3322e.1581680021.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Mon, 17 Feb 2020 16:17:27 +0800
Message-ID: <CAEemH2f2pR1KhLAoKKphzh9fP++yyALbv4TiAh=4Vyv0M3SEdw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: G2ne5rniOx61HuBsZ_SOzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/7] syscalls/fsmount: New tests
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
Content-Type: multipart/mixed; boundary="===============1460641116=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1460641116==
Content-Type: multipart/alternative; boundary="00000000000038fbb0059ec130c6"

--00000000000038fbb0059ec130c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Viresh Kumar <viresh.kumar@linaro.org> wrote:

....
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
> + * Basic fsmount() test.
> + */
> +#include "tst_test.h"
> +#include "lapi/fsmount.h"
>

Adding #include "lapi/fcntl.h" in case of =E2=80=98AT_FDCWD=E2=80=99 undecl=
ared. It seems
we have to do this for all the tests involves  =E2=80=98AT_FDCWD=E2=80=99.

+
> +static void run(void)
> +{
> ...
> +
> +       TEST(fsmount(fd, 0, 0));
>

As this fsmount01.c is duplicated with zlang@'s patch, I suggest rewriting
an enhancement version maybe name fsmount02.c to cover more fsmount
attributes. Since it is named basic fsmount() test, it shouldn't only test
fsmount(fd, 0, 0), right?

+#define MOUNT_ATTR_RDONLY      0x00000001 /* Mount read-only */
+#define MOUNT_ATTR_NOSUID      0x00000002 /* Ignore suid and sgid bits */
+#define MOUNT_ATTR_NODEV       0x00000004 /* Disallow access to device
special files */
+#define MOUNT_ATTR_NOEXEC      0x00000008 /* Disallow program execution */
+#define MOUNT_ATTR__ATIME      0x00000070 /* Setting on how atime should
be updated */
+#define MOUNT_ATTR_RELATIME    0x00000000 /* - Update atime relative to
mtime/ctime. */
+#define MOUNT_ATTR_NOATIME     0x00000010 /* - Do not update access times.
*/
+#define MOUNT_ATTR_STRICTATIME 0x00000020 /* - Always perform atime
updates */
+#define MOUNT_ATTR_NODIRATIME  0x00000080 /* Do not update directory
access times */



> +       if (TST_RET =3D=3D -1)
> +               tst_brk(TFAIL | TERRNO, "fsmount() failed");
> +
> +       fsmfd =3D TST_RET;
> +
> +       TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> +                       MOVE_MOUNT_F_EMPTY_PATH));
> +       SAFE_CLOSE(fsmfd);
>

I guess we probably need a way to verify the move_mount() does work. The
function ismount() in zlang@'s patch could be extracted into the library as
tst_ismount() for all of these tests.
@Petr Vorel <pvorel@suse.cz>  WDT?


> +
> +       if (TST_RET =3D=3D -1)
> +               tst_brk(TBROK | TERRNO, "move_mount() failed");
> +
> +       SAFE_CLOSE(TST_RET);
> +       TEST(umount(MNTPOINT));
>

SAFE_UMOUNT(MNTPOINT);

+
> +       tst_res(TPASS, "fsmount() passed");
> +}
> +
> +static struct tst_test test =3D {
>

Suggest referring to my previous comments for this part.

+       .min_kver =3D "5.2",
> +       .test_all =3D run,
> +       .setup =3D setup,
> +       .cleanup =3D cleanup,
> +       .needs_root =3D 1,
> +       .needs_tmpdir =3D 1,
> +       .format_device =3D 1,
> +       .mntpoint =3D MNTPOINT,
> +};
>

--=20
Regards,
Li Wang

--00000000000038fbb0059ec130c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.=
org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt; wrote:<br></div><div=
 dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">=
....</span><br>
+/*<br>
+ * Copyright (c) 2020 Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@lina=
ro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<br>
+ *<br>
+ * Description:<br>
+ * Basic fsmount() test.<br>
+ */<br>
+#include &quot;tst_test.h&quot;<br>
+#include &quot;lapi/fsmount.h&quot;<br></blockquote><div><span class=3D"gm=
ail_default" style=3D"font-size:small"><br></span></div><div><span class=3D=
"gmail_default" style=3D"font-size:small">Adding #</span>include=C2=A0&quot=
;lapi/fcntl.h&quot;<span class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0in case of=C2=A0</span>=E2=80=98AT_FDCWD=E2=80=99 undeclared<span cla=
ss=3D"gmail_default" style=3D"font-size:small">. It seems we have to do thi=
s for all the tests involves=C2=A0 =E2=80=98AT_FDCWD=E2=80=99.</span></div>=
<div><span class=3D"gmail_default"></span><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
+<br>
+static void run(void)<br>
+{<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsmount(fd, 0, 0));<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">As thi=
s fsmount01.c is duplicated with zlang@&#39;s patch, I suggest rewriting an=
 enhancement version maybe name fsmount02.c to cover more fsmount attribute=
s. Since it is named basic fsmount() test, it shouldn&#39;t only test fsmou=
nt(fd, 0, 0), right?</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">+#de=
fine MOUNT_ATTR_RDONLY =C2=A0 =C2=A0 =C2=A00x00000001 /* Mount read-only */=
<br>+#define MOUNT_ATTR_NOSUID =C2=A0 =C2=A0 =C2=A00x00000002 /* Ignore sui=
d and sgid bits */<br>+#define MOUNT_ATTR_NODEV =C2=A0 =C2=A0 =C2=A0 0x0000=
0004 /* Disallow access to device special files */<br>+#define MOUNT_ATTR_N=
OEXEC =C2=A0 =C2=A0 =C2=A00x00000008 /* Disallow program execution */<br>+#=
define MOUNT_ATTR__ATIME =C2=A0 =C2=A0 =C2=A00x00000070 /* Setting on how a=
time should be updated */<br>+#define MOUNT_ATTR_RELATIME =C2=A0 =C2=A00x00=
000000 /* - Update atime relative to mtime/ctime. */<br>+#define MOUNT_ATTR=
_NOATIME =C2=A0 =C2=A0 0x00000010 /* - Do not update access times. */<br>+#=
define MOUNT_ATTR_STRICTATIME 0x00000020 /* - Always perform atime updates =
*/<br>+#define MOUNT_ATTR_NODIRATIME =C2=A00x00000080 /* Do not update dire=
ctory access times */<br></div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TFAIL | TER=
RNO, &quot;fsmount() failed&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fsmfd =3D TST_RET;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(move_mount(fsmfd, &quot;&quot;, AT_FDCWD, =
MNTPOINT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MOVE_MOUNT_F_EMPTY_PATH));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fsmfd);<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">I guess we p=
robably need a way to verify the move_mount() does work. The function ismou=
nt() in zlang@&#39;s patch could be extracted=C2=A0into the library as tst_=
ismount() for all of these tests.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><a class=3D"gmail_plusreply" id=3D"m_-5960756315931134=
695plusReplyChip-0" href=3D"mailto:pvorel@suse.cz" target=3D"_blank">@Petr =
Vorel</a>=C2=A0 WDT?<br></div></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;move_mount() failed&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(TST_RET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(umount(MNTPOINT));<br></blockquote><div><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">SAFE_UMOUNT(=
MNTPOINT);</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small"></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;fsmount() passed&quot;);<b=
r>
+}<br>
+<br>
+static struct tst_test test =3D {<br></blockquote><div>=C2=A0</div><div><s=
pan class=3D"gmail_default" style=3D"font-size:small">Suggest=C2=A0referrin=
g to my previous comments for this part.</span>=C2=A0</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.min_kver =3D &quot;5.2&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.test_all =3D run,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.setup =3D setup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.cleanup =3D cleanup,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_root =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.needs_tmpdir =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.format_device =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.mntpoint =3D MNTPOINT,<br>
+};<br></blockquote><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000038fbb0059ec130c6--


--===============1460641116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1460641116==--

