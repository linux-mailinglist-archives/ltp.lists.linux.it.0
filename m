Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D81483F1212
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 05:45:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 874303C67FC
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Aug 2021 05:45:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2E7043C22AC
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 05:45:34 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1B642200079
 for <ltp@lists.linux.it>; Thu, 19 Aug 2021 05:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629344731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wqh+PnA+kLnnYu8Jrov62BhJSRcyMldctSvVllrR+Lw=;
 b=VIN8BXnoii18NqoAJOPgjoE6iBOYEVwmgCv35YbVfMsomgrvunL/CEgHSKKozJ1Nd6ksBG
 VCrTBbmXTCtCxklP1MWFsy1/kdWQwGsceYjLaJRD9Z53wHYWPLBdvzVkHa4n4WSpKeNKQd
 MZWzroETPOeZDDuYH39Q7SzZaE/LsDw=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-PFNJkRA2MVqmwXNHhRTzmQ-1; Wed, 18 Aug 2021 23:45:29 -0400
X-MC-Unique: PFNJkRA2MVqmwXNHhRTzmQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 n200-20020a25d6d10000b02905935ac4154aso5169040ybg.23
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 20:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wqh+PnA+kLnnYu8Jrov62BhJSRcyMldctSvVllrR+Lw=;
 b=H07X6PBbqQQn9NHjA1Z/gUvyyaA6oCRGlI2QL9O+aIz0IYwBq1qKu6hW+U3+Fyhp20
 vlM+uasWX2Z9jQ2xMEdURlQZOlvjP/ZPAkvUNNQFKRr5L9A8fZiahzz7XQrpUXWTVqKo
 MQrDcVC23+kI4NZi15ZIS2ILnbX6U13J4Gsf97y0U/X4e95XdSWNSIlDsVhj3pyVBggk
 F+WT1uFrguNFfl6+ipWqEz+SUi7e7fpzEJvpRG68ChucvFHYdosgC4Ir3dB9MQwCNlTj
 +/J7wNW8qAvYWL9bAJ5xjBMMHa96t8E+zkLoigTORbihI9cDaBQcHtlWMu4/QoXMa8jU
 lKOA==
X-Gm-Message-State: AOAM530bM5HwNetXfQQW4TB/e6HXezLdsSd5XDRpUWc/iYka3fieLTC9
 02zDqsQ4E9vgd5sG9/i0JaJHEynkswvE5Y+erp6xqgRJEkCVtnYleBFq80HsIbw5h+7Qxv0/oVm
 4oXmrlc7uR6klo1goMyyIIt1VCWM=
X-Received: by 2002:a25:d14e:: with SMTP id i75mr16029633ybg.243.1629344728275; 
 Wed, 18 Aug 2021 20:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuDqIOjlZMep/BsoOkPE9QQDU7+BSYy/Cdf9tCiDefqEybPlbV8C+GFouRa5t/8mnxOpmjzloCHZP1SAAh9J0=
X-Received: by 2002:a25:d14e:: with SMTP id i75mr16029623ybg.243.1629344728093; 
 Wed, 18 Aug 2021 20:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210818100823.1836-1-pvorel@suse.cz>
In-Reply-To: <20210818100823.1836-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 19 Aug 2021 11:45:16 +0800
Message-ID: <CAEemH2f_syoR+UDwwrcjqavv=Dm_ojynvQALS-O4HV8nm4fK2g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH v2 1/1] binfmt_misc02.sh: Use "command -v" instead
 of "which"
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============2010032925=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2010032925==
Content-Type: multipart/alternative; boundary="000000000000bc2ba205c9e16136"

--000000000000bc2ba205c9e16136
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 6:08 PM Petr Vorel <pvorel@suse.cz> wrote:

> "which" has been discontinued after 2.21 release in 2015 due this (git
> repository is empty [1]) it provides warning on Debian/Ubuntu [2].
>
> Use "command -v" which is POSIX [3] and supported on all common shells
> (bash, zsh, dash, busybox sh, mksh).
>
> [1] https://git.savannah.gnu.org/cgit/which.git
> [2]
> https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c13ce23fc9da7efb
> [3]
> https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>
Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000bc2ba205c9e16136
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Aug 18, 2021 at 6:08 PM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&quot;which&quot; has been disc=
ontinued after 2.21 release in 2015 due this (git<br>
repository is empty [1]) it provides warning on Debian/Ubuntu [2].<br>
<br>
Use &quot;command -v&quot; which is POSIX [3] and supported on all common s=
hells<br>
(bash, zsh, dash, busybox sh, mksh).<br>
<br>
[1] <a href=3D"https://git.savannah.gnu.org/cgit/which.git" rel=3D"noreferr=
er" target=3D"_blank">https://git.savannah.gnu.org/cgit/which.git</a><br>
[2] <a href=3D"https://salsa.debian.org/debian/debianutils/-/commit/3a8dd10=
b4502f7bae8fc6973c13ce23fc9da7efb" rel=3D"noreferrer" target=3D"_blank">htt=
ps://salsa.debian.org/debian/debianutils/-/commit/3a8dd10b4502f7bae8fc6973c=
13ce23fc9da7efb</a><br>
[3] <a href=3D"https://pubs.opengroup.org/onlinepubs/9699919799/utilities/c=
ommand.html" rel=3D"noreferrer" target=3D"_blank">https://pubs.opengroup.or=
g/onlinepubs/9699919799/utilities/command.html</a><br>
<br>
Signed-off-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_=
blank">pvorel@suse.cz</a>&gt;<br></blockquote><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"mailto:=
liwang@redhat.com">liwang@redhat.com</a>&gt;</span></div><div><br></div></d=
iv>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>=
Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000bc2ba205c9e16136--


--===============2010032925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2010032925==--

