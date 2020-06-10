Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A81F51FB
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:13:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67D7D3C2E1E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:13:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 5A8D83C2C67
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:13:00 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 937C71001752
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591783977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3d8zTedPJWtq5EWz0MZC0Bf2U4vSzo0vzdpO9LP+JjU=;
 b=Za1r56LYKtQe8W5WsMmvvhQs0kI6Q6tuWiJa5mdjWSV0fXEkw4NkvOmjKoraNXE5HjpQeX
 GtB2MwjLZoEyfTaqlTbCotkvL+FqCuLgx4Yv2ucrLI8s49Gbn3oRVty/19tzzs8ul/aj/4
 eawPIj/LfyESbfvXSijlGI9HFkewzB4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-xPM04RkBPjGMOhSNiDILsw-1; Wed, 10 Jun 2020 06:12:55 -0400
X-MC-Unique: xPM04RkBPjGMOhSNiDILsw-1
Received: by mail-lf1-f69.google.com with SMTP id k12so547489lfg.7
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 03:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3d8zTedPJWtq5EWz0MZC0Bf2U4vSzo0vzdpO9LP+JjU=;
 b=sn2v8zHd9F2HJ0b79NG4Na1/+6Dcja1/C4blBpTm3Ur2pI3DEItd7GRT+hmuPfL6pM
 MhURzpT4t+nOuotcPUNj4AdZpM7GfDvMzFzMs5zohXN6mZNUaWHZyoEAfW6nV+SToFVo
 Cy94tA4owRmu7b7daojQrUgpTcYlEAVAVhXrAGDS5GugO2Vc9Y6DZaPD/HDnwm0OXvYJ
 Cbf+sSPTY03tBPQHwOd3HpP0gfErCW0nt1OTNct4ySiR034gnVKLaA6XCrGL54VboRzQ
 geHelokOvLXpjx+knQARtvskiWt5UB4oG4yPM2A5ZZaBDdO4w68gfLTbparL0mytmv8j
 O/HA==
X-Gm-Message-State: AOAM533KO4nCU+FAHyFCT3JGSHIWHgtPkdGVwuO5c3coIIZxO+jycSTG
 KK4t7CO8Ol7ZSY5+0+fAQGilxSu8/O2ayQQCylO56b6fS5nQP3YnTz7/2g7+0aeUxL8B3CGaJVR
 U7GShMA5vjTsjVVSaEOZINynVpKc=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr1375889ljd.441.1591783973114; 
 Wed, 10 Jun 2020 03:12:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBN4j41ILotN6w3lfOWr2s7JpS+cW+0BLXYlCg5wiPhtozMmEt9zWECB+YOCgztyWxR275M5j7dUeqh2SG/p0=
X-Received: by 2002:a05:651c:149:: with SMTP id
 c9mr1375878ljd.441.1591783972839; 
 Wed, 10 Jun 2020 03:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200609095102.21153-1-liwang@redhat.com>
 <1111554317.15300411.1591699362992.JavaMail.zimbra@redhat.com>
In-Reply-To: <1111554317.15300411.1591699362992.JavaMail.zimbra@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 10 Jun 2020 18:12:40 +0800
Message-ID: <CAEemH2fkUX2KA+dPqgjqrBftxAZ722k9B7i3fi8eSxEmzSLk6w@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Content-Type: multipart/mixed; boundary="===============0105143662=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0105143662==
Content-Type: multipart/alternative; boundary="00000000000042befd05a7b81634"

--00000000000042befd05a7b81634
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2020 at 6:42 PM Jan Stancek <jstancek@redhat.com> wrote:

>
> ----- Original Message -----
> > Many of our LTP tests need Control Group in the configuration,
> > this patch makes cgroup unified mounting at setup phase to be
> > possible. The method is extracted from mem.h with the purpose
> > of extendible for further developing, and trying to compatible
> > the current two versions of cgroup,
> >
> > It's hard to make all APIs be strictly consistent because there
> > are many differences between v1 and v2. But it capsulate the detail
> > of cgroup mounting in high-level functions, which will be easier
> > to use cgroup without considering too much technical thing.
> >
> > Btw, test get passed on RHEL7(x86_64), RHEL8(ppc64le), Fedora32(x86_64)=
.
> >
>
> No strong objections to v4, couple comments below (if you spin v5 because
> of other reviews).
>

