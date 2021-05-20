Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F235338A658
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 12:24:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3EA53C8733
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 12:24:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4A663C21B2
 for <ltp@lists.linux.it>; Thu, 20 May 2021 12:24:52 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 480F110011DE
 for <ltp@lists.linux.it>; Thu, 20 May 2021 12:24:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621506290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UdpyHVo5NNMco3wNLmxLMDsrqPQUUblbrY43xzagsgQ=;
 b=Y6Wu9pk5yffJKwh2R4bZsRdONjn/ZOhDg44tHuLfLe/OcBsqdjBu3dMiLsOYXMPqfinWhb
 6MbUyBBwljpT+gZxsJF6S6Vaxk1cliWYlu0sPirUOeo+Spc2jEOReq3ktcWsB3VmWwlYO+
 pQU5GjO8M9/nIuhRTCSHEVyjFZ5aeU4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-QHqqk64GPiSB8IJbSMZ1rw-1; Thu, 20 May 2021 06:24:49 -0400
X-MC-Unique: QHqqk64GPiSB8IJbSMZ1rw-1
Received: by mail-ot1-f69.google.com with SMTP id
 88-20020a9d06e10000b029030513a66c79so10662630otx.0
 for <ltp@lists.linux.it>; Thu, 20 May 2021 03:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UdpyHVo5NNMco3wNLmxLMDsrqPQUUblbrY43xzagsgQ=;
 b=VdDDR/RSRk2VfxM+7JdYzKpiaxIedUJhLV9quBnFv6kLt5Yo6gwR1D8fSunnFckGfW
 rYH4eRIITgkJ7Lli/MWley9ruyhtwUXZYonXaMEm08HKfKxAthG0JaqyU+wAZBk9tiAa
 0f0UkfINeMXD46zZtQmkOzeQ0P+EuxMgBCyia4bVsOiMisfIJh4AQgyp3E4yqBTH0O2o
 FFoi/tZE5hM8OMJ0XWPoLic/ccI2uFRcEQYlRk+7OvmRtAoF8E6T33jRdtl/tWs7Lq16
 Tnulm+EdnRYO448q85VhE6N+xfwznccQyYksqH45+Kq5N3CB6McUPK+YNoH6aEzK7Bsa
 q7GQ==
X-Gm-Message-State: AOAM530vauzF29/H2TfLXr6UzogY0lG95ertXqjQQgq5nKnmxwJnDQVn
 5IqjPheE1ijf+QDcus7SQ2CccR6Lhfp/lBYUCznDqMXVnL7AzPUjWV4bm7ETuJ1EN1y4jvNChA/
 H/Qko7CCMrzcHgtugyNir+mrkarU=
X-Received: by 2002:a05:6808:8a:: with SMTP id
 s10mr2838126oic.66.1621506288193; 
 Thu, 20 May 2021 03:24:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9OZnTHjpeu3J90N8K2n+U+9fe/9uYT6l6vJWno+piUIU8b/kP0SZTEboMO3stE9hDB5fq4//d12BbOrBe4/o=
X-Received: by 2002:a05:6808:8a:: with SMTP id
 s10mr2838112oic.66.1621506287963; 
 Thu, 20 May 2021 03:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210519131916.314184-1-cascardo@canonical.com>
In-Reply-To: <20210519131916.314184-1-cascardo@canonical.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 20 May 2021 12:24:32 +0200
Message-ID: <CAASaF6y2XaLjHwfErwez4zo2NYFLoScROGocK0ibH1pVZcia1w@mail.gmail.com>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mtest06/mmap1: Further limit distant mmap size
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, May 19, 2021 at 3:22 PM Thadeu Lima de Souza Cascardo
<cascardo@canonical.com> wrote:
>
> Though on recent kernels (starting with 5.2, commit
> 8c7829b04c523cdc732cb77f59f03320e09f3386 ("mm: fix false-positive
> OVERCOMMIT_GUESS failures"), overcommit accounting allows for allocating up
> to MemTotal memory, older kernels have a much more complicated overcommit
> guess accounting.
>
> That leads to mmap failing on small enough systems:
>
> mmap1.c:205: TBROK: mmap((nil),2088370176,3,34,-1,0) failed: ENOMEM (12)
>
> Allocating only half of the total memory would generally work on test
> systems.
>
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

Thanks for patch.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
