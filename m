Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC523ED59
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 14:31:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 894023C31E8
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 14:31:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 071C13C24E7
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 14:31:06 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 2D607140175C
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 14:31:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596803461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNaBVE9Yl+LxFAw2gFay4TJJioE+JG1CemYw95BdZRQ=;
 b=NXJsHZB4nwMguU2ZEN8EAvqVtpgCxIgk8r7lxZiJRFUw89l8q9qh7WsBL4kqIyk0rHx+Hp
 1kdpXFar8PXCDZ/tkQuzApUB0iblxAr0YwW7wd8a6phE80T/POv3rMd8zSvq/TXpmOfdUL
 4oYhStiwcLFnkggWDj7rmt0wRpzWrCE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-N7pwVKlNOCCfZj8jqdqFXA-1; Fri, 07 Aug 2020 08:30:57 -0400
X-MC-Unique: N7pwVKlNOCCfZj8jqdqFXA-1
Received: by mail-yb1-f198.google.com with SMTP id a14so2517000ybm.13
 for <ltp@lists.linux.it>; Fri, 07 Aug 2020 05:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZNaBVE9Yl+LxFAw2gFay4TJJioE+JG1CemYw95BdZRQ=;
 b=YozUd8QtY7JnfQtEJ4dhg47t3+aJ67E7Agocp6lw+Lrlt+/meMeDGrxAcHITZEFCFC
 lEjl6Z7Jmmv/HiJflmBqRmqVMIqwC+Oe6+oUA0OKW+y9qmWGcOHodWaYSZUgce3u2U8k
 s0YEDGt6NOGwbfoPLLo1FUk0ixa3R4VUepl59lnRM3sN1roRP61P32PYVzp8lTMrCfPR
 wCQJ8Et1y1HXgN/VeTwGA6Chm8Gr5CBWylvvte0KLZfRrYVY3eLFAuNGL+VJiLl5CHzi
 ec3vfYm9YF6BpiwXYt5kTNZWsa4Xqh2PCxcGdx7ow7A+wgg4RF+9orfZenFeEpKa0r6m
 BsQA==
X-Gm-Message-State: AOAM530f3HCw/GtM9jyNzDvuiOPmdwfhUt4+JWY6K6dD3r15iuPsSnX7
 mfFaTjHkEZJzQTVzDkU2lntpTqe1leRkYQ4157o6Di2X+gaQaerO3zOnNY7N8r3fmp9zi3qrkgi
 iUZPP35z4yNeX3moV6zfY0sv1w9s=
X-Received: by 2002:a25:414:: with SMTP id 20mr19724677ybe.97.1596803456446;
 Fri, 07 Aug 2020 05:30:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRl7CpnfIKTNrHmUMYcVd7NSAsFrutbloTqGLKqrQjsh5hggG7IjZeFmfdsBLaemYz0KmnXIeCjHSdEnALwq0=
X-Received: by 2002:a25:414:: with SMTP id 20mr19724635ybe.97.1596803456081;
 Fri, 07 Aug 2020 05:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <1596793326-21639-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2d7+05ZT7UwePjtOuDKws-kK-5kt5LbyzV_zicFp51z2A@mail.gmail.com>
 <1ca03e90-6885-4345-9be8-c1f37a6227ab@cn.fujitsu.com>
In-Reply-To: <1ca03e90-6885-4345-9be8-c1f37a6227ab@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Fri, 7 Aug 2020 20:30:44 +0800
Message-ID: <CAEemH2dRLs3NwfwNzzcMK9tBHBRi_QOMsvTCfUc8xm6r0DFZrA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1755336846=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1755336846==
Content-Type: multipart/alternative; boundary="000000000000c6cb1005ac48c625"

--000000000000c6cb1005ac48c625
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 7, 2020 at 7:16 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

