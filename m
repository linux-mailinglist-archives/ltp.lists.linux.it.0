Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A620450B
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 02:11:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D8903C2BF0
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Jun 2020 02:11:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 86FD23C2239
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 02:10:59 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id CF71D1000BE4
 for <ltp@lists.linux.it>; Tue, 23 Jun 2020 02:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592871057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qekh2xoYy4KDtLikusxwhwhYv0cX3xZ8WGnb35ojmUw=;
 b=WSl/qfh/QdhBJoWaCcOTtKWqlQJcuTYPCPh15PxaQiZyAzmOPXufC3esVxRtqqg6r2ld47
 6XlpI4KwzFMrfbi0c7vDSyPfkPMNCQn6ZW5HQf5BLMvdsQD9eGsUtGySmBkbTok0yawkIF
 qSHB//pWB06eGPv5sJqm9c03RyFAqhQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-DWzNPiGAPA-Mg15D3qqAOQ-1; Mon, 22 Jun 2020 20:10:54 -0400
X-MC-Unique: DWzNPiGAPA-Mg15D3qqAOQ-1
Received: by mail-lf1-f69.google.com with SMTP id a75so5008823lfd.0
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 17:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qekh2xoYy4KDtLikusxwhwhYv0cX3xZ8WGnb35ojmUw=;
 b=WBZ6YgQ8roVSosuBMsyUq24Tj9nUDmStg3lKAbN6fHfej/AO/MJabQUXvWF9buVJPE
 2vNNruOWGPxWQ3EtppH/jitj+dSzEW5EV4W2faexpmxKmO5yjxqEVTkzhjg/ITw8cBtD
 hqTlPn3t6kx8clZfHCZ/6UisOApPLdGRjsxA7gzSp3zGGx5qVcota/qTqCEFj/Sv//Bo
 scywzHYmFwVZsf1rDEa+1GSyhjReS8dxdWA1qSqrsCxPTbstglWaOmQphAngysmVA+Nn
 SZOY2BK0n81Nx23AvKP5KkV3VN/dN7Wteh6GToFKwxW/bXcE736FD+d0ZmDjLWmIWYC9
 5/FA==
X-Gm-Message-State: AOAM533wovkdQa2vCQ/pPi6xpMp1UZgVv1WWhA48i9TZ97eaR8mffFaR
 ahUR5mlNYBcJ6xKG2Q3caMr5TWA20K01MO1xaRmBX/Z8owAl4bEtjub5G8VZOKXEEm7aJqWAoh7
 e1JQh33VdqW6tfa6Efx9xUvKI8wc=
X-Received: by 2002:a05:6512:3089:: with SMTP id
 z9mr11024625lfd.83.1592871053033; 
 Mon, 22 Jun 2020 17:10:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNC/J/Rgx0ZHCDchRg/xXYl2ggmDHPJsYbUmzQ8VH3w55fPb3v64e/sM9mXudjOXgPXWK9habQVyVKt/CFD3c=
X-Received: by 2002:a05:6512:3089:: with SMTP id
 z9mr11024615lfd.83.1592871052782; 
 Mon, 22 Jun 2020 17:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200609095102.21153-1-liwang@redhat.com>
 <1111554317.15300411.1591699362992.JavaMail.zimbra@redhat.com>
 <CAEemH2fkUX2KA+dPqgjqrBftxAZ722k9B7i3fi8eSxEmzSLk6w@mail.gmail.com>
 <CAEemH2e+BE4=jikyu92CNarVGefd9piwDdWxSzwua3rWj6_dkQ@mail.gmail.com>
 <20200622131012.GA5500@dell5510>
In-Reply-To: <20200622131012.GA5500@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 23 Jun 2020 08:10:40 +0800
Message-ID: <CAEemH2cZ9fLSt_uecP7hb5uoB7rPjqMsw0i5buvU9h8GDWc3dg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/4] lib: add new cgroup test API
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
Cc: Pter Vorel <pvorel@suse.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0718420531=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0718420531==
Content-Type: multipart/alternative; boundary="000000000000464cb905a8b53199"

--000000000000464cb905a8b53199
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 22, 2020 at 10:20 PM Petr Vorel <pvorel@suse.cz> wrote:

> Hi all,
>
> > I have pushed the patchset with the following changes:
> I've updated wiki. Please remember updating it when you touch doc/*.txt.
>

Ah yes, I have forgotten that more than twice. Sorry for the inconvenience.

-- 
Regards,
Li Wang

--000000000000464cb905a8b53199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 22, 2020 at 10:20 PM Petr Vorel &lt;<a =
href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
&gt; I have pushed the patchset with the following changes:<br>
I&#39;ve updated wiki. Please remember updating it when you touch doc/*.txt=
.<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Ah yes, I have forgotten that more than twice. Sorry for =
the inconvenience.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000464cb905a8b53199--


--===============0718420531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0718420531==--

