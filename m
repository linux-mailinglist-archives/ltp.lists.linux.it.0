Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 325B21BDD6E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:22:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4744F3C5EEE
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:22:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D07523C2820
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:22:43 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2EFAD1001886
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:22:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588166561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+4TcAwIeM6RpWyEHfll5tFTB6/ob1xpLTwtrOX42GDc=;
 b=EbK2+ulDAbqsz7qGL6k2qOt8IBygJp/sS437Y69cRMK2AqbkSvkiUhG89ADrojFboYfJhI
 RjYmt69tsAIAW4NVXVE7GmJ+SEGe1IVFHocHoBn6L5FxOTtxH5VBsUf36eDz627iVxW8sn
 /KNvQR80P2XM/4bZFjNUX28iz8gjaCA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-qlgkJoIVNH23_5iqPSWTwA-1; Wed, 29 Apr 2020 09:22:39 -0400
X-MC-Unique: qlgkJoIVNH23_5iqPSWTwA-1
Received: by mail-lf1-f72.google.com with SMTP id s1so745261lfd.16
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 06:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RAJ60jeMVYdmPcIJ8uTh3STj+8dw4Tyo4Rj4TCK/mT0=;
 b=rbTl/HXS2Tdfg5Xsb1L/KEj+kqVpKzyM6U+PJRbaKs2E2yxXy3mjHZCewVpv20YyQf
 9+CwnQtIAMWsFAfh67FdYhznqNVi+QVtdtFCWW2fDGv8eGSgur1HkdyMJppDnwFNcEb+
 d6PFtZy3BI+OM00nZItipFN3QSPsgugzbtUjqgG1QueqvETCxpi77IiTTz6ZNdAx+uud
 Wj8trRr8hIirJCT0a5VHKR4VhItCMJ0+KEznsHfxw+lvhhO5kcXtyCp0iG8M6LGL77Mx
 4Ttm2efmuz2/+snnuToBrSbTzfMkB/6WYVau9/KzgR8VEV3m2Ovxa+pZNETyz3PpI9S0
 tUBw==
X-Gm-Message-State: AGi0PuYJ9ZxnJo8meSDihuy/WKQCiW/qN9/VAADvXbOGAZ6M+pRCnLbG
 fg3rOdW5Iu9bZ7FggYe3RUKfq1NWjn+AwH/vc+n0sbJi0BYMvhxFctuTl07j5BdhzP1zJ7zBM58
 LOH+j6R+pW/wMyrP/40JsOUPrDf0=
X-Received: by 2002:a19:ee11:: with SMTP id g17mr22599950lfb.42.1588166557486; 
 Wed, 29 Apr 2020 06:22:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypLkO1cJG/lGhHuWS9Jl2zSrtAyYqrKWLxp5AenrGkzmyQQrViqBlWM7TfW4e7kuGFZX03JUCIhZeiwqq0a5Bng=
X-Received: by 2002:a19:ee11:: with SMTP id g17mr22599928lfb.42.1588166557157; 
 Wed, 29 Apr 2020 06:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200429092601.6325-1-mdoucha@suse.cz>
In-Reply-To: <20200429092601.6325-1-mdoucha@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 29 Apr 2020 21:22:25 +0800
Message-ID: <CAEemH2fnv-hynqo2CeROs-C3EwRuVD1+YhRN4FtSHgbakwffrg@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] tst_is_virt(): Allow checking for any
 hypervisor
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
Content-Type: multipart/mixed; boundary="===============1554183643=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1554183643==
Content-Type: multipart/alternative; boundary="0000000000007be55705a46dd782"

--0000000000007be55705a46dd782
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patchset LGTM and:

Tested-by: Li Wang <liwang@redhat.com>

--=20
Regards,
Li Wang

--0000000000007be55705a46dd782
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Patchset LGTM and:</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">Tested-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=
=3D"_blank">liwang@redhat.com</a>&gt;</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div></div>-- <br><div dir=3D"ltr"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000007be55705a46dd782--


--===============1554183643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1554183643==--

