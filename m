Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F942000C9
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 05:32:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 45FBC3C2CA0
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 05:32:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E38DA3C1419
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 05:32:30 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C7582600C96
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 05:31:40 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id i12so3498422pju.3
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 20:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4LWqt+MOQ3xlnf+iHYpvwCN0ms9kCNiphd4NKbbIRXA=;
 b=Urm+eJ2gW5kiDPWv6C7dzarSr0eJiwg9zxt6LUN0gllUL+BAWw4DmwLW/SnMVAjDD1
 nVmy095OkJ1ji+jbC7/Q2SZBqX3WLryOtBb/hbB99Teu9EfMfsIyVoYhDpmYb1FFGP0S
 p8i/QzjJZOMAcGubhW451dokQKlUxVVN8iCjCabtK3Yc58T4M51mUlgw31/xpBWix/GN
 NqmtTz535RCQIyIcCcaZPzvZKbKRa3lKsOESF2/azWCy9BRSrmouCPKFwyf825ztrZ9A
 jed0rw9X9UmLFsKHXcLaSak5jv9lsCvSOLR4mpO2ETVb3K9tvqisk1WCvlg04/+Vv9B0
 hruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4LWqt+MOQ3xlnf+iHYpvwCN0ms9kCNiphd4NKbbIRXA=;
 b=EL7ezNOqF6ZWV3i0PlAIJ1zYwyE0d5+vNngGBBinF/FeCW0Lsk3QV8x3xfITuU2mNA
 igJ5oPDhvJNsLgKzAS8mYjZbl7mPoX0xr+wcQ0V3BQbpMCNvtP/hqBYhJTITz3q6f5yR
 2/hksIe1P4o3iiuvbXAYj4ZLWcAldk4ux59WFblAxjJgS5b/HxwCELFtqpNvnBspkFyI
 zOjrwKZaoFmEw68ls7tmTO1vYyusme3dc9GMO5hKKklCDmbhqgU+mIHSNLSFIWn3P/Tj
 sLtUiG3K6/W2Hc8n0Jo8y/jM4kNMOF4EvJ9iVxy/8t6dLHWdWuTlxUOaj4EA+00uz5ma
 PsiQ==
X-Gm-Message-State: AOAM530hdbzklX4LVls3Wtc86m471hk0//HW0+x1YGYWZMe4qrs6WuYV
 aU16Bx02YjsurDIh1XWZA0u5Xw==
X-Google-Smtp-Source: ABdhPJx0dGYXVEVxeDXVHhJoGBeP6aQBynfFWHGuaTbtEkLcspzsY+7dRGmqRK3jaTDuKbBzvliNaw==
X-Received: by 2002:a17:902:ee15:: with SMTP id
 z21mr6456812plb.233.1592537548359; 
 Thu, 18 Jun 2020 20:32:28 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id f3sm3865689pjw.57.2020.06.18.20.32.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jun 2020 20:32:27 -0700 (PDT)
Date: Fri, 19 Jun 2020 09:02:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200619033225.vhqu7a7ej33wjcbf@vireshk-i7>
References: <8b9a7e8ea27894090f1e31e178d7328f118163d0.1591270889.git.viresh.kumar@linaro.org>
 <CA+G9fYuHsezzit3pzHiz-6ad4AfbgRsdbuqfUKvLif7_Jk5WkA@mail.gmail.com>
 <20200618134205.GB19072@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618134205.GB19072@dell5510>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime03: Fix issues with negative offset
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 18-06-20, 15:42, Petr Vorel wrote:
> Hi Naresh, Viresh,
> 
> > Test ran for 100 iterations on x86 device and confirmed test getting pass.
> FYI with very high number of the tests it still can fail, but it's
> much less likely:
> 
> ./clock_gettime03 -i 100000
> Summary:
> passed   3599972
> failed   28
> skipped  0
> warnings 0

I am wondering why delta will be over 10 ms in any case.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
