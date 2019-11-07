Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A28F29E9
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 09:56:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 464CC3C2033
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 09:56:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1C34B3C1CF1
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 09:56:26 +0100 (CET)
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6CDBA1001952
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 09:56:25 +0100 (CET)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34]
 helo=nanos.glx-home)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iSdaU-0001WD-DO; Thu, 07 Nov 2019 09:56:18 +0100
Date: Thu, 7 Nov 2019 09:56:12 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Jan Stancek <jstancek@redhat.com>
In-Reply-To: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
Message-ID: <alpine.DEB.2.21.1911051304420.17054@nanos.tec.linutronix.de>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kernel: use ktime_get_real_ts64() to calculate
 acct.ac_btime
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
Cc: Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Ingo Molnar <mingo@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Jan,

The subsystem prefix for acct is surely not 'kernel.'. Try:

 git log --oneline kernel/acct.c

On Sat, 2 Nov 2019, Jan Stancek wrote:
> diff --git a/kernel/acct.c b/kernel/acct.c
> index 81f9831a7859..991c898160cd 100644
> --- a/kernel/acct.c
> +++ b/kernel/acct.c
> @@ -417,6 +417,7 @@ static void fill_ac(acct_t *ac)
>  	struct pacct_struct *pacct = &current->signal->pacct;
>  	u64 elapsed, run_time;
>  	struct tty_struct *tty;
> +	struct timespec64 ts;
>  
>  	/*
>  	 * Fill the accounting struct with the needed info as recorded
> @@ -448,7 +449,8 @@ static void fill_ac(acct_t *ac)
>  	}
>  #endif
>  	do_div(elapsed, AHZ);
> -	ac->ac_btime = get_seconds() - elapsed;
> +	ktime_get_real_ts64(&ts);
> +	ac->ac_btime = ts.tv_sec - elapsed;

So the calculation goes like this:

   runtime = ktime_get_ns() - current->...->start_time;

   elapsed = ns_to_ahz(runtime)
   
   elapsed /= AHZ	-> runtime in seconds
   
And then you retrieve the current wall time and just use the seconds
portion for building the delta. That still can fail in corner cases when
the runtime to seconds conversion does not have truncation in the
conversions and the timespec nanoseconds part is close to 1e9.

There is another issue related to suspend. If the system suspends then
runtime is accurate vs. clock MONOTONIC, but the offset between clock
MONOTONIC and clock REALTIME is not longer the same due to the
suspend/resume which has the same issue as what you are trying to solve
because

   runtime = totaltime - time_in_suspend

so your ac_btime will be off by time_in_suspend.

Something like this should work:

   runtime = ktime_get_ns() - current->...->start_time;
   ....
   runtime_boot = ktime_get_boot_ns() - current->...->real_start_time;
   start_ns = ktime_get_real_ns() - runtime_boot;
   start_s = startns / NSEC_PER_SEC;

current->...->real_start_time is clearly a misnomer as it suggests
CLOCK_REALTIME at first sight ...

But it would be way simpler just to store the CLOCK_REALTIME start time
along with BOOT and MONOTONIC and just get rid of all these horrible
calculations which are bound to be wrong.

Peter?

Thanks,

	tglx

   



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
