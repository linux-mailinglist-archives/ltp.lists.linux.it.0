Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7B92990B5
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 16:13:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65AA43C5627
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 16:13:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8AE293C12E6
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:12:57 +0100 (CET)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ECA891A007FE
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 16:12:56 +0100 (CET)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1kX4B5-00051d-Aj; Mon, 26 Oct 2020 15:12:55 +0000
Date: Mon, 26 Oct 2020 12:12:50 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201026151250.GA370402@mussarela>
References: <20201006085309.32227-1-cascardo@canonical.com>
 <20201013140315.GD29925@yuki.lan> <20201020122351.GA15920@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020122351.GA15920@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/timer_settime01: adjust for rounding
 from nsec to usec
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
Cc: Kelsey Skunberg <kelsey.skunberg@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Oct 20, 2020 at 02:23:51PM +0200, Cyril Hrubis wrote:
> Hi!
> > What about this change instead?
> > 
> > diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> > index 67143e8f8..599ef2891 100644
> > --- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> > +++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> > @@ -132,11 +132,13 @@ static void run(unsigned int n)
> >  					get_clock_str(clock));
> >  				continue;
> >  			}
> > -			val += tst_ts_to_us(timenow);
> > +			tst_ts_add_us(timenow, val);
> > +			tst_its_set_value_from_ts(&new_set, timenow);
> > +		} else {
> > +			tst_its_set_value_from_us(&new_set, val);
> >  		}
> >  
> >  		tst_its_set_interval_from_us(&new_set, tc->it_interval_tv_usec);
> > -		tst_its_set_value_from_us(&new_set, val);
> >  
> >  		TEST(tv->timer_settime(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
> >  
> > 
> > 
> > By adding the us to the timenow first and then setting the its.value
> > from it we can avoid the rounding completely.
> 
> Does this fix work for you?
> 

Sorry, I was out on vacation. This fixes it for me when using
clocksource=jiffies.

Thanks.
Cascardo.

> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
