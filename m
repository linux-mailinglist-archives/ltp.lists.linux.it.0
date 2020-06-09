Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD51F63D6
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51EF63C2DFB
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 10:42:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 61D383C185D
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 23:39:38 +0200 (CEST)
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 78DE020017C
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 23:39:37 +0200 (CEST)
Received: by mail-oo1-xc42.google.com with SMTP id z145so54325ooa.13
 for <ltp@lists.linux.it>; Tue, 09 Jun 2020 14:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Yu8pw9jK9VOjbL2dYzGQjWLCjyEftt8W9Aw6UsWTdE=;
 b=JGH/6ACA3rTqQskKIf73T4w76M5+R47CRjeEcTPHDVjSPuGJzBpTsXJvOAThBCkCGY
 euTtOEWSTn9eACrQ4nc8iFpN1aZVN2cBdB2DjS8b1fhcQSSERP1QN+f4Qo85BVfFfXsA
 z+f3UtJnoXoXmuAdm3LFnKQJn4vr0mMm+r71g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Yu8pw9jK9VOjbL2dYzGQjWLCjyEftt8W9Aw6UsWTdE=;
 b=iGj44iwBymkrnCuL099Z1H99KnteWOMvKiVH2uhSMDjeB0XIuBO0IOVJJrSg3dZo9j
 6ALnHYLPoGNllSxmKTPdBFaDsh1zcP5r+DYbp7xxaGQ8SUyCj//0ZS+wYJfZLeU7sM7v
 oo7wzVLP4V6A34/0vxjUqiavbN1bebFi5uE9CYnmfIzjapubaFT2cIvEWqYz+tdpuXit
 y+jy2PygLHAX25r2Ay3E2Z4xZ6EqHviE2ts9pad47KGqJYYDeaoqKCd8kdM9GHMBS7O4
 R0jlCvPx0aNnSDHNWxHfHTYrbVVYbXE9p8a7igJA/7dpHW2lBvBjAKqyxq1jvFammW96
 Ozyw==
X-Gm-Message-State: AOAM530IgS9pC5MbPfa2XR+O7rJmD+z+25eQvtINkjVPRcKdzBxISEvE
 WuGYtvkvHB0N/61b0qIAMBAAvg==
X-Google-Smtp-Source: ABdhPJxuSg+5XlOOHG0ByMSNtjGECyHpXX4OKrkBd6zRcgpbh83FX0rPhOw9WTf7xGnJPgclKYABEA==
X-Received: by 2002:a4a:96f1:: with SMTP id t46mr22943247ooi.75.1591738776155; 
 Tue, 09 Jun 2020 14:39:36 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id c23sm2450291otd.7.2020.06.09.14.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 14:39:35 -0700 (PDT)
To: Petr Vorel <pvorel@suse.cz>
References: <20200609113421.10936-1-rpalethorpe@suse.com>
 <20200609165921.GA28805@dell5510>
 <fa3b9d86-84f7-be61-f06f-c32f3ab60d3a@linuxfoundation.org>
 <CACT4Y+bYdmD7vdNUayT86oiW8yVLUBdFLOZRJ1nTi9AE99KzSg@mail.gmail.com>
 <ce8bd6c0-0abb-e09e-b21f-5e769ffd3ab3@linuxfoundation.org>
 <20200609195851.GA29515@x230>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <8b3cbf25-83ad-42da-f3ec-e2bafdfff97c@linuxfoundation.org>
Date: Tue, 9 Jun 2020 15:39:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609195851.GA29515@x230>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 11 Jun 2020 10:42:03 +0200
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>, skhan@linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 6/9/20 1:58 PM, Petr Vorel wrote:
> Hi Shuah,
> 
> ...
>>> I don't have any particular comments.
>>> I assume Richard tested it and it works. if so, it's fine with me :)
>>> I don't have any concrete plans to use this at the moment. We have a
>>> corpus of reproducers in syzkaller format and we can run these. This
>>> should be more useful for kernel continuous integration systems and
>>> distro testing.
> 
>> Right. That is what I was thinking that this is more relevant for kernel
>> developers, CI and distros.
> 
>> Richard, Please send the patch for linux-arts to me once Petr gives it a
>> try and I will apply it.
> NOTE: this patch is for LTP. But maybe I miss something (some other patch for
> linux-arts I overlooked).
> 

Possibly I misread the

V3:
+ Updated linux-arts commit (thanks Dmitry and Shuah for updating those!)
+ Fixed AC macro

If this patch doesn't intend to update syzkaller-repo, there is
nothing to do for linux-arts. I thought that this patch is for
Dmitry's syzkaller repo I update from and looking get this into
linux-arts directly.

Since this is LTP patch, ignore my comments. Sorry for the noise.

thanks,
-- Shuah

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
