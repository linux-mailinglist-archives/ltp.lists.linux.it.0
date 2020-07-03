Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10135213643
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:19:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 868FA3C5608
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 10:19:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 21B943C0271
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 10:18:58 +0200 (CEST)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 234C5601792
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 10:17:56 +0200 (CEST)
Received: by mail-pf1-x442.google.com with SMTP id a14so9116734pfi.2
 for <ltp@lists.linux.it>; Fri, 03 Jul 2020 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DQIZLe6csvY5nlO3sHHt6IhlNEP5LnLoTT8f+ps3KfM=;
 b=hdZtJtIdtkPUJfFc9XeJ+o/KahiU8I3ezqawwsGPpHSDMiG9d8Ak2W51PpBXqFLVYb
 fQBCMJilzMZ4ip2Smf3y5TWShPiBcvhVKD/VSfbQkVeQIh5p5GjZznqmFLPsdQmEFoG/
 eXUd01l/sp3e7mE1LzI+pD/9mS/5m4v2FHSXJRCc8pkzCcV9WeAtqNCXktVnC7v3xYdT
 xx7e8DQM5RK+id4XQejcFiiCuIOeyrKVjdpPKozwnOF5owISIz5iv/Gd9tzn9CcgvJ6c
 2awkgQxchPRhORD0r1p2b/2TtEPNaPIRGJYyS65TL8lTrLAReDQJYt47czMU4Lqed/DY
 /sdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DQIZLe6csvY5nlO3sHHt6IhlNEP5LnLoTT8f+ps3KfM=;
 b=bbV8xGamrDXFJ9w2kwMjqJVxK0uXrASdp73L80rVxko9SyLqeO9B+d1HMi5aUypyMC
 pDATVoZlAU5fYMUzHtRrDcYiedkBrNT/cojjCNHqBLMIAQkfYUhXwHqnDmEcEY/iFflJ
 rOa88BlkToLqojIw9DTBbJGzHiOKL1JmXy7/TmYBUqy3+a5DksFni/TRsfQn/uNaS4Cw
 OAksoJbSfCvT4qm2Kl7YTAi2K00sLAhE+E4PlOo2rNIahXKLCwonh2ur+J8o2ub7YJc5
 LyHajL5sG4n+p1SFpV+iIZIGVnRQsRfeYhmWIIM/Zkr0vD7k1e76JSSCIYlpK1q8hFBW
 36Sw==
X-Gm-Message-State: AOAM5332TqiIWJm1iTB8+LYFl3UTJ/i+AZfb49VXLvzw8iCWiQqMXMSc
 yRKIOWPuWfSpDDP+8JBT1avbAA==
X-Google-Smtp-Source: ABdhPJwxVr1+7cZKb1jMGlMzLNoGIu1Lf7NlHNebsVm2kte7ljCmmSN85Ya60SOw2VxZyOztUnkeaQ==
X-Received: by 2002:a63:5808:: with SMTP id m8mr28173427pgb.110.1593764335777; 
 Fri, 03 Jul 2020 01:18:55 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id d4sm10667715pgf.9.2020.07.03.01.18.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 01:18:54 -0700 (PDT)
Date: Fri, 3 Jul 2020 13:48:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200703081852.7mxbhkfz6vgjfwak@vireshk-i7>
References: <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <0744cfd7d2f14d8e8c6d8e74420b35ef273a7737.1593761725.git.viresh.kumar@linaro.org>
 <902db9f8-22d9-b641-746b-6ec61b8eaa21@cn.fujitsu.com>
 <20200703075136.enu2ovlfo25cwyca@vireshk-i7>
 <2ced43d0-4bf0-982a-fd7e-3628716890c4@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ced43d0-4bf0-982a-fd7e-3628716890c4@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/sched_rr_get_interval: Validate the
 timeslice
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

On 03-07-20, 16:00, Yang Xu wrote:
> We only need to check /proc/sys/kernel/sched_rr_timeslice_ms whether existed in setup phase and
> then check proc value in run like prctl08.c[1].
> 
> [1]https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/prctl/prctl08.c

This is certainly better, thanks.

> > What's the regression test you are suggesting here ?
> 
> The following kernel patch.
> 
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5

Yeah I got that you were talking about this, but I am not sure of what
regression test you are asking for and if we should be adding a test
towards it at all as this is a kernel bug and we should keep showing
the error for such kernels, isn't it ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