Thanks for review!
Ok, I agree to keep patchv4 posts for more days in case other people have
comments.


>
> > +2.2.36 Using Control Group
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^
>
> Would be nice if there was short description of each function.
>

I'd add some code comments in the tst_cgroup.h header file. Which something
maybe like:

/* To mount/umount specified cgroup controller on 'cgroup_dir' path */
void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, const char *cgroup_dir);
void tst_cgroup_umount(const char *cgroup_dir);

/* To move current process PID to the mounted cgroup tasks */
void tst_cgroup_move_current(const char *cgroup_dir);

/* To set cgroup controller knob with new value */
void tst_cgroup_set_knob(const char *cgroup_dir, const char *knob, long
value);

/* Set of functions to set knobs under the memory controller */
void tst_cgroup_mem_set_maxbytes(const char *cgroup_dir, long memsz);
int  tst_cgroup_mem_swapacct_enabled(const char *cgroup_dir);
void tst_cgroup_mem_set_maxswap(const char *cgroup_dir, long memsz);

/* Set of functions to read/write cpuset controller files content */
void tst_cgroup_cpuset_read_files(const char *cgroup_dir, const char
*filename, char *retbuf);
void tst_cgroup_cpuset_write_files(const char *cgroup_dir, const char
*filename, const char *buf);