> Hi Li
>
>
> >
> >
> > On Fri, Aug 7, 2020 at 5:42 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com
> > <mailto:xuyang2018.jy@cn.fujitsu.com>> wrote:
> >
> >     When running cgroup test cases(like cpuset01 or oom05) about cpuset
> >     subsystem
> >     firstly, then cpuset_inherit case will fail because the value of
> >     cgroup.clone_children has been changed into 1 on cgroup-v1. Reset
> >     this value
> >     when calling tst_cgroupN_umount.
> >
> >     Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com
> >     <mailto:xuyang2018.jy@cn.fujitsu.com>>
> >     ---
> >       lib/tst_cgroup.c | 8 ++++++++
> >       1 file changed, 8 insertions(+)
> >
> >     diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c
> >     index 9459f7ea0..764951afa 100644
> >     --- a/lib/tst_cgroup.c
> >     +++ b/lib/tst_cgroup.c
> >     @@ -9,6 +9,8 @@
> >       #include <stdio.h>
> >       #include <stdlib.h>
> >       #include <sys/mount.h>
> >     +#include <fcntl.h>
> >     +#include <unistd.h>
> >
> >       #include "tst_test.h"
> >       #include "tst_safe_macros.h"
> >     @@ -123,6 +125,7 @@ static void tst_cgroupN_umount(const char
> >     *mnt_path, const char *new_path)
> >              FILE *fp;
> >              int fd;
> >              char s_new[BUFSIZ], s[BUFSIZ], value[BUFSIZ];
> >     +       char knob_path[PATH_MAX];
> >
> >              if (!tst_is_mounted(mnt_path))
> >                      return;
> >     @@ -151,6 +154,11 @@ static void tst_cgroupN_umount(const char
> >     *mnt_path, const char *new_path)
> >                                  != (ssize_t)strlen(value) - 1)
> >                                      tst_res(TWARN | TERRNO, "write %s",
> s);
> >              }
> >     +       if (tst_cg_ver & TST_CGROUP_V1) {
> >
> >
> > To recognize cgroup_v1 is not enough here, because it will
> > be failed "with no such cgroup.clone_children file" on MEMCG umount if
> > the system no CPUSET mounting.
> I has umounted cpuset, but I still see this file in memory as below:
>

It's not the same file, here set to 1 is '../cpuset/cgroup.clone_children'
which belong to the CPUSET but not the MEMCG one.

i.e.
# echo 1 >/sys/fs/cgroup/memory/cgroup.clone_children
# cat /sys/fs/cgroup/memory/cgroup.clone_children
1
# cat /sys/fs/cgroup/cpuset/cgroup.clone_children
0



>
> #mount |grep cpuset
> nothing
> # ls -l /sys/fs/cgroup/memory/cgroup.clone_children
> -rw-r--r--. 1 root root 0 Aug  7 08:16
> /sys/fs/cgroup/memory/cgroup.clone_children
>
> >
> > Maybe a smart way is to save the cgroup.clone_children value, restore it
> > if it has been changed in the setup phase. What do u think?
> We can just use print and scanf api to do this.
> But I don't know this whether takes bad effects on complexd nesting
> situation(has sub cgroup).
>

We could just do scanf that for CPUSET subsystem, and do nothing if no
CPUSET mounting.



>
> >
> >     +               sprintf(knob_path, "%s/cgroup.clone_children",
> >     mnt_path);
> >     +               if (!access(knob_path, F_OK))
> Here has a check for cgroup.clone_children so it should not trigger un
> such file error.
>

No, the tst_cgroupN_umount just unmount the DIR but do nothing to
distinguish what kind of group it is, so it will also do same thing for all
cgroup types.



>
> ps: I will add clone_children swith into cpu_inherit case.
>
> Best Regards
> Yang Xu
> >     +                       SAFE_FILE_PRINTF(knob_path, "%d", 0);
> >     +       }
> >              if (fd != -1)
> >                      close(fd);
> >              if (fp != NULL)
> >     --
> >     2.23.0
> >
> >
> >
> >
> >
> > --
> > Regards,
> > Li Wang
>
>
>

-- 
Regards,
Li Wang

--000000000000c6cb1005ac48c625
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Aug 7, 2020 at 7:16 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li<=
br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Aug 7, 2020 at 5:42 PM Yang Xu &lt;<a href=3D"mailto:xuyang201=
8.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a> <br=
>
&gt; &lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujitsu.com" target=3D"_=
blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When running cgroup test cases(like cpuset01 or oom=
05) about cpuset<br>
&gt;=C2=A0 =C2=A0 =C2=A0subsystem<br>
&gt;=C2=A0 =C2=A0 =C2=A0firstly, then cpuset_inherit case will fail because=
 the value of<br>
