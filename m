Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A14392597
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 05:50:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26FE93CA769
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 05:50:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ED5DD3C2B56
 for <ltp@lists.linux.it>; Thu, 27 May 2021 05:50:11 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0720B1001175
 for <ltp@lists.linux.it>; Thu, 27 May 2021 05:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622087409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+91xkUoKw5KIq/5arxO/CCrMPhweeLe/F82IWtMyso=;
 b=Tm+/4wz3PNa055/2VcOjTro4MdqLtCeH6yrBB3cEyd9KB95YC2B6F8w3oli2vt+hZpNZMq
 BE+K/AFzyu+M3MJuUUxsey6Jkx4XZNowUKIXfGLNUVjYLsPG5XEtHrvfx9ruIK7SVpxAyw
 p0LNIJIaQbANBon+yK4GCA3XnnklAP8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-XCA9kyEwME2BFZ1yCZru7w-1; Wed, 26 May 2021 23:50:05 -0400
X-MC-Unique: XCA9kyEwME2BFZ1yCZru7w-1
Received: by mail-yb1-f198.google.com with SMTP id
 n129-20020a2527870000b02904ed02e1aab5so4210710ybn.21
 for <ltp@lists.linux.it>; Wed, 26 May 2021 20:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i+91xkUoKw5KIq/5arxO/CCrMPhweeLe/F82IWtMyso=;
 b=GDSe+/MamnhsKe3eD44M6Yr807O75i6wuGb9hai/NNZ8e7oI1ssPiyDVJx/WyG6+HF
 Hd6agyP8TaxXiZeqrURuRBWAyf4gLHLpX6Y0tGVLFd5XiHsNzPz7UJ5TGfJYGR+Q3YL9
 35D/Vbvr6EiH/ZCdaKEkUlLkRe4+iHc54UwVd8DtM6PbU4Yr/d/9d7c3In1WLMpcU9bc
 KVs8+hHtA2ecucMox+Sj/62UIpTTlo/khZEVnYm09oMNDujqV64tBo5zjc6ascBOFAXo
 d75dbxGyTC5URnkJPnTlaNDANfKsdMnaCqlZOHHPisknEVtp2ymJ5lCL7TVVhBd9Szk1
 u7ZQ==
X-Gm-Message-State: AOAM531stzasoo5A8OnT24Xrg0SsJIY7/oRmpH2+Y8JvS3V/O9FPSa3i
 yb1ZeGRkLP5r/PWTh79nQP7aT4YzuHTdTvhCHiLC1X3s95LtEPUkP9unKkFSzb4f6hXWgFZEfOq
 GOvUdlCkUxY22SDy6p1vNTGdHHUo=
X-Received: by 2002:a5b:787:: with SMTP id b7mr1811722ybq.243.1622087404818;
 Wed, 26 May 2021 20:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwf2zJtXTzT1Ssuw48uRKeVQ+fMiCtZk8PydpC8SIh4rwbL8kh0m9o+kJGFYTNHWIr+qF0UWblsK43H/GNDf4=
X-Received: by 2002:a5b:787:: with SMTP id b7mr1811709ybq.243.1622087404675;
 Wed, 26 May 2021 20:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210526154949.4473-1-pvorel@suse.cz>
 <CAEemH2ecppttvGW1JeJ_E=w1eUJYEY8+Sx8Euztn2MhRYykEKQ@mail.gmail.com>
In-Reply-To: <CAEemH2ecppttvGW1JeJ_E=w1eUJYEY8+Sx8Euztn2MhRYykEKQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 27 May 2021 11:49:53 +0800
Message-ID: <CAEemH2fGaxQuTvpV1gEp8hVoeHo=42ikSRYs+5RmCuJQfJQa-g@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

> > https://github.com/pevik/ltp/wiki/Test-Writing-Guidelines
> > https://github.com/pevik/ltp/wiki/C-Test-API

Seems we have a similar guideline "c-test-tutorial-simple.txt",
maybe better to combine them together?

> > https://github.com/pevik/ltp/wiki/Shell-Test-API

Forgot to mention, with the increased number of docs, do you think it
necessary to create an index for including all documents in a sort?

-- 
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
