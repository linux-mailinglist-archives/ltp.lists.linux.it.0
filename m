Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AAA12D6D1
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:32:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E31B43C2261
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 08:32:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D90593C1840
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:32:40 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5C4F320A6D0
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 08:32:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577777556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ATCp5/yVk2I7pWnAOMdsJjJ1WuYcWyck5l7Nybnu2a8=;
 b=SVpHamiT6VCTmcWpjY+t0S45cXbp+Hb9WNyVG3yX6bTirnLfy9Nwyl2jUyPX29vUXF7P2V
 VYcgMhKLxJw9eZ2MoOwOOTbTq2DvEfYvUsBVRwrz/R3Uu89hFBaNCMi3f7Brb1YoXTBrhO
 zKD3mB/IsfopjqK4rOjRWzTPc5ax4pE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-t2OLlBG6MQiK4R7530beBw-1; Tue, 31 Dec 2019 02:32:32 -0500
Received: by mail-ot1-f70.google.com with SMTP id 38so18064046otv.3
 for <ltp@lists.linux.it>; Mon, 30 Dec 2019 23:32:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ATCp5/yVk2I7pWnAOMdsJjJ1WuYcWyck5l7Nybnu2a8=;
 b=nxz624ZNTpjD12Yg3w8QnpKjDtfOy/tfFowKadZilqBKH9InFaCnK7tU8gKbJtkavH
 w//4bcgQ0T5Jzb1RX8XUsjK2sqx6ETMOseJsVZZ1jFBLTqua1WIw2y/chw7JdGe84PP0
 ov7W8yj1sgk1QrvMSMK+yIQID9jTZc0ns+u9DooUeXnN8qmt20TsUSBbb9E3BihY6gbH
 rK7AGe9biht0Jm7P07gdF5kQNjC+s6moB1/Gkzp30sCR5r+fIT9/dbsATEX1GivCEUrs
 M1VlpnLWnwWj6s9c5OPBEptGVe4ZRwH1yFldK31XCtFe+yImrnYyPlDn/CfpNTkJCk3D
 ikZw==
X-Gm-Message-State: APjAAAVtqVoqRL5Kup9PmtaGrohnfwowR+A2PpLTNaP+t/Tl4s12VagI
 mP6NwTs2R3PxzdKlmU5bbkSKCL4boXzybINyXIJfxZGZwnQi4dFPlCKLNT4/u1cB8XQQEYwmnKG
 oSvskaZSS9zloC4FG6WzoXIZs8jw=
X-Received: by 2002:a9d:6511:: with SMTP id i17mr49397521otl.264.1577777551429; 
 Mon, 30 Dec 2019 23:32:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZ1wGae+/0hO0n6NWBgFj5IIxr+EmZhjZBbdcTFyttabg6bd5+stJJzSvLu76+V4M7hFYHF/r33oPQHnZZBFA=
X-Received: by 2002:a9d:6511:: with SMTP id i17mr49397501otl.264.1577777551175; 
 Mon, 30 Dec 2019 23:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
 <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
 <23f8d05b-efff-56ba-b5d8-f99046e5619c@cn.fujitsu.com>
 <CAEemH2dyHSS20Lf9neVfY6voN-EO60_MQdXjb0Xjy9VsDfbZwA@mail.gmail.com>
 <d3baf4e5-66cb-6288-6742-0f7d1dc89090@cn.fujitsu.com>
In-Reply-To: <d3baf4e5-66cb-6288-6742-0f7d1dc89090@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Dec 2019 15:32:19 +0800
Message-ID: <CAEemH2fE=+6qi8P8wu6CDOkS1NOCWTTTmKeSBiRDWiu0qGhTOw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-MC-Unique: t2OLlBG6MQiK4R7530beBw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
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
Cc: Caspar Zhang <caspar@linux.alibaba.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2115382694=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2115382694==
Content-Type: multipart/alternative; boundary="0000000000007917a4059afaf616"

--0000000000007917a4059afaf616
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2019 at 3:05 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> ...
> >>     I have tried this for many different systems, and it doesn't hit
> >>     the failure at least one time. So if no more comments, I would
> >>     merge the patch as below in the next step.
> >
> >     I have a question.we must call sync()? I think syncfs is more
> accurate.
> >
> >
> > Here we use sync() is to make fs metadata/cache being written back
> > before testing because there is no obtainable file descriptor 'fd' for
> > the ext4 deferred IO (e.g. initialize the journal and inode tables).
>


