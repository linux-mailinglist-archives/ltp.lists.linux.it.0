Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263E324A37
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 06:37:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C28833C5A3E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 06:37:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5C97D3C4E16
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 06:37:18 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BFE3C600953
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 06:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614231436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MPaWkLmKKbhm6gaStsGob8f37AuuKvv+fLjkt4TTAvg=;
 b=AugiScjGoknW46iuTR1ZlWiCGA+QI2Kp3EguXj8ZDOhHp5uc18l6j6EGnNIbwqQT/FcNJj
 D4AZCah8L9WbI1/9SgSvldXUS7SEZ1vc/O2txLvKyWzcmLMkRdwfwOulU9r0jZYTzvuE4U
 RYFCoacNdOR9189/UeKVw/A/F3cJpyM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-zhm2ATJsMTaW5MIVY0W6Tw-1; Thu, 25 Feb 2021 00:37:11 -0500
X-MC-Unique: zhm2ATJsMTaW5MIVY0W6Tw-1
Received: by mail-yb1-f200.google.com with SMTP id v62so4832657ybb.15
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 21:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPaWkLmKKbhm6gaStsGob8f37AuuKvv+fLjkt4TTAvg=;
 b=Y7R/NH/5dP0r6GS7VbKr+SYX/rtf7L7vsY5ihM76GjSfj3wom6U1Khsq83/cTSnht8
 psCJKydLS89NL/CTbClD49kNFmkNJs0t4HzRddwxR7uSz15KW5jG51yTDttZLeyUX/Ny
 Q+kZeMMHmJkaFeLqCPqfqAD/g+/QmTR8XCVe8ArQFqZGDAlmOBBclf0/xibhumn9RoO1
 f+Gfm2OTn5KgnkivbNLANXHekiVBjv/Vqzye1+uk/JaQG/EgswHhxgvCTnAv6aLJQdt2
 vrJFA1e5Y1QfOGbi+vdKUyRu/Ty1FCgnMmpKlzK3PquePgMhGNEHwX0eFfk4LEHxGhYW
 3OKg==
X-Gm-Message-State: AOAM533Y7YsIbkj97j4Xmb3BvZBfrLADVi6OzJ+T/UjX2sabkgzsrOgz
 4IgdkhtIAZ+0edC/2VExpdq/iM2r2ksxi6JSSHJYy6bDnYXExtrvEofj2RKRqTl2d05R8OVA6qn
 G7pJ2zBqzUrZ+bsE6Gp2O2+k3+Yo=
X-Received: by 2002:a25:412:: with SMTP id 18mr1731930ybe.366.1614231430858;
 Wed, 24 Feb 2021 21:37:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycvuNZG1wD7ujv43UqUQdGxrziEcUrpepA1biBdqqpCe7cXShFyPYaksT9L3ejik8r/KEZWG9/LgqDPNTaiDo=
X-Received: by 2002:a25:412:: with SMTP id 18mr1731910ybe.366.1614231430625;
 Wed, 24 Feb 2021 21:37:10 -0800 (PST)
MIME-Version: 1.0
References: <20210224082500.18106-1-liwang@redhat.com> <YDYyMQO5+Iu8zFpt@pevik>
In-Reply-To: <YDYyMQO5+Iu8zFpt@pevik>
From: Li Wang <liwang@redhat.com>
Date: Thu, 25 Feb 2021 13:36:59 +0800
Message-ID: <CAEemH2fO3fxtP7K4KNK+3sBzc4pBh=Gv5b3pHqZ_ASsPGMgsqw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] swapping01: check memory swap usage per process
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
Content-Type: multipart/mixed; boundary="===============2015751020=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2015751020==
Content-Type: multipart/alternative; boundary="00000000000002168e05bc228b20"

--00000000000002168e05bc228b20
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

On Wed, Feb 24, 2021 at 7:02 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Li,
>
> looks like as a good approach. LGTM.
> Thanks for taking care.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Thanks for the review, merged.

-- 
Regards,
Li Wang

--00000000000002168e05bc228b20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Feb 24, 2021 at 7:02 PM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi Li,<br>
<br>
looks like as a good approach. LGTM.<br>
Thanks for taking care.<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">Thanks for the review, merged.=
</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></d=
iv></div></div>

--00000000000002168e05bc228b20--


--===============2015751020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2015751020==--

