Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5F1DA95C
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 06:41:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDF953C4DFA
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 06:41:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0DDFE3C149F
 for <ltp@lists.linux.it>; Wed, 20 May 2020 06:41:02 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BC6A710009FB
 for <ltp@lists.linux.it>; Wed, 20 May 2020 06:41:01 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id u35so865553pgk.6
 for <ltp@lists.linux.it>; Tue, 19 May 2020 21:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i3ZLjnjV/so3uTPjfII7Yei3O4mW22j4J1wmdF8Jytc=;
 b=zPt6f6zPZGoPMPOTyMCrAMqhFZ4+kAhlEc3AZahu4ZkotHbPCyAopDk4MdCOt7SclP
 NULi0D/0kqpoYOoGUpwme2ZthlbyzVZFKCL2vRFpEk9aj56lii+QGrZpY7XJrrAv7XPA
 GljnQBeY1UFzpdemv2b4ZdBgqlsfJ7t1CJgnw8nuu7NQtyDMTpMet0ie38Yl9ATGgKQ4
 BsARAioHCQDrx4XnNRe8Hop0gv3DIP2REWPFsKpYUGMV7hcuaNYcrTIQtckX3LcS6Qs5
 V6pNsCLx/7X+hCnD8Feecu2oV99PaJv0XaR3Nk/z9d+OcXps9cUlmtdpBETKYfr4il/U
 tEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i3ZLjnjV/so3uTPjfII7Yei3O4mW22j4J1wmdF8Jytc=;
 b=Q/8sgXaF+VZj/muTWS89YErjuJFKiwmy834rcRVN5J/K9+UXbX5KbkcXjnNEI913Qb
 iTZ3ReIptZPSv3uLwErNSQGR4K2WF9RFOHL3QbF4c5u9JLsxMzrPMVf7hb0dYbvkwfLD
 p9A+z0d85c67fh37ZNNUaDHvDiq+lwJ+/3VJD6HSQ8yLFBk9DwuIgOZdZODe6jZ0XNOp
 2nXkj7rvBgvxg7svnavUxzRpOKZ7z1OKLBISjdxUm7rFrw9ZV9B0XTlyqOuUU4UbKacQ
 9hzlNmr6oksxYrdxTqj4PDUGDriLh3Lo7a8O1OD3TaixkYC0KCZoi7rs3Qi4pJeRrPM9
 GoSg==
X-Gm-Message-State: AOAM531k/gYGQLGsoc26gjBpd7spkkLnJy/AViKnCNktAUORrsCjJiNA
 YUd1BpI9iv0UiBt6Zr3vD0pfGg==
X-Google-Smtp-Source: ABdhPJzYZ6A2+MtU2bqQqDnP+Ah9uTTiefaaGd2X2wRxqbyIqvXnQAfCJeNtwcU4qQ5qizJvywy5RQ==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr2311721pgb.74.1589949660024;
 Tue, 19 May 2020 21:41:00 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id gg8sm847889pjb.39.2020.05.19.21.40.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 21:40:59 -0700 (PDT)
Date: Wed, 20 May 2020 10:10:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200520044056.z67p66mubpok23gi@vireshk-i7>
References: <20200519120725.25750-1-pvorel@suse.cz>
 <20200519140704.GE16008@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519140704.GE16008@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] C API: Turn .test_variants into array of
 description
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

On 19-05-20, 16:07, Cyril Hrubis wrote:
> Hi!
> > diff --git a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
> > index 061b2bb22..40dae4b24 100644
> > --- a/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
> > +++ b/testcases/kernel/syscalls/clock_adjtime/clock_adjtime01.c
> > @@ -107,14 +107,12 @@ struct test_case tc[] = {
> >  static struct test_variants {
> >  	int (*clock_adjtime)(clockid_t clk_id, void *timex);
> >  	enum tst_timex_type type;
> > -	char *desc;
> >  } variants[] = {
> >  #if (__NR_clock_adjtime != __LTP__NR_INVALID_SYSCALL)
> > -	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_OLD_TIMEX, .desc = "syscall with old kernel spec"},
> > +	{.clock_adjtime = sys_clock_adjtime, .type = TST_KERN_OLD_TIMEX},
> >  #endif
> > -
> >  #if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
> > -	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX, .desc = "syscall time64 with kernel spec"},
> > +	{.clock_adjtime = sys_clock_adjtime64, .type = TST_KERN_TIMEX},
> >  #endif
> >  };
> >  
> > @@ -188,8 +186,6 @@ static void setup(void)
> >  	size_t i;
> >  	int rval;
> >  
> > -	tst_res(TINFO, "Testing variant: %s", tv->desc);
> > -
> >  	saved.type = tv->type;
> >  	rval = tv->clock_adjtime(CLOCK_REALTIME, tst_timex_get(&saved));
> >  	if (rval < 0) {
> > @@ -257,7 +253,15 @@ static struct tst_test test = {
> >  	.setup = setup,
> >  	.cleanup = cleanup,
> >  	.tcnt = ARRAY_SIZE(tc),
> > -	.test_variants = ARRAY_SIZE(variants),
> > +	.test_variants = (const char *[]) {
> > +#if (__NR_clock_adjtime != __LTP__NR_INVALID_SYSCALL)
> > +		"syscall with old kernel spec",
> > +#endif
> > +#if (__NR_clock_adjtime64 != __LTP__NR_INVALID_SYSCALL)
> > +		"syscall time64 with kernel spec",
> > +#endif
> > +		NULL
> > +	},
> 
> I do not think that having more ifdefs and splitting the test variant
> structure helps to make things simple in the case of timer testcases.
> 
> What exact problem are you trying to solve?

This is exactly what I thought about this when I saw the patch, and then also
the problem of syncing two different arrays with their names (specially in my
tests).

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