>
> > +static void tst_cgroup_set_path(const char *cgroup_dir)
> > +{
> > +     char cgroup_new_dir[PATH_MAX];
> > +     struct tst_cgroup_path *tst_cgroup_path, *a;
> > +
> > +     if (!cgroup_dir)
> > +             tst_brk(TBROK, "Invalid cgroup dir, plese check
> cgroup_dir");
> > +
> > +     sprintf(cgroup_new_dir, "%s/ltp_%d", cgroup_dir, rand());
> > +
> > +     /* To store cgroup path in the 'path' list */
> > +     tst_cgroup_path =3D SAFE_MMAP(NULL, (sizeof(struct tst_cgroup_pat=
h)),
> > +                     PROT_READ | PROT_WRITE, MAP_PRIVATE |
> MAP_ANONYMOUS, -1, 0);
>
> This looks like it could use just SAFE_MALLOC/SAFE_FREE.
>

Agree.

And btw, seems we have to set cgroup.clone_children as 1, otherwise, we
can't write anything to the cpuset subsystem files.

    BROK: Failed to close FILE '/tmp/cgroup_cst/ltp_1804289383/tasks' at
tst_cgroup.c:296: ENOSPC (28)

So these lines will be add in to library as neccesary:

--- a/lib/tst_cgroup.c
+++ b/lib/tst_cgroup.c
@@ -251,6 +251,16 @@ void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, const
char *cgroup_dir)
                break;
                case TST_CGROUP_CPUSET:
                        tst_cgroup1_mount("cpusetcg", "cpuset", cgroup_dir,
cgroup_new_dir);
+                       /*
+                        * we should assign one or more memory nodes to
cpuset.mems
+                        * and cpuset.cpus, otherwise, echo $$ > tasks
gives =E2=80=9Cno space
+                        * left on device: ENOSPC=E2=80=9D when trying to u=
se
cpuset.
+                        *
+                        * Or, setting cgroup.clone_children to 1 can help
in automatically
+                        * inheriting memory and node setting from parent
cgroup when a
+                        * child cgroup is created.
+                        */
+                       tst_cgroup_set_knob(cgroup_dir,
"../cgroup.clone_children", 1);
                break;


--=20
Regards,
Li Wang

--00000000000042befd05a7b81634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 9, 2020 at 6:42 PM Jan Stancek &lt;<a h=
ref=3D"mailto:jstancek@redhat.com">jstancek@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
----- Original Message -----<br>
&gt; Many of our LTP tests need Control Group in the configuration,<br>
&gt; this patch makes cgroup unified mounting at setup phase to be<br>
&gt; possible. The method=C2=A0is extracted from mem.h with the purpose<br>
&gt; of=C2=A0extendible for further developing, and trying=C2=A0to compatib=
le<br>
&gt; the current two versions of cgroup,<br>
&gt; <br>
&gt; It&#39;s hard to make all APIs be strictly consistent because there<br=
>
&gt; are many differences between v1 and v2. But it=C2=A0capsulate the deta=
il<br>
&gt; of cgroup mounting in high-level functions, which will be easier<br>
&gt; to use cgroup without considering too much technical thing.<br>
&gt; <br>
&gt; Btw, test get passed on RHEL7(x86_64), RHEL8(ppc64le), Fedora32(x86_64=
).<br>
&gt; <br>
<br>
No strong objections to v4, couple comments below (if you spin v5 because<b=
r>
of other reviews).<br></blockquote><div><br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">Thanks for review!</div><div class=3D"gm=
ail_default" style=3D"font-size:small">Ok, I agree to keep patchv4 posts fo=
r more days in case other people have comments.</div></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +2.2.36 Using Control Group<br>
&gt; +^^^^^^^^^^^^^^^^^^^^^^^^^^<br>
<br>
Would be nice if there was short description of each function.<br></blockqu=
ote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I&#39;d add some code comments in the tst_cgroup.h header file. Which s=
omething maybe like:</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div>/* To mount/umount specified cgroup controller on &#39;cgro=
up_dir&#39; path */<br>void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, con=
st char *cgroup_dir);<br>void tst_cgroup_umount(const char *cgroup_dir);<br=
><br>/* To move current process PID to the mounted cgroup tasks */<br>void =
tst_cgroup_move_current(const char *cgroup_dir);<br><br>/* To set cgroup co=
ntroller knob with new value */<br>void tst_cgroup_set_knob(const char *cgr=
oup_dir, const char *knob, long value);<br><br>/* Set of functions to set k=
nobs under the memory controller */<br>void tst_cgroup_mem_set_maxbytes(con=
st char *cgroup_dir, long memsz);<br>int =C2=A0tst_cgroup_mem_swapacct_enab=
led(const char *cgroup_dir);<br>void tst_cgroup_mem_set_maxswap(const char =
*cgroup_dir, long memsz);<br><br>/* Set of functions to read/write cpuset c=
ontroller files content */<br>void tst_cgroup_cpuset_read_files(const char =
*cgroup_dir, const char *filename, char *retbuf);<br>void tst_cgroup_cpuset=
_write_files(const char *cgroup_dir, const char *filename, const char *buf)=
;<br><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt; +static void tst_cgroup_set_path(const char *cgroup_dir)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0char cgroup_new_dir[PATH_MAX];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct tst_cgroup_path *tst_cgroup_path, *a;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!cgroup_dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk(TBROK, &quot;=
Invalid cgroup dir, plese check cgroup_dir&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sprintf(cgroup_new_dir, &quot;%s/ltp_%d&quot;, cg=
roup_dir, rand());<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* To store cgroup path in the &#39;path&#39; lis=
t */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_cgroup_path =3D SAFE_MMAP(NULL, (sizeof(struc=
t tst_cgroup_path)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);<br>
<br>
This looks like it could use just SAFE_MALLOC/SAFE_FREE.<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ag=
ree.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">And btw, seems=
 we have to set cgroup.clone_children as 1, otherwise, we can&#39;t write a=
nything to the cpuset subsystem files.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0 =C2=A0 BROK: Failed to close FILE &#39;/tmp/cgroup_cst=
/ltp_1804289383/tasks&#39; at tst_cgroup.c:296: ENOSPC (28)<br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">So these lines will be add in to lib=
rary as neccesary:</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div>--- a/lib/tst_cgroup.c<br>+++ b/lib/tst_cgroup.c<br>@@ -251,6=
 +251,16 @@ void tst_cgroup_mount(enum tst_cgroup_ctrl ctrl, const char *cg=
roup_dir)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TST_CGROUP=
_CPUSET:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 tst_cgroup1_mount(&quot;cpusetcg&quot;, &quot;cpuset&q=
uot;, cgroup_dir, cgroup_new_dir);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we should assi=
gn one or more memory nodes to cpuset.mems<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and cpuset.cpus, =
otherwise, echo $$ &gt; tasks gives =E2=80=9Cno space<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* left=
 on device: ENOSPC=E2=80=9D when trying to use cpuset.<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>+=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* Or, setting cgroup.clone_children to 1 can help in automaticall=
y<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* inheriting memory and node setting from parent cgroup wh=
en a<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* child cgroup is created.<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
st_cgroup_set_knob(cgroup_dir, &quot;../cgroup.clone_children&quot;, 1);<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br><br></di=
v><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></d=
iv>

--00000000000042befd05a7b81634--


--===============0105143662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0105143662==--

