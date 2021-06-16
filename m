Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF43A9460
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:48:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F9C03C4CBD
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:48:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E2603C4CB3
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:48:54 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6FE8E600C81
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:48:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623829733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qekIu1bKd2hA0tcg58OVDyDwm6it5EaJz2WZDR9HkXM=;
 b=giVtL1aMOZNk80hi7I8z3tH4c9iQlOG2sxbJgUDpxDJ4sp8qk2jjHmeKdvkvxEybcXiUkg
 /UmGet39YlRoA8Gx7Ub9kKeg438purxrNswTNphmrCwVA5BzRbkROurdAqmxMNkvSakx5p
 66KO3jayZq99B3E9AVo/3JV4Eduzrgc=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-HXZ1XrqCOTWH21nAPrGdDg-1; Wed, 16 Jun 2021 03:48:51 -0400
X-MC-Unique: HXZ1XrqCOTWH21nAPrGdDg-1
Received: by mail-yb1-f200.google.com with SMTP id
 a17-20020a5b09110000b0290547160c87c9so1676626ybq.19
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 00:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qekIu1bKd2hA0tcg58OVDyDwm6it5EaJz2WZDR9HkXM=;
 b=eGBERKGrY+D0ndNPNFJ5DaG50cgtcHOW29K0isu2ex1NgMH41mUxM9bakndj1LDA1k
 UPcHMJf0VjY+C03KLJbexKndhQAklBZKbV8WJYISHSAWXm8jmBOVN++i+18+q73asMgf
 SyRrMZa992K4qC/L29alM6D63VRCCjyOXXiAHdLDl4e6SFxgRxCnOY10cL8fXacAliIH
 OOSjLc4dYXIaALRkvWbH7iHgd28SmFMUxj2JJg7iTc/OT7YjkdSiq+WTzCdzykrYT2mm
 eihMpkZlKAjKQR5DX0w3jmDMOWvzysvrX33bWe4Lyo6J0kbZtxrndHxEKzcwr3u6mcqD
 DZ3g==
X-Gm-Message-State: AOAM5306pBnZcG+JDC5MK6wvDcnqRlY/AtH8G93WxVp4TNvE3w+CDilb
 9TO6fLiyxj0idyUPjdTlkW5l4dvERrw3w+b0qpbuzYAE+xrV7m6ls7P5RnRPaxY/UfVV3I+CFsp
 RHneqwiIHW+wa2wALkoYBjv1Co30=
X-Received: by 2002:a25:ac17:: with SMTP id w23mr2026919ybi.243.1623829730848; 
 Wed, 16 Jun 2021 00:48:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8298zuTiGpIYdug8pB0udkhK7WfV2R3cDlNlxap76MVjRB4xJScgpgpUKI26gp8fzHikKLGfK1/dWEZLIqt0=
X-Received: by 2002:a25:ac17:: with SMTP id w23mr2026902ybi.243.1623829730641; 
 Wed, 16 Jun 2021 00:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <CAEemH2fgVnh4w9Vgezvu7-YmLXLJiKEkLyz5puTjgo=9=neidg@mail.gmail.com>
In-Reply-To: <CAEemH2fgVnh4w9Vgezvu7-YmLXLJiKEkLyz5puTjgo=9=neidg@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 16 Jun 2021 15:48:38 +0800
Message-ID: <CAEemH2eq-ZpjD-zw_NND76em9CEdQE-tLE_WFaPAMqN+sjpmyg@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] Add Coccinelle helper scripts for reference
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

Li Wang <liwang@redhat.com> wrote:

> > +for spatch_file in $*; do
> > +    case $spatch_file in
> > +       libltp-test-macro)
> > +           libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro.cocci;;
> > +       libltp-test-macro-vars)
> > +           libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro-vars.cocci \
> > +                         --ignore lib/tst_test.c;;
> > +       *)
> > +           tests_spatch --sp-file scripts/coccinelle/$spatch_file.cocci;;
>
> Why here use the coccinelle/ path and add suffix with the spatch_file?

Ah, it seems to preserve for more self define spatch files, I misread
the usage just now.
Sorry for making noise, I'm definitely a newbie on coccinelle.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
