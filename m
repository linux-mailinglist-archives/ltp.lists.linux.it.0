Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2EC38743D
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:43:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38B2A3C95CA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:43:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 98D643C91DF
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:43:36 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7C14A1400F97
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:43:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621327414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UATwk/yB/Vl9Wja3c88KtwAgFboBp50izn8o2PxLCds=;
 b=Y0A0b4KR1MLIr+b0aibI6v3hA6EJu3vqA9GvAcnwosI1sCLL9ln2ryzQwWKC6zJOFuYFy0
 3rI/9ILKrEryWSTls2CpbpnctCMBelUCXy9hOmV8YbCTVB6Z5jv+WK/7hyoafp4Tnlyi2Z
 eKA9NBMUddXjf3JtUFB8EwlJXQIt4bo=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-D4NloJ_EM8qXDHTrRpizVw-1; Tue, 18 May 2021 04:43:32 -0400
X-MC-Unique: D4NloJ_EM8qXDHTrRpizVw-1
Received: by mail-yb1-f197.google.com with SMTP id
 e138-20020a25e7900000b029050df4b648fcso6745677ybh.7
 for <ltp@lists.linux.it>; Tue, 18 May 2021 01:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UATwk/yB/Vl9Wja3c88KtwAgFboBp50izn8o2PxLCds=;
 b=Xvs7DvsAlBAV869HEfCVLqYFZDSZf+PAfwdfnyApq9GZpDDKBH0vA3nz5szPWZIwfF
 VkwUG4ljHlyb4TSttNgr/DiLQqdRpIvzgKpU6wvAVbgK0m9K7/dUBjP0EQMo0PEtPM2T
 ZpVGdCloseWTm68uRFNPgM3KJl+IYt4eH+h7mSCOZW7bxWgm955ScUY7SzBn7xActOl2
 dK/RdviRoFkR6LuRYPykA9FkwozGOzbIYsHIPADrF0T+T5T6Aej6w0WOBwyDBJo/YgW6
 3QGDaOrxdKngl/EJMyfVKtsH5JXb9ckAF5T5o6LSIxn24xAp5af/sB02YR8HrB22rvWB
 mJtw==
X-Gm-Message-State: AOAM530LQmfoqZWM3RHuT0eFWZKNWX6JI1LCpq/ldR2d7GfHU9vgcgPh
 GM7JeIChb3OCa0GFtSLHfEusmPwDs9O882IFwRj1YouotNWvTzdpajF0SONC1Bwzz5hW6YXgbf+
 HAWBl+/hV48BfmcsOr1r0DIQkKB0=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr6058283ybj.97.1621327412011; 
 Tue, 18 May 2021 01:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4CtH2S8+rkQ9F0ER30YlohY4aXQWPP4gIm1/uHKrwBgYvzpktbhr89RCmsUCY7s4ufA45mogFJ5gEjLIV2W8=
X-Received: by 2002:a25:ae24:: with SMTP id a36mr6058274ybj.97.1621327411873; 
 Tue, 18 May 2021 01:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210517163029.22974-1-rpalethorpe@suse.com>
 <20210517163029.22974-5-rpalethorpe@suse.com>
In-Reply-To: <20210517163029.22974-5-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 16:43:20 +0800
Message-ID: <CAEemH2d8L30n8pMLzcp4owEOsQ13Mdai6B=njZMEa9PZjAgFmA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
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
Subject: Re: [LTP] [RFC PATCH 4/6] API: add tst_ to mount_overlay
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

On Tue, May 18, 2021 at 12:31 AM Richard Palethorpe via ltp
<ltp@lists.linux.it> wrote:
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
