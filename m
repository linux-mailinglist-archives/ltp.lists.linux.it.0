Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 377A62AEE1E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 10:51:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F2B793C2F3D
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 10:51:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 009A73C2639
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 10:51:36 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 79E8E1400043
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 10:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605088294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FbPuZHDRl5OA7OhbJYepLjCV6ZHgsJMDKcfUI0RNA0w=;
 b=eyk1wAyES2Mi/C8+s5Wx4wwH/n4d0Wh++h+B7G5SL2dkrVRKgGsditogzL394Q6yTqyhFR
 YKyGTayIcDAjPZFTXx3me37gFTJgS3/49iqPOPGxLz4MAqM7kxK0gRbJlhAYuqkZpMn+8T
 mLSlYMmeEwuVimxl3sffG++DE3wKa9w=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-I7LqljWCNxmVU94I1xOpWw-1; Wed, 11 Nov 2020 04:51:31 -0500
X-MC-Unique: I7LqljWCNxmVU94I1xOpWw-1
Received: by mail-yb1-f197.google.com with SMTP id j10so1834470ybl.19
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 01:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FbPuZHDRl5OA7OhbJYepLjCV6ZHgsJMDKcfUI0RNA0w=;
 b=fDzdHpv3IGbTp36X620CdiIVwVPqmQMDYJ17IhrCrzfjIdITufa1IZBzC871WmBoRA
 zKbVGpu37knDWguEF2AiOSyusqAxsepNKsbuxABNvC/OSm8kNiaEG7tmCScVLQge9XDU
 oHIoJSpomqmo8sgp57AKcUqqvpWVHnMZigtI5wSmch7rpOduX/fSifz0UnIdtx2Qox6R
 t/6QasneSzKHPqraUdKkKJAHninNTpifPcAcZ0X8p3xm6KShwlugyAGlznfC+/R54bHz
 fzf4Gu57ldnEVuQEjm5A8xR4BVnLpEtlpmrBm/taMXJrUD0gxBXHknkNzQeABX2+AMy2
 C7zg==
X-Gm-Message-State: AOAM532LMhmAFvmsE/uFYZALoyfHZAcnX9w2xHkUJygdi9TGco6DJMZR
 EejfOZUL1hCOSiKGSC9Uf37JuRPEDBzMDt9th0D/ZzG+wd1y/cRjgE7/6vkX1UCCOSVtBiTxLFf
 +SyRAmRHJQaVciFtCRsiJQI24Ow8=
X-Received: by 2002:a25:d9cf:: with SMTP id
 q198mr22510589ybg.243.1605088290896; 
 Wed, 11 Nov 2020 01:51:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznNnKGslephPwzqKMP3NtKO6v9lIBIEnhCzg1VSM19DmggWU45iYyLbZlFmUlKOKdcQATNW8I8ToWc3cUxcNI=
X-Received: by 2002:a25:d9cf:: with SMTP id
 q198mr22510576ybg.243.1605088290760; 
 Wed, 11 Nov 2020 01:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20201110120923.21759-1-pvorel@suse.cz>
 <20201111093934.GA5870@yuki.lan>
In-Reply-To: <20201111093934.GA5870@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Nov 2020 17:51:19 +0800
Message-ID: <CAEemH2cyoSpQhTH5S=EWWoD7DaLz6WKFFadLFHMxkW8LHYM5CA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] m4: Remove workaround for old pkg-config
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
Content-Type: multipart/mixed; boundary="===============0746352727=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0746352727==
Content-Type: multipart/alternative; boundary="00000000000067826b05b3d1bd87"

--00000000000067826b05b3d1bd87
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Nov 11, 2020 at 5:38 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> Looks good to me, let's apply this unless anybody complains.
>

Hold on, please.

Seems we have to replace TIRPC_LIBS/TIRPC_CFLAGS with LIBTIRPC_* in all
respective Makefiles? Otherwise, it will fail like the Travis CI job I
guess.

-- 
Regards,
Li Wang

--00000000000067826b05b3d1bd87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Nov 11, 2020 at 5:38 PM Cyril Hrubis &lt;<a =
href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
Looks good to me, let&#39;s apply this unless anybody complains.<br></block=
quote><div>=C2=A0</div></div><div class=3D"gmail_default" style=3D"font-siz=
e:small">Hold on, please.=C2=A0</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Seems we have to replace TIRPC_LIBS/TIRPC_CFLAGS with=C2=A0LIBTIRPC_=
* in all respective Makefiles? Otherwise, it will fail like the Travis CI j=
ob I guess.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div>=
</div></div>

--00000000000067826b05b3d1bd87--


--===============0746352727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0746352727==--

