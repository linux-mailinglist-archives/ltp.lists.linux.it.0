Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEE05AA83B
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 08:46:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 37BA23CA847
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Sep 2022 08:46:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E9673CA4D7
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 08:45:59 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0834D1000DF0
 for <ltp@lists.linux.it>; Fri,  2 Sep 2022 08:45:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662101157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zr4LcfDpwbnZj0s08hgdnJ2546CZYdxfftjP+Of+wGc=;
 b=Q6wW0tfDGWFABs0EGLJajeWF+4nXlzgwEC+wSDLF5ICipSdGAEw6nXF8JdvWYkOWXQInoa
 VNZhhpNe7MTZvAVYTJZHZr7/cVyfb//tMG/hzDIHUqf0jQxPPmALYMSVjJvXlGCT7a/C4k
 FUmzED6DrS0atHWaT+zsZgA2QoBnF+U=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-111-xbdXlufFMUuZsdVLLTDafQ-1; Fri, 02 Sep 2022 02:45:55 -0400
X-MC-Unique: xbdXlufFMUuZsdVLLTDafQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 p8-20020a258188000000b0069ca52d9f68so1124599ybk.2
 for <ltp@lists.linux.it>; Thu, 01 Sep 2022 23:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Zr4LcfDpwbnZj0s08hgdnJ2546CZYdxfftjP+Of+wGc=;
 b=mVroqxAEhmYz3WPWYxn8gq4eFKCbUVJBrafeoxR1z67IrEd5E1+8Hx+dKtFg2c5Qmb
 2Cb7wf5esLYO5M3cblqPMvRjN869j0/Q2lwRfDNl+MU+CeMTV4dOjmccJLOtmInoTfr/
 Z+A2ZWYhKE7AzPu6OaB+cM3iUSVoQslJFLuTBUzTIggBjalT+uVZpSlfeRRwKHrvAgPT
 Rw25Ram5dK96Qyn5fs8j2OJMD735n35ArPUYBTgDkI1P264uLitkc/l2EjD2b7rZ9jlg
 2gXFILQxSNBv/5hjIN2M/+b06uztaKLEeddccuI3K4gIvfHWJlRAgPQstkvbKnmioGOQ
 7FMg==
X-Gm-Message-State: ACgBeo3Gpu2a6PmYkqTa81G8FUFFhosimbGAk0uAoghnaSJOlqX2+4Pm
 Wc9Q9sr4wz2OioGiiDPgf/UcDfxbTYIvnL836VnqzgOtGA1u4Httr6F9uHZWcuITDpmrzXNoXPt
 UM5uC5Qxx9CLBSy4KPtH3QrbaANo=
X-Received: by 2002:a25:f88:0:b0:6a2:805:7e70 with SMTP id
 130-20020a250f88000000b006a208057e70mr3789400ybp.461.1662101154652; 
 Thu, 01 Sep 2022 23:45:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4wN0/ydGUlhXs552e/v207L8aX2Y/MgWMHqapyhLsJBOqb2NqO0lMbmECpYJcZRAtQIyHkSqWu3Gq5P2nCKMQ=
X-Received: by 2002:a25:f88:0:b0:6a2:805:7e70 with SMTP id
 130-20020a250f88000000b006a208057e70mr3789396ybp.461.1662101154473; 
 Thu, 01 Sep 2022 23:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220831092036.20779-1-pvorel@suse.cz>
In-Reply-To: <20220831092036.20779-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 2 Sep 2022 14:45:43 +0800
Message-ID: <CAEemH2fJ85-SxdfQ1uYVCannw5Li2ixBaJKe9kP75qAgWxYq0A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] include: Move stringification macros to
 tst_common.h
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
Content-Type: multipart/mixed; boundary="===============0610927651=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0610927651==
Content-Type: multipart/alternative; boundary="000000000000e4c26705e7ac14d6"

--000000000000e4c26705e7ac14d6
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang

--000000000000e4c26705e7ac14d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div class=3D"gmail_quote"><div class=3D"gmai=
l_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"ma=
ilto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div></div><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br>=
</div><div>Li Wang<br></div></div></div></div>

--000000000000e4c26705e7ac14d6--


--===============0610927651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0610927651==--

