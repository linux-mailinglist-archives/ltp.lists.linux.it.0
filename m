Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B823EB64
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 12:21:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0468E3C31E5
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 12:21:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BA3F93C25BE
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 12:21:49 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id EE8BE1003772
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 12:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596795707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RI12W8gSCmQb/ViwUfp1W8QfAFLrOOK5zNfRAA3Knv8=;
 b=K8G380KRS2jF+Xa97VGQdUawp+8B61MuVmPXoyotV2sVES18YvEtotRiTtuq/gY1u6u2cb
 N1iF58weDr6ygaHqcutFgGGE6Y1jHUworD9vV0tN+pBMvomjCRrLYFYZxn3TK74NA2pwX8
 fgh9P4J6ZbtrAP7VLpVJ2kL90IEKMso=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-jFxWZq77MKy-sczfdIE5yg-1; Fri, 07 Aug 2020 06:21:45 -0400
X-MC-Unique: jFxWZq77MKy-sczfdIE5yg-1
Received: by mail-yb1-f199.google.com with SMTP id g127so2186033ybf.11
 for <ltp@lists.linux.it>; Fri, 07 Aug 2020 03:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RI12W8gSCmQb/ViwUfp1W8QfAFLrOOK5zNfRAA3Knv8=;
 b=NNCiT1vnv/OdEeT+j4YLvWg5ZaYxXGI1Uvaazw2KiSGnxQtuwNFbT8qa6i4p8kne5L
 CmIZobfJ4esxSdiUMa9cCpAsu1Ep6FrpFCvt05U8gfPvtBmbNlRs5Z0Pn7dqEyOel1tG
 qIXMJPufltZ+jAegLxVbzomFV0MnhqB8yJvD62kFLRN6zfA2xY6kufOw5w3VqYVDtHz6
 35jKN67prFdXolsO2faB8raPORdhtKb8AbnzkWn7XkNhiE0StjRyubgBkgUxdLCxbyDX
 j+tNR/1jiBFHoWXkMEmSZup79MYnVbC9RidcQPMXbJfH2VDRqBiCn+Wgc3Kwm9jUXlig
 EweQ==
X-Gm-Message-State: AOAM530hfbkMUZAPMnRrtms4iUb7AMTvTwB8cpnea+tVGC314JJnJwXx
 697YFmGIKCed1sK5bZctYtKt0MutRVit0Od0q1CNxshOGgvZomC5a/TVzFehVsWR4Ku6VzzUtgc
 cc4V3ZMZ4R0ykQY/Tl+AEHSNPr3Y=
X-Received: by 2002:a25:7708:: with SMTP id s8mr20737644ybc.86.1596795704352; 
 Fri, 07 Aug 2020 03:21:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCwDo8XkaaeOcl1T6uy6vWKb8dovE1gvsB7JQbPdQC3eSAhbdgF3w2DQo97c8wL8gIc3isSbodqWUs6wSOseE=
X-Received: by 2002:a25:7708:: with SMTP id s8mr20737627ybc.86.1596795704117; 
 Fri, 07 Aug 2020 03:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <1596793326-21639-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1596793326-21639-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 7 Aug 2020 18:21:32 +0800
Message-ID: <CAEemH2d7+05ZT7UwePjtOuDKws-kK-5kt5LbyzV_zicFp51z2A@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_cgroup: Reset cgroup.clone_children value
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
Content-Type: multipart/mixed; boundary="===============0963913070=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0963913070==
Content-Type: multipart/alternative; boundary="000000000000b9223505ac46f8fe"

