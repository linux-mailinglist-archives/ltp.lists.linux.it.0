Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 073813438F3
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 06:59:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB4D73C2983
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 06:59:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F20763C2869
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 06:59:29 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E7943200973
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 06:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616392767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bAnxUgp5jzqDkDddwnxDFPWgECocjy1Knb/pGswpNQg=;
 b=QZaWWDkvW9abO43U2g47Bt2WgVjfmi4KLVhoY+Otr2YIvtWdkymqVijknvS+jlNRPxyTqg
 WBBeDSRtvQP6y/2l4p84QNMP35rVCZMQDdLehguiJHbl2SlTd12rIphz+IP/ZfnpQc/F3k
 DeZaxKOuuGoDujxy5Bt74ZdeTGvbZ54=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-QlFgcczWOAyVS5-H6BxhfA-1; Mon, 22 Mar 2021 01:59:23 -0400
X-MC-Unique: QlFgcczWOAyVS5-H6BxhfA-1
Received: by mail-yb1-f198.google.com with SMTP id p136so59575731ybc.21
 for <ltp@lists.linux.it>; Sun, 21 Mar 2021 22:59:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bAnxUgp5jzqDkDddwnxDFPWgECocjy1Knb/pGswpNQg=;
 b=AlEJvD2pffSi5Q+CxRBGNz7NRuUF1dL/SLbRSQG1cAlY0gHy/wLaTk+p8EO3LnCTml
 u4u+Vc3uyOrRMpP7Cq54stCT4VbHBQEhBdbSOeIbIWDheFlZLIEXQEM6JnGRfJu4fm9w
 mKjKuUcjGwtAni3zPPP2jCs1QPoBseQYb8+4tnVWkylAGXQccWz+uCBtkEJvqXIffDr8
 KZqKitC1srResTaYFIGjk/X4AXyIfw6n9XGXFyNglLRROKSy8A5Ut0jarnPORWM1VE5z
 z3XoZGhBbmO6TW1P3F0znhbY0XYC1SSUdCMtvRW+VtvTOtSpIELQzE48CAIXRhuRhlat
 RHXQ==
X-Gm-Message-State: AOAM531cR46DVpFDG86cB/IUYnQnal0k+OLrSUDcsE9Kt5izUXFEKPFb
 0ExM06Coh3Z0Cdf8T41QfCeUnLQREF4hswlCArFWhCPXIcji9PjcJe0Z3Td88pOrJJOiYnCwpTS
 BdXcRS+Mwd1x62XE72jlDmAQLanY=
X-Received: by 2002:a5b:787:: with SMTP id b7mr529165ybq.243.1616392763354;
 Sun, 21 Mar 2021 22:59:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7QPp+yR3Jbhrw3NXkO3b2LXNF8rYQiZMx0Ux19dXBI9kdfiBDw2We/qR8FkSOPtUtUuIsAN17eYbyvE6V4gk=
X-Received: by 2002:a5b:787:: with SMTP id b7mr529145ybq.243.1616392763212;
 Sun, 21 Mar 2021 22:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210320161933.2088737-1-qi.fuli@fujitsu.com>
In-Reply-To: <20210320161933.2088737-1-qi.fuli@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 22 Mar 2021 13:59:12 +0800
Message-ID: <CAEemH2c0B0hWmXaZZEqVy4ZK7zgCM7OHYF139sb33Hv1AsWfdA@mail.gmail.com>
To: QI Fuli <fukuri.sai@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/swapoff/swapoff01: remove the check for
 BTRFS
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
Cc: QI Fuli <qi.fuli@fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1182894020=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1182894020==
Content-Type: multipart/alternative; boundary="00000000000078134d05be19c404"

--00000000000078134d05be19c404
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 21, 2021 at 12:20 AM QI Fuli <fukuri.sai@gmail.com> wrote:

> From: QI Fuli <qi.fuli@fujitsu.com>
>
> remove the redundant task as BTRFS is checked in is_swap_supported()
> Fixes: eadffb391("syscalls/swapoff/swapoff0{1,2}: use helpers to check
>         support status")
>

Thanks for the cleanup, pushed.

-- 
Regards,
Li Wang

--00000000000078134d05be19c404
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun, Mar 21, 2021 at 12:20 AM QI Fuli &lt;<a hre=
f=3D"mailto:fukuri.sai@gmail.com">fukuri.sai@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: QI Fuli &lt;<a =
href=3D"mailto:qi.fuli@fujitsu.com" target=3D"_blank">qi.fuli@fujitsu.com</=
a>&gt;<br>
<br>
remove the redundant task as BTRFS is checked in is_swap_supported()<br>
Fixes: eadffb391(&quot;syscalls/swapoff/swapoff0{1,2}: use helpers to check=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 support status&quot;)<br></blockquote><div><br>=
</div><div><div class=3D"gmail_default" style=3D"font-size:small">Thanks fo=
r the cleanup, pushed.</div></div><div>=C2=A0</div></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><di=
v>Li Wang<br></div></div></div></div>

--00000000000078134d05be19c404--


--===============1182894020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1182894020==--

