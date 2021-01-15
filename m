Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4E82F73E5
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 08:59:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1AFB3C6A09
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Jan 2021 08:59:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5BDA33C2305
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 08:59:08 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A50B6200FE1
 for <ltp@lists.linux.it>; Fri, 15 Jan 2021 08:59:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610697546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/u03YcsVK4mP5iO7PMbfwZJXZ2GDS0HoUJCDNGRFu7I=;
 b=dB+NPo2ZdprpnxL5fIiNVnPB5k1EQSBkKwckbILJd+1+3Fj2RjwZf7G9ZJm94q8idSpBs1
 oWBT/9X+51sUQK8j6/k2v6LI2YOP5hGNvcR6CL6h1k79GeTI//uzkARt2Zc0gnBpIIPx/p
 Q0w+SA3VJwSAZ/qqwj3FzLn1JE1QYX4=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-gb4kiF7rMDuAxZdMNRnMag-1; Fri, 15 Jan 2021 02:59:02 -0500
X-MC-Unique: gb4kiF7rMDuAxZdMNRnMag-1
Received: by mail-yb1-f198.google.com with SMTP id p80so2741410ybg.10
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 23:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/u03YcsVK4mP5iO7PMbfwZJXZ2GDS0HoUJCDNGRFu7I=;
 b=WPCsLJIdMDcTvmh2UH8Ru3RoI2ZZI5NbmSdZ7B4PiDCqmf8zvyOQ72v6uXnI65q9Qt
 NTEG6XHNjxhXpzYobtmnBNvV/zNY+Hobvfa8FPmtSK1rFs7au2ho+sR7Ji3Snwddeu1Y
 xjRMdUI4Qq6NbmAt8By4MbnFTfFrEE4PwXQUEQ/bP/WuHudQ9UCkR99jZzqJHT4+Ip3B
 HHisx0bQG0XdJRC+ydHLRZHMHjnJGrh09HEeZMjJUtukZHDR/PicSPOvEm7mjl1Q137U
 tQ49ro0mz7d5HDyodnKg2HI1eW4+dmOPIsILVRlBytEjhu6CINx7PKWPyWOOTX1UiA14
 NzPg==
X-Gm-Message-State: AOAM530y0GkT9LZo3MMOVUL/yUWX6KfD1nPPv9wpRrupCiCKFe4XKCpW
 YqFRPnj3bglcpy3A4mIiVcf8L4x/f0u0lVVmuQ8DGdTfIe8+Yg//ZJBmaWbo4enFZ/RLXIEGqV1
 aPHdvWtla8Juvr3ErIO0kNfsmbiQ=
X-Received: by 2002:a25:2554:: with SMTP id l81mr8925073ybl.243.1610697541687; 
 Thu, 14 Jan 2021 23:59:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7IiCtCrL7w31JhznKB9umhQ8lONn9EIo4UTqd+hr7fiK3eD9ya25c2n14vI0Ea82IxVfhZnFbU2PPSuntFB8=
X-Received: by 2002:a25:2554:: with SMTP id l81mr8925055ybl.243.1610697541448; 
 Thu, 14 Jan 2021 23:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20210114183226.794-1-pvorel@suse.cz>
 <CAEemH2cQRNQ3_sko-rBSNf4hgR0p3a5sp1qXgpyXoY1T4aOf7Q@mail.gmail.com>
 <YAE9Lkgj09qVupsN@pevik>
In-Reply-To: <YAE9Lkgj09qVupsN@pevik>
From: Li Wang <liwang@redhat.com>
Date: Fri, 15 Jan 2021 15:58:49 +0800
Message-ID: <CAEemH2cmyKFuL9=OWFB-PcpvCmCa2v6BPSijeEqaV6626EmsJQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: multipart/mixed; boundary="===============1303412851=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1303412851==
Content-Type: multipart/alternative; boundary="000000000000cc8e2f05b8ebbed9"

