Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F712E7E99
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 08:28:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C62363C555C
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Dec 2020 08:28:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7EBFB3C28E3
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 08:28:34 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7F486600926
 for <ltp@lists.linux.it>; Thu, 31 Dec 2020 08:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609399712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqerbPYm9E8w9tyO2ImEwqKKvgB0wDib0x8Ku68tLgQ=;
 b=FTg9Rt14qcicdXJFPzCpo6G6jApmEKDLPSiKo68J22ZZ9VhCwSYzzMp7aZNt0KGHT8R0Xd
 aS/EM+wWoMLM6On4s2lPNrAgE84qCqnupx2JMFO7OT10XYa1WnT5VPYA79+tTFn7UUCXhI
 HtJOA0pTwUSCAFzSZvWnCQJiHAuvdd8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-RB_lVV-qMDiAr41yJcvqvQ-1; Thu, 31 Dec 2020 02:28:29 -0500
X-MC-Unique: RB_lVV-qMDiAr41yJcvqvQ-1
Received: by mail-yb1-f198.google.com with SMTP id j1so32688255ybj.11
 for <ltp@lists.linux.it>; Wed, 30 Dec 2020 23:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wqerbPYm9E8w9tyO2ImEwqKKvgB0wDib0x8Ku68tLgQ=;
 b=tZWDr4tzW/9gVDKdpzkttpEJtz6gk7cgAOzQHBEtTmM70CPfx3Oyn1UjMrlIvIwLjf
 Na69rtp4BuqA4ogjQKWLFmKKj68qG/DECziaK4HGzRNqNGb/UCLkgpyPDCUivZaJlkyO
 qLGl7vCcdEUCRaY3S1eFPV19cmVDyY0KH4F5ADCTC6U4RpaIeJojIKi1m0c2s/od9BYo
 HAA7yMVM50hRKZDY2GIR/T131ihaSR4/EyujaM2uCuhkT1S1MNAFWu5EuBoLLM4zqiNs
 5/QXO7g0DwXcd2xNB5HNbpoiA1KreIgVF85d851xV5OCyvXiOEwc/y5UDXkuQtnAaK9w
 anYA==
X-Gm-Message-State: AOAM530wccGDaOQJVpVhpxzvRWhqrcPz5rEvBOB040SkZA/4pLbrCZTT
 DPqKVdOf5xobfjk3cjeWdb+/GaPXu2ZLywdKb+6wqvqhpZU/rX0bM2aFL1b0X8YIwd4yN+5V4RT
 QO3Daf64kaOGKuCLSnDgvc6+uB7o=
X-Received: by 2002:a5b:810:: with SMTP id x16mr80855613ybp.86.1609399708944; 
 Wed, 30 Dec 2020 23:28:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF+2bkuMDiMF7efW7JC7rgBeSsLkb/RytZpMC3+jG9eb5S2BFbDfrxyAcIq/e3ZIci+qXnWA5tHZpSBHmdQAA=
X-Received: by 2002:a5b:810:: with SMTP id x16mr80855596ybp.86.1609399708739; 
 Wed, 30 Dec 2020 23:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20201222054841.736529-1-gengcixi@gmail.com>
In-Reply-To: <20201222054841.736529-1-gengcixi@gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 31 Dec 2020 15:28:17 +0800
Message-ID: <CAEemH2d1i94yeww-vnMfCJ9qE9roaR=nKibZQtuVmVoQfkeh7Q@mail.gmail.com>
To: gengcixi@gmail.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/4] add compiled_module_files into gitignore
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
Cc: Cixi Geng <cixi.geng1@unisoc.com>, LTP List <ltp@lists.linux.it>,
 orsonzhai@gmail.com
Content-Type: multipart/mixed; boundary="===============0352939100=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0352939100==
Content-Type: multipart/alternative; boundary="000000000000f103b905b7bd91b3"

--000000000000f103b905b7bd91b3
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 1:49 PM <gengcixi@gmail.com> wrote:


> Use Out-of-build-tree build ltp, When compile kernel module
> under these directories, some module-build-file wil generated.
> add these files into .gitinore
>

Thank you Cixi, patchset merged.

-- 
Regards,
Li Wang

--000000000000f103b905b7bd91b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 22, 2020 at 1:49 PM &lt;<a href=3D"mail=
to:gengcixi@gmail.com">gengcixi@gmail.com</a>&gt; wrote:<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Use Out-of-build-tree build ltp, When compile kernel module <br>
under these directories, some module-build-file wil generated.<br>
add these files into .gitinore<br></blockquote><div><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Thank you Cixi, patchset mer=
ged.</div></div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div><=
/div></div></div>

--000000000000f103b905b7bd91b3--


--===============0352939100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0352939100==--

