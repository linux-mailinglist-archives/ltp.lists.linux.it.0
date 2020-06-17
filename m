Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF21FC55F
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 06:50:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38CD23C2CE4
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 06:50:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 3936F3C02EF
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 06:49:56 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 19732200C15
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 06:49:56 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id 64so508429pfv.11
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 21:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yXnczXt618XG5kvdyOQ0+5WBAvo2erjlXyal8IhJH+o=;
 b=gH2Z6D+JPtgfcodEb8qFmXTiEvXgTp5GjewDo8XnjiIsF4pyvx5IYWvXZ51zIT1Ybh
 hfxIOtdh3GAG+8Uifs3jfTxJTXv3hSoe/Y/7dxEbuWi19G75dk5/SHujwZ5DSx917HPL
 8Y0XoszVZZN6kjm6ZT3y9YGeHNWYl9eR3LC4BpNliSZBGwYSz65SI2GKKUuowEp4c69r
 E3KnhB7Xh4+wzxe9db+5PspOVL0pBOYHkBtUjaPvSQkX7VFyuY7q8JxdXSEWH6auY46a
 a69CA+60Qyileh5vQlsKaErGR3iTDFV8W7PxGdjMKvR4VPxbuu8Oel+TrrdrWFc5HqKP
 hE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yXnczXt618XG5kvdyOQ0+5WBAvo2erjlXyal8IhJH+o=;
 b=ATuVSosI9IOwnUb0eJrXhcmO7Qn+HO7tZjKFvw6iYLu0ec9vzGNpp24WVuNYAYty4E
 8M6ND1l5OwC+JsQcvq0mRDccoFbqfrjKUK/0pvAUMUVKaNtZdcnzD43Uzy9KPUKBwKAI
 LBY9uxlebgFBGpLqpvmahvVk4/IaRi+0MZNZglM7uEABeC9UCWZs4RqRtjf+Vn3aq4nr
 t0cQMe4v36jJjNJWJur+hJC5jgyGH9kg9tQRcmtEigR5dzIiSixcovDfso721J1fXQhb
 6JTw3QlKysZUCBccVIrmM31vR2df1G6ldZI3zj+N0ybhcg1zNS4FHAKOx7PlAh4F17Xz
 exWw==
X-Gm-Message-State: AOAM533qdma4J2k42KpcSg/uaM4g8AEEpdBqegBxqqfXNR2InssTfh7k
 XlTzo6DBIdEzk9LsV36IiF03fQ==
X-Google-Smtp-Source: ABdhPJz1aOZmtLN4RCetsXn5QOFwp9LjhlolL4x9IKUpH+8kdhiSxCkZ6Zln35gFjmfMihV7zbilSA==
X-Received: by 2002:a63:ee0c:: with SMTP id e12mr4489987pgi.83.1592369394505; 
 Tue, 16 Jun 2020 21:49:54 -0700 (PDT)
Received: from localhost ([122.172.119.132])
 by smtp.gmail.com with ESMTPSA id z24sm18851314pfk.29.2020.06.16.21.49.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 21:49:53 -0700 (PDT)
Date: Wed, 17 Jun 2020 10:19:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200617044952.afa4mawg236ut5u2@vireshk-i7>
References: <cover.1592302358.git.viresh.kumar@linaro.org>
 <20200616131014.GB2790@yuki.lan> <20200616142958.GA25688@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616142958.GA25688@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 0/6] syscalls: Add tests to verify the
 _time_high fields
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16-06-20, 16:29, Cyril Hrubis wrote:
> Hi!
> Looking at the travis it looks like we do have a problem with missing
> __kernel_ulong_t on older kernel headers:
> 
> https://api.travis-ci.org/v3/job/698929344/log.txt
> 
> Also looking into kernel headers it looks like it's defined to unsigned
> long unless on x32 which has unsigned long long. It seems that the types
> __kernel_long_t and __kernel_ulong_t firstly appeared in 3.4 along with
> the x32 so I guess that we will need a fallback definition in UAPI as
> well. And given that __kernel_long_t is defined we may need something
> as lapi/posix_types.h with:
> 
> #include "linux/posix_types.h"
> 
> #ifndef __kernel_long_t
> # if (defined(__x86_64__) && defined(__ILP32__))
> typedef long          __kernel_long_t
> typedef unsigned long __kernel_ulong_t
> # else
> typedef long long          __kernel_long_t
> typedef unsigned long long __kernel_ulong_t
> # endif
> #endif
> 
> 
> Is that all or do I miss some 32bit ABI with 64bit syscalls?

That should do I believe. Part of this is already present in
tst_timer.h btw.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
