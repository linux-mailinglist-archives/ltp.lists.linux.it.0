Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2936D5F7
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 12:51:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48BAD3C6298
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 12:51:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 484E33C0DFE
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 12:51:34 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BEDA01A010F8
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 12:51:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7fAESiM2+tDyD5Edg1LBPxQevBq8+Uho9e1xoSjwTGg=;
 b=Fc8HMb5f71j1qo+PCdk9nvcwgANSej+LD4psLmzOhuOi0v9hKcs5YWBd7xqdss8t/K/6c/
 i6JkRMcY/pT64pqh37EEt6sNojG9tI/y9HHXFIAKt/cbuuXawP9TVevN2vQVh/XO+UHWIH
 jNnkO7KfxcCxp8i9s2EMamId9CcxwJw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-UEmkbqX6OVudiPh-uz65Eg-1; Wed, 28 Apr 2021 06:51:30 -0400
X-MC-Unique: UEmkbqX6OVudiPh-uz65Eg-1
Received: by mail-yb1-f198.google.com with SMTP id
 v10-20020a25fc0a0000b02904eea8179f1fso1344586ybd.9
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 03:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fAESiM2+tDyD5Edg1LBPxQevBq8+Uho9e1xoSjwTGg=;
 b=siXQT2Rgox7HbWFEYceg9ydFZuE3iRCCckTeXakuqQ++Bx2YofB142rD+GIHeDc7KQ
 Xqa9uftyY5Tf8///dOoahtpYfYXRvxfzafLYmU9y8odRODDsvUwJvLFTBprwqp/6yevJ
 /CjLW6ZpLsPcPezSPcdEz2ky6FX3GuYlhev94WeqvgVk4xNkd6aOjsseYSOtqD3aQ+Hg
 5LZF7H0u69meCQ6joglB9F1dBeUwSBBt8LVzyuIpjtLFqXHYHGtCcB7jdjn1zbw1/N4B
 Cte/CQtmKAnbmj2goXPndIbe3vsf/yDISK3WApYSgAYT2HWlsgfbKaqIa3Pr2g8KNJ54
 cPBw==
X-Gm-Message-State: AOAM532x4uGm0E/2qRNBSBuJzlnWWyz9H6wq6WBEvQlrrzqB0GMfdBf2
 vIoFc+em/cZfQJ8jSVzC42X8AO5yqHKJob6nWeqjsXeK2WBcjDOXot2TsnUKvX7KtLeDJQbEfad
 ebA+vQ0LaB6YY9ZE7x6IiFEb6Coo=
X-Received: by 2002:a5b:787:: with SMTP id b7mr40148850ybq.243.1619607089705; 
 Wed, 28 Apr 2021 03:51:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz43BiTzwKSGSlmGqkB2RdbTXSI+qkBCAjO5ZhEjRe8PDnbSqDmHh7zlg/19kxUNEHjJHepVIMSrqbTQJWZofI=
X-Received: by 2002:a5b:787:: with SMTP id b7mr40148831ybq.243.1619607089499; 
 Wed, 28 Apr 2021 03:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210426031043.16212-1-zhaogongyi@huawei.com>
In-Reply-To: <20210426031043.16212-1-zhaogongyi@huawei.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 28 Apr 2021 18:51:17 +0800
Message-ID: <CAEemH2d8PK2uz9QpYefmhoaLm=g9NwsViUGMB=pJ4f0PKtSAvw@mail.gmail.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/reboot: Update to new API
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

Hi Gongyi,

Nice work on API converting and cleanup, pushed!

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
