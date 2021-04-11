Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B4835B1CD
	for <lists+linux-ltp@lfdr.de>; Sun, 11 Apr 2021 07:01:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA3573C730B
	for <lists+linux-ltp@lfdr.de>; Sun, 11 Apr 2021 07:01:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3CBF53C1C3C
 for <ltp@lists.linux.it>; Sun, 11 Apr 2021 07:01:34 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4DB9B100054B
 for <ltp@lists.linux.it>; Sun, 11 Apr 2021 07:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618117292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ultQrcp08DS1USPfvPx0YRKGSSw5pltxT+yD/PfEr6o=;
 b=ZvvEtwcK1khngUI6bsQRHQxCRoeJJURR+4pemjpWUquOXUZVW7cMmhQJ4c3oOBYf7q/duG
 peglRRtpydytJiAGaLJI3DBFYnbzWhJr1pwawiWAeRWljgIMGlDJMUnfd8t5HJzplAEIWk
 4icYlb5AHQYAB8TUsoz5gfzBv9pOf0g=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-hvyCvP1UMCq6CYECuxB55g-1; Sun, 11 Apr 2021 01:01:28 -0400
X-MC-Unique: hvyCvP1UMCq6CYECuxB55g-1
Received: by mail-yb1-f200.google.com with SMTP id v6so9977909ybk.9
 for <ltp@lists.linux.it>; Sat, 10 Apr 2021 22:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ultQrcp08DS1USPfvPx0YRKGSSw5pltxT+yD/PfEr6o=;
 b=F7fnP1LeO19UtMhqzEHv6E6MaA2EJjHqyfa3a1cVtObAwZDKxuSU3qmClM3JdU5TdF
 ch/qCW/CaXJx/76w8EQnK15iWDCcQBuLEenFSGXKkaShaQW9o27Cdye1IsUqF6it81ID
 Fxc7MrjGQfiU/HYYVnZ+tQFPgJCIAa2/tUXndvxNfH6WxMEjnYBRDuXH9XjkOocggNFM
 kDgw1lJIlp2loHw/N2PPauSkquNxN07g1Di6Kz+Bt8iAbCIVl29Yenqz8YgSN50ZW4MD
 tj50sPEtMbQEi/450mKqeCPd+142ga8FxnoX0/cMq7uQGLZrIt6ZLeZLyNkZYoFM2Dpb
 XpPA==
X-Gm-Message-State: AOAM530rq8KkuE7otyDI6O5mFQjqa103u42TtTNBrEBej46Lf+VwddxJ
 jLfSqyJaMrLkgkJOcF21uziyngXZW+cstZJghoVVxJoWITd2C0KZ7DlKGVgfGT36lZWlZcdHI9C
 mjUPQk/51ViG/jO69Bf9yOS1nG8U=
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr3217006ybh.110.1618117286971; 
 Sat, 10 Apr 2021 22:01:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUeaDmAQ3+7XeuvkY4cuyFSfJm8JWdBIuoqPWEhGOFDve7SA7zBvzioc98RSGI21R+hIjMxyjc5lDupGlxEGU=
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr3216991ybh.110.1618117286792; 
 Sat, 10 Apr 2021 22:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <1611570288-23040-1-git-send-email-liuxp11@chinatelecom.cn>
 <YBE03REJywKIlM0X@yuki.lan> <2021012718043566596022@chinatelecom.cn>
 <CAEemH2dA0T1F3wsdwtG2hsfDUUJsY8gFeTLTHyGz+pu034gH4g@mail.gmail.com>
 <202103051352110688245@chinatelecom.cn>
 <CAEemH2cW9djj3sN8j9Xj_A5iNB9DLhYYkK=nu8ypaOtiYMnLyw@mail.gmail.com>
 <202103241726592002447@chinatelecom.cn>
In-Reply-To: <202103241726592002447@chinatelecom.cn>
From: Li Wang <liwang@redhat.com>
Date: Sun, 11 Apr 2021 13:01:14 +0800
Message-ID: <CAEemH2cYTS1mEXR+2W8Fh_HtySj3gTmhfqmcmy4DZ4dG2S4o1w@mail.gmail.com>
To: "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/ioctl: ioctl_sg01.c: ioctl_sg01
 invoked oom-killer
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1341741853=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1341741853==
Content-Type: multipart/alternative; boundary="00000000000015a49905bfab4ad2"

--00000000000015a49905bfab4ad2
Content-Type: text/plain; charset="UTF-8"

Hi all,

Seems this ioctl_sg01 problem is caused by the kernel commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8c7829b04c523cdc732cb77f59f03320e09f3386

I start a new thread for tracking it in Linux-MM just now:
https://lists.linux.it/pipermail/ltp/2021-April/021903.html

liuxp11@chinatelecom.cn <liuxp11@chinatelecom.cn> wrote:

Hi Li Wang,
> I think your patch is good.
> 1.CommitLimit is the memory that can be allocated by application.
> 2.ioctl_sg01 in serveral machines with your patch,the result is passed.
>
>
Thank you Xinpeng,

That is just an eclectic workaround but not the key point of the OOM occurs
issue.
I'd not suggest merging my patch to LTP:).

-- 
Regards,
Li Wang

--00000000000015a49905bfab4ad2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi all,</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">See=
ms this ioctl_sg01 problem is caused by the kernel commit:</div><div class=
=3D"gmail_default" style=3D"font-size:small"><a href=3D"https://git.kernel.=
org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D8c7829b04c523c=
dc732cb77f59f03320e09f3386">https://git.kernel.org/pub/scm/linux/kernel/git=
/torvalds/linux.git/commit/?id=3D8c7829b04c523cdc732cb77f59f03320e09f3386<b=
r></a></div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">I start a new thre=
ad for tracking it in Linux-MM just now:</div><div class=3D"gmail_default" =
style=3D"font-size:small"><a href=3D"https://lists.linux.it/pipermail/ltp/2=
021-April/021903.html">https://lists.linux.it/pipermail/ltp/2021-April/0219=
03.html</a><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr"><a href=3D=
"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a> &lt;<a href=3D=
"mailto:liuxp11@chinatelecom.cn">liuxp11@chinatelecom.cn</a>&gt; wrote:<br>=
</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div>
<div><span></span></div><blockquote style=3D"margin-top:0px;margin-bottom:0=
px;margin-left:0.5em;margin-right:inherit"><div>Hi Li Wang,</div><div>I thi=
nk your patch is good.</div><div><span style=3D"font-size:small;line-height=
:19.5px;background-color:transparent">1.CommitLimit is the memory that can =
be allocated by application.</span></div><div><span style=3D"font-size:smal=
l;line-height:19.5px;background-color:transparent">2.ioctl_sg01 in serveral=
 machines with your patch,the result is passed.</span></div></blockquote></=
div></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Thank you Xinpeng,</div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">That is just an eclectic workaround but=
 not the key point of the OOM occurs issue.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">I&#39;d not suggest merging my patch to LTP:).=
</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--00000000000015a49905bfab4ad2--


--===============1341741853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1341741853==--

