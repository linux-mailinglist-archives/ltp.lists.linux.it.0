Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D332294B58
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 12:38:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B36623C3295
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Oct 2020 12:38:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9CF983C2474
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 12:38:21 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id B68B8200AFB
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 12:38:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603276699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVVNeErMB9IIU3UUVkJy7rSd6Y7mxk+z+rK8yypYD40=;
 b=fi1mG6CR1pSb2BE82Sa9G8IB7ar1Pl8+xwc9e10LPQlWYAUpSZQE9/fHioM/lfl/oicRVv
 wGmstWjcgJqqCTZIIU3U3GsoIfp+ptXtp57/MepG++jH17bZivLNEsbUGgklrc3u7KRLDY
 o5FfJcGlQuta3X4xps6VJvwW2hOgPgg=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-Aqt6KroHOKiRT6jVXf_EzA-1; Wed, 21 Oct 2020 06:38:17 -0400
X-MC-Unique: Aqt6KroHOKiRT6jVXf_EzA-1
Received: by mail-yb1-f199.google.com with SMTP id h6so1993323ybk.4
 for <ltp@lists.linux.it>; Wed, 21 Oct 2020 03:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVVNeErMB9IIU3UUVkJy7rSd6Y7mxk+z+rK8yypYD40=;
 b=rjOtG24YbjFAJpoEwRJKSazZPgZYepSrqbpQLpB3upsCOGDKopPvXJRSGZOJeChJWU
 1ZZTsJhjZNF34TYOrqZwm9Pdt4RQVNZd3wwMRSh/SC82lJcf0Me11/LIGgVzqp+5twS6
 e/+r+6BHOmxlvrMd7qNXnOrQOJiI2yokkqrVve86HufitEddYWpaosKc2tUo3kfdwyXo
 E3yYJrw4Lw4nxgfnb2XyPnpFBxDYbIYXMf+jmewvkh4TSy2NqRuXjbefd1SLlvvIgz17
 oBQj/7t8BNXLQSVV4vpwtQBIRb3HpniXZLfvtIOIAVQ66JmDSc5mHdI1twe5WOWCdgfi
 2E0A==
X-Gm-Message-State: AOAM532I0JRyvwR45zN4UbrTEdRpVAuSlbwgNVI68WQMAG7UUqjylC62
 LSzjw3TxrSwK4BdD8/JKLWSWg18XsKHNJNiOfmnrvyB1rvUkhj5QZe2DjXmKNPDob/TPtrrjmeP
 fRtsm+ShxUoeHA/omtYC1n6YwfWI=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr4031521ybj.366.1603276697067; 
 Wed, 21 Oct 2020 03:38:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV145gktput82SXXK98j1gEfO1Afv73HFIb0+Pjj30wPPvx345hvZrt2abo5vf2pdqEu6kHcPZubdxIdjc2yA=
X-Received: by 2002:a25:ba4c:: with SMTP id z12mr4031493ybj.366.1603276696743; 
 Wed, 21 Oct 2020 03:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201005133054.23587-1-chrubis@suse.cz>
 <20201005133054.23587-10-chrubis@suse.cz>
In-Reply-To: <20201005133054.23587-10-chrubis@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Wed, 21 Oct 2020 18:38:05 +0800
Message-ID: <CAEemH2eAy-037WvoBVqGfUVOvHNuFv=mRdexgS77xhpxGKXJeg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 09/11] travis: Install docparse dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cyril Hrubis <chrubis@suse.cz> wrote:
...
> --- a/travis/fedora.sh
> +++ b/travis/fedora.sh
> @@ -2,7 +2,10 @@
>  # Copyright (c) 2018-2020 Petr Vorel <pvorel@suse.cz>
>  set -ex
>
> -yum -y install \
> +yum="yum -y install"
> +
> +$yum \
> +       asciidoc \
>         autoconf \
>         automake \
>         make \
> @@ -12,8 +15,10 @@ yum -y install \
>         findutils \
>         libtirpc \
>         libtirpc-devel \
> +       perl-JSON \

Package perl-libwww-perl is needed for fedora/centos as well.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
