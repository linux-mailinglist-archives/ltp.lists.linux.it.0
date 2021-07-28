Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A208E3D8CBC
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 13:27:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1CDC03C6436
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jul 2021 13:27:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E3F623C6436
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 13:27:45 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DE1FE200C22
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 13:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627471663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sEDNg1Z8Sp3Y4VzS3YtD4niKSELi2P5kvQQzhnzYZN4=;
 b=eTHs5ZYwBaz8KbD+MCeHatYAxreOYriRZPOzS2zEXjJ7pCGDvOj0WImEOuAS6YKh7ryL2G
 /LEI8i68RFP4aRfCDEuii7Dz9TQfCRUH7cUFipBTb3YuvOfVrgohTwxJfq1103lllTa/dT
 yt23fvgpwBLPV4fI0tqXVgb98Unk/Jo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-tGmyPt_kNFG-LynpvcOt3g-1; Wed, 28 Jul 2021 07:27:41 -0400
X-MC-Unique: tGmyPt_kNFG-LynpvcOt3g-1
Received: by mail-ot1-f69.google.com with SMTP id
 20-20020a9d05940000b02904d1011b3b03so716721otd.10
 for <ltp@lists.linux.it>; Wed, 28 Jul 2021 04:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sEDNg1Z8Sp3Y4VzS3YtD4niKSELi2P5kvQQzhnzYZN4=;
 b=oO4kLEPJ83qzNap/HKwt3M/eT2VjjTBY+VTD2ozqA9vvaDNmYRdvT2JDn1NlwIEN+D
 PcVY2G3VRKrcdZJph89KlGbm+a0Ya4wIo01mHfFhKiTv3BsxUbleq8/VE4Iiwxptaqwv
 E1LA3b7RLsaschQnBSsn2lVGrotWyB4LzLvsuWHrvmQxOsrDRMdseieONyFv3KgnJw8E
 mnSviYD6nEh4+HKh2K+OEyHHGT/3vk+uWpDWaEwq0IMqr4PP3zind19GsuQHLOD85qWf
 fXDXMw8s2yGXbTfJeHrQ4OnxFZDzGhgBFEBlfta1pNhQlhdDX3HyakrRXyccYefHdgWA
 hn5w==
X-Gm-Message-State: AOAM530+gUwZHz1cgQpPg9oCPSwKrFG28s0WaS/nHPOwT5lT01zxovU1
 uTOXZDxrkog1qeKKDw4Qa1hkuL+hkl1jFrnf00GJNI+J09aMNr/xmgA+Ev/IiwafvlGC0x23P1v
 jeD605jNXlbOzYgOGDt1UuM5FzM8=
X-Received: by 2002:a9d:4f09:: with SMTP id d9mr18459897otl.265.1627471660557; 
 Wed, 28 Jul 2021 04:27:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtPCG8soz/AH2c3VNXCDs/Ta0dkJxa2SA24w1D0KKORigJlij2OykStrBxtlXEqVkKsNRvcpuNN5hPzIwhx0k=
X-Received: by 2002:a9d:4f09:: with SMTP id d9mr18459882otl.265.1627471660181; 
 Wed, 28 Jul 2021 04:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <15dd5ab99369da3cba33a748d1bf05be145ef373.1627046193.git.jstancek@redhat.com>
 <YPrbrX3VePpf84C+@yuki>
In-Reply-To: <YPrbrX3VePpf84C+@yuki>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 28 Jul 2021 13:27:24 +0200
Message-ID: <CAASaF6zu+6rAuE7aRJShiHEF9_4f94AdfqDBb66kOv6Ymh9ErQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime01: avoid zero exec runtime due to
 irq and steal time accounting
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1521306554=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1521306554==
Content-Type: multipart/alternative; boundary="0000000000002ffee005c82d4681"

--0000000000002ffee005c82d4681
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 23, 2021 at 5:35 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> Looks good: Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
>

Thanks for review, pushed.

--0000000000002ffee005c82d4681
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 5:35 PM Cyril Hrubis =
&lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
Looks good: Reviewed-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz=
" target=3D"_blank">chrubis@suse.cz</a>&gt;<br></blockquote><div><br></div>=
<div><div style=3D"font-family:monospace" class=3D"gmail_default">Thanks fo=
r review, pushed.</div></div><br></div></div>

--0000000000002ffee005c82d4681--


--===============1521306554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1521306554==--

