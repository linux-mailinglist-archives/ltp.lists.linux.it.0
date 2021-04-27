Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF136BCDF
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 03:14:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6B5F3C6748
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 03:13:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 219763C27D7
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 03:13:57 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9BA541400437
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 03:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619486034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1iZy0GQoHLyW5c5+ADLm3EFcTRKGAIrKtZX0cWeHQ14=;
 b=EK9B0uzUTZymMRIpUEbYI8VjsCNifMQxaDj+PiiccR1RlQyOITJMX+oZR2YYEDsfayyeb+
 rsxTIBOrlj2ctLI3fYME59ZMs4lb3Bm5NKvFCpTIv4ZpXa59tG+e7UM71AK/dfUlcMSoRa
 eXQzsOuHmlyVgUw22YY5DSPguPznQbw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-aYDdpf2TPKeEMAQ3oJ-pAg-1; Mon, 26 Apr 2021 21:13:51 -0400
X-MC-Unique: aYDdpf2TPKeEMAQ3oJ-pAg-1
Received: by mail-yb1-f198.google.com with SMTP id
 d89-20020a25a3620000b02904dc8d0450c6so35343923ybi.2
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 18:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1iZy0GQoHLyW5c5+ADLm3EFcTRKGAIrKtZX0cWeHQ14=;
 b=k8+YkGGt3NyccXW1O5AMDOEPEiyPoFX4zwTDrg9mGT7QsRaPCXuCeNe7wiLq6nTRJ8
 08fkjUlpJ/jDuDVW1YjZ+9Wn0QkJts5DKi73LQCilgbxrmn5j1b+Htgna2M4d9MWr6Rz
 gkmDoqljnUeMg6Atu6tA/nIswKqr8Uuk2oHb/7FDRTfA4mwbCKlvxVnOJ0FJ/myKKY2W
 pHLGf8vVRtpxdK7j4G662vKrfjDHaXYfBkZBYsGjFp4brtFWyIyivfWjzwaNS6whtDbk
 9V4xZjmXIn5mxPamjli+qjUomTKjZz8fFEXTsIgHbkU7p+9j1vh0YdPrdXJWBlXGG7Wv
 2jrw==
X-Gm-Message-State: AOAM531geTXYwWyKGF3albJY4s2Fq9n7f0ibL3pnl/+9GfesdEXSYXLX
 hHaEmQy2vD2eKzrrY6KkkiZrFaBm7fG2R8XeKIA0CYXZJa2jh7Mtwi6FKRc9d/WWeROjeF3lkDX
 e4gII7PdwGhWcr1svyhJtum9HJGQ=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr29014885ybg.86.1619486030366; 
 Mon, 26 Apr 2021 18:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze1+045yJ7VeG4BoOloRNLzqgDHL9cY9k7eN7jFpZUvNZw4oX4ZMFxn/cumacSqP3fZDLrTwWNXV/7DH7RuNQ=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr29014875ybg.86.1619486030223; 
 Mon, 26 Apr 2021 18:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <1618453203-24741-1-git-send-email-wangxin410@huawei.com>
 <YIcVUx/Qk9lXIM4I@pevik>
In-Reply-To: <YIcVUx/Qk9lXIM4I@pevik>
From: Li Wang <liwang@redhat.com>
Date: Tue, 27 Apr 2021 09:13:38 +0800
Message-ID: <CAEemH2dFzT2ycr7zASsZydbn1dF42zvzxCqGjPjeNXFsA0sVSA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] openposix/conformance/interfaces: Correct typos
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
Cc: Wang Xin <wangxin410@huawei.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr, Xin,

Petr Vorel <pvorel@suse.cz> wrote:

>
> Hi Xin,
>
> > Types in the name of the temporary files: For example, in aio_cancel/8-1.c file,
> > pts_aio_cancel_1_1 -> pts_aio_cancel_8_1.
> > Others like this have been modified.
>
> Your patch does not apply to current master.
> Could you please rebase it and resent?

This patch is not because of the rebased issue, as I commented
before, it has format errors in the patch.

(I'm not sure how Xin cooks a patch, or if he modified something
in it, but checkpatch.pl blame it is corrupt).


--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
