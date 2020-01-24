Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF0147C4A
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:51:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8E183C2395
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:51:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 01D083C2379
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:51:02 +0100 (CET)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C434014060A8
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:50:55 +0100 (CET)
Received: by mail-pg1-x543.google.com with SMTP id k25so746703pgt.7
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 01:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PjhrPYuipYxgmnh1AOknhmNMw9rUHTq/0DDUJzSDc8Q=;
 b=gke1GBraJatfnUh/lBJVf2gm8An0gtUiov0OGUgAQfQBcWkopq6oB+T66hq0icScXE
 e0s/hQ1MBb8w5YJKsH1oz5CAmewQg2cAEa+lteecm7QkrZCqoAAxhA0IgeDfvnPOU38J
 VmDwlsXAUd8KcnT1lzIEu4kGVeaw760MwFyFPzhwt8ulIwVwOqVT0Oltp432Uz58x/xY
 9Hmc8a09lK3x9agMMeyNm/Ex759v2h6qyKcoXxGSe+/HA4xXvk20kZ/95WsBldAeiz2Z
 /C+ILmq+sPzgCJoeAAgZRhUwwW6iNNEfkyvWJu8dCU8GECybC6yFo8PcFcIQ3dp4tYyj
 Zoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PjhrPYuipYxgmnh1AOknhmNMw9rUHTq/0DDUJzSDc8Q=;
 b=geYObXHOqLWM0Qf+tl7we7eeLmXtiKc77gthmYNtXF+dR8Zxb58BqkhU6pwb7fkM2P
 A8m6VxS+4X5PA3jXaP3b33wXc8m5rhJPUj4JLLenFMoPuxltSRh2pzOaW8MOZIygo9mf
 6Ej4/PlxRB4cHWDpW7VYtsMBjOUm03TdlAynGIrTN46iqVR3M5VY459lCGDNXqXUGOvH
 uB7Nvaviy6IjkTxLD4YMHupWCzxOUgE3wEWyzww0UvHs2ZhtiQhxE0Bq+Qf3UWSjrAtl
 Wb1/0j7hR99DicpcrsArgtfAqH34GLAeh08SnB8FeBwvDnu0yzhSRF+8Ieea2oRZ8ztg
 PypA==
X-Gm-Message-State: APjAAAXzIBNc5oa9cSYDqlGboYr5IP9pBpokRIXuP+hMw+THhNwM+F5f
 spuBqNIFjvb+AgMwv4Wm/HrYSV78RUQ=
X-Google-Smtp-Source: APXvYqxZ/ripk74ZT0u1aQVZMG4kPUxyn7Dxa8ngduLPE3mf1u8HGQM3Mv0vwA6uAEJYX7uApIf6Hg==
X-Received: by 2002:a63:213:: with SMTP id 19mr3207081pgc.160.1579859454273;
 Fri, 24 Jan 2020 01:50:54 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id o98sm5861173pjb.15.2020.01.24.01.50.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 01:50:53 -0800 (PST)
Date: Fri, 24 Jan 2020 15:20:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200124095051.utej37i4qvqhvjvm@vireshk-i7>
References: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
 <20200124074805.b2gk4jcu3jrvrczd@vireshk-i7>
 <20200124094720.GA28992@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124094720.GA28992@rei.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add Syscall numbers for io_pgetevents
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 24-01-20, 10:47, Cyril Hrubis wrote:
> Hi!
> > >  include/lapi/syscalls/aarch64.in   | 1 +
> > >  include/lapi/syscalls/arm.in       | 1 +
> > >  include/lapi/syscalls/hppa.in      | 1 +
> > >  include/lapi/syscalls/i386.in      | 1 +
> > >  include/lapi/syscalls/ia64.in      | 1 +
> > >  include/lapi/syscalls/powerpc.in   | 1 +
> > >  include/lapi/syscalls/powerpc64.in | 1 +
> > >  include/lapi/syscalls/s390.in      | 1 +
> > >  include/lapi/syscalls/s390x.in     | 1 +
> > >  include/lapi/syscalls/sparc.in     | 1 +
> > >  include/lapi/syscalls/sparc64.in   | 1 +
> > >  include/lapi/syscalls/x86_64.in    | 1 +
> > >  12 files changed, 12 insertions(+)
> > 
> > Is it fine to send patches like this separately from the patches which
> > actually add the tests? Will you merge them alone as well?
> > 
> > Asking as I would be required to resend these patches (which just add
> > syscall number) along with the real tests, while they may never get
> > modified. I can then send such patches for future syscalls I am
> > working on.
> 
> We may as well add all the missing syscalls in a single patch and I will
> commit that right away if you are okay with that.

Sure. I will still send my patches as is for now (as they are on the
way), and you can just drop the first one which adds the syscall.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
