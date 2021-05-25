Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D30BC3901FC
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:18:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22C273C77C5
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 15:18:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C86E63C2B2E
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:18:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 828841A01011
 for <ltp@lists.linux.it>; Tue, 25 May 2021 15:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621948717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIsTA3V9tIJqgd/heFrR4E1k/Yckk3uhHcKfC5vS3Yw=;
 b=ZQr4hdi1idy2HP8+eFGixkth37ayCsJcEw9nAs+hRyJ3TI78zmRR3gllwc+wXWQjW6QWWq
 Xyai/qUt1Dne01MhbqUwBVSu3xYzRS/hpMdCsV8OAekxenTMaZjlgxtW6L+O0l9pdfglF4
 FTdHAOnW+I3hkkXYqlBOYAaNCGDJUpw=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-vGR6Z7BTOteLXNsQOekgOw-1; Tue, 25 May 2021 09:18:35 -0400
X-MC-Unique: vGR6Z7BTOteLXNsQOekgOw-1
Received: by mail-yb1-f200.google.com with SMTP id
 j84-20020a25d2570000b029052695f1929dso2785650ybg.3
 for <ltp@lists.linux.it>; Tue, 25 May 2021 06:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIsTA3V9tIJqgd/heFrR4E1k/Yckk3uhHcKfC5vS3Yw=;
 b=J3lymzGCB3yOt0DJUulmKK2Qsc7ezV5m6SAu8LWRIc1sVUqPPXE414rXmYR8Zu8BiT
 klWxXP1lGQ1/tAhQWrpAipq1y+tAXOHMMrderRLRvKJUVvbSC0qeKvH+xoD/GMhjeVVy
 s2P54/417jfpoMRIb8JyQMpvwLDTG+EFwlUX28QtMXTg7jEYQXJZzfQ+CcPjI2Uk7l5z
 SaYT2UuzF3MJEF794Y6GClVOqjA3T6sIV+LoNXD3lgqXsn99sae7fKiHEv+yjmU2apC7
 hqLUI+etVjHS6yQOMowCoXP+I+tuUDRPFCWXyrN9/G/SIZ0OQowyZibJZAl+5Nmy+u2G
 Hcbw==
X-Gm-Message-State: AOAM531kdPlybqYT11RicxfdEyaqh7t9j0iC95JJuHMnf3NX8h1MfKYN
 fpJa7kuOQjBzyeQx3OCaKK+R352aQhdgM7m/s+FJfyHp7FpB6XHSqZT1xGXbm4Ajek7L21NR9pO
 3eVIONtwK4VzXebkwZmwBhdM+XxU=
X-Received: by 2002:a25:d94e:: with SMTP id q75mr3290637ybg.110.1621948714853; 
 Tue, 25 May 2021 06:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXPu9lXHVhots8Gst6LscVH6IYDvIhMJMi+lexp/KSucBXSnoYdCBBTWl12izldPWaF/VUTsTm5Bx5a5hycz8=
X-Received: by 2002:a25:d94e:: with SMTP id q75mr3290607ybg.110.1621948714608; 
 Tue, 25 May 2021 06:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190911124714.GA21670@rei.lan>
 <1571975625-6322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1571975625-6322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 25 May 2021 21:18:22 +0800
Message-ID: <CAEemH2dxhzBk+fbR8YnxAKqQSYhsb=HW2B2rov18yOjk9a+5Uw@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
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
Subject: Re: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before
 test
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

Hi all,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:

>
> stx_attributes_mask shows what's supported in stx_attributes.
> Set supp_{append,compr,immutable,nodump} attributes only on filesystems
> which actually support it.
>
> Also merge duplicate code.
>
> ---------------
> v2->v3:
> 1.add kernel version check for stx_attributes_mask
> 2. use test_flag(int) instead of test_flagged and test_unflagged
> ---------------
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

Reviewed-by: Li Wang <liwang@redhat.com>

This patch makes sense to me, I'm not sure if any blocker issue for
holding the apply process. If _no_ I would help to merge it:).

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
