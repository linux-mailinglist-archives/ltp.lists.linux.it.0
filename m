Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2893FC77F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:44:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0EE923C8DA1
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:44:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DED533C2A67
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:44:02 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1CF1A1000D53
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0n040VJW10kRS5JoNg/I1+MG8NarjMqdN+1/0+M2HxI=;
 b=itYBiocY+l2kwt/JEPijOJnG4prNGUjoC8b1SLfzQqn0B9xj6G7RsqMy50yB328RntExyK
 WPA6NzmjxBLpkG+1q5jUE0iksifwIIPmVF+uiDiZ9TzO+WyD5C5ZHVp8dB6Wbnk+Qu3ikh
 nb5Syvvf4pMHHA/xUi7d7VAsNuH5ZQM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-B7u9XyWjOQmuRye_NHPIUg-1; Tue, 31 Aug 2021 08:43:59 -0400
X-MC-Unique: B7u9XyWjOQmuRye_NHPIUg-1
Received: by mail-yb1-f200.google.com with SMTP id
 z15-20020a25868f000000b0059c56f47e94so1030928ybk.21
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 05:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0n040VJW10kRS5JoNg/I1+MG8NarjMqdN+1/0+M2HxI=;
 b=NBxXViWC7UKZ+pXq08jJz4avsTYDEwnT7VdD4uZBuFJVRisQtKJAF5uA8o66Y0QdM5
 Wt4hoNOb+M+OqnTVFPzefx/bfs9lUHBfd5NBIpRnx0bl3eNrP5r5epbaMn3cSzlCOKW7
 oEHvgcLwyDFdgJQC4Rtjgg9kd/NmNtr6mpYOCsWejXDrNZk4C7EKgD8apwEONgyxHoFf
 aWjDVLfuD2653jCOG7IGk0aV3DY2Ct6sTNhCV81lHXgpT2tT5oWeB9hl8hHwfEtfBHz+
 nlonIdmg+l0NKRlZi3bVmPryMxRo3in+xvRcxpjUro4V0wRSKCSQIgxtpw5ROaJkJ22G
 z/1A==
X-Gm-Message-State: AOAM532dTmFR1001AJMHQNZGM16v9zr1HTz/bYN0vE9QGTjwOUEZr9Ei
 eWDdeyoGvanz8yGgq+YhEZzebBMVfb2BL7YyOrXPYOUJGJIXo+a3HYaUBFxDBClSo4LI96E0iNp
 LD1nl4/griFfgDARpsuPILQbl9fs=
X-Received: by 2002:a25:1257:: with SMTP id 84mr31206879ybs.243.1630413838596; 
 Tue, 31 Aug 2021 05:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEiZ9eghoBNlJp5eaktWGHK7cCveLQHY6BInGGA9bKYEx/KEWLB1Qo2ytAn3zjPS2P9J9aEqZR1C1TxcL2MKc=
X-Received: by 2002:a25:1257:: with SMTP id 84mr31206850ybs.243.1630413838387; 
 Tue, 31 Aug 2021 05:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210831121250.17557-1-pvorel@suse.cz>
In-Reply-To: <20210831121250.17557-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Aug 2021 20:43:37 +0800
Message-ID: <CAEemH2c2nfHeHzbDtKWfUMVTkOxN_gvAgpsGLKOY0YC5gBiOmQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib/tests: Remove tst_fuzzy_sync02
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
Cc: LTP List <ltp@lists.linux.it>, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: multipart/mixed; boundary="===============1568631865=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1568631865==
Content-Type: multipart/alternative; boundary="000000000000ac9cdd05cada4d84"

--000000000000ac9cdd05cada4d84
Content-Type: text/plain; charset="UTF-8"

Hi Petr,

I have no objection to disable it too.

Reviewed-by: Li Wang <liwang@redhat.com>



-- 
Regards,
Li Wang

--000000000000ac9cdd05cada4d84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I =
have no objection to disable it too.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" t=
arget=3D"_blank">liwang@redhat.com</a>&gt;<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div></div><div><b=
r></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">=
<div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000ac9cdd05cada4d84--


--===============1568631865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1568631865==--

