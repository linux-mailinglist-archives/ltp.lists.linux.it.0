Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BCF9719B6
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2024 14:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1725885820; h=message-id :
 date : mime-version : to : references : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-transfer-encoding :
 content-type : sender : from;
 bh=g8WWAe/y66VZmAlqe0UTPdl/kadfE/hOH3nIaBp5E7g=;
 b=jgv2bkwAKTjGGPxEidWnWskTyTvHgftEK8l396uEQJYceO6CVcX3RqZlGVNF7qJTJkZru
 cw8NZSJlIIST1oAOwhhL5HvRnyJ//hUvoJQjPeLW3aMEwLcpKUkesjCB7G4P5kuEHlH4UEv
 itSYUYz9oi184f2iFky4xU9C8fssjqc=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CA723C1876
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Sep 2024 14:43:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8CA293C068A
 for <ltp@lists.linux.it>; Mon,  9 Sep 2024 14:43:28 +0200 (CEST)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 145BD1A000A4
 for <ltp@lists.linux.it>; Mon,  9 Sep 2024 14:43:28 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f74e613a10so26603581fa.1
 for <ltp@lists.linux.it>; Mon, 09 Sep 2024 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1725885807; x=1726490607; darn=lists.linux.it;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rTmvoQZ90q8Ur0d8m87oBk3P5ilXiIK44FPhRjRaD3w=;
 b=DGGRfmBJC/3v5p9IO7XezTlFzg9mHIsvV2yUi2Ky5uNYAXQOmv+Rar2JZraao1MVeh
 rxrrxwr48XQ36AvOY1hIPA89X1bMkistDBJbR37U+7JjRCAS9lrvVKpOZTA/4YTv5xD8
 8Xs9wCEZVeJ+70qClvhcQFx8qRYXmv7Te++uV/KtVosv5a7QazEIrjzN0AZuBTdXlO4Z
 SQxbBVv74y6zUiC5pQ8CHjbv2fheGGqQyw2oLN7CCvqjblh34nh5XvrACKqJU8UT2HRs
 rwJNkbsdLnRVJ60q2QxLcuu4lhjGJBJT571fKk8CM6Ilus8y6r3sZQMTFdIdyPLhZ6yU
 UlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725885807; x=1726490607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rTmvoQZ90q8Ur0d8m87oBk3P5ilXiIK44FPhRjRaD3w=;
 b=MnGgm79rdv9z4NB6qiiCluVV+X2AaHopfuXi9DjPj0ouJHZenBD39kXWt/Z2IIpldv
 WnxScz6wBmALgmNyTPklSTfYiUcXGFxGrznZDtMOKOidsOBzQrhD6wLV45o0HqcFCFh7
 6/eR0lGwVk1JzmqLF7PyOyKrtVpAbcByEk8v/1a5D4H3J5jXvOe23hum/vZAJRqTAcq0
 zCxUqdyXJcaWqmwhzyCNvh2AhpIj5Z8MMAZWEMkrWBsJoI0ixnuLG4zBamUVVo4OrBOH
 jDYui6bqyNjdTv+3YaNzoLD9auZ8XFUXsVZgCAR+97wvyKbMLJxg4z7oJ1PECL3ypvZP
 pA4A==
X-Gm-Message-State: AOJu0YxO2SLjXGoINSJTrlfb+XGF0bo9fZ7Zx1g8u1AD4LhQ7aJTSghK
 cJO3oUdn5c8Hzih71bxJH7SsK+6VL20yBA3NHM/5Ny83/xHiiU0hBEEg7RrBSGrCpSFUcfNT7cZ
 O57s=
X-Google-Smtp-Source: AGHT+IG7CcPfNe751Xc8wMSKYcdqydoeWDNzk8GmRb4n5XJNAPWWNi7pFkTZmyElbhiD5o6vm2M+uQ==
X-Received: by 2002:a05:6512:3d89:b0:536:2356:5dce with SMTP id
 2adb3069b0e04-53658818beemr10436110e87.58.1725885806084; 
 Mon, 09 Sep 2024 05:43:26 -0700 (PDT)
Received: from [172.20.10.3] ([37.162.80.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25979e90sm339007666b.72.2024.09.09.05.43.25
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 05:43:25 -0700 (PDT)
Message-ID: <a9b069f4-56c5-468b-bccb-a734457f2783@suse.com>
Date: Mon, 9 Sep 2024 14:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ltp@lists.linux.it
References: <ZtWLSQSSqmh0tn13@yuki.lan>
Content-Language: en-US
In-Reply-To: <ZtWLSQSSqmh0tn13@yuki.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP release preparations
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

I forgot to mention also the syscalls.h patch that removes cleanup.c 
from the includes. It's a 3 lines patch that can be useful during 
development to avoid LSP errors.

Andrea

On 9/2/24 11:54, Cyril Hrubis wrote:
> Hi!
> It's about the time we start pre-release preparations. So as usual
> please point out patches that should be reviewed before the release. I
> already plan to look at the Hugetlb patches, anything else?
>
> Also it would be nice if anbody else had time to review my shell library
> v3 patchset, I asked Ritchie and he had a look, which is great. However
> I would like to have at least one more person acking it before it gets
> merged.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
