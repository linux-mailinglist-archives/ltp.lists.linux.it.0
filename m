Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4543348931E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 09:15:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E45C3C938E
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jan 2022 09:15:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ACE9D3C051B
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 09:15:03 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 36ED5600055
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 09:15:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641802501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=HUOxcdWXcGk6fGNWIHpcxJFGGbi3GxBzEBhPQSrwggOFeWt2QLqpOX0MhbMF5r5e2Uo4YQ
 7NRVvJa0xFjOOnzGpbRB6sDfBIADcQX+kSdUh5Ucg8vWQIradVg0rqmBDJQLFI+h+lEJmC
 PaUAMDQ3RWj9zd9yuTRN3cyLinwtXSo=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562--XoyibgiMVG3jjugsXDlIg-1; Mon, 10 Jan 2022 03:15:01 -0500
X-MC-Unique: -XoyibgiMVG3jjugsXDlIg-1
Received: by mail-yb1-f198.google.com with SMTP id
 e137-20020a25378f000000b0060c1f2f4939so25997181yba.3
 for <ltp@lists.linux.it>; Mon, 10 Jan 2022 00:15:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=NfysnsqKdL8V9/EAZLVHTWiz6HSYnlklkcd98gRMWxy/bK4yaP8+NdC2kY8dlnj5WI
 J7S8WtEWT4tJ69F29Ze/HYSNxCFdZoBbpAEyG2Cj2+8IMrjY8w6S8wBudsyKDgG1ZdHo
 6UT7fAfMrXGwx95kKvZuUBDv/5M7cXrMRc3XK2vCEb4SnSpRTbasvzGtXxLCvQoMStZX
 l8/NbxeLLfO5yiU9clRF0t5omsQg8EzhVIwxK9f4smqyste7SEaUH0a9jsxij24OJQ/B
 sGw5mObxa8B6WyaTRtszH88C1kQX/ksDECZToZf7mLpu/LUhJjkNkTXMHy8DvFTyZiW3
 D3JQ==
X-Gm-Message-State: AOAM5313UprDBHqxI3If+viWlnJpF9NlxokgLa/7MFGccgx6Q1QBUmkz
 gY0HDG2hn7zZ+vKy7XzfTdGgWXgS3f29AJ01fibC/IcdrEiLqr+6XbwrxtH7Gg3n6SYnbh9Xkbt
 7D/RfzP8CxYh2YqrvwzC2rD3IFdE=
X-Received: by 2002:a25:b0e:: with SMTP id 14mr501528ybl.728.1641802500516;
 Mon, 10 Jan 2022 00:15:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykgy1HfSQgj/afGpSFWYaRd8w+gCO7EiOAax3gEwRmlASdYo5VBqZDZmAjgiEYBg8sVxPTawBNH6mYF+lPmrY=
X-Received: by 2002:a25:b0e:: with SMTP id 14mr501514ybl.728.1641802500314;
 Mon, 10 Jan 2022 00:15:00 -0800 (PST)
MIME-Version: 1.0
References: <YdbQmTJK73804UYT@yuki>
 <1641779349-8424-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1641779349-8424-2-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1641779349-8424-2-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 10 Jan 2022 16:14:47 +0800
Message-ID: <CAEemH2emC5fPQOfTdKyVHVv2_0Y6bhJ_RZ667i4fbWS9iy_xDA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
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
Subject: Re: [LTP] [PATCH v3 2/4] lib: Introduce KCONFIG_SKIP_CHECK
 environment variable
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

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
