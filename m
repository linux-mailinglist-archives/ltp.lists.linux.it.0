Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF583DCE97
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 04:03:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91A873C6738
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 04:03:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A4A93C5FED
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 04:03:41 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7E2882000A9
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 04:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627869818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SDKfB3+4ATwSLSYKlc2KRa78PNUJp7a1AC262U4dCBo=;
 b=VN8JQ28nk1Y8Tv8cY35ZiMwY1O8X3r5uX0JRmewGflerNK2QQpDzPyK32t1P6dysHJUUr2
 +9gA0A7h1sDZHFqBEU4VypinfWDtTO3WCn3misGUfFJh+O8Gtqrfbs+Kfe7LdEi9OE+baC
 ay2x6gafynXhDfAzRBJp/HpdEm6WDMI=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-DF3NeXolP7WX9DrnIdkPeA-1; Sun, 01 Aug 2021 22:03:36 -0400
X-MC-Unique: DF3NeXolP7WX9DrnIdkPeA-1
Received: by mail-yb1-f197.google.com with SMTP id
 v71-20020a252f4a0000b029055b51419c7dso17474502ybv.23
 for <ltp@lists.linux.it>; Sun, 01 Aug 2021 19:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDKfB3+4ATwSLSYKlc2KRa78PNUJp7a1AC262U4dCBo=;
 b=Lnqf3OV8YnX0su+kgzhXtMUEpOXluudcjSiOa4ZD7uM3OP8zGVI3XMxLjhpvibI18t
 Td7lqhAlhfPC1rdIdgaes6KXIDvJLx/lb+KGpewZAdGwdNvz5pWbImSFH5q4pdvPN7QB
 6YKHueZ+S2q8TGUnHDZlioc+ZuvVKHclVnljfGMVIsgRnhABEJ7l9vZ+wgqu0x28BjDY
 mD0XZbbfgaWVJFF3MEFtdHw6ANKSVJ4kTVveSJ6Wti/d0pWlcI6OSk1dk1Pg90c/ENLC
 O8d4YAEa47+r8Nj3KDv0kMtIXLOLgLaiAHY5YWCGWhSL/t5R6amipm5XWHyt+DHB2S30
 Ju0Q==
X-Gm-Message-State: AOAM532kW0+AsVWe6wzsB4GasxPSckT9oHSXyYuJDyMzkih9rOv5tZSr
 X0QLsg1dcNGlpdgJV6pzOGM++jyUV+lekgzzK4BUdNlSfDsG7x1lb7PcwZ/tYq2jNzd49RMRqto
 Ya1Ak2bFGXq8tei9zave6Q2o9qZc=
X-Received: by 2002:a25:73d2:: with SMTP id o201mr17195261ybc.97.1627869816465; 
 Sun, 01 Aug 2021 19:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwzlmAH1Hpl/jfbagwAl+/isTZAvZCMGaCuNWWyftHApE/mkLXlxrRT37uGWsBU5Vv/RxZHS2m5sxqgoKRCWs=
X-Received: by 2002:a25:73d2:: with SMTP id o201mr17195243ybc.97.1627869816250; 
 Sun, 01 Aug 2021 19:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210729132514.1699551-1-liwang@redhat.com>
 <20210729132514.1699551-3-liwang@redhat.com>
 <CAASaF6yQkiZVPWpsoo0ZrryBGFdLSGo3kkoejeWcy8dQMSL3yw@mail.gmail.com>
 <CAEemH2cJHtVkaaH5OokAHfVLzPdxU=SqiCf_Gg_ntX_fnWorYw@mail.gmail.com>
 <20210730113534.GB87305@shbuild999.sh.intel.com>
In-Reply-To: <20210730113534.GB87305@shbuild999.sh.intel.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Aug 2021 10:03:24 +0800
Message-ID: <CAEemH2dA9Wzhar5SiTH+GL5mMEhJzj8x7uY5dm2x1mmjUBZCXw@mail.gmail.com>
To: Feng Tang <feng.tang@intel.com>
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
Subject: Re: [LTP] [PATCH 3/3] mbind01: add more tests for MPOL_LOCAL
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
Content-Type: multipart/mixed; boundary="===============1534482706=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1534482706==
Content-Type: multipart/alternative; boundary="000000000000237bf405c889fa21"

--000000000000237bf405c889fa21
Content-Type: text/plain; charset="UTF-8"

Hi Jan, Feng,

Thanks for your confirmation, the patch was applied.

-- 
Regards,
Li Wang

--000000000000237bf405c889fa21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Jan, Feng,</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Thanks for your confirmation, the=C2=A0patch was applied.</div></div><di=
v><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000237bf405c889fa21--


--===============1534482706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1534482706==--

