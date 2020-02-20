Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAA8165855
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:26:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDB613C25C0
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 08:26:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 951603C12AE
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:26:06 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 458AC10005F8
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 08:24:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582183564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aeBo3pWnf7YtOZH/W5nmm6fDAWDod8m2AWSHJWKFTyI=;
 b=PfQzGqv0oe+1HHCoUUH1vLm0h4C5Sz4MHENjafcKco7WUTa4dB9sUXg/8maiwvi88VPXpb
 fWdtT3Oy3x4SPSLTAuYBOwHh7xeEl+HIR+OYQUHPYFL6hgMEenVxEmeWCr7Yxk2Xr2rGjy
 rh1f9o8EMExZaEqYBWoi58vHxKmtwsY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-Y1Vx7FizMyGKaKxL3h2rZw-1; Thu, 20 Feb 2020 02:26:00 -0500
Received: by mail-ot1-f70.google.com with SMTP id d16so1700200otf.5
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 23:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GhbGfWfaZ/ZvYZXQL4deLyXNwRW7ZDsOvxDwPNyNNPw=;
 b=W9dTqFlg/Q3txCIcCFowex35P807qHBcf5ZCjzV+W+mtPskZAB6ko2I734ZyLfhbNg
 9R0zU2ntGw186UIREk2Ygq3pDuhDaAC0GeaH2XZPrMtlIu9mppojWgyflAdW625C/xYE
 dnMBidtZYuGWPutHyD2iEBr7QT1zgibfNlTJbabBbaF35MPH/+R+T8PLBLfML81DYdsa
 i0HThsNTzb1Y5+T6AVFQ2Wq1NSyMHMOvQ2yuf97nAapI5OQkcpc1H5V83PqO5d8FOdQe
 2SyOHZre28kcYfIKqJ8nWhqQFgjqVFOd2P2E5312E12NNxwBgY/45Qu8HnFfPafqP4EG
 Oyrg==
X-Gm-Message-State: APjAAAVCeGnQIImKXK8wBGVjpH6k2eNl2HJHPl9FWW5rAmMKlGyXvvk7
 MMsoQdeVW/XDpFadAxYzEtdydYsTMRmAP3I3GRrPJMKhpq1jm8Emt9RnRA3pHxxi1iZRmW6O2P4
 hCBDz7HhjxG3t3o16vNj3YqP8RhA=
X-Received: by 2002:a9d:7:: with SMTP id 7mr21531324ota.26.1582183559285;
 Wed, 19 Feb 2020 23:25:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqw4cQhaldFWri3ENVSlBHgWfitcBe8PBUSQkMGLjyOicPhbOirWNx6mgwufoYYZDB8De+4WB9KPjkHByshHtRA=
X-Received: by 2002:a9d:7:: with SMTP id 7mr21531306ota.26.1582183559045; Wed,
 19 Feb 2020 23:25:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <da324ef2c06239f2cb7fc1eee436209e3bd2e35a.1582104018.git.viresh.kumar@linaro.org>
In-Reply-To: <da324ef2c06239f2cb7fc1eee436209e3bd2e35a.1582104018.git.viresh.kumar@linaro.org>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Feb 2020 15:25:47 +0800
Message-ID: <CAEemH2ee77jFMsEptSqy39giJ5aXTsOpsRWg1g+6vLr8kfJsFw@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-MC-Unique: Y1Vx7FizMyGKaKxL3h2rZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 10/10] syscalls/open_tree: New tests
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
Content-Type: multipart/mixed; boundary="===============0435335967=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0435335967==
Content-Type: multipart/alternative; boundary="00000000000001bba6059efcd1f0"

--00000000000001bba6059efcd1f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Viresh Kumar <viresh.kumar@linaro.org> wrote:

> ...
> +++ b/testcases/kernel/syscalls/open_tree/open_tree01.c
> ...
> +static struct tcase {
> +       char *name;
> +       unsigned int flags;
> +} tcases[] =3D {
> +       {"Flag OPEN_TREE_CLONE", OPEN_TREE_CLONE},
> +       {"Flag OPEN_TREE_CLOEXEC", OPEN_TREE_CLONE | OPEN_TREE_CLOEXEC},
> +};
>
=3D=3D> remove Flag


+++ b/testcases/kernel/syscalls/open_tree/open_tree02.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> ...
> +
> +       fsmfd =3D TST_RET;
> +       TEST(move_mount(fsmfd, "", AT_FDCWD, MNTPOINT,
> +                       MOVE_MOUNT_F_EMPTY_PATH));
> +       SAFE_CLOSE(fsmfd);
> +
> +       if (TST_RET =3D=3D -1)
> +               tst_brk(TBROK | TERRNO, "move_mount() failed");
> +
>

