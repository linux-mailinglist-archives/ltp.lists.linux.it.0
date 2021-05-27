Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1596939257A
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 05:31:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57DB83CA775
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 05:31:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0797B3C2B56
 for <ltp@lists.linux.it>; Thu, 27 May 2021 05:31:25 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 70461601BC6
 for <ltp@lists.linux.it>; Thu, 27 May 2021 05:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622086282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WvibMAGRhfVKMnzrzwUPCw8Z5+tPpK53aGnggE+09k=;
 b=cNIrvKVDgY189oXKoHsxb9o2u95QmBbBpxI/BdC5l7TUtKNo8+lGstDQdrcNXn/XjOYriP
 Yg3jX7MekXX6tD2mApH1TdKJT714M0+PYXZLpDg3+VH2Ur9xng10uRnjcKEyAPXo9JkO5Y
 vu+1XzywcVRMQHhu0xRHf3YxJm4f5a8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-n7K-VC0UM8ejr7MVlBCjpA-1; Wed, 26 May 2021 23:31:20 -0400
X-MC-Unique: n7K-VC0UM8ejr7MVlBCjpA-1
Received: by mail-yb1-f199.google.com with SMTP id
 s8-20020a5b04480000b029049fb35700b9so4277198ybp.5
 for <ltp@lists.linux.it>; Wed, 26 May 2021 20:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WvibMAGRhfVKMnzrzwUPCw8Z5+tPpK53aGnggE+09k=;
 b=JXiXzNiIj3YUMk/cEEml2IRESG663ZPm0UVgQNblC31UrCMCrvD3BEe5ekJOh2vgvh
 WpqLWiJJQ2nu03qpHgCj4H1wNDp8WVx1LSXBE5NJ6lLEV5rtwjE9yGePcOJSvaSghgMT
 dbpKnnixd7kYHv7bjkOkPKXmUaqo8SHgn6AWADv5/DO1jU9Re8e+9HDkXCJjZ2lmTqzQ
 nr5GFArl5R/3kpH5yZeI8mNVwmX9eEk9TS+ZmLIonoQX4esUqYQpxFpZHgAuy1xylYhT
 eh1bzYv0oRLITgCLUgr3ONn8TY037CUSPPjwbHSMgqYahRIbwg5QDleu6f67iNTn3du5
 gz8w==
X-Gm-Message-State: AOAM5326yywxsXh9+C3azOB7WY0Tiys+m9YnQoL1sgJKO7iTJ7lJkiVo
 D3PegqEIZrDF0BxHp5XF1f9UtZBoKxje8ezJfOJiKJ6s07t/w0y2NBlLdRDd/I37Fe8khxt37rx
 BEGNfjWpwwEzK/axgbA+SdLWg2b0=
X-Received: by 2002:a5b:787:: with SMTP id b7mr1737415ybq.243.1622086279831;
 Wed, 26 May 2021 20:31:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9IJirFBG9jczHzSQh/UEkmtrsrruY52FUfYCaHUmmV+O+mpKUfK1dP9jNtpL0rxYkrljylNEk6qdbDRS8Ft0=
X-Received: by 2002:a5b:787:: with SMTP id b7mr1737393ybq.243.1622086279610;
 Wed, 26 May 2021 20:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154949.4473-1-pvorel@suse.cz>
In-Reply-To: <20210526154949.4473-1-pvorel@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 27 May 2021 11:31:07 +0800
Message-ID: <CAEemH2ecppttvGW1JeJ_E=w1eUJYEY8+Sx8Euztn2MhRYykEKQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] doc: Split test-writing-guidelines
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On Wed, May 26, 2021 at 11:50 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Test Writing Guidelines wiki page is too long, thus split it
> into 3 parts:
>
> 1) generic part (only first chapter, the same URL)
> 2) C test API (2.2 chapter, 4. Common problems)
> 3) shell test API
>
> Unfortunately this breaks users' bookmarks.
>
> Start numbering in headers from 1 on each page (links are broken
> anyway).
>
> NOTE: in order to have '...' formatting as code,
> main header ====== was needed to add on the page.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> See it:
> https://github.com/pevik/ltp/wiki/Test-Writing-Guidelines
> https://github.com/pevik/ltp/wiki/C-Test-API
> https://github.com/pevik/ltp/wiki/Shell-Test-API

+1
I think this is a good proposal, the split doc looks more friendly to read.

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
