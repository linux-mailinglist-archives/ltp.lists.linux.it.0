Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01D398271
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 09:03:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 488AE3C54B1
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 09:03:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0D7E3C2940
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 09:03:01 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 43A546005E1
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 09:03:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622617379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JrGcUqdwz5vprOtJMpXWps4qcrqtGh0gR1bOYKu9f8E=;
 b=B5PfmJ3CbYlK16x+37y+WPWqZcvjeVjPNSTTVmH4wv3Z8IfbLOLMKNNq06Aj+R0ozB/jrb
 V5K1NkB+L6QaLG4Q924mMvLZJ21kA+EJ3sINndF8NlQcdGaEUIXD5RJtakfcF96YuUqrHJ
 t4Qtv4wC3LsxBy5ChV7fsHnKFHxX3Nc=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-5OgygvzQPoOpFko5JOLvdw-1; Wed, 02 Jun 2021 03:02:56 -0400
X-MC-Unique: 5OgygvzQPoOpFko5JOLvdw-1
Received: by mail-yb1-f197.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so2073012ybp.17
 for <ltp@lists.linux.it>; Wed, 02 Jun 2021 00:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JrGcUqdwz5vprOtJMpXWps4qcrqtGh0gR1bOYKu9f8E=;
 b=E4pJOQkZurYn3rAJ7SyOpfWIDqeV7j4NnjLNsvz0/MmUErM7owbJHJ5uOqd14ILyh7
 ShgfIwAe7/VbOkFMrWoP7wh8PG+RQ5F4O0+aZfMELHJZGC2a0YpulCG0IR2WC/hUr7bK
 e0zHzvmwE1sk0eePghWchBtmbUH4POVedGYh8CHC7SZ2gLx+T1Yn0HEjMx+3oSG1IW1H
 xoI0+WO+plmO24h8A0Ft4cxWwWpNfaEAG6X9Lp/f8mjAeOf5T3OjmvvSVim6yhuER2Ha
 zqTZTGlTsE+lYpAep7TaVQCThBibouDgeaW3x8tom/IpIbQBLGNj/yW2YBfCU2Q6spqM
 sZOw==
X-Gm-Message-State: AOAM532s9wm4KEPAeg0rbEkvI51Lm13Ye3cimQIr4OFr3cQnbI7B28tM
 87KccQYH+qIQf+F4dQBnMhSJesR3++BQac2PDBj+BBusfonQqcZEPlWqDnliOxGRhKl62zXgp0A
 T51JEMX0IHIxzSgEi2NbXtr+cuDw=
X-Received: by 2002:a25:1455:: with SMTP id 82mr44848732ybu.403.1622617376345; 
 Wed, 02 Jun 2021 00:02:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkX8qH6RWlLbQE31luMr+NAgiX2H7EJWhXSfLRvB0m4V9CXz4N2dXsKT31e27hoWECYjpWkdOVS3OZE006/5M=
X-Received: by 2002:a25:1455:: with SMTP id 82mr44848708ybu.403.1622617376142; 
 Wed, 02 Jun 2021 00:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210601105521.27459-1-rpalethorpe@suse.com>
In-Reply-To: <20210601105521.27459-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 2 Jun 2021 15:02:44 +0800
Message-ID: <CAEemH2c2W1Z9W3dm2LoyMbtqJxtgZjEBHF8VDU3O1ZSJ2ZQmeA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/6] cfs_bandwidth01 and CGroup API
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

> This adds a test scheduler test which uses the cpu controller.
>
> Also included are some additions and fixes to the CGroup API related
> to the test.
>
> V3:
> * Reverse order of writing cpu.cfs_period_us and cpu.cfs_quota_us to fix V1.
> * Add may_have_waiters to indicate we should try waking and cleaning up
>   children during cleanup. At worst this can result in timeout warnings if there
>   are less than 9 children waiting.
>   Which is probably better than failing to cleanup the CGroups.

I helped to test the patchset and push. Thanks~

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
