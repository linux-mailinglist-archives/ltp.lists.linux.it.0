Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9DC3653AD
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 10:01:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB9FA3C6C88
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 10:01:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 88B383C6C50
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 10:01:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 657C7200C82
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 10:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618905697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UX1lUUFhNq8pjfM60ClivOE6xDtRsQzvwEc9byxObOY=;
 b=fTuoeevEgZZiZ9pj2jLN/bnyrSxZ5zUL6XpW0AqpvY393M5Vmjsf3Mxh422/YpF/0vH5zH
 7nfcdRbuGlXfHA/gCuleMeH7tTKXtQFASavRoR68FvN4ILgrgmwkSIJ6SOw4ldJewvKmKP
 iC1hm8l7nKts13pC1F1Ei9gFxUjUpeo=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-4H549R4kPYa-2yRri2WFqA-1; Tue, 20 Apr 2021 04:01:31 -0400
X-MC-Unique: 4H549R4kPYa-2yRri2WFqA-1
Received: by mail-yb1-f197.google.com with SMTP id
 137-20020a250d8f0000b02904e7bf943359so10736454ybn.23
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 01:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UX1lUUFhNq8pjfM60ClivOE6xDtRsQzvwEc9byxObOY=;
 b=R6SbIXPj0zNgnRp4gXiuH0Y/AkYjNRjh78Lqy893ws//XNc2bu8/IE2/R+jvcupt92
 k1LkP9P384gOG8dc3y8K0VoyH8i8g99fsIGAy9/ELAdjTIMAe5xBuxdE1+qzPhbQSauZ
 m/bh5+foaad/XMEr09J5WZvAdkHMHGek3FME9sQQW7GDjxjWvDrpb/FLJ4P3mOZlc9TR
 kdmvCx71VA+QVQ3JDNXGoWbG4OgrxsMWySVA/v7rmpAZdCmhuZJ6X/vcYgIzX6PNdI+N
 5SRuByWhhelGdO/5C/pfamgyl+ZjPv33hREbCd4WGi+WZ1rBSxcoq/0D2wY6+by2yL2w
 Sz2A==
X-Gm-Message-State: AOAM531MqwQuEZ7zgJ6QTcTQtduPaGtVzVFWtixnFGLFvoFlqCCQzXc4
 x6gAVyPlcxY6f4K3iHm+6jUOBy2gEGPa95W5PlZLZaVI9wLyTVcsavS93VH1oFpLbWUMAj54/w7
 XgS0SmzX25AlJRBtqltsf7sbLaB8=
X-Received: by 2002:a25:c0cb:: with SMTP id
 c194mr22611297ybf.252.1618905690637; 
 Tue, 20 Apr 2021 01:01:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyneLXbzm2ouP+qaVki7RBk5K9+Igqf5c9/92zbPFLiwONsGxlY5GpXHFVo91p0rjli58UUyTFAQs7o289eTXQ=
X-Received: by 2002:a25:c0cb:: with SMTP id
 c194mr22611280ybf.252.1618905690428; 
 Tue, 20 Apr 2021 01:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210420061759.22457-1-pvorel@suse.cz>
In-Reply-To: <20210420061759.22457-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 20 Apr 2021 16:01:18 +0800
Message-ID: <CAEemH2fD45RCJwKYtrTj7H3vZaBHU=Y2e2zu8V1YepnOKOSC1A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/1] zram01.sh: Skip tmpfs
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

Hi Petr,

This patch looks good.

Reviewed-by: Li Wang <liwang@redhat.com>

I am now thinking, does that make sense to add FS skiplist to
tst_test.sh just like we have done for C lib?

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
