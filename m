Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A817133CEBE
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 08:39:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7852C3C2DB0
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 08:39:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B59A13C2D5F
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 08:39:33 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 49DE81400F8A
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 08:39:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615880370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Asema5MRr6FaRIpsb8Cv5bDtpLI16T9rMZlZ/kWdrG0=;
 b=hirbCFWmGvD+GOg0VAZELjnL8+aapvZ+3jQGhtKQqQM6Q6W7Ml3/RGycAW/lDzg69aeUK/
 AjG5Tl5nX4DNyYEMSSKLPar2H5ZrUJby7hzg0lnYTeA18e49heg50LFu2S/3FFCfMde+d7
 H1tupekEiKPyTMPeFBDXbhxVhmOC8qk=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-WxmSiyEIMr6Egiy7bW6KAQ-1; Tue, 16 Mar 2021 03:39:28 -0400
X-MC-Unique: WxmSiyEIMr6Egiy7bW6KAQ-1
Received: by mail-yb1-f198.google.com with SMTP id y7so40872003ybh.20
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 00:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Asema5MRr6FaRIpsb8Cv5bDtpLI16T9rMZlZ/kWdrG0=;
 b=BVIkUOV1KIn5b68wzIfM/MJRvxT2BNV2dGHb27Sr4MvDfHGaMrQ+h2wcdhLeEnBFeZ
 77oIQhtzLNHFdJ30rAKzoSwvCiOLH30AtsIBXBXN5XQJ81W8Jgd2TxMk/J1UDZSfwk7n
 l4b2PkYXGQ1OB/nwHZQN5cFnwKuUV+oyr8SyzR1WePM6exRL+f6Vrk2r35891bMTMd52
 b23/VZHzhfEhjzwwrMJQNjHpkZxGMQewaQUYGBqS0C8asBPEydGSqGpPJxhaUvuUJ7aW
 wK+fR8KuHxOhb3iJ7wxgIrkQBx6xoZE/QDifbes5fg802wCQs+shsY2H8ZFTqT2p10qv
 5dvg==
X-Gm-Message-State: AOAM531Ewsj/RNfOKpAjVhP8Xpx2pnQBSlWuicuUOkt6wZT7nDssl+jc
 hDFr3Yd3Ch5HeVmw+9pMTVXyCpSYTjGTxXAYoMNl3BgjcgRkcx+HsJ3O+xseEjavHLTL2DsXCvh
 eOvyiqy/nkO0vT7+Jz4ULUOTagh8=
X-Received: by 2002:a25:1485:: with SMTP id 127mr5393762ybu.243.1615880367747; 
 Tue, 16 Mar 2021 00:39:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW9ynbWolG5BqhYWXlcfGIOjN4EKz3p+s8MROtSV9fuTregi1KZF7e+2376jnse3IwXkyt0dsQied2W8FLZT4=
X-Received: by 2002:a25:1485:: with SMTP id 127mr5393747ybu.243.1615880367559; 
 Tue, 16 Mar 2021 00:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210316065542.1221203-1-lkml@jv-coder.de>
In-Reply-To: <20210316065542.1221203-1-lkml@jv-coder.de>
From: Li Wang <liwang@redhat.com>
Date: Tue, 16 Mar 2021 15:39:16 +0800
Message-ID: <CAEemH2e1M09F4ZDFtRFtSQeQRW-t9KxG4+csakcN4tZE=3Hebw@mail.gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
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
Subject: Re: [LTP] [PATCH] open_posix: Add all logfiles to gitignore
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1883057870=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1883057870==
Content-Type: multipart/alternative; boundary="0000000000004ef10405bda27788"

--0000000000004ef10405bda27788
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 2:56 PM Joerg Vehlow <lkml@jv-coder.de> wrote:

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> The logfiles are created, when the tests are compiled and
> should not be committed.
>

Pushed, thanks!

-- 
Regards,
Li Wang

--0000000000004ef10405bda27788
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Mar 16, 2021 at 2:56 PM Joerg Vehlow &lt;<a=
 href=3D"mailto:lkml@jv-coder.de">lkml@jv-coder.de</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Joerg Vehlow &lt;<a=
 href=3D"mailto:joerg.vehlow@aox-tech.de" target=3D"_blank">joerg.vehlow@ao=
x-tech.de</a>&gt;<br>
<br>
The logfiles are created, when the tests are compiled and<br>
should not be committed.<br></blockquote><div><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Pushed, thanks!</div></div><div><br></d=
iv>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>=
Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004ef10405bda27788--


--===============1883057870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1883057870==--

