Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96C3BE08C
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 03:26:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C818E3C9552
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 03:26:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E68073C2F26
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 03:26:29 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 69FFB1A002EA
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 03:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625621186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tW8EO49h2S4YD41VK9+JIE5+pY3bHJkTaY0HQIbclBc=;
 b=BNYu9jZd1RpR9YSeq6SP3lwQ3qdw0nSIswvf276hDWG7GpJjcKi+uqk3mGG9U4chqehChA
 L8Spmpi+09gAqrbLX8GwDgEULju7Fwx/8F0rdVnM41OZwlEvN+gpda0buKGG5B2fCDGQ9A
 unnlAKZ9D6EsRdtk9Jp+i5cVHgoKAjk=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-B9XQguobOUGSHL6vXSLGRQ-1; Tue, 06 Jul 2021 21:26:25 -0400
X-MC-Unique: B9XQguobOUGSHL6vXSLGRQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 g3-20020a256b030000b0290551bbd99700so510423ybc.6
 for <ltp@lists.linux.it>; Tue, 06 Jul 2021 18:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tW8EO49h2S4YD41VK9+JIE5+pY3bHJkTaY0HQIbclBc=;
 b=Yk90RU9BvQB0JUtt6mOb8jaMwEkzQBJvCfQiQ8qy7+MsaSWMNxhjlhop+J/wkDfZUx
 wn09APKh5NkeoYR8lEnab0YR61iEsl9ipMR659DhQBeEJouc0JkPrxJSJ6NN/TMT3cgs
 flYJ498WMHo39zG6yOe3lqbew23ZxvTuePZKOX2u847plmdH01Tb0Gjmn8fv1nBaO6BO
 kliLGk1VfJJxPIBosFzlQK+/oMh8TaFLMDecGiXotNqhKFShauYwn6GPRFAjXLDcWGjo
 reu9yc67ICBOfrXkPRiFkAQUSidpjdewoTxZQa/JBXH1zeek3cM/xCv2GhcWOHiQ+o74
 8y2Q==
X-Gm-Message-State: AOAM532fRpyrAvXkiaEFMO+0z9Qzr86Fti+wDKirkT6ONlBxs9E63U73
 5E1YpG4JbO0C0El3Nvx3f1puTerHh/hBAmr2gKO0B81Wq65II9WjcH3DJ4hYxVkxrq5+BY1sRh+
 1gLA4qIxrxavzzjVpKD/LaUwgBU0=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr27317797ybp.86.1625621184757; 
 Tue, 06 Jul 2021 18:26:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVHDUgrMF4hoSOGeDzsWYpvfdhOOAsZ/DIW7kUTpzf2Tfjzv4OWdS+7+YTnsubGDuOgBeJb3T3S3wb50NlfxU=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr27317779ybp.86.1625621184554; 
 Tue, 06 Jul 2021 18:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
In-Reply-To: <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 7 Jul 2021 09:26:12 +0800
Message-ID: <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: multipart/mixed; boundary="===============0044084984=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0044084984==
Content-Type: multipart/alternative; boundary="0000000000003ec31705c67e6d72"

--0000000000003ec31705c67e6d72
Content-Type: text/plain; charset="UTF-8"

Alexey Kodanev <aleksei.kodanev@bell-sw.com> wrote:


>
> It's also possible that some resources will be freed during
> the tests... perhaps, moving the loop to verify_*() is the
> better option?
>

Yes, good point, that would be more precise for ENOSPC testing.


-- 
Regards,
Li Wang

--0000000000003ec31705c67e6d72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Alexey Kodanev &lt;<a href=3D"mailto:aleksei.kodanev@bell-sw.=
com">aleksei.kodanev@bell-sw.com</a>&gt; wrote:<br></div></div><div class=
=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
It&#39;s also possible that some resources will be freed during<br>
the tests... perhaps, moving the loop to verify_*() is the<br>
better option?<br></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Yes, good point, that would be more=C2=A0pre=
cise for ENOSPC testing.</div></div><div><br></div></div><div><br></div>-- =
<br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regard=
s,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000003ec31705c67e6d72--


--===============0044084984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0044084984==--

