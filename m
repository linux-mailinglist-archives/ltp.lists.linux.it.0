Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E877275203
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 08:58:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A39953C29E1
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 08:58:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1CFA33C29D8
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 08:58:35 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6E7A81A00F85
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 08:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600844313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rb211e9NWdClVTOjQ4zmDS/KdJOnLpZ4ujZboHT7crY=;
 b=NXa/KFtyXfRh22IrAhzaDwD0/KIgjqHbyjuE4Fj366zw0NnX3qJn52mkpGnd0/BelhnM8p
 dw8mH1YZS4DMXcKizoxp/fEBxMFJh/JNKR5vslnxyR6olvvszRA33OAq5T81WgUrei8ZpF
 jiPl0hTj0WmNdqNKvCE7SHjvoBnNzbk=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-v-L2Bo47NtSkcIihWVRNYw-1; Wed, 23 Sep 2020 02:58:30 -0400
X-MC-Unique: v-L2Bo47NtSkcIihWVRNYw-1
Received: by mail-yb1-f200.google.com with SMTP id v106so18449437ybi.6
 for <ltp@lists.linux.it>; Tue, 22 Sep 2020 23:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rb211e9NWdClVTOjQ4zmDS/KdJOnLpZ4ujZboHT7crY=;
 b=UKm2wO/psnomTUME6Kzo9bVOFm2Km1p5382OB6OhbiYt49S7xZangYwSxfCoo8+481
 MNOJ5lWNiUcK4OPAMJYodLtxa7NbbKy28Hon1MuTulXXoiNZ929y1fDapFjpJoG2d3p5
 rcfDzvaDyVQeJl84wOPBe0hcEXYhxpwjrZyoNsKH4ifrms5dHRNDeYIkZd2gJZIPaJ40
 nr/AZsel/Vj2n1Io+g3boWa4zSnzqLab8hvDOIsUOtG1tbsm34V6c41xxouLlRqRFCbd
 QGdLlnUPwyw3K3SuPbFLmzaaxCplLsGl/5wroUOgROkosaZNWiclLMqbTyQNw3zitjni
 ycZA==
X-Gm-Message-State: AOAM531Xxazf9jJhQLEEc5wHmwCueAqzwH+n3DId+WVvFm8iqG4wgsHJ
 X8tZN3k2nouaEVQsmwH2lGQsl3LwVYwJb/ftTLputwbBVGXIXjM0Tkj2LkJQk0BtiKqKZwT6cjA
 anljlqhv0KqH0Tr5m/8kh19u685E=
X-Received: by 2002:a25:254f:: with SMTP id l76mr12012617ybl.366.1600844309950; 
 Tue, 22 Sep 2020 23:58:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+eXGHQc9alCpD27mxBs+B62nSo0DxDGPECcybmvHlpozjfQKUmqQXvdndVEOV2ENTPzjY05pqys31pNKo5Os=
X-Received: by 2002:a25:254f:: with SMTP id l76mr12012594ybl.366.1600844309771; 
 Tue, 22 Sep 2020 23:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan> <20200922182102.GB12980@yuki.lan>
 <CAEemH2dFqYRNNSyhQ1bJ_L+wHFUQkOVBgdnm-_6Nqr4rP7UbBg@mail.gmail.com>
In-Reply-To: <CAEemH2dFqYRNNSyhQ1bJ_L+wHFUQkOVBgdnm-_6Nqr4rP7UbBg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Sep 2020 14:58:17 +0800
Message-ID: <CAEemH2cxf2RQz5psmsaUsBHRrtayLJUVTfCo+NvevSyu7bLmvA@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>
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
Subject: Re: [LTP] LTP release
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
Cc: Filip.Bozuta@syrmia.com
Content-Type: multipart/mixed; boundary="===============0304495633=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0304495633==
Content-Type: multipart/alternative; boundary="0000000000006cce1c05aff59c1d"

--0000000000006cce1c05aff59c1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC' people who touched the patches maybe give a hand.

