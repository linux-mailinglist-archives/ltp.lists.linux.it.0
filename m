Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C26387439
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:42:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26DCA3C95CA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 May 2021 10:42:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8B2603C91DF
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:42:34 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0158E200C11
 for <ltp@lists.linux.it>; Tue, 18 May 2021 10:42:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621327352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlV2hJCkz7uxI0qBIfTCUZm39jWBSxRb9YevjDwnjnM=;
 b=QgR2jGF1mECgncoFflK31W7XkBbwBmiMRth3IdK3IDNjh8nmtMsmqjr/MJRsYiLPwU9R1r
 72MniO4cTuYmj9Femk2DhF8EomqOsO/Cco11Pusol7TBYD2pqf3lhpKxFjxM5q4ylIq6JI
 J65I1yKwVZPP2Kfe1U5H6pl4lxE5J5w=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-dT_0-t4HOpmbP3RTG8Ymow-1; Tue, 18 May 2021 04:42:29 -0400
X-MC-Unique: dT_0-t4HOpmbP3RTG8Ymow-1
Received: by mail-yb1-f200.google.com with SMTP id
 129-20020a2504870000b0290513326cc5e0so185903ybe.10
 for <ltp@lists.linux.it>; Tue, 18 May 2021 01:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qlV2hJCkz7uxI0qBIfTCUZm39jWBSxRb9YevjDwnjnM=;
 b=tG/gOU7+s86w8PrW3oNa6a6x5H9smOCVeStXky0CJa/blUXNKgIoqGUjwWXRiN701v
 9YN6eDPM5KK0gSpyCBd5VQPMq3E25Y3//eesmL7f8OenGLx/jRQlZChZFlFWEa9+AigD
 w0Jx9wjBNFD6Ze1ZFjFBofFdCvD2Cli1oDwqz4BirjiH5w8BqjgdnMNkDYMYAUdZrD+q
 spxsiIzBKm4OQxCJDwmn/dSmxR5owIraNob6T8zcIw1c7j0IhP3AtbTzW1gjAEASvRmU
 rymL6YO5P1t1AI2Xq+eoD0isVyi5rx332OFjtwqPHqZPmP/MYRL5462ZF6rESFZ8HMt/
 m3IQ==
X-Gm-Message-State: AOAM533q2nNzjqAZuQQIcLdZo1odGMXYwUHfOg52Iwe3Q9vPiTV+2CBn
 DCUOGKEDoMk6w0q0nccuqs8kx5WIZK8ujiOLDRQ4cWXrn/YPNcogMtPgPvKxCiT0FSOrW73qpSy
 5AeHo9bV9nhMuWS5UZD3wX0u7NuY=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr5715536ybp.366.1621327349316; 
 Tue, 18 May 2021 01:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFuLXBj70ItYf3Ho++MwivvYClvNeO0pHBBWeD0c8LhYsc71UQapLsQAKW26zxTWQw7s4WvVG4q6u6sVUcwcs=
X-Received: by 2002:a25:9d86:: with SMTP id v6mr5715524ybp.366.1621327349187; 
 Tue, 18 May 2021 01:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210517163029.22974-1-rpalethorpe@suse.com>
 <20210517163029.22974-6-rpalethorpe@suse.com>
In-Reply-To: <20210517163029.22974-6-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 18 May 2021 16:42:17 +0800
Message-ID: <CAEemH2dpgSOqfjcnGRq-tbJk6wRbHK4wHzHgZyQ5EoUrVEurnA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
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
Subject: Re: [LTP] [RFC PATCH 5/6] API: Add tst_ to hugepage opt vars
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

On Tue, May 18, 2021 at 12:32 AM Richard Palethorpe via ltp
<ltp@lists.linux.it> wrote:
>
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
