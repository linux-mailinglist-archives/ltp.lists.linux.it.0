Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C18B723A144
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 10:48:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75AE83C6AC5
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 10:48:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0C0183C14BD
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 10:48:11 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 1AC8B600957
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 10:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596444488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/4ApLepbPuMwXS1fYCudmGIf0KaTUpUUXSEZVpllVHY=;
 b=GuODJW+sfnJDhSa/qM5dZh1G/o1/ah+QL3k/fnpGRTxwRPeNKNVv8v2ljnotcNUze6rywy
 uHLLeBNQztHrjVt9e0JYHhIM54UasDbkmp77ZBMmc8Cj6+P1NUzXgrOFDO0zn/681fyGNx
 +CxbXUJsfjlTy7YChouljwddsvhwjC8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-sAmru7DeNniKP_e2eBvXtg-1; Mon, 03 Aug 2020 04:48:04 -0400
X-MC-Unique: sAmru7DeNniKP_e2eBvXtg-1
Received: by mail-lj1-f199.google.com with SMTP id f13so1860099ljj.15
 for <ltp@lists.linux.it>; Mon, 03 Aug 2020 01:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4ApLepbPuMwXS1fYCudmGIf0KaTUpUUXSEZVpllVHY=;
 b=jJO4qlnBXUkl0Wy3k3uE/sfj0FvGw8WviV5IZe2RNjjE7e8yjOcnrni82Yx+CH71nk
 DPS9IT097w5kbV0Y1mLdxHAqmLFkTYg8p/J9diBt+5jvMNH1HcdRIPxwHsTlI6p0b6B7
 kHKhyDuZd+wFMT/hbs+LoOV5QX/fXhctcjb/aXr/4yT1jTglzXNKxEzBXQq4w49HEs5N
 HARQOEH+GQzL+qgbFQBXxsNF2/aJtXtKF9G2f3TPg/hjc47SUNukoY08d1tid10WvgAl
 HCOTd9/6J59N7XtY3xECzrfQwVJUgEgmji9TsNsapcp2G3qDbJDcBt8Tt8aOmeDNx0GQ
 UiFA==
X-Gm-Message-State: AOAM531bCYDsALgg1I7ihBfhzW70uT1/+rHVyiGmlUBx3tJdvgC8d6yB
 YJLDy5xBO6ILC8ChmvtFnzeC+gDgU/WIh6DxJKDteob89XV73DCpAXjbDxB2Xmgsq4Xzox8X5TO
 5jFp/HB3tY8XCMV3/V+2PMtKyvhY=
X-Received: by 2002:a05:651c:110b:: with SMTP id
 d11mr3591045ljo.353.1596444482795; 
 Mon, 03 Aug 2020 01:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPzOynXlUKS/3o3apppjOx7NMr5yGVQ+P/39mUwdVx6ZJRN97QLAAsZv//AwT6yome3GwRvo1DN5zRmsqbDvI=
X-Received: by 2002:a05:651c:110b:: with SMTP id
 d11mr3591040ljo.353.1596444482606; 
 Mon, 03 Aug 2020 01:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <1595911224-12470-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595911224-12470-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200729143451.GG7152@yuki.lan>
 <320f25e9-f0e7-73a9-fe43-284befcce1e2@cn.fujitsu.com>
In-Reply-To: <320f25e9-f0e7-73a9-fe43-284befcce1e2@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 3 Aug 2020 16:47:50 +0800
Message-ID: <CAEemH2dAGGFt6esH4srVec=6HCVt3j+Bn1UOdTACwg_5xj1htA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] libs/libltpnewipc: Add libmsgctl.c into
 new ipc library
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
Content-Type: multipart/mixed; boundary="===============0465632641=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0465632641==
Content-Type: multipart/alternative; boundary="0000000000004a2d6605abf53206"

--0000000000004a2d6605abf53206
Content-Type: text/plain; charset="UTF-8"

Hi Xu,

On Thu, Jul 30, 2020 at 3:00 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
wrote:

> Hi Cyril
>
>
> > Hi!
> >> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> >> ---
> >>   include/libnewipc.h           |  28 ++++------
> >>   libs/libltpnewipc/libnewipc.c | 101 ++++++++++++++++++++++++++++++++--
> >>   2 files changed, 109 insertions(+), 20 deletions(-)
> >
> > Just FYI we do not have to put all the code into a single *.c file, we
> > can have as many as we want in the library directory...
> I remember you have some comments on my previous patach as below:
> ------------------------------
> So unless we plan to use it from different tests it does not make much
> sense to export it to the top level include and libs.
>
> Or alternatively we do have libltpnewipc we can pust put the
> libnewmsgctl.c to that directory and with that we will have a single
> System V IPC helper library.
> ------------------------------
>
> So I merge libnewmsgctl.c into libnewipc.c.
>
> ps: IMO, libnewipc has only three functions(getipckey,get_used_queues,
> probe_free_addr) ,It's hard to call it a LIBS library. Can we put it
> into lib directory and named it as tst_ipc.c?
> @LI, What do you think about this?
>

I have no objection to this.

The reason to move it to LIBS is to support both new and old test cases in
same directory, so if you're going to move back into the general LTP lib,
we have to convert all the old-tests into new API. Then it will be fine.

-- 
Regards,
Li Wang

--0000000000004a2d6605abf53206
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Xu,</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Jul 30, 2020 at 3:00 PM Yang Xu &lt;<a hr=
ef=3D"mailto:xuyang2018.jy@cn.fujitsu.com">xuyang2018.jy@cn.fujitsu.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi C=
yril<br>
<br>
<br>
&gt; Hi!<br>
&gt;&gt; Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@cn.fuji=
tsu.com" target=3D"_blank">xuyang2018.jy@cn.fujitsu.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0include/libnewipc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 28 ++++------<br>
&gt;&gt;=C2=A0 =C2=A0libs/libltpnewipc/libnewipc.c | 101 ++++++++++++++++++=
++++++++++++++--<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 109 insertions(+), 20 deletions(-)<br=
>
&gt; <br>
&gt; Just FYI we do not have to put all the code into a single *.c file, we=
<br>
&gt; can have as many as we want in the library directory...<br>
I remember you have some comments on my previous patach as below:<br>
------------------------------<br>
So unless we plan to use it from different tests it does not make much<br>
sense to export it to the top level include and libs.<br>
<br>
Or alternatively we do have libltpnewipc we can pust put the<br>
libnewmsgctl.c to that directory and with that we will have a single<br>
System V IPC helper library.<br>
------------------------------<br>
<br>
So I merge libnewmsgctl.c into libnewipc.c.<br>
<br>
ps: IMO, libnewipc has only three functions(getipckey,get_used_queues, <br>
probe_free_addr) ,It&#39;s hard to call it a LIBS library. Can we put it <b=
r>
into lib directory and named it as tst_ipc.c?<br>
@LI, What do you think about this?<br></blockquote><div><br></div><div><div=
 class=3D"gmail_default" style=3D"font-size:small">I have no objection to t=
his.</div></div><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">The reason to move it to LIBS is to support both new and ol=
d test cases in same directory, so if you&#39;re going to move back into th=
e general LTP lib, we have to convert all the old-tests into new API. Then =
it will be fine.</div></div><div><br></div></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wan=
g<br></div></div></div></div>

--0000000000004a2d6605abf53206--


--===============0465632641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0465632641==--

