Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEAB1B6ED2
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 09:20:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8197A3C2922
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 09:20:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C17D43C2A4B
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 09:19:50 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 23E752013CA
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 09:19:50 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id d17so4246995pgo.0
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 00:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3EXIg/KLOeL8TqdOE+1pQkCsQ0A8OPZanAeBCNRbRbE=;
 b=nBB5jL/VSqxeajBQ5da7xXJagRvG6IVjZCPDj/RorNBK/to1YybqZKM8wIqPDA7wu6
 41izK5+hrfb+9fM4ZSuHb//nvhC5KqacspLSDc3mPTlBQGAXsUEK/y7R9p48g5l1My1+
 jKjXNYSLU0Y6grNTf6+vQpxRDSr4U9AVIrMl+SjQOgYVHaKqrekxWU83ag0PZtrUejcP
 XuFGl/BOL/meUF9e0boHjBKP7G5Y5OJElb48ghpiATJuz8rL7mCPGmCgfj86hT8XQBtl
 K3PCbv8LkIy9Ng4VcxRYLgGOXT2iRiH4Id+82mIP5S6IGaC0T7YVrjaPQLAfPuDMYhlM
 M/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3EXIg/KLOeL8TqdOE+1pQkCsQ0A8OPZanAeBCNRbRbE=;
 b=W+eWmDV3qckM/uA3Tqu9wn2pUkHb/7FPNIp30ORz9ahQG0wimZvEnlhUdrCdXJbDZ7
 c0z78Zi+ZA0HFM79R9xzgdXcIlWcrkNSLM8OGKKGjCIzFZTLB9EHsCPFdYCLrN8UEy8c
 ZNXI29v/eKXhZIFzDsr1OJIR9VQnDG+5vhYP0G+rKgAagZSTlIjIhPBMf69mTIqyJWBV
 mS5hPUWyAQB4s0sgv6jqQtBIrv/7kx5tB6wI3biZt6bHmgDvxMiHQgtUN+scF0J4/ojm
 ij6Ix3qKG/REvvGRqwDXIhbv81T68BW3rFgROynEZEqWnZR4DYRXzkEgL+0C+0kRkemn
 dT7g==
X-Gm-Message-State: AGi0PuZl5uBnkqEItwAYaaPtqBqK0iKEaNIz0RXtCoyL2xyOYAc/KkjF
 Gm7ntCnzyTgWWSjHoHjBzA7gsw==
X-Google-Smtp-Source: APiQypKn74HO+frnPN7TCY+56MPQ4bYXM2caj7LLkq4tJBT00y8oxCNFbUN9hXT43iTKVwN3+c/vgw==
X-Received: by 2002:a63:1d4c:: with SMTP id d12mr7945755pgm.247.1587712788611; 
 Fri, 24 Apr 2020 00:19:48 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id d124sm18346pfa.98.2020.04.24.00.19.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 00:19:47 -0700 (PDT)
Date: Fri, 24 Apr 2020 12:49:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200424071945.yqsxq6m5oelsoh5l@vireshk-i7>
References: <cover.1587533697.git.viresh.kumar@linaro.org>
 <2e57919c45e9e9b23bd0e819ffc470a9326ecfb1.1587533697.git.viresh.kumar@linaro.org>
 <20200423135048.GB3632@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423135048.GB3632@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4 1/5] syscalls/clock_gettime: Add support for
 time64 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 23-04-20, 15:50, Cyril Hrubis wrote:
> Hi!
> Pushed with a few changes, thanks.
> 
> * Changed the nonzero check to check if nanoseconds are valid,
>   which covers the 64bit check as well.
> 
> * Pushed the bad address handling down to the test, which means that
>   we have to convert the struct tst_ts for each syscall, but I think
>   that it's cleaner that way and we also map only single bad address per
>   test.

Thanks. I have resent the pending patches from this series with
modification based on your changes to this patch, so you won't be
required waste that much time on this :)

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
