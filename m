Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9BB2208DB
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 11:33:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50F433C2BC7
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Jul 2020 11:33:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E43883C1C67
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 11:33:17 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0999A1A00F66
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 11:33:17 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id n5so2801162pgf.7
 for <ltp@lists.linux.it>; Wed, 15 Jul 2020 02:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MaJp8nH1kXRZh56rMan8A2V6Fidn03hMEPRCAotcMeY=;
 b=qQor1WX8LlfsmPpmgOPnUvdxvOvU8mLuPg5RkMcXmkBVOXGq1yGQyonPQiBmrVkJ/V
 8nrm/G7pJhUQI9XeK8AifLtzgznjwkxrTOSp16988+emoUVUJApPeqFyHjDhez7ZGSsk
 AOpklaPi62wwQ21OsKZC8QHiri/gjZKZOAovc54mA0db3cIUVkyQ3OIVnFXUD+s4KE2O
 4rbTjFtGGYLIcOTKsba4dg+94Xfh38VYgq9DbypN40ODFI0q8bK+AcpaDNgDp4Bx+MbY
 abNjIMg2Tt3tXLTFAhSYRhknagaPW3m97dkQjoG7d+964I57ksg/LUYC8vMyfR+1YxxS
 +iyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MaJp8nH1kXRZh56rMan8A2V6Fidn03hMEPRCAotcMeY=;
 b=drGOAKsuvAW6Bkz+SgUoqqmn+89EpY2nhEwGuoau7jYuFyGM/Evuow/jNXcwuSZ8qT
 8U6f2+wH5TaPnki6MNqDDQU10mgVwrWZK46nu5R2NrkntPnWuF/PrJfXmIerWT2E1K7m
 5e4Dw+1Wrq+aN1Kso6AVFKCCH1gmiElwGelUFG/9wlZg+wxgygMwkJZEti4ZSQ/ekBfv
 WAEUk54pVrD0OyCpgrHsEJc/nTGlc7cobP1ryWQwOjZ7yyFgAdKyK9UW55V89yLDzznD
 2XOZjHcG4r+dOO53JXPT632Wce3N4kkPpLW6JjC3dUTNrlOE+fIhVDwTvw7y33Goc2p9
 qSow==
X-Gm-Message-State: AOAM531E0YvgXiZkA6NgiHC2Nx76jPH/uJ+aMZ0tnW58DE5Rf3Ex5W/P
 6asskKvgObSn3jMR8ywN/gD9Jg==
X-Google-Smtp-Source: ABdhPJw2E7DJ+rTvJPtLAs0/2rBK5WAWxB6/7T/yuXT1mQ1VPOeJadYDjUw2k3sWqtqfd5tAf1lvWw==
X-Received: by 2002:a63:4f1f:: with SMTP id d31mr7255491pgb.241.1594805595365; 
 Wed, 15 Jul 2020 02:33:15 -0700 (PDT)
Received: from localhost ([122.172.34.142])
 by smtp.gmail.com with ESMTPSA id d9sm1724853pgv.45.2020.07.15.02.33.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Jul 2020 02:33:14 -0700 (PDT)
Date: Wed, 15 Jul 2020 15:03:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200715093312.5dbxlmkmolrha5vd@vireshk-i7>
References: <bd80f928abee6dac85d051c022afe559f5da8d0a.1594758146.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd80f928abee6dac85d051c022afe559f5da8d0a.1594758146.git.jstancek@redhat.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_timer: pass kernel_timer_t type to syscalls
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

On 14-07-20, 22:24, Jan Stancek wrote:
> timer_[gs]etttime tests are failing on s390, which is big endian
> system, because tests are passing timer_t type, which is glibc
> type (void *). Kernel expects and sets only int portion, so the
> tests fail for all but first (0) timer id.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  include/tst_timer.h                                       | 8 ++++----
>  testcases/kernel/syscalls/timer_gettime/timer_gettime01.c | 6 +++---
>  testcases/kernel/syscalls/timer_settime/timer_settime01.c | 6 +++---
>  testcases/kernel/syscalls/timer_settime/timer_settime02.c | 8 ++++----
>  4 files changed, 14 insertions(+), 14 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
