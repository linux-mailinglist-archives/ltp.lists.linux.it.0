Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D03BF84B
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 12:18:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A043B3C7913
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 12:18:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FD753C5747
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 12:18:34 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6156A20096E
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 12:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625739511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VWDHT9wM52KCu507U3sQMjxyGpT1gXVrPCsBTy04SEo=;
 b=ilNWdoCRo7HVcmOYn4n4WCy9/P0T5RH/VoKHyiVHNi0h7UMWWAliEIt4NYd+keCysetORo
 hjIPwQnOVqxNoW0UajPCaYAavE7NTJKUdKJnOxmAlfwwqiej7gEbr8+KDlkcwSjwqI6Qg9
 GPqIRjZOfGuSUATRr3HUW8//NuzC+mM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-BaAgGKmMPsSxqAn_ibRDbw-1; Thu, 08 Jul 2021 06:18:28 -0400
X-MC-Unique: BaAgGKmMPsSxqAn_ibRDbw-1
Received: by mail-yb1-f199.google.com with SMTP id
 a7-20020a5b00070000b02904ed415d9d84so6108814ybp.0
 for <ltp@lists.linux.it>; Thu, 08 Jul 2021 03:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VWDHT9wM52KCu507U3sQMjxyGpT1gXVrPCsBTy04SEo=;
 b=luXFGDfsWDp+XPlz0T8nvo90WxfF8JHEAgjc24buYnfk2T9UD4rDgMiwvKFoScceq3
 Z9iPn4pb4yAYa9i3qahYcclAfPDmWGaT0E2kz7FPYzKZGKmULWVDOmDJ9YW3kyuZk0aC
 JYVMBB2urwi5/OAx+72sndJEjfx9Zq3FOpvTIZ7n4NrNZtzBe5nS6EvaNl5wvlsNigSh
 yGbhixXsv2fGntDRpXHoqGyD/3gotuf9pPwn4zLx+3xlwGDg7Pqk4mhBdh+iS6l/ItlM
 39WRdyiRaEwjDBzu13wGxUEP8V245E/ZYb33QCmI6Y+xX7eKUXwGFC3h176ZEyCpHX/z
 YRPg==
X-Gm-Message-State: AOAM5339oHZiEVjkWr2R1sNVmkEMD4j9Hb7CI6wQ9dPjPWs/oA7/+ENo
 wji0zfWTop2s/q5p18DO6ZRoWyxpjbiQhdQkD5PqSZsESSRM/4HQ0cSpStSmtSL4KFzJ4HVgaow
 eBexZPsopRXlpDehcnE7+NU2ZOl8=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr36656117ybp.86.1625739507867; 
 Thu, 08 Jul 2021 03:18:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1LTC70okT0YrZ9LJNU+gAYE0gkezUZeFVsP6ZJWFeyJKqa+keNGXDisQ6V605oC1xftjLHbg3pfVUgyAoUC4=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr36656089ybp.86.1625739507554; 
 Thu, 08 Jul 2021 03:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210708080720.18997-1-xieziyao@huawei.com>
In-Reply-To: <20210708080720.18997-1-xieziyao@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Jul 2021 18:18:16 +0800
Message-ID: <CAEemH2cTBd45n9F5Db+Xc3ZE0R8GyLVa1AVsgbEPYFB+2hVV5Q@mail.gmail.com>
To: Xie Ziyao <xieziyao@huawei.com>
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
Subject: Re: [LTP] [PATCH] gethostid: Rewrite with newlib and use/test
 sethostid
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
Content-Type: multipart/mixed; boundary="===============1879862802=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1879862802==
Content-Type: multipart/alternative; boundary="000000000000d86d3505c699f9d9"

--000000000000d86d3505c699f9d9
Content-Type: text/plain; charset="UTF-8"

I made some refine and pushed, thanks!

-- 
Regards,
Li Wang

--000000000000d86d3505c699f9d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><div class=3D"=
gmail_default" style=3D"font-size:small">I made some refine and pushed, tha=
nks!</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div><=
/div></div>

--000000000000d86d3505c699f9d9--


--===============1879862802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1879862802==--

