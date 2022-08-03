Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46886588858
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Aug 2022 09:57:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11AB33C91E2
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Aug 2022 09:57:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9F79B3C4CA9
 for <ltp@lists.linux.it>; Wed,  3 Aug 2022 09:57:45 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A02461A00995
 for <ltp@lists.linux.it>; Wed,  3 Aug 2022 09:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659513463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gzf8wq1qExnVwf/jPpnNhM1K7CxbG4LlZW2sNomWlHQ=;
 b=C0JEpsI5THIoBZ3ZNPB79CuM78bcn5Pmv/rWQ88BcgajSKZgUtQrDhQURt2YQUzbGXIqSx
 GAGWosHdlXK6elJdzUHuT7ij2hMDYeQGwF6QiuczmnNHisWtLGu0SAbi4WVYKGhwvxprUn
 CBAIg2Fj7ZY0YmtEBhu0ehz6P55k17U=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-JvdMNpItPCi7a2gdT93OiQ-1; Wed, 03 Aug 2022 03:57:42 -0400
X-MC-Unique: JvdMNpItPCi7a2gdT93OiQ-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-31dfe25bd47so138172307b3.18
 for <ltp@lists.linux.it>; Wed, 03 Aug 2022 00:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzf8wq1qExnVwf/jPpnNhM1K7CxbG4LlZW2sNomWlHQ=;
 b=NyNLQaMIQ+OKox6IOhzaNnLoafTRf+A+OWH6hFZsc4Bv+AdWD7KlohmzVj1HOmZc1P
 45z2ewb4ehPThyXpxWwTy55urAYTLDXkLuNu9f2MiFsx1E7glolOJgEw8yTfxeStoxTk
 SdtW9mKNeWlRdLWyfJsrgG000L0cq0ZDBzblYisAW+LT7jIjauAYSP3s+rRDTBKoHwSM
 1DQ7OdolA/OLMybKcXC3feDAqt79UtcEkVFp95CUNlT/HAkl7y8P28oFf6PzzMSgyr6z
 zEptBocmW3Fe8mbF9wGH7ny+XyJaOGPP8v+m6N0XtItgqMnz+CRkyXUW2X98FGdhWl3D
 0yJg==
X-Gm-Message-State: ACgBeo2ODgMzDV7dnYsFwQQrfHJyWTwkakQcMODD4v2auLgEdZjn8dGb
 xhjg37ijlwtbU1A5SFIofgjVtUYjDbAHmrW2T05Cl6PIx1ZU4zf3mOelr22vjUy3+qfY3CWORkT
 pRggdv/F9KS3UmufbIveWsynG0xg=
X-Received: by 2002:a0d:eb07:0:b0:328:230c:b6c0 with SMTP id
 u7-20020a0deb07000000b00328230cb6c0mr4723458ywe.82.1659513461501; 
 Wed, 03 Aug 2022 00:57:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5v8Gg1SNOGfHueOiURCRCyKCjyLJnLtkwTNZCdeJWFQV8Vs56IG1q86Z6RopaZsGC4nDH7ndTbkPTORvDtNSQ=
X-Received: by 2002:a0d:eb07:0:b0:328:230c:b6c0 with SMTP id
 u7-20020a0deb07000000b00328230cb6c0mr4723448ywe.82.1659513461323; Wed, 03 Aug
 2022 00:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220725100641.11625-1-rpalethorpe@suse.com>
 <20220725100641.11625-4-rpalethorpe@suse.com>
In-Reply-To: <20220725100641.11625-4-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 3 Aug 2022 15:57:30 +0800
Message-ID: <CAEemH2ecqsqO6Bz-3rY+_QNYkK_5f3zPfCB-7XLbJkAxt1=+1g@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] read_all: Prevent FNM_EXTMATCH redefinition
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
Content-Type: multipart/mixed; boundary="===============1715060128=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1715060128==
Content-Type: multipart/alternative; boundary="0000000000005ccd5305e5519674"

--0000000000005ccd5305e5519674
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--0000000000005ccd5305e5519674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com"=
 target=3D"_blank">liwang@redhat.com</a>&gt;<br></div></div><div><br></div>=
-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Reg=
ards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000005ccd5305e5519674--


--===============1715060128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1715060128==--