On Wed, Sep 23, 2020 at 2:50 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Wed, Sep 23, 2020 at 2:20 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
>> Hi!
>> As far as I can tell I've pushed the last patch that should have been in
>> the release just now. With that we should have a week worth of
>> pre-release testing since we are aiming for a release at the end of the
>> September. If you haven't tried LTP git HEAD yet, please do so now and
>> report any problems you find.
>>
>
> We still got this persistent fail on some kernels(RHEL8, kernel-v5.9-rc4)=
:
>
> ---
> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>
> ---
> fanotify10.c:404: TFAIL: group 0 (4) got event: mask 1020 (expected 1000)
> pid=3D95067 fd=3D12
> fanotify10.c:404: TFAIL: group 1 (4) got event: mask 1020 (expected 1000)
> pid=3D95067 fd=3D12
> fanotify10.c:404: TFAIL: group 2 (4) got event: mask 1020 (expected 1000)
> pid=3D95067 fd=3D12
> fanotify10.c:404: TFAIL: group 0 (0) got event: mask 1020 (expected 1000)
> pid=3D95067 fd=3D12
> fanotify10.c:404: TFAIL: group 1 (0) got event: mask 1020 (expected 1000)
> pid=3D95067 fd=3D12
> fanotify10.c:404: TFAIL: group 2 (0) got event: mask 1020 (expected 1000)
> pid=3D95067 fd=3D12
>
> ---
> recvmmsg01.c:86:9: error: request for member =E2=80=98type=E2=80=99 in so=
mething not a
> structure or union
>   timeout.type =3D tv->ts_type;
>
> Otherwise, the latest LTP test good from my side(RHEL8, mainline-kernel).
>
> --
> Regards,
> Li Wang
>


--=20
Regards,
Li Wang

--0000000000006cce1c05aff59c1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">CC&#39;=C2=A0people=C2=A0who touched the patches maybe give a hand.</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Sep 23, 2020 at 2:50 PM Li Wang &lt;<a href=3D"mailto:liwang@redh=
at.com">liwang@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"fo=
nt-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 2:20 AM Cyril Hrubis &lt;<=
a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
As far as I can tell I&#39;ve pushed the last patch that should have been i=
n<br>
the release just now. With that we should have a week worth of<br>
pre-release testing since we are aiming for a release at the end of the<br>
September. If you haven&#39;t tried LTP git HEAD yet, please do so now and<=
br>
report any problems you find.<br></blockquote><div><br></div><div style=3D"=
font-size:small">We still got this persistent fail on some kernels(RHEL8, k=
ernel-v5.9-rc4):</div><div><br></div><div>---</div>send02.c:86: FAIL: recv(=
) error: EAGAIN/EWOULDBLOCK (11)<br>send02.c:86: FAIL: recv() error: EAGAIN=
/EWOULDBLOCK (11)<br>send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (1=
1)<br><div style=3D"font-size:small">send02.c:86: FAIL: recv() error: EAGAI=
N/EWOULDBLOCK (11)</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">---</div><div style=3D"font-size:small"></div><div sty=
le=3D"font-size:small">fanotify10.c:404: TFAIL: group 0 (4) got event: mask=
 1020 (expected 1000) pid=3D95067 fd=3D12<br>fanotify10.c:404: TFAIL: group=
 1 (4) got event: mask 1020 (expected 1000) pid=3D95067 fd=3D12<br>fanotify=
10.c:404: TFAIL: group 2 (4) got event: mask 1020 (expected 1000) pid=3D950=
67 fd=3D12<br>fanotify10.c:404: TFAIL: group 0 (0) got event: mask 1020 (ex=
pected 1000) pid=3D95067 fd=3D12<br>fanotify10.c:404: TFAIL: group 1 (0) go=
t event: mask 1020 (expected 1000) pid=3D95067 fd=3D12<br>fanotify10.c:404:=
 TFAIL: group 2 (0) got event: mask 1020 (expected 1000) pid=3D95067 fd=3D1=
2<br></div><div style=3D"font-size:small"><br></div><div style=3D"font-size=
:small">---</div><div style=3D"font-size:small">recvmmsg01.c:86:9: error: r=
equest for member =E2=80=98type=E2=80=99 in something not a structure or un=
ion<br>=C2=A0 timeout.type =3D tv-&gt;ts_type;<br></div><div style=3D"font-=
size:small"><br></div><div style=3D"font-size:small">Otherwise, the latest =
LTP test good from my side(RHEL8, mainline-kernel).</div><div style=3D"font=
-size:small"><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div>=
Regards,<br></div><div>Li Wang<br></div></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000006cce1c05aff59c1d--


--===============0304495633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0304495633==--

