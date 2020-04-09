Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2183F1A2EBA
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 07:14:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48EEB3C2CD2
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 07:14:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E94FA3C0639
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 07:14:01 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D016B10005E9
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 07:14:00 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id 22so3582136pfa.9
 for <ltp@lists.linux.it>; Wed, 08 Apr 2020 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o/V/UCrd9qSK2cI9uvBhf1H2XzIv/Ag1HwD0StUw6Pw=;
 b=dPMG5GCxGbyoYm4rOxw2aZBnPAcbDwQ7yvKfzcDylzTfgXGAGfTX/NLwMJ65tt4LQd
 /0nA8/vP41Ua9Qjj6BW1yQPaF7f4Pnwyu4M1WIWq96K94jptWD5oCS051MB+2dkLZK5g
 UFWOV38E+J+naqmJefABeH/iAogA1A140o+9HWChwl5ckN833aXZRHlTSmCxaGTahYwL
 AKaEmtl23JualYedjmXqX5SDUJ1mgiB5F9y14n6atdNQHLGmvngCgBCRjKo6jBGohg2w
 FzklGuh0dEC/yP7XARs1Aq6lLaMEw/LrdODmvpBUeKVaCGMPKRpFO4jv9/oDh9oLAhBY
 iO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o/V/UCrd9qSK2cI9uvBhf1H2XzIv/Ag1HwD0StUw6Pw=;
 b=U5sXeZzcKCfrj/nnv3zOB436Okd/Hfljtl87qAf9R1+kkvMM6CKv9UaIhObwH6igrj
 GeGcq9dmAFfQ0WB+OthsUtwJrVW6i0RYzg4g+aXpz8BrNtx2ALheHXJ+6JEeyQh8EKBJ
 Gi8qKg/kBpFLPeCIFfpwOWdKOPwF0absa4D4DQLbvDAO7nDBV1NErdQLm+ZxzPZ620aI
 Gc5Aec32wuadqWLksjWYN4fqnXF/em/82+owBXpqG2qZhY3BlmZgELvttJZjSaUcA+Hm
 XuuxDMRscWhj+KZWA6jTDduMXrK6wVN8VPJ3B7RiMrX8YzZmsluY8xbMt5c4FIRBuZNY
 Holg==
X-Gm-Message-State: AGi0PuYjPmdAFD0iJpGfSvvxckfk0Fz5vP7ua3Rl+8GQ/TcjjqaFl8Ru
 kbQ1KkNkj8Iezj3NGWt3HVFxkA==
X-Google-Smtp-Source: APiQypIgngx7ggeu7FVcH1CB2OziHwSpAj18EmKs85WCmoR+ZSaDDM3GD/4cbwrDrX9Y9ITAMR668A==
X-Received: by 2002:a63:ff4e:: with SMTP id s14mr10359740pgk.269.1586409238923; 
 Wed, 08 Apr 2020 22:13:58 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id y3sm17973899pfy.158.2020.04.08.22.13.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 22:13:58 -0700 (PDT)
Date: Thu, 9 Apr 2020 10:43:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200409051356.5p6xwi4ttsz2zzzg@vireshk-i7>
References: <20200408114007.4096-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408114007.4096-1-chrubis@suse.cz>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clone301: Fix the test race this time
 for real
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 08-04-20, 13:40, Cyril Hrubis wrote:
> I have messed up the first fix, sorry, the signal handler has to be
> estabilished before the clone3() call, not just before the if ().
> 
> This also makes the test more verbose in case of failure, we print what
> exactly went wrong which saves time on debugging.
> 
> Fixes: f17b3862dceb (syscalls/clone301: Fix race between parent and child)
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Richard Palethorpe <rpalethorpe@suse.com>
> CC: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  testcases/kernel/syscalls/clone3/clone301.c | 65 +++++++++++++++------
>  1 file changed, 48 insertions(+), 17 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
