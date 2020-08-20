Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F4224B1EF
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 11:16:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7B7F3C2FCF
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Aug 2020 11:16:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A558C3C2F99
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 11:16:02 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 38D8D10008F0
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 11:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597914960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y3xj1X7AS3nxS/MnTMcDkfgbrukYo3lsefdl9gbpOks=;
 b=elgZYuN3vPR6EUjX/ulfrwnaY2JQCO5wGLAjLH0FtVM+0+E28NkoHrG+wri1cS+LRFF07j
 YEaphq5k6o602MGnS3yWEpG7qwp4MGLNZPnwwUPFh7+mrfO/K4ckV0D3GkTNRZolTt50m5
 I9wv3TKG0hoH/1IRwb5douWsI+KhM/k=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-yahCJoPWNWCJANDNeQiF6Q-1; Thu, 20 Aug 2020 05:15:56 -0400
X-MC-Unique: yahCJoPWNWCJANDNeQiF6Q-1
Received: by mail-yb1-f199.google.com with SMTP id e1so1620113ybk.14
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 02:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y3xj1X7AS3nxS/MnTMcDkfgbrukYo3lsefdl9gbpOks=;
 b=Yw8wxMoK6oVriJF/7ZqcSz5NNnlcKOdTXnksFgJIA/eJgfo5bo7oXBcZ/a1vc34Da3
 crSzpGjapdcMs/t7fLyG+g5vnRU77uLYtUK1oARgjsjmAmvpX/Pisa105QQuH7R7KMw1
 JzByWzddpxokW83gPXxzXD9zRCS6jl1ou8uJk/h50ynwoIlI/2Jng0AHEBy+rYkOm3kJ
 pqwrpf7PNYRQPHGCd2Q5eyFMLyaOjdBFo+0OCP8aenp02mqkuWgj3FVcDYFJQitUmdxf
 uyanujT8P19tY5kNq5GwNRpeQ2EsnehXs3+YiLvimrCm/67xGPw1pmbgEwPoUjPAvVZU
 BxeA==
X-Gm-Message-State: AOAM533+2xjYzT+sZAB1w+0qhEq2TwMu582PFH4UCSyj5XltzPwZJEqt
 hgaWIm8nIavZI2oj1VRxWnScPR/xNvTPGX6+bXht98Bi8NIhaU3dY+YGYZz6QZHmKyMJLVcdYXC
 rNuenYdYp6jsD5DCOrh6SjUMR9aI=
X-Received: by 2002:a25:414:: with SMTP id 20mr3592476ybe.97.1597914955578;
 Thu, 20 Aug 2020 02:15:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV89OEx5nr1flFvBjbSF3T00Lno3rqiaPGu6voQRUWlryx15gpo1D+MHxPbWBRQfe2tGcxdbx/kFQBGISOuOk=
X-Received: by 2002:a25:414:: with SMTP id 20mr3592452ybe.97.1597914955252;
 Thu, 20 Aug 2020 02:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200811180604.4073173-1-aiden.gaoyuan@gmail.com>
In-Reply-To: <20200811180604.4073173-1-aiden.gaoyuan@gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 20 Aug 2020 17:15:43 +0800
Message-ID: <CAEemH2dxX2-t7S0TN3p7=zMLY_=TquSZdKUgqDRE9fpg_t8hdA@mail.gmail.com>
To: Yuan Gao <aiden.gaoyuan@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] hotplug/memory_hotplug: Handle NULL
 returned by strtok_r when parsing inputs
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
Cc: kernel-team@android.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2079270395=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2079270395==
Content-Type: multipart/alternative; boundary="0000000000004a246c05ad4b9157"

--0000000000004a246c05ad4b9157
Content-Type: text/plain; charset="UTF-8"

Hi Yuan,

Thanks for contributing to the memory-hotplug test. I have no objection to
these patches, but it seems quite a long time(since it imported to LTP from
Linux foundation at the year 2008) nobody actually touches this
memtoy except some code cleanup work.

I'm wondering whether you guys play with the memtoy regularly? and how do
you use it?

I take a rough look at the README file but got nothing useful to get
a start.

-- 
Regards,
Li Wang

--0000000000004a246c05ad4b9157
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi=C2=A0Yuan,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Thanks for contributing to the memory-hotplug test. I have no objection =
to these patches, but it seems quite a long time(since it imported to LTP f=
rom Linux foundation at the year 2008)=C2=A0nobody actually touches this me=
mtoy=C2=A0except some code cleanup work.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">I&#39;m wondering whether you guys play with the memtoy=C2=
=A0regularly? and how do you use it?</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0</div></div><div class=3D"gmail_default" style=
=3D"font-size:small">I take a rough look at the README file but got nothing=
 useful to get a=C2=A0start.</div><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr"><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000004a246c05ad4b9157--


--===============2079270395==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2079270395==--