--000000000000cc8e2f05b8ebbed9
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Fri, Jan 15, 2021 at 2:59 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> ...
> > > diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh
> > > b/testcases/kernel/device-drivers/zram/zram_lib.sh
> > > index 3f4d1d55f..1a611b974 100755
> > > --- a/testcases/kernel/device-drivers/zram/zram_lib.sh
> > > +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> > > @@ -178,13 +178,30 @@ zram_swapoff()
> > >  zram_makefs()
> > >  {
> > >         tst_require_cmds mkfs
> > > +
> > > +       local default_fs fs
> > >         local i=0
>
> > > +       for fs in $zram_filesystems ext2; do
> > > +               if tst_supported_fs $fs 2> /dev/null; then
> > > +                       default_fs="$fs"
> > > +                       break
> > > +               fi
> > > +       done
>
>
> > This workaround makes some sense but a bit overlap to traverse
> >  $zram_filesystems.
> Not sure if I understand you.


> > Maybe we can remove the unsupported filesystems from $zram_filesystems
> > list via tst_supported_fs and tst_cmd_available, to avoid involving that
> > additional
> > variable 'default_fs', then in following test if $zram_filesystems is a
> > null string
> > just exit with TCONF directly?
>
> I understood, that there must be 4 runs, because 4 /dev/zram* has been used
> (dev_num=4). Do you mean to check supported systems in the setup (it'd be
> safer
> to move the calculation to the setup) and lower dev_num if needed?
>

My fault, seems I ignored the dev_num in the previous review, I just looked
into
the zram_makefs() and suggest pruning the $zram_filesystems.

You are right, we could have two ways now:
1. check supported filesystems and recalculate relative parameters in the
setup
(I prefer this, but needs more work/time to refactor code)

2. add variable default_fs as what you did
(the cons side might have duplicated test, but I'm not against it because
of the coming LTP release date)


>
> And tst_cmd_available is not needed, because tst_supported_fs checks also
> for
> mkfs.foo presence.
>
Great.


>
> Also further cleanup after release: it'd make sense to move zram_makefs and
> zram_mount to zram01.sh, which is the only test which use them. And
> zram_makefs
> uses $zram_filesystems.
> Or keep them in zram_lib.sh, but pass $zram_filesystems to zram_makefs as a
> parameter. Current state is confusing a bit.
>

Yes, or let's do the refactoring after release.


>
> Kind regards,
> Petr
>
> > > +
> > > +       if [ -z "$default_fs" ]; then
> > > +               tst_res TINFO "supported filesystems"
> > > +               tst_supported_fs > /dev/null
> > > +               tst_brk TCONF "missing kernel support or mkfs for all
> of
> > > these filesystems: $zram_filesystems"
> > > +       fi
> > > +
> > >         for fs in $zram_filesystems; do
> > > -               # if requested fs not supported default it to ext2
> > > -               tst_supported_fs $fs 2> /dev/null || fs=ext2
> > > +               # use default if requested fs not supported or missing
> mkfs
> > > +               tst_supported_fs $fs 2> /dev/null && tst_cmd_available
> > > mkfs.$fs \
> > > +                       || fs=$default_fs
>
> > >                 tst_res TINFO "make $fs filesystem on /dev/zram$i"
> > > +
> > >                 mkfs.$fs /dev/zram$i > err.log 2>&1
> > >                 if [ $? -ne 0 ]; then
> > >                         cat err.log
> > > --
> > > 2.29.2
>
>

-- 
Regards,
Li Wang

--000000000000cc8e2f05b8ebbed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jan 15, 2021 at 2:59 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
...<br>
&gt; &gt; diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh<br>
&gt; &gt; b/testcases/kernel/device-drivers/zram/zram_lib.sh<br>
&gt; &gt; index 3f4d1d55f..1a611b974 100755<br>
&gt; &gt; --- a/testcases/kernel/device-drivers/zram/zram_lib.sh<br>
&gt; &gt; +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh<br>
&gt; &gt; @@ -178,13 +178,30 @@ zram_swapoff()<br>
&gt; &gt;=C2=A0 zram_makefs()<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_require_cmds mkfs<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0local default_fs fs<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local i=3D0<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for fs in $zram_filesystems ext2; do<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tst_su=
pported_fs $fs 2&gt; /dev/null; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0default_fs=3D&quot;$fs&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0break<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
<br>
<br>
&gt; This workaround makes some sense but a bit overlap to traverse<br>
&gt;=C2=A0 $zram_filesystems.<br>
Not sure if I understand you.<span class=3D"gmail_default" style=3D"font-si=
ze:small"></span></blockquote><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; Maybe we can remove the unsupported filesystems from $zram_filesystems=
<br>
&gt; list via tst_supported_fs and tst_cmd_available, to avoid involving th=
at<br>
&gt; additional<br>
&gt; variable &#39;default_fs&#39;, then in following test if $zram_filesys=
tems is a<br>
&gt; null string<br>
&gt; just exit with TCONF directly?<br>
<br>
I understood, that there must be 4 runs, because 4 /dev/zram* has been used=
<br>
(dev_num=3D4). Do you mean to check supported systems in the setup (it&#39;=
d be safer<br>
to move the calculation to the setup) and lower dev_num if needed?<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">My fault, seems I ignored the dev_num in the previous review, I jus=
t looked into</div><div class=3D"gmail_default" style=3D"font-size:small">t=
he zram_makefs() and suggest pruning the $zram_filesystems.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">You are right, we could have two ways no=
w:</div><div class=3D"gmail_default" style=3D"font-size:small">1. check sup=
ported filesystems and recalculate relative parameters in the setup</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">(I prefer this, but ne=
eds more work/time to refactor code)</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">2. add variable default_fs as what you did</div><div class=3D"g=
mail_default" style=3D"font-size:small">(the cons side might have duplicate=
d test, but I&#39;m not against it because of the coming LTP release date)<=
/div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
And tst_cmd_available is not needed, because tst_supported_fs checks also f=
or<br>
mkfs.foo presence.<br></blockquote><div><span class=3D"gmail_default" style=
=3D"font-size:small">Great.</span></div><div><span class=3D"gmail_default" =
style=3D"font-size:small"></span>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Also further cleanup after release: it&#39;d make sense to move zram_makefs=
 and<br>
