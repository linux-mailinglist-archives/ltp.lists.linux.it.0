Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 542672134E7
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:26:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C93233C5606
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 09:26:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 86C5A3C1419
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:26:14 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C6375601A91
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 09:26:13 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id f2so12325721plr.8
 for <ltp@lists.linux.it>; Fri, 03 Jul 2020 00:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N5iVtQRzkGQs1yVAWT8exwtWvPmEM20FDNQYKxOdCqo=;
 b=hq7HjMVMrTi+PNpeDTt/WvFhQeQ+OzriiWwKa7mcDYsSeNJmdpJCgFL6ZW6Eh/W6KV
 Onk5ifFBbmlHLHLmqu9z+rUW91ovkqV4A94/aUCQ9siSDTVKrop9HE0cIaBDItP+2OCN
 ydbyA0VD90f1pSDCeUaEghcp1/TcjEHcuAoboUfHuSFmPyjjsAe32lwv1vraKM5cSx6u
 GM7GUbdHDfWwJJ4/hRBTcZCvFV3L4GZsUaQGaoOztzOGff9KrPlCe30k9zzR7UZKuU3f
 DJYyrUGByGZFfusCETtwRqGB/rtQVOryAkibHbTS3V4tAxWhFEN/gACzeQKwv0MQ+bvg
 ZPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N5iVtQRzkGQs1yVAWT8exwtWvPmEM20FDNQYKxOdCqo=;
 b=mFCkuOabU6AiqakamsJIufrkeDte0WNeLD0DEG9PEyjIV5i7Omn8ZGYq8Oq+8zqiRi
 392ODM5jeI+iZDxsQgGEOVzLG0GdcM12QTktna34lErF2rzMlOpQcgKUkNWib0oY5PGj
 pZ8BvONJ05FwsgGWwhQBjLrEqDcjBxtqzpl3jxLDOu4o1/+KIy9yqdzdMUl+vpwgly50
 0ocMeegi4qTfsS1N+QVJgmsIS0CC32ipfHNDcXmI5LCOWgMbObkH9/OFc3Dwc5hKO/ai
 vV4YPOAlAb3vBmjzs6n4mv216W71mKVwCHmTZdHxF0jNzz9EIMrCQ14BsRFxF3Jk9Ub6
 RzcQ==
X-Gm-Message-State: AOAM533+hnV+8ZsM82CDMUPBScIjYLgVE2XZ05JI9rlfTXAtBWq///vN
 0E5K+SChJc6sPe536zGvo3xnMnYYMEs=
X-Google-Smtp-Source: ABdhPJyNoNcM7XHvd+fDpEBmQo+nE9+4M2hoAzqdsU7awKtIcenM/cLCBNBvkAstbFan69JT8Sx2PQ==
X-Received: by 2002:a17:90a:6343:: with SMTP id
 v3mr36984996pjs.196.1593761172321; 
 Fri, 03 Jul 2020 00:26:12 -0700 (PDT)
Received: from localhost ([122.172.40.201])
 by smtp.gmail.com with ESMTPSA id j16sm10647247pgb.33.2020.07.03.00.26.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 00:26:11 -0700 (PDT)
Date: Fri, 3 Jul 2020 12:56:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200703072609.st5psivk656ioetv@vireshk-i7>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <325a43a851acca8bb242011a1d62063c8154653c.1593152309.git.viresh.kumar@linaro.org>
 <20200702130654.GC9101@yuki.lan>
 <20200703031532.bjkwhkpfobdsxj4p@vireshk-i7>
 <fb2f4706-2739-9ab7-3b1f-a741cf055680@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb2f4706-2739-9ab7-3b1f-a741cf055680@cn.fujitsu.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 05/19] syscalls/sched_rr_get_interval: Add
 support for time64 tests
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
Cc: ltp@lists.linux.it, Vincent Guittot <vincent.guittot@linaro.org>,
 arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 03-07-20, 13:52, Yang Xu wrote:
> Hi Viresh
> 
> > On 02-07-20, 15:06, Cyril Hrubis wrote:
> > > Btw, we may as well add a check that the value is consistent with
> > > /proc/sys/kernel/sched_rr_timeslice_ms.
> 
> I guess cyril may want to add a check using TST_ASSERT_INT api like this
> 
> TST_ASSERT_INT("/proc/sys/kernel/sched_rr_timeslice_ms", tst_ts_to_ms(tp));
> 
> It is strange.
> On my machine, the two values are all 100. AFAIK, it has a bug (set in milliseconds but the result is shown in jiffies.) on old kernel whenCONFIG_HZ is not 1000. what kernel version do you test?

I am running an old kernel (4.4) and with 250 CONFIG_HZ.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=975e155ed8732cb81f55c021c441ae662dd040b5

I sent it to get included in stable kernels now.

https://lore.kernel.org/lkml/ffdfb849a11b9cd66e0aded2161869e36aec7fc0.1593757471.git.viresh.kumar@linaro.org/

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