--000000000000b9223505ac46f8fe
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 7, 2020 at 5:42 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> When running cgroup test cases(like cpuset01 or oom05) about cpuset
> subsystem
> firstly, then cpuset_inherit case will fail because the value of
> cgroup.clone_children has been changed into 1 on cgroup-v1. Reset this
> value
> when calling tst_cgroupN_umount.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  lib/tst_cgroup.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> index 9459f7ea0..764951afa 100644
> --- a/lib/tst_cgroup.c
> +++ b/lib/tst_cgroup.c
> @@ -9,6 +9,8 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <sys/mount.h>
> +#include <fcntl.h>
> +#include <unistd.h>
>
>  #include "tst_test.h"
>  #include "tst_safe_macros.h"
> @@ -123,6 +125,7 @@ static void tst_cgroupN_umount(const char *mnt_path,
> const char *new_path)
>         FILE *fp;
>         int fd;
>         char s_new[BUFSIZ], s[BUFSIZ], value[BUFSIZ];
> +       char knob_path[PATH_MAX];
>
>         if (!tst_is_mounted(mnt_path))
>                 return;
> @@ -151,6 +154,11 @@ static void tst_cgroupN_umount(const char *mnt_path,
> const char *new_path)
>                             != (ssize_t)strlen(value) - 1)
>                                 tst_res(TWARN | TERRNO, "write %s", s);
>         }
> +       if (tst_cg_ver & TST_CGROUP_V1) {
>

To recognize cgroup_v1 is not enough here, because it will
be failed "with no such cgroup.clone_children file" on MEMCG umount if the
system no CPUSET mounting.

Maybe a smart way is to save the cgroup.clone_children value, restore it if
it has been changed in the setup phase. What do u think?



> +               sprintf(knob_path, "%s/cgroup.clone_children", mnt_path);
> +               if (!access(knob_path, F_OK))
> +                       SAFE_FILE_PRINTF(knob_path, "%d", 0);
> +       }
>         if (fd != -1)
>                 close(fd);
>         if (fp != NULL)
> --
> 2.23.0
>
>
>
>

-- 
Regards,
Li Wang

--000000000000b9223505ac46f8fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 7, 2020 at 5:42 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When r=
unning cgroup test cases(like cpuset01 or oom05) about cpuset subsystem<br>
firstly, then cpuset_inherit case will fail because the value of<br>
cgroup.clone_children has been changed into 1 on cgroup-v1. Reset this valu=
e<br>
when calling tst_cgroupN_umount.<br>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" =
target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0lib/tst_cgroup.c | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br>
index 9459f7ea0..764951afa 100644<br>
--- a/lib/tst_cgroup.c<br>
+++ b/lib/tst_cgroup.c<br>
@@ -9,6 +9,8 @@<br>
=C2=A0#include &lt;stdio.h&gt;<br>
=C2=A0#include &lt;stdlib.h&gt;<br>
=C2=A0#include &lt;sys/mount.h&gt;<br>
+#include &lt;fcntl.h&gt;<br>
+#include &lt;unistd.h&gt;<br>
<br>
=C2=A0#include &quot;tst_test.h&quot;<br>
=C2=A0#include &quot;tst_safe_macros.h&quot;<br>
@@ -123,6 +125,7 @@ static void tst_cgroupN_umount(const char *mnt_path, co=
nst char *new_path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *fp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char s_new[BUFSIZ], s[BUFSIZ], value[BUFSIZ];<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char knob_path[PATH_MAX];<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_is_mounted(mnt_path))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
@@ -151,6 +154,11 @@ static void tst_cgroupN_umount(const char *mnt_path, c=
onst char *new_path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 !=3D (ssize_t)strlen(value) - 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TWARN | TERRNO, &quot;write =
%s&quot;, s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cg_ver &amp; TST_CGROUP_V1) {<br></bloc=
kquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:=
small">To recognize cgroup_v1 is not enough here, because it will be=C2=A0f=
ailed=C2=A0&quot;with=C2=A0no such=C2=A0<span class=3D"gmail_default"></spa=
n>cgroup.clone_children file&quot; on MEMCG umount=C2=A0if the system no CP=
USET mounting.</div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Maybe a smart way is to save the <span class=3D"gmail_defaul=
t"></span>cgroup.clone_children=C2=A0value, restore it if it has been chang=
ed in the setup phase. What do u think?</div><br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(knob_path, =
&quot;%s/<span class=3D"gmail_default" style=3D"font-size:small"></span><sp=
an class=3D"gmail_default" style=3D"font-size:small"></span>cgroup.clone_ch=
ildren&quot;, mnt_path);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!access(knob_pa=
th, F_OK))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SAFE_FILE_PRINTF(knob_path, &quot;%d&quot;, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd !=3D -1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp !=3D NULL)<br>
-- <br>
2.23.0<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000b9223505ac46f8fe--


--===============0963913070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0963913070==--

