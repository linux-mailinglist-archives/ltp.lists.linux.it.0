Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9431704E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 20:37:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 149003C6EDF
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Feb 2021 20:37:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AF6003C6268
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 20:37:38 +0100 (CET)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B9552600D06
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 20:37:37 +0100 (CET)
Received: by mail-pg1-x52c.google.com with SMTP id r38so1886022pgk.13
 for <ltp@lists.linux.it>; Wed, 10 Feb 2021 11:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GMMMjxVi90GIiNAiLm9pBdNdSuf9cn6U1jj4BLV0EeE=;
 b=UP0jgbJDO/1o/KcIRTq5rlG1dJGuf7I1JAZDSoiiyO+Eot/eZEDuFzCYM9XdwwYpFb
 4NozM5cfgIV9NgltWha9fIcBsEY5rmTJ1d/0m7d7KQY2MJ5LKkXUYCYTNVn44zzVC8a0
 Pb1ZwRZPYdpLeApbDjqlJQhoMtRfUU0A+ZBPocuRF0tjunq86dLD9o5ktTr6ns+JP7r/
 kuNQBezb+AEjbhfpTaTxjhPLmJ6DV0SwMswBKacXDxNVhMFzk7mYRdMcogkPSZwFVE5X
 fXO39axJBK+gozv8igm6IaKmi/nWb1p8NpvifzFQ6GTZbELY/KJGwPF0QV2XMcKHnjOo
 Op+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GMMMjxVi90GIiNAiLm9pBdNdSuf9cn6U1jj4BLV0EeE=;
 b=FNJGwZPVm6NvXl229zGtVKp2PDLl+NjexbPJ2e9KOt7jz7w7VnfQxyadzasRQ2hfFE
 poZV+7vICQcp98RCo44d0LnnxOt+ZTvQIpdVdUHrQp48XUHyXhEiW5J6AOeLss6HRuqr
 5PUo2dY0NXQVydS4SfmjQ5rWdLYkp30eZptNynvc44nrrgs+Ll/jNbsoMBQsrdb9Vkka
 fTOl1h3zlnsZKx8eBaMWQIpJr2yrWc0ZyZNxQbPS8TkX57N74HFR4AGq1qbLyyXgw7zS
 ybs4pltt54QX2vfX/LHhoD12HgIKHCrqv2vzrzfXVBiWulw65EYGm9CYloPDFesF8Svq
 mWAQ==
X-Gm-Message-State: AOAM531w+4KyEI1VdwC+4cms64qDQIDnFLfD77uOyHJKXddNJeXCrkwX
 0T+teKSKsL+t3HdpXhJ9yaDCk0hee6xGOA==
X-Google-Smtp-Source: ABdhPJwMVsxIX9190gpXf4eXv3SXOW+/fYYIQ3jfB8fyvFEBqykRU1lESVTAFXzX3lqqJy7321gdUA==
X-Received: by 2002:a63:1a44:: with SMTP id a4mr4487450pgm.41.1612985855897;
 Wed, 10 Feb 2021 11:37:35 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id y24sm3096831pfr.152.2021.02.10.11.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 11:37:35 -0800 (PST)
To: Pavel Begunkov <asml.silence@gmail.com>, Petr Vorel <pvorel@suse.cz>,
 io-uring@vger.kernel.org
References: <YCQvL8/DMNVLLuuf@pevik>
 <b74d54ed-85ba-df4c-c114-fe11d50a3bce@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <270c474f-476a-65d2-1f5b-57d3330efb04@kernel.dk>
Date: Wed, 10 Feb 2021 12:37:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b74d54ed-85ba-df4c-c114-fe11d50a3bce@gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] CVE-2020-29373 reproducer fails on v5.11
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
Cc: ltp@lists.linux.it, Nicolai Stange <nstange@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2/10/21 12:32 PM, Pavel Begunkov wrote:
> On 10/02/2021 19:08, Petr Vorel wrote:
>> Hi all,
>>
>> I found that the reproducer for CVE-2020-29373 from Nicolai Stange (source attached),
>> which was backported to LTP as io_uring02 by Martin Doucha [1] is failing since
>> 10cad2c40dcb ("io_uring: don't take fs for recvmsg/sendmsg") from v5.11-rc1.
> 
> Thanks for letting us know, we need to revert it

I'll queue up a revert. Would also be nice to turn that into
a liburing regression test.

-- 
Jens Axboe


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