+       ismounted =3D 1;

We need to set 'ismounted' variable to 1 here, otherwise, the test will
break at the second loop.

------Error log------
tst_test.c:1278: INFO: Testing on ext3
tst_mkfs.c:90: INFO: Formatting /dev/loop2 with ext3 opts=3D'' extra opts=
=3D''
mke2fs 1.44.6 (5-Mar-2019)
/dev/loop2 is mounted; will not make a filesystem here!
tst_mkfs.c:101: BROK: tst_test.c:831: mkfs.ext3 failed with 1
tst_device.c:222: WARN: ioctl(/dev/loop2, LOOP_CLR_FD, 0) no ENXIO for too
long
tst_tmpdir.c:330: WARN: tst_rmdir: rmobj(/tmp/SHZbDJ) failed:
unlink(/tmp/SHZbDJ/mntpoint) failed; errno=3D21: EISDIR

Summary:
passed   3
failed   0
skipped  0
warnings 0

--=20
Regards,
Li Wang

--00000000000001bba6059efcd1f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Viresh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.=
org">viresh.kumar@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><span class=3D"gmail_default" style=3D"font-siz=
e:small">...</span><br>
+++ b/testcases/kernel/syscalls/open_tree/open_tree01.c<br>
<span class=3D"gmail_default" style=3D"font-size:small">...</span><br>
+static struct tcase {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags;<br>
+} tcases[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag OPEN_TREE_CLONE&quot;, OPEN_TREE_CL=
ONE},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;Flag OPEN_TREE_CLOEXEC&quot;, OPEN_TREE_=
CLONE | OPEN_TREE_CLOEXEC},<br>
+};<br>
</blockquote><div><span class=3D"gmail_default" style=3D"font-size:small">=
=3D=3D&gt; remove Flag</span></div><div><span class=3D"gmail_default" style=
=3D"font-size:small"></span>=C2=A0</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
+++ b/testcases/kernel/syscalls/open_tree/open_tree02.c<br>
@@ -0,0 +1,104 @@<br>
+// SPDX-License-Identifier: GPL-2.0-or-later<br><span class=3D"gmail_defau=
lt" style=3D"font-size:small">...</span><br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fsmfd =3D TST_RET;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(move_mount(fsmfd, &quot;&quot;, AT_FDCWD, =
MNTPOINT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MOVE_MOUNT_F_EMPTY_PATH));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fsmfd);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TST_RET =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK | TER=
RNO, &quot;move_mount() failed&quot;);<br>
+<br></blockquote><div><span class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></span></div><div><span class=3D"gmail_default" style=3D"font-size:=
small">+ =C2=A0 =C2=A0 =C2=A0 ismounted =3D 1;</span></div><div><span class=
=3D"gmail_default" style=3D"font-size:small"><br></span></div><div><span cl=
ass=3D"gmail_default" style=3D"font-size:small">We need to set &#39;ismount=
ed&#39; variable to 1 here, otherwise, the test will break at the second lo=
op.</span></div><div><span class=3D"gmail_default" style=3D"font-size:small=
"></span></div><div><span class=3D"gmail_default" style=3D"font-size:small"=
><br></span></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">------Error log------</div></div><div><span class=3D"gmail_default" styl=
e=3D"font-size:small">tst_test.c:1278: INFO: Testing on ext3<br>tst_mkfs.c:=
90: INFO: Formatting /dev/loop2 with ext3 opts=3D&#39;&#39; extra opts=3D&#=
39;&#39;<br>mke2fs 1.44.6 (5-Mar-2019)<br>/dev/loop2 is mounted; will not m=
ake a filesystem here!<br>tst_mkfs.c:101: BROK: tst_test.c:831: mkfs.ext3 f=
ailed with 1<br>tst_device.c:222: WARN: ioctl(/dev/loop2, LOOP_CLR_FD, 0) n=
o ENXIO for too long<br>tst_tmpdir.c:330: WARN: tst_rmdir: rmobj(/tmp/SHZbD=
J) failed: unlink(/tmp/SHZbDJ/mntpoint) failed; errno=3D21: EISDIR<br></spa=
n></div><div><span class=3D"gmail_default" style=3D"font-size:small"><br></=
span></div><div class=3D"gmail_default" style=3D"font-size:small">Summary:<=
/div>passed =C2=A0 3<br>failed =C2=A0 0<br>skipped =C2=A00<br><div class=3D=
"gmail_default" style=3D"font-size:small">warnings 0</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div></div>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>L=
i Wang<br></div></div></div></div>

--00000000000001bba6059efcd1f0--


--===============0435335967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0435335967==--

