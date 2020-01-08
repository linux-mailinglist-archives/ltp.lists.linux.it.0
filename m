Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8127B1340A9
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:39:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 221C33C2501
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jan 2020 12:39:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6D6073C23AF
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:39:22 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8DA001A00F50
 for <ltp@lists.linux.it>; Wed,  8 Jan 2020 12:39:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578483559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j4cXVf8Ga807SxBtt5QSk5oaEQx97cx/9gee5l5a36w=;
 b=c9x1i6jzb/sLCQ3HAeZsD1RcSmlo8maYTRlPv1/91Dg9GJ6j6ZFjwoPmvZ7zN6Dq4A5Pj/
 N6u0uB+ODi+8KoAxr0iyMZwulUU4lXsWm/r7G6U/z87nDio3vgEy1xmuJOSTkJpJ4SVKQU
 MhHq6eb289qSb9i/UYhY66+UiKl76iI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23--LGccz6nNDux6kfA2ZppdA-1; Wed, 08 Jan 2020 06:39:16 -0500
Received: by mail-oi1-f198.google.com with SMTP id c4so1483948oiy.0
 for <ltp@lists.linux.it>; Wed, 08 Jan 2020 03:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FT1a4rRXM17vPZHMoOmqWiNMH31p0An3P5nOKceIfXc=;
 b=Dffwtpl41gTkJe839ON4QsQMoWPZIRqmKX7zitzRasJrYOI/cK2f29msq8tjYASwMJ
 c5e0J8pET9yObpE1trRGQqsaHCo1XVuxxbWbtsssqa3V9p6aLGr6kHqdX6Iy9b0uOiDG
 SM3df2K4RBhAqqLJ9sCautxs5AeujeCZ3Wc8zj5QerELapI+bI6r/42OXL5pVb9jUMGu
 Z/LObKUBhZlPriV0VB6islE3BRRIVBVIBTAZ9s35o52Aajt41pFGyk6XiyekK9ULlwUr
 fBwzSFEkDAJNaUISoCOI6Px6zaQsysyODQIYHiMSlZHbZ3HQeZn/+b/P9r3kpNyuOaYx
 YROQ==
X-Gm-Message-State: APjAAAXKKsZMNA6nskDqmteC8V1zeH4aVXiW2Du9frF00AmH3Ps2/Oc6
 djbV+IwbUzoluaJw2Y2I9ULte669vHmMj36HVLODJVcI2Q4Ujex3+ahYKBV0s6vCInrkIedpUPN
 /Jr0M62FMcJnNHOOgWOKCw6lLmYU=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr2521692oie.144.1578483555630; 
 Wed, 08 Jan 2020 03:39:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxb0ZkWAW5DfIGSsyB/fjWyggqgjQJR5iAu6YVER4DA9dJqRzPsOkbBv4IN/lxrxa64DbcFbHy1I7kT0xdT/s=
X-Received: by 2002:a05:6808:30d:: with SMTP id
 i13mr2521670oie.144.1578483555235; 
 Wed, 08 Jan 2020 03:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20200107071324.29492-1-liwang@redhat.com>
 <20200107101119.GA22967@rei.lan>
 <CAEemH2fmmQ2a0EVHoqkMwMOjy5EZoiNT+02yYRz-TnWpTQ__0A@mail.gmail.com>
 <20200108112537.GA22954@dell5510> <20200108113535.GA17272@rei.lan>
In-Reply-To: <20200108113535.GA17272@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 8 Jan 2020 19:39:03 +0800
Message-ID: <CAEemH2dZ0pVqpaecjO06stw8RiK-hmSUWwo=kndm3EsvoXCW2w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-MC-Unique: -LGccz6nNDux6kfA2ZppdA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: add new tst_dev_sync
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
Content-Type: multipart/mixed; boundary="===============1977116889=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1977116889==
Content-Type: multipart/alternative; boundary="000000000000981cc9059b9f5729"

--000000000000981cc9059b9f5729
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2020 at 7:35 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > This broke build with -Werror=3Dimplicit-function-declaration [1]:
> >
> > ../include/tst_device.h:78:2: error: implicit declaration of function
> 'syncfs'; did you mean 'sync'? [-Werror=3Dimplicit-function-declaration]
> > 2770  syncfs(fd);
> > 2771  ^~~~~~
> > 2772  sync
>

Thanks for highlight this.

> >
> > The problem is that syncfs() is guarded with __USE_GNU (in glibc, in mu=
sl
> > directly _GNU_SOURCE), so this requires to use _GNU_SOURCE (before
> including
> > first header).
> > Because it's in tst_device.h, we effectively need to build with
> -D_GNU_SOURCE.
> > Is that what we want? Or should we always use tst_syscall(__NR_syncfs,
> fd)
> > (without conditional check #ifndef HAVE_SYNCFS) ?
>
> I guess calling raw syscall in the tst_device.h would be easiest fix.
>

Yes, we can have a try.

Btw I just pushed a simple fix to include unistd.h, it seems not works.


> --
> Cyril Hrubis
> chrubis@suse.cz
>
>

--=20
Regards,
Li Wang

--000000000000981cc9059b9f5729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jan 8, 2020 at 7:35 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; This broke build with -Werror=3Dimplicit-function-declaration [1]:<br>
&gt; <br>
&gt; ../include/tst_device.h:78:2: error: implicit declaration of function =
&#39;syncfs&#39;; did you mean &#39;sync&#39;? [-Werror=3Dimplicit-function=
-declaration]<br>
&gt; 2770=C2=A0 syncfs(fd);<br>
&gt; 2771=C2=A0 ^~~~~~<br>
&gt; 2772=C2=A0 sync<br></blockquote><div><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Thanks for highlight this.</div><div class=
=3D"gmail_default" style=3D"font-size:small"></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; <br>
&gt; The problem is that syncfs() is guarded with __USE_GNU (in glibc, in m=
usl<br>
&gt; directly _GNU_SOURCE), so this requires to use _GNU_SOURCE (before inc=
luding<br>
&gt; first header).<br>
&gt; Because it&#39;s in tst_device.h, we effectively need to build with -D=
_GNU_SOURCE.<br>
&gt; Is that what we want? Or should we always use tst_syscall(__NR_syncfs,=
 fd)<br>
&gt; (without conditional check #ifndef HAVE_SYNCFS) ?<br>
<br>
I guess calling raw syscall in the tst_device.h would be easiest fix.<br></=
blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Yes, we can have a try.=C2=A0</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Btw I just pushed a simple fix to include unistd.h, it seems not=
 works.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Cyril Hrubis<br>
<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a><br=
>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000981cc9059b9f5729--


--===============1977116889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1977116889==--