> I see. For other test cases using tst_dev_bytes_written api such as
> fdatasync03.c,  we also need to call sync() to make this written value
> more accurate.  What do you think about it=EF=BC=9F
>

Good point. I think we should take care of them as we do for
sync_file_range02 too. It will more easily report fail in the case of a
situation that synced data is less than expected.

$ git grep tst_dev_bytes_written
kernel/syscalls/fdatasync/fdatasync03.c:
 tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/fdatasync/fdatasync03.c:        written =3D
tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/fsync/fsync04.c:
 tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/fsync/fsync04.c:        written =3D
tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/sync/sync03.c:  tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/sync/sync03.c:  written =3D
tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/sync_file_range/sync_file_range02.c:
 tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/sync_file_range/sync_file_range02.c:    written =3D
tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/syncfs/syncfs01.c:
 tst_dev_bytes_written(tst_device->dev);
kernel/syscalls/syncfs/syncfs01.c:      written =3D
tst_dev_bytes_written(tst_device->dev);

--=20
Regards,
Li Wang

--0000000000007917a4059afaf616
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 31, 2019 at 3:05 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail_default" style=3D"font-size:small">...</span><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0I have tried this for many different systems, a=
nd it doesn&#39;t hit<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0the failure at least one time. So if no more co=
mments, I would<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0merge the patch as below in the next step.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have a question.we must call sync()? I think sync=
fs is more accurate.<br>
&gt; <br>
&gt; <br>
&gt; Here we use sync() is to make fs metadata/cache being written back <br=
>
&gt; before testing because there is no obtainable=C2=A0file descriptor &#3=
9;fd&#39; for <br>
&gt; the ext4 deferred=C2=A0IO (e.g. initialize the journal and inode table=
s).<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
I see. For other test cases using tst_dev_bytes_written api such as <br>
fdatasync03.c,=C2=A0 we also need to call sync() to make this written value=
 <br>
more accurate.=C2=A0 What do you think about it=EF=BC=9F<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Go=
od point. I think we should take care of them as we do for sync_file_range0=
2 too. It will more easily report fail in the case of a situation that=C2=
=A0synced=C2=A0data is less than expected.</div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">$ git grep tst_dev_bytes_writt=
en=C2=A0</div>kernel/syscalls/fdatasync/fdatasync03.c: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_dev_bytes_written(tst_device-&gt;dev);<br>kernel/syscalls/fdatas=
ync/fdatasync03.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0written =3D tst_dev_bytes_wri=
tten(tst_device-&gt;dev);<br>kernel/syscalls/fsync/fsync04.c: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tst_dev_bytes_written(tst_device-&gt;dev);<br>kernel/syscalls=
/fsync/fsync04.c: =C2=A0 =C2=A0 =C2=A0 =C2=A0written =3D tst_dev_bytes_writ=
ten(tst_device-&gt;dev);<br>kernel/syscalls/sync/sync03.c: =C2=A0tst_dev_by=
tes_written(tst_device-&gt;dev);<br>kernel/syscalls/sync/sync03.c: =C2=A0wr=
itten =3D tst_dev_bytes_written(tst_device-&gt;dev);<br>kernel/syscalls/syn=
c_file_range/sync_file_range02.c: =C2=A0 =C2=A0tst_dev_bytes_written(tst_de=
vice-&gt;dev);<br>kernel/syscalls/sync_file_range/sync_file_range02.c: =C2=
=A0 =C2=A0written =3D tst_dev_bytes_written(tst_device-&gt;dev);<br>kernel/=
syscalls/syncfs/syncfs01.c: =C2=A0 =C2=A0 =C2=A0tst_dev_bytes_written(tst_d=
evice-&gt;dev);<br>kernel/syscalls/syncfs/syncfs01.c: =C2=A0 =C2=A0 =C2=A0w=
ritten =3D tst_dev_bytes_written(tst_device-&gt;dev);<br><br></div></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regar=
ds,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007917a4059afaf616--


--===============2115382694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2115382694==--