zram_mount to zram01.sh, which is the only test which use them. And zram_ma=
kefs<br>
uses $zram_filesystems.<br>
Or keep them in zram_lib.sh, but pass $zram_filesystems to zram_makefs as a=
<br>
parameter. Current state is confusing a bit.<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">Yes, or let&#3=
9;s do the refactoring after release.</div></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Petr<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$default_fs&quot; ]; th=
en<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_res T=
INFO &quot;supported filesystems&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_suppo=
rted_fs &gt; /dev/null<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brk T=
CONF &quot;missing kernel support or mkfs for all of<br>
&gt; &gt; these filesystems: $zram_filesystems&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for fs in $zram_filesystems; do<=
br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# if requ=
ested fs not supported default it to ext2<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_suppo=
rted_fs $fs 2&gt; /dev/null || fs=3Dext2<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# use def=
ault if requested fs not supported or missing mkfs<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_suppo=
rted_fs $fs 2&gt; /dev/null &amp;&amp; tst_cmd_available<br>
&gt; &gt; mkfs.$fs \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|| fs=3D$default_fs<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_=
res TINFO &quot;make $fs filesystem on /dev/zram$i&quot;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkfs=
.$fs /dev/zram$i &gt; err.log 2&gt;&amp;1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [=
 $? -ne 0 ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0cat err.log<br>
&gt; &gt; --<br>
&gt; &gt; 2.29.2<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000cc8e2f05b8ebbed9--


--===============1303412851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1303412851==--