&gt;=C2=A0 =C2=A0 =C2=A0cgroup.clone_children has been changed into 1 on cg=
roup-v1. Reset<br>
&gt;=C2=A0 =C2=A0 =C2=A0this value<br>
&gt;=C2=A0 =C2=A0 =C2=A0when calling tst_cgroupN_umount.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang=
2018.jy@cn.fujitsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:xuyang2018.jy@cn.fujit=
su.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lib/tst_cgroup.c | 8 ++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 8 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/lib/tst_cgroup.c b/lib/tst_cgroup.c<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0index 9459f7ea0..764951afa 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/lib/tst_cgroup.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/lib/tst_cgroup.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -9,6 +9,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;stdio.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;stdlib.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &lt;sys/mount.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &lt;fcntl.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#include &lt;unistd.h&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &quot;tst_test.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#include &quot;tst_safe_macros.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -123,6 +125,7 @@ static void tst_cgroupN_umount(=
const char<br>
&gt;=C2=A0 =C2=A0 =C2=A0*mnt_path, const char *new_path)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE *fp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char s_new[BUFSIZ], s[=
BUFSIZ], value[BUFSIZ];<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0char knob_path[PATH_MAX=
];<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tst_is_mounted(mn=
t_path))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -151,6 +154,11 @@ static void tst_cgroupN_umount=
(const char<br>
&gt;=C2=A0 =C2=A0 =C2=A0*mnt_path, const char *new_path)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D (ssize_t)strlen(value=
) - 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TWAR=
N | TERRNO, &quot;write %s&quot;, s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tst_cg_ver &amp; TS=
T_CGROUP_V1) {<br>
&gt; <br>
&gt; <br>
&gt; To recognize cgroup_v1 is not enough here, because it will <br>
&gt; be=C2=A0failed=C2=A0&quot;with=C2=A0no such cgroup.clone_children file=
&quot; on MEMCG umount=C2=A0if <br>
&gt; the system no CPUSET mounting.<br>
I has umounted cpuset, but I still see this file in memory as below:<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">It&#39;s not the same file, here set to 1 is &#39;../cpuset/cgrou=
p.clone_children&#39; which belong to the CPUSET but not the MEMCG one.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">i.e.=C2=A0</div># ech=
o 1 &gt;/sys/fs/cgroup/memory/cgroup.clone_children <br># cat /sys/fs/cgrou=
p/memory/cgroup.clone_children <br>1<br># cat /sys/fs/cgroup/cpuset/cgroup.=
clone_children <br>0<br><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
#mount |grep cpuset<br>
nothing<br>
# ls -l /sys/fs/cgroup/memory/cgroup.clone_children<br>
-rw-r--r--. 1 root root 0 Aug=C2=A0 7 08:16 <br>
/sys/fs/cgroup/memory/cgroup.clone_children<br>
<br>
&gt; <br>
&gt; Maybe a smart way is to save the cgroup.clone_children=C2=A0value, res=
tore it <br>
&gt; if it has been changed in the setup phase. What do u think?<br>
We can just use print and scanf api to do this.<br>
But I don&#39;t know this whether takes bad effects on complexd nesting <br=
>
situation(has sub cgroup).<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">We could=C2=A0just do scanf th=
at for CPUSET subsystem, and do nothing if no CPUSET mounting.</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sprintf(knob_path, &quot;%s/cgroup.clone_children&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0mnt_path);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0if (!access(knob_path, F_OK))<br>
Here has a check for cgroup.clone_children so it should not trigger un <br>
such file error.<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">No, the tst_cgroupN_umount just unmount th=
e DIR but do nothing to distinguish=C2=A0what kind of group it is, so it wi=
ll also do same thing for all cgroup types.=C2=A0</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
ps: I will add clone_children swith into cpu_inherit case.<br>
<br>
Best Regards<br>
Yang Xu<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_FILE_PRINTF(knob_path, &quot;%d&quot=
;, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd !=3D -1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 close(fd);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fp !=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.23.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Regards,<br>
&gt; Li Wang<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000c6cb1005ac48c625--


--===============1755336846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1755336846==--

