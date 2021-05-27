Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E2F392505
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 04:45:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 890BF3CA776
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 04:45:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 78B653C4ED5
 for <ltp@lists.linux.it>; Thu, 27 May 2021 04:45:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9059C600041
 for <ltp@lists.linux.it>; Thu, 27 May 2021 04:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622083537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5cUIM/hQTFBWUP42/XgOTBwl5r3AhIEk42gHlVmFQlw=;
 b=CJNQlnU4Srcs0UpyhXprfJfsw5S4D7M7bhq1pd9Aqs2wXV437NLw2K7rYH/u6ifCWwqSYL
 beU0a7S11cZ0sJLCjBc9larKCoUuBdZeBLzOrLr/BupgmpAjHKyaaT5oKxTf0cqWpVlONx
 4/kX1CtEqpDpJ/EhXQ6Bcmv7GtfgAyg=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-BeJJItSgOz-KJT549YrScA-1; Wed, 26 May 2021 22:45:35 -0400
X-MC-Unique: BeJJItSgOz-KJT549YrScA-1
Received: by mail-yb1-f197.google.com with SMTP id
 i8-20020a25b2080000b0290523c9c81ba5so4076354ybj.20
 for <ltp@lists.linux.it>; Wed, 26 May 2021 19:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5cUIM/hQTFBWUP42/XgOTBwl5r3AhIEk42gHlVmFQlw=;
 b=PRjKbdIwYXGcX8Vor4lOHqC5hTcMvyR0U+JdMsPM4ljmgiTVSZ/h20y22tZe7/nN/n
 UnNkM1kn68wvcHA4MVmex8pHGhEdpbCj60gZ85OQjuiiiL3kephpJo7MXnAqxTlsmlEZ
 GlZjFuYkv1lfBedUgaA0hQVARGsTyVwxo60Y30Hxy/e2kSQCFeRje0OH5XukL8yOdEBV
 c47ZjuboYzRUnDIruw8EUKiuLT1vvDLPvKYrYwxk6DbqRGEOvINy4ZRM9W7UoOvlfOwN
 Lz7p0+dRv1HhEDvlW5Xzyl/FpNwUs9R3YVV6CHAXMZzDUzK5EbSfJUR3t1Vyg976yZAw
 RpvQ==
X-Gm-Message-State: AOAM5310rTloLLp0kQszK155wD6E/QHafkdw7IDfcF4xgA/yQh7S/q2p
 2t3T9SMKdpD9/s8J/bJ9OlGhRUK7RcEHSlhIpUt8hZIFyVK49OWB/QKcRVm7ZBs8wZgbnDSC/fv
 uda1jbCbrQMzcwualuOaezP8cLlM=
X-Received: by 2002:a25:1455:: with SMTP id 82mr1560039ybu.403.1622083534580; 
 Wed, 26 May 2021 19:45:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYim6c77rhxrpHReJhT8vVJ7gkm39Fd+Xv3RuO5eQKW/hbD0Suk5jAYz3GZRS5vV805SlFFwqNi01mtVH8YRk=
X-Received: by 2002:a25:1455:: with SMTP id 82mr1560022ybu.403.1622083534376; 
 Wed, 26 May 2021 19:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210526135900.19042-1-pvorel@suse.cz>
In-Reply-To: <20210526135900.19042-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 27 May 2021 10:45:22 +0800
Message-ID: <CAEemH2evB4SZnuz-A0S73yGYCTpYAKevcJKGC8MPiSzhSue-OA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/1] Remove README.kernel_config
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

On Wed, May 26, 2021 at 9:59 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> It's not up-to-day nor important enough to maintain it.

Merged, thanks!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
