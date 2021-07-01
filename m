Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A01F3B8DBD
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:27:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9765B3C8CDA
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Jul 2021 08:27:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01B583C247E
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:27:10 +0200 (CEST)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4F13860072D
 for <ltp@lists.linux.it>; Thu,  1 Jul 2021 08:27:10 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id hr1so5135573ejc.1
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 23:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=qLeMFETJykh0SN+245Li/gaQ8vuxSU/cdn1mIqq8gLs=;
 b=SDNfy1XYkxOCHuIDpB1t+0FVULMcv9tUwNbte1uNHEGmc9FWwDDXKxc/l+Vf19qtpt
 Ec4TgTHxpN7koPR9ig1mVTGYGaJ50GQESKYcLwoBKqB2N4D90jzuf4w2MkGzXPxTvyi8
 eXfAEJRaezkJC2MzFOWudbXJBTm2GigK3Q5vrbNQYDBlyg3nO3iDezm4tQzGDe9yTV01
 UXgWEvVs4tNMU6MZ76lusCEQFLytApzep75OO/SFQhsZyVH0vfU3QYDHUJN2vCX2f+k/
 M2PK5DgIyIM4b8Np2amjFIZkSp0fV9wc2Gs7QBOwbePeQ1WKBnavh73XMUI6CdrwF8R5
 ziMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=qLeMFETJykh0SN+245Li/gaQ8vuxSU/cdn1mIqq8gLs=;
 b=LPccn/18MLwkFNO2KhkEr2XJCRY5yFwwR9xBzElGbeXy0cf1jzZ4K9xbkHYnMSxRoZ
 AKfnZbazj8VC0rr/AJZng75RYx/Vs+niQ3ecuEHHC7VCTEI1PFgeKMv1oxdpMbQw9oXy
 43Lh4vqpUdDM4Dw/WaRMqJU6so6XPrM75bjsMXMOSoP7MNO5WiPb8eIM6uuwSff4Uv54
 UyzJbcbtw9YXec/5Pt2mvxHxGMTyPBlOi1lVxLQJPHeMhZjIzFIk/fe7oASvd2unCDNH
 BgX8Rm/3wCFFwQwHtMU2lLEBrvHBDj6C5m1/PBPWlGaukP3tMNmGvekAuhiyj38x7Pur
 bvag==
X-Gm-Message-State: AOAM533bAL+WOBU1Xbx4bHBZ7H/MrGvb4vTPN9iD1rGzMhxVLa3Ivet7
 XpbMYIAVc1/IIGMPk73+L/CsAkyoD81ISA==
X-Google-Smtp-Source: ABdhPJztMD3xePl4yes6lWY6Pf1ul3XrgHvi4Pt4Qne9bYM5ae79ygDKMDn7J+hW6VSDTXIQZoW2Cg==
X-Received: by 2002:a17:907:265d:: with SMTP id
 ar29mr39016104ejc.113.1625120829889; 
 Wed, 30 Jun 2021 23:27:09 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id df20sm13912772edb.76.2021.06.30.23.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 23:27:09 -0700 (PDT)
Date: Thu, 1 Jul 2021 08:27:06 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YN1gOkdw7b8b833v@pevik>
References: <20210701050314.1005067-1-petr.vorel@gmail.com>
 <60DD58CE.5070800@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60DD58CE.5070800@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2] API tests cleanup
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> Hi Petr

> Why only rename these two tests?
There have been other tst_fuzzy_sync* tests, test17 had other issues to be
fixed.

> ps:IMO, test01-test21 also can ben rename to a meaningful name.

Sure, feel free to rename more.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
