Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 769112F72C6
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:14:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25B443C3122
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 07:14:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5FAFC3C2657
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:14:46 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 834F91A00115
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 07:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610691283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wt5G+54Pl59hgV8S9JylN+5lx2SmMCo8LFCXSFoFhNA=;
 b=SMNP+J2/7lw1MSARyBqqB0o9UNBgUyAHwOV1mj7z9w5Ue3pYK0bw9aNb9D6wnzoNW6NhHB
 mj48Qr7SdQCgOx90WN46FcuROWb222grqXaMROYEc+Tb9z6XiACMSQtp/fnLelaxtEq/2W
 AaBhvKGzgk50gtppuj2Hj5muY2gwbO8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-lPJRZEELN4WoopF51g695g-1; Fri, 15 Jan 2021 01:14:39 -0500
X-MC-Unique: lPJRZEELN4WoopF51g695g-1
Received: by mail-yb1-f198.google.com with SMTP id e137so4688100ybf.16
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 22:14:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wt5G+54Pl59hgV8S9JylN+5lx2SmMCo8LFCXSFoFhNA=;
 b=RIU2M+hCiUxOkL1d+1ReGWAcjyYQtwW0E3VsTidbqNWwiCoBl5lb294sbuITR/8DSJ
 Nclsca2aRUrhpE+lyn4sox6zZgoiefBSG+0guWTH5/3qJWusoJw4SXYWKewdM4nxug2B
 5QT4mVBpiaFOFd47WLmZwxKzKqmfSzz48NbqRxdYfeZQqMAbZXEE0HcS+kd4JfkPh3wU
 ZAe/rkRZ3WbzCibLrucVVpkHKkAJlVpacbzGvhJ2WPOk6HyAHWRQcc1LCl7uJcvb+6RV
 G262MFY7hK853XQuf8aOS7+/eqJ4H//XahnvjZUINxyipjnmTdOi0yU7oGCzcRJDavsA
 lkCQ==
X-Gm-Message-State: AOAM531EJIuK2APyeu96JKQEfi263ZIM1NxZdcaS9wjOgQBbiWAtJ+Q4
 Qme7wqo5ungz+9ucwTfs7nsNpvMhkzA2ttY5v/ENBX+ta+fiQiteuIvrTXHxVzwSZTv62QWP7pv
 s4l7HeL7j+bG0H9n5DL/dlh9tx6w=
X-Received: by 2002:a25:2554:: with SMTP id l81mr8446905ybl.243.1610691278974; 
 Thu, 14 Jan 2021 22:14:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqIgm+Eph95vgE4Z+Y4vxjERtar9A0h43MKbFoNb6zAlhgSMYSXlYPfg9J53kEco2H/818wCdJ/jkWru3cr+Q=
X-Received: by 2002:a25:2554:: with SMTP id l81mr8446885ybl.243.1610691278757; 
 Thu, 14 Jan 2021 22:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20210114183226.794-1-pvorel@suse.cz>
In-Reply-To: <20210114183226.794-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 15 Jan 2021 14:14:26 +0800
Message-ID: <CAEemH2cQRNQ3_sko-rBSNf4hgR0p3a5sp1qXgpyXoY1T4aOf7Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] zram: Check properly command dependencies
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
Content-Type: multipart/mixed; boundary="===============1827370224=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1827370224==
Content-Type: multipart/alternative; boundary="000000000000837bb305b8ea49bf"

--000000000000837bb305b8ea49bf
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Fri, Jan 15, 2021 at 2:32 AM Petr Vorel <pvorel@suse.cz> wrote:

