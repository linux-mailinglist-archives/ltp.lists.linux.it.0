Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72799293B73
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 14:23:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F1A23C31B4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 14:23:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C6C093C26BE
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 14:23:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 54331600711
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 14:23:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8356AE47;
 Tue, 20 Oct 2020 12:23:22 +0000 (UTC)
Date: Tue, 20 Oct 2020 14:23:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <20201020122351.GA15920@yuki.lan>
References: <20201006085309.32227-1-cascardo@canonical.com>
 <20201013140315.GD29925@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013140315.GD29925@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

Hi!
> What about this change instead?
> 
> diff --git a/testcases/kernel/syscalls/timer_settime/timer_settime01.c b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> index 67143e8f8..599ef2891 100644
> --- a/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> +++ b/testcases/kernel/syscalls/timer_settime/timer_settime01.c
> @@ -132,11 +132,13 @@ static void run(unsigned int n)
>  					get_clock_str(clock));
>  				continue;
>  			}
> -			val += tst_ts_to_us(timenow);
> +			tst_ts_add_us(timenow, val);
> +			tst_its_set_value_from_ts(&new_set, timenow);
> +		} else {
> +			tst_its_set_value_from_us(&new_set, val);
>  		}
>  
>  		tst_its_set_interval_from_us(&new_set, tc->it_interval_tv_usec);
> -		tst_its_set_value_from_us(&new_set, val);
>  
>  		TEST(tv->timer_settime(timer, tc->flag, tst_its_get(&new_set), tst_its_get(tc->old_ptr)));
>  
> 
> 
> By adding the us to the timenow first and then setting the its.value
> from it we can avoid the rounding completely.

Does this fix work for you?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
