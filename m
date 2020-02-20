Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C771658DA
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:57:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE4663C25C6
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:57:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C70163C12AE
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:57:24 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 324B0600699
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582185441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0qxSKLhFrTVMe9sFmx1TYSrXXHtWuVA+Rc1qmK5y6EY=;
 b=eAmsqc90YahdRiO9xrCy4XlisWe5va7dBnIKczMygxMyC9oZlLDROU/6dhnoGdZO2gemDM
 H5ULtb2cV3vVvea3V6Xass/rH4lThDWkpmamuiQ43DIDs9K+xiN92r0yQ7zkyhl9+SwdvH
 QWUpJrTYDX0s4UMYznUoycdfS3DZIeQ=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-bMHR9bUCNO2SnU3JpWHb7w-1; Thu, 20 Feb 2020 02:57:17 -0500
Received: by mail-oi1-f197.google.com with SMTP id 16so3569827oii.18
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 23:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=obOR3ctFar5QxWmGv987Kr4q2BAGohruVAqFUl6i05E=;
 b=JMS86YJYWLAUycYJInzpCV7Yp/bUFEAtfcyfpPsvMlmVGiDb/69jUNr9aEprIQhiKW
 f/W/YHn9ppVujXZ2NOjSL344OO62pVUA/WngmH20sUP3xvpLcBngKHS0XFPNi02QoosF
 z3+ab7RgNcyIuLzWWmLWxJ09hYsjtXXpFdBHiwInso/lmZuourxmo0MD3L2grbph5wTJ
 4uT8U6Otn3ap0iFKvRuFghGjjDtQaT0SzAY3rfufP5TSgTeglCE2Vw6DyoZLnzJ2QjS1
 gy9BGOB8h0daz1cwcnr+cps0ndVJ5NkWpkbomOhHMgbRpUEwfnUapTxqqOpadTRCwn2J
 xCdg==
X-Gm-Message-State: APjAAAWhO7w6osTGFu91LxEcjiTuYSWTqZFgKkohcRJc1YTVpOLGSPQB
 3EBdYT+NEeuFQtfzdMUe13NfTWIjZHptrIKUHj/p/dAA1cUBjIG+wEL2Rllx3iS3tfVy3vsMkvu
 OHRKA63/EKEtk/glZC9Axt+dvnnI=
X-Received: by 2002:a9d:7:: with SMTP id 7mr21590767ota.26.1582185435678;
 Wed, 19 Feb 2020 23:57:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGTtARo1ImdfoB3n8c6yPKQAXI+ffH2dhhoyGI0QkMklXXRfn+hOlQ/eMTLgA2EF5uC1guOa4R2GZ2zBwQCa8=
X-Received: by 2002:a9d:7:: with SMTP id 7mr21590751ota.26.1582185435436; Wed,
 19 Feb 2020 23:57:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <7195b2e7ffcda3ba70715b9094cff450568d9298.1582104018.git.viresh.kumar@linaro.org>
In-Reply-To: <7195b2e7ffcda3ba70715b9094cff450568d9298.1582104018.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 15:57:04 +0800
Message-ID: <CAEemH2dUQ_NdJWNTBgh=i0sLY+VzgwFmfCXNqiKeeh2YZDw4_A@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: bMHR9bUCNO2SnU3JpWHb7w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 09/10] syscalls/fspick: New tests
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
Content-Type: multipart/mixed; boundary="===============0684869008=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0684869008==
Content-Type: multipart/alternative; boundary="000000000000d92c2f059efd40fd"

--000000000000d92c2f059efd40fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Viresh Kumar <viresh.kumar@linaro.org> wrote:

> ...
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fspick/fspick01.c
> ...
> +
> +static void run(unsigned int n)
> +{
> +       struct tcase *tc =3D &tcases[n];
> +       int fspick_fd;
> +
> +       TEST(fspick(AT_FDCWD, MNTPOINT, tc->flags));
> +       if (TST_RET =3D=3D -1)
> +               tst_brk(TFAIL | TERRNO, "fspick() failed");
> +
> +       fspick_fd =3D TST_RET;
> +
> +       TEST(fsconfig(fspick_fd, FSCONFIG_SET_STRING, "user_xattr",
> "false", 0));
> +       if (TST_RET =3D=3D -1) {
> +               SAFE_CLOSE(fspick_fd);
> +               tst_brk(TBROK | TERRNO, "fsconfig() failed");
>
Test kernel: 5.6.0-rc2+ x86_64

tst_test.c:1278: INFO: Testing on xfs
tst_mkfs.c:90: INFO: Formatting /dev/loop3 with xfs opts=3D'' extra opts=3D=
''
tst_test.c:1217: INFO: Timeout per run is 0h 05m 00s
fspick01.c:90: BROK: fsconfig() failed: EINVAL (22)


> +       }
> +
> +       TEST(fsconfig(fspick_fd, FSCONFIG_SET_FLAG, "ro", NULL, 0));
> +       if (TST_RET =3D=3D -1) {
> +               SAFE_CLOSE(fspick_fd);
> +               tst_brk(TBROK | TERRNO, "fsconfig() failed");
> +       }
> +
> +       SAFE_CLOSE(fspick_fd);
> +       tst_res(TPASS, "%s: fspick() passed", tc->name);
> +}
>

--=20
Regards,
Li Wang

--000000000000d92c2f059efd40fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" target=3D"_=
blank">viresh.kumar@linaro.org</a>&gt; wrote:<br></div></div><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=
=3D"gmail_default" style=3D"font-size:small">...</span><br>
--- /dev/null<br>
+++ b/testcases/kernel/syscalls/fspick/fspick01.c<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+<br>
+static void run(unsigned int n)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct tcase *tc =3D &amp;tcases[n];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int fspick_fd;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fspick(AT_FDCWD, MNTPOINT, tc-&gt;flags));=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TFAIL | TER=
RNO, &quot;fspick() failed&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fspick_fd =3D TST_RET;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fspick_fd, FSCONFIG_SET_STRING, &=
quot;user_xattr&quot;, &quot;false&quot;, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fspick_f=
d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;fsconfig() failed&quot;);<br></blockquote><div><span class=3D"gm=
ail_default" style=3D"font-size:small"></span></div><div><span class=3D"gma=
il_default" style=3D"font-size:small">Test kernel: 5.6.0-rc2+ x86_64</span>=
</div><div><span class=3D"gmail_default" style=3D"font-size:small"></span>=
=C2=A0</div><div><span class=3D"gmail_default" style=3D"font-size:small"></=
span>tst_test.c:1278: INFO: Testing on xfs</div>tst_mkfs.c:90: INFO: Format=
ting /dev/loop3 with xfs opts=3D&#39;&#39; extra opts=3D&#39;&#39;<br>tst_t=
est.c:1217: INFO: Timeout per run is 0h 05m 00s<br>fspick01.c:90: BROK: fsc=
onfig() failed: EINVAL (22)<br><div><span class=3D"gmail_default" style=3D"=
font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(fsconfig(fspick_fd, FSCONFIG_SET_FLAG, &qu=
ot;ro&quot;, NULL, 0));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fspick_f=
d);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;fsconfig() failed&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fspick_fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res(TPASS, &quot;%s: fspick() passed&quot;,=
 tc-&gt;name);<br>
+}<br></blockquote><div>=C2=A0</div></div>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000d92c2f059efd40fd--


--===============0684869008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0684869008==--

