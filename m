Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC25A31E7C0
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 10:01:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56A2D3C661E
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Feb 2021 10:01:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3B3B33C56CA
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 10:01:07 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id AA65A1A01124
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 10:01:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613638865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JJ9eOp93Vg1znC3H8eFLzW59gF1XM27YDWZzlnG9vwA=;
 b=ZkAQNsU9VLvrWhtX2WiizeTfs3/M7yHGWvUV35eAFLF00rytZ9mbymFBEJu3QTVQUa14k9
 kq5TEjlXXFwxb5czDD58lPjxXUaeSjYSf0oLgJ0L26sNt1Cm2K7uJ3A15EsEJGoN0MkYk5
 LQKNtKA2j/LBFBrwNJtLK5OufToDlNg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-SQfWAVdDNr-Zi8qskz-4DQ-1; Thu, 18 Feb 2021 04:01:01 -0500
X-MC-Unique: SQfWAVdDNr-Zi8qskz-4DQ-1
Received: by mail-yb1-f200.google.com with SMTP id v6so1927374ybk.9
 for <ltp@lists.linux.it>; Thu, 18 Feb 2021 01:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJ9eOp93Vg1znC3H8eFLzW59gF1XM27YDWZzlnG9vwA=;
 b=flDrS0VkBnw+nUNFath+OaosbHBXDEOEBTbaJDe9edidadDCE13+1SkA3OC1t2f6So
 h20ycut+3QAxhb+h7J4VSXTB2tFqp1qCHMz/OAByUnb/udtcNEyLNWR2Y4mI9R1x85Mq
 K08ZWs/wVttHa++HOA392ikfR9UYC+os045yaxxnH0WZv7s7vqalX10IBaU6pZMlHfbZ
 6Irs+MuGJSAy3R6EFh4fHC9QdaPSTOsMkfabktYOiBsR+CnMmcRozTfyyzMQSXscZEi8
 11IsLKUyIVIIC6tm6XltlfKsdl6wxLFXH9MLEJFsxAGSB0u8DCtoTbq3UwOIGacjjgnm
 vO2A==
X-Gm-Message-State: AOAM531re7AsIWhpVrxF5Vj5fqfgQKEnfEetKqG0qkyQosTCg6fD2bOC
 KT62eQmEZdH0uJR7RSnCPicZIL9sQWpNvLZBZ5iKN+8UhU5XPm5DgY4nMfAb+1pBKqUYFv3ZBg/
 OGOTnWSAkGN82gyFOseXKDSVFdkE=
X-Received: by 2002:a25:5ac2:: with SMTP id o185mr5557750ybb.252.1613638861468; 
 Thu, 18 Feb 2021 01:01:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT6QcSZFYOH2kAUaACGr15CLQ6Zg+QmQ0mQgIUGa3d5OVRCqr7CcPFJMJ6LockparzRL40do8vGMD1Ugbi41Q=
X-Received: by 2002:a25:5ac2:: with SMTP id o185mr5557721ybb.252.1613638861264; 
 Thu, 18 Feb 2021 01:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-3-pvorel@suse.cz>
 <CAEemH2ffReVSE_210nyRZVZHOwoMMy-F4Cye08RwPa5bh7PZ0w@mail.gmail.com>
 <YBj8bMKfxqvQ6lYt@pevik>
 <CAEemH2f5tJtgcZG8WaAU1qpKwU7yHDdjzGahhL814goL5sAv-g@mail.gmail.com>
 <YB71JBi757ong63Y@pevik> <YCDkC2YG22X+OOFs@pevik>
In-Reply-To: <YCDkC2YG22X+OOFs@pevik>
From: Li Wang <liwang@redhat.com>
Date: Thu, 18 Feb 2021 17:00:49 +0800
Message-ID: <CAEemH2ekz6Vw_QwZKj75ugop8r2Qjtu4XDf2=2ZXTZj7y4AU_Q@mail.gmail.com>
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
Subject: Re: [LTP] [PATCH v2 2/6] zram01.sh: Generate test setup variables
 in setup
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
Content-Type: multipart/mixed; boundary="===============0185438921=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0185438921==
Content-Type: multipart/alternative; boundary="0000000000001f363505bb98931a"

--0000000000001f363505bb98931a
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

Sorry for the late reply, I was on the Spring Festival holidays last two
weeks.

On Mon, Feb 8, 2021 at 3:11 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> > BTW I tested zram on all filesystems including fuse/*fat/ntfs:
> > zram01 4 TINFO: make ext2 filesystem on /dev/zram0
> > zram01 4 TINFO: make ext3 filesystem on /dev/zram1
> > zram01 4 TINFO: make ext4 filesystem on /dev/zram2
> > zram01 4 TINFO: make xfs filesystem on /dev/zram3
> > zram01 4 TINFO: make btrfs filesystem on /dev/zram4
> > zram01 4 TINFO: make vfat filesystem on /dev/zram5
> > zram01 4 TINFO: make exfat filesystem on /dev/zram6
> > zram01 4 TINFO: make ntfs filesystem on /dev/zram7
>
> > and it's working well, thus I suggest to test everything available:
>
> > -       for fs in $(tst_supported_fs | grep -v -e fat -e ntfs -e fuse);
> do
> > +       for fs in $(tst_supported_fs); do
>
> Although running all 8 filesystems run takes more than 10 min. If it's too
> long,
> it might be better to keep grep and also limit number of tested
> filesystems.
>

+1
I tend to keep grep there cause Linux users might rarely use fat/ntfs.

-- 
Regards,
Li Wang

--0000000000001f363505bb98931a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">So=
rry for=C2=A0the late reply, I was on the Spring=C2=A0Festival holidays las=
t two weeks.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, Feb 8, 2021 at 3:11 PM Petr Vorel &lt;<a href=3D"=
mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
&gt; BTW I tested zram on all filesystems including fuse/*fat/ntfs:<br>
&gt; zram01 4 TINFO: make ext2 filesystem on /dev/zram0<br>
&gt; zram01 4 TINFO: make ext3 filesystem on /dev/zram1<br>
&gt; zram01 4 TINFO: make ext4 filesystem on /dev/zram2<br>
&gt; zram01 4 TINFO: make xfs filesystem on /dev/zram3<br>
&gt; zram01 4 TINFO: make btrfs filesystem on /dev/zram4<br>
&gt; zram01 4 TINFO: make vfat filesystem on /dev/zram5<br>
&gt; zram01 4 TINFO: make exfat filesystem on /dev/zram6<br>
&gt; zram01 4 TINFO: make ntfs filesystem on /dev/zram7<br>
<br>
&gt; and it&#39;s working well, thus I suggest to test everything available=
:<br>
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0for fs in $(tst_supported_fs | grep -v -e =
fat -e ntfs -e fuse); do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for fs in $(tst_supported_fs); do<br>
<br>
Although running all 8 filesystems run takes more than 10 min. If it&#39;s =
too long,<br>
it might be better to keep grep and also limit number of tested filesystems=
.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">+1=C2=A0</div><div class=3D"gmail_default" style=3D"font-=
size:small">I tend to keep grep there cause Linux users might rarely use fa=
t/ntfs.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--0000000000001f363505bb98931a--


--===============0185438921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0185438921==--

