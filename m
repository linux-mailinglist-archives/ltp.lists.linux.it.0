Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE11DE0A7
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 09:10:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B71A23C233A
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 09:10:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D26683C233A
 for <ltp@lists.linux.it>; Fri, 22 May 2020 09:10:29 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B060C1A014FE
 for <ltp@lists.linux.it>; Fri, 22 May 2020 09:10:28 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id x2so4811604pfx.7
 for <ltp@lists.linux.it>; Fri, 22 May 2020 00:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hh2HUmpgrE9hahBFhFFKrsQgc8t/6xAsnuPGJpqLBDg=;
 b=YgKLUu6bcJ32dezb2sKmpzrT21baIU3mwEhCCxDI8cvue9yF49nMWgt8HqlsFJcTTY
 mmniZuw6dE0P3omFR/irUeDkVbzS4jZAilt/KPoBPFeRocmwV2qniCdHOyjFLFHF/yrB
 qmf7yBMxp0Cp+QYq2Tljnn7YZ8JCx2fJw5HZ6FvxuHjy/e+wce8UrCLWv+0jIKzZ05jH
 wzsZoe8a4AVOCwmBluC1zrXf4S8ZZlMbIxko3mMdVHunb68TyHP5I2NXeoODq5/6VB88
 xUBBSougL8vM0ni+qgdRCHCnyUT0M5Pann1HjTfLupxYGelNi5wQBZo3hGMhgyc/aAcw
 gmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hh2HUmpgrE9hahBFhFFKrsQgc8t/6xAsnuPGJpqLBDg=;
 b=CJwtARpjNz+eVTwUOi5DyAkO/Z6giVfJxfuLf4z+TqRXJskkvpHUO7w7hKez74HN1k
 JY8XxZDsp3WHmUctD7u/xwzS7YS02QpXkc3nDPL0O3Mqqi+FfaQ/3siiVhMf55H+3Lzc
 7wHhA9SH8kOTW2ZLUpsewtw1Iw2CMfF9i/DZF3shwm73smaGs1Mm6i558R4i6U3w9NeG
 2V+2+PJZRbw+3hrQYmFh9qHETP0OPqyhWrRH8RttvbTR6ZrMP4jCAIvLNTyVK2JtvUAF
 x4Bb8cqSiM9NMJqc9t3tiw+tW+obkA5bo/p+cNwqOJL0tNH4cdnp3E1xxV4UWzyQh/0S
 uAQA==
X-Gm-Message-State: AOAM531aBMEbB0pM2n+D/IiZuIr+d8RuEN5a74Az1K8VfgDw3nLJsa8z
 P4ysVZKbXxgCpkiUkf4FvNf/tA==
X-Google-Smtp-Source: ABdhPJyO4TCCW+sxF3x4N0K02SFxm0sAsEOrhdYwysO02TAwdDfFn0HNFstpwkQb2ZLuONaGjhtU0A==
X-Received: by 2002:a63:451c:: with SMTP id s28mr12780316pga.340.1590131427192; 
 Fri, 22 May 2020 00:10:27 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id v127sm6145046pfb.91.2020.05.22.00.10.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 00:10:26 -0700 (PDT)
Date: Fri, 22 May 2020 12:40:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200522071024.vomeqkqawp5w5nao@vireshk-i7>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
 <CAK8P3a2yN+AwWP-BdiPg+NkyB5z00jXoSt4vQCzPJfzWpZvW6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2yN+AwWP-BdiPg+NkyB5z00jXoSt4vQCzPJfzWpZvW6w@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] include: Add declaration of struct ipc64_perm
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 21-05-20, 15:11, Arnd Bergmann wrote:
> On Thu, May 21, 2020 at 12:47 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > This adds declaration of struct ipc64_perm, which will be used by
> > following patches.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Like the other structures, there are multiple definitions in the kernel:
> 
> $ git grep ^struct.ipc64_perm

I searched with a { at the end :)

> arch/parisc/include/uapi/asm/ipcbuf.h:struct ipc64_perm
> arch/powerpc/include/uapi/asm/ipcbuf.h:struct ipc64_perm
> arch/s390/include/uapi/asm/ipcbuf.h:struct ipc64_perm
> arch/sparc/include/uapi/asm/ipcbuf.h:struct ipc64_perm
> arch/xtensa/include/uapi/asm/ipcbuf.h:struct ipc64_perm
> include/uapi/asm-generic/ipcbuf.h:struct ipc64_perm
> 
> Any reason you can't just #include <asm/ipcbuf.h> to get the
> kernel's definition for the correct architecture?

Because the libc header may not have the definitions, and so we need
to define our own.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