> Instead of relying that there is mkfs.ext2 as a backup,
> search for supported default.
>
> Always check ext2 (in case there is enough space for btrfs but
> no mkfs.btrfs).
>
> This fixes error when even the default ext2 is not supported:
>
> zram01 5 TINFO: make ext2 filesystem on /dev/zram0
> /opt/ltp/testcases/bin/zram01.sh: line 188: mkfs.ext2: not found
> zram01 5 TFAIL: failed to make ext2 on /dev/zram0
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> fix to be merged before release.
>
> NOTE: Bug affecting BusyBox needs to be discussed:
> http://lists.linux.it/pipermail/ltp/2021-January/020568.html
>
> Kind regards,
> Petr
>
>  .../kernel/device-drivers/zram/zram_lib.sh    | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh
> b/testcases/kernel/device-drivers/zram/zram_lib.sh
> index 3f4d1d55f..1a611b974 100755
> --- a/testcases/kernel/device-drivers/zram/zram_lib.sh
> +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> @@ -178,13 +178,30 @@ zram_swapoff()
>  zram_makefs()
>  {
>         tst_require_cmds mkfs
> +
> +       local default_fs fs
>         local i=0
>
> +       for fs in $zram_filesystems ext2; do
> +               if tst_supported_fs $fs 2> /dev/null; then
> +                       default_fs="$fs"
> +                       break
> +               fi
> +       done
>

This workaround makes some sense but a bit overlap to traverse
 $zram_filesystems.

Maybe we can remove the unsupported filesystems from $zram_filesystems
list via tst_supported_fs and tst_cmd_available, to avoid involving that
additional
variable 'default_fs', then in following test if $zram_filesystems is a
null string
just exit with TCONF directly?



> +
> +       if [ -z "$default_fs" ]; then
> +               tst_res TINFO "supported filesystems"
> +               tst_supported_fs > /dev/null
> +               tst_brk TCONF "missing kernel support or mkfs for all of
> these filesystems: $zram_filesystems"
> +       fi
> +
>         for fs in $zram_filesystems; do
> -               # if requested fs not supported default it to ext2
> -               tst_supported_fs $fs 2> /dev/null || fs=ext2
> +               # use default if requested fs not supported or missing mkfs
> +               tst_supported_fs $fs 2> /dev/null && tst_cmd_available
> mkfs.$fs \
> +                       || fs=$default_fs
>
>                 tst_res TINFO "make $fs filesystem on /dev/zram$i"
> +
>                 mkfs.$fs /dev/zram$i > err.log 2>&1
>                 if [ $? -ne 0 ]; then
>                         cat err.log
> --
> 2.29.2
>
>

-- 
Regards,
Li Wang

--000000000000837bb305b8ea49bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jan 15, 2021 at 2:32 AM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz" target=3D"_blank">pvorel@suse.cz</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Instead=
 of relying that there is mkfs.ext2 as a backup,<br>
search for supported default.<br>
<br>
Always check ext2 (in case there is enough space for btrfs but<br>
no mkfs.btrfs).<br>
<br>
This fixes error when even the default ext2 is not supported:<br>
<br>
zram01 5 TINFO: make ext2 filesystem on /dev/zram0<br>
/opt/ltp/testcases/bin/zram01.sh: line 188: mkfs.ext2: not found<br>
zram01 5 TFAIL: failed to make ext2 on /dev/zram0<br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br>
---<br>
Hi,<br>
<br>
fix to be merged before release.<br>
<br>
NOTE: Bug affecting BusyBox needs to be discussed:<br>
<a href=3D"http://lists.linux.it/pipermail/ltp/2021-January/020568.html" re=
l=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp/2021=
-January/020568.html</a><br>
<br>
Kind regards,<br>
Petr<br>
<br>
=C2=A0.../kernel/device-drivers/zram/zram_lib.sh=C2=A0 =C2=A0 | 21 ++++++++=
+++++++++--<br>
=C2=A01 file changed, 19 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/k=
ernel/device-drivers/zram/zram_lib.sh<br>
index 3f4d1d55f..1a611b974 100755<br>
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh<br>
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh<br>
@@ -178,13 +178,30 @@ zram_swapoff()<br>
=C2=A0zram_makefs()<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_require_cmds mkfs<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0local default_fs fs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 local i=3D0<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for fs in $zram_filesystems ext2; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tst_supported_fs=
 $fs 2&gt; /dev/null; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0default_fs=3D&quot;$fs&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br></blockquote><div><br></div><div><div c=
lass=3D"gmail_default" style=3D"font-size:small">This workaround makes some=
 sense but a bit overlap to=C2=A0<span style=3D"color:rgb(51,51,51);font-si=
ze:14px">traverse</span>=C2=A0$zram_filesystems.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Maybe we can remove the unsupported filesystems=C2=
=A0from $zram_filesystems</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">list via tst_supported_fs and=C2=A0<span class=3D"gmail_default"=
></span>tst_cmd_available, to avoid involving that additional</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">variable &#39;default_fs&#39=
;, then in following test if $zram_filesystems is a null string</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">just exit with TCONF direc=
tly?</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$default_fs&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res TINFO &quot=
;supported filesystems&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_supported_fs &g=
t; /dev/null<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk TCONF &quot=
;missing kernel support or mkfs for all of these filesystems: $zram_filesys=
tems&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for fs in $zram_filesystems; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# if requested fs n=
ot supported default it to ext2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_supported_fs $f=
s 2&gt; /dev/null || fs=3Dext2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# use default if re=
quested fs not supported or missing mkfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_supported_fs $f=
s 2&gt; /dev/null &amp;&amp; <span class=3D"gmail_default" style=3D"font-si=
ze:small"></span>tst_cmd_available mkfs.$fs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|| fs=3D$default_fs<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res TINFO &quot=
;make $fs filesystem on /dev/zram$i&quot;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfs.$fs /dev/zram$=
i &gt; err.log 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; th=
en<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cat err.log<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div>=
</div>

--000000000000837bb305b8ea49bf--


--===============1827370224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1827370224==--

