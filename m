Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D3393EAB
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 10:23:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 426793C6BF8
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 10:23:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6825B3C18B0
 for <ltp@lists.linux.it>; Fri, 28 May 2021 10:22:59 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3A0B01A00920
 for <ltp@lists.linux.it>; Fri, 28 May 2021 10:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622190176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sWXSS2CuGHOKKKFoRgV+/rK+0BfbdySWQejQM5UDU7I=;
 b=KlYB71RAA8sn0kHg/zZLTnyHEUesZSPam+CuR21r68zyek2RPWULMWE2YOD/lFLUyspDPl
 FaFw/bYoXiUfYcYcirMbere+fQ9uiPPuONwJwRfKTPZIUwFR4PwrHvw+7q+U+ACkyloctg
 2QpY/0Ic+S8CSm4f2S/9JJKQ27B8wkI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-wEq8VcQ7MJKR7SJDllqC_g-1; Fri, 28 May 2021 04:22:54 -0400
X-MC-Unique: wEq8VcQ7MJKR7SJDllqC_g-1
Received: by mail-yb1-f198.google.com with SMTP id
 g9-20020a25ae490000b029052f9e5b7d3fso3594873ybe.4
 for <ltp@lists.linux.it>; Fri, 28 May 2021 01:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sWXSS2CuGHOKKKFoRgV+/rK+0BfbdySWQejQM5UDU7I=;
 b=O9wuhvZ8HxQSwytAqYz6mv1bq3M8PF/nD72zDhNilAy0h2wNNzYZSk3UWOtdI0s113
 fEJ3d6/RYIdqjWa9o57KSBiNnR/DhUTlSa0fEYpEr4da13MI+59fQqglq8MOcqnZiK0z
 YGRlGq30t2Vy4mCFcgBnSyB4jvCRkxzrGwDTxHeQDXwijqv7nYcAsT4LFHM0SM6b6Dln
 /VsG6BXFbtwVDuOzHDIxc3LvbnTkVqIkJN/ZHw7Rk6p8DdVkcx1+FKANutyWAaq8LriC
 3t6jbo9V1qeJnDrx88PuRgoeT1YRhLS+cnICkeMLWHWCDU5iovYDaYUQODsPgAUd5O3L
 MZrQ==
X-Gm-Message-State: AOAM533RbUcqQBrNFH8G4nx4g6TIR5yxmdnJ3mHQgLX8LdGkqGRwdFzi
 kOqA8dUC+8C0KknlZJLNpJiVTy5jsaMuUbg2HZonq7NMZGnqc2XjRfKSdcn+mooaQP0+OEKQGTk
 dgut8P1gbL5T7dN82sICxnEvDbNQ=
X-Received: by 2002:a25:d412:: with SMTP id m18mr10347825ybf.110.1622190174056; 
 Fri, 28 May 2021 01:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmjZixBSbvUUBkljG9OJGM/zZR/VyDUNbU/o/r8wMd3JsSkl1jok/tfnDiMH90pFWpEECsrbn5qFjZAamADtQ=
X-Received: by 2002:a25:d412:: with SMTP id m18mr10347808ybf.110.1622190173860; 
 Fri, 28 May 2021 01:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210521102528.21102-1-rpalethorpe@suse.com>
 <20210521102528.21102-6-rpalethorpe@suse.com>
 <CAEemH2cqGGJuF56LpVO9egB7eLLCLdcXKaVA_2dkFRFmN8=jKw@mail.gmail.com>
 <87mtsgjjiz.fsf@suse.de>
In-Reply-To: <87mtsgjjiz.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Fri, 28 May 2021 16:22:42 +0800
Message-ID: <CAEemH2d8dVjhNbD_1ayPhz+Y7+rGGyVn+M6T03YkF=Wy_DErew@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/6] API/cgroups: tst_require fail gracefully
 with unknown controller
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

> >> +       if (!ctrl) {
> >> +               tst_brk(TBROK, "'%s' controller is unknown to LTP", ctrl_name);
> >> +               tst_brk(TBROK, "Calling %s in cleanup?", __func__);
> >> +               return;
> >
> > It'd never go here to perform a return because the first tst_brk
> > will break the test directly. And, I don't know why we need the
> > second tst_brk to show calling in cleanup, is that possible?
>
> It can return if it is called during cleanup. tst_cgroup_require should
> not be called from cleanup. However someone can do it by accident.

Well, I see. But TBH, here worries too much about the unexpected situation:).

> We probably need two versions of tst_brk. One which can return if called
> from cleanup and one which does not. I suspect most tst_brk callers
> assume it will not return. It is really only some safe library functions
> which can handle that.

Yes, sounds reasonable to me.

[Cc Cyril if he has more advice on this]

--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
