Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 922BF2ED137
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 14:56:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 485553C549D
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 14:56:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BFB9A3C323C
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 14:56:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5EE3D1000B60
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 14:56:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B485B718;
 Thu,  7 Jan 2021 13:56:48 +0000 (UTC)
Date: Thu, 7 Jan 2021 14:57:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: gengcixi@gmail.com
Message-ID: <X/cTWFNvtJ5NCyOh@yuki.lan>
References: <20201223033517.1464263-1-gengcixi@gmail.com>
 <20201223033517.1464263-3-gengcixi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201223033517.1464263-3-gengcixi@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib: implement rtctime_save and
 rtctime_restore function
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
Cc: Cixi Geng <cixi.geng1@unisoc.com>, ltp@lists.linux.it, orsonzhai@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

>  static struct timespec real_begin, mono_begin;
>  
> +static struct rtc_time rtc_begin;
> +
>  static int clock_saved;
>  
>  void tst_wallclock_save(void)
> @@ -58,3 +61,42 @@ void tst_wallclock_restore(void)
>  	if (tst_clock_settime(CLOCK_REALTIME, &adjust))
>  		tst_brk(TBROK | TERRNO, "tst_clock_settime() realtime failed");
>  }
> +
> +void tst_rtctime_save(void)
> +{
> +	/* save initial monotonic time to restore it when needed */
> +	if (tst_rtc_gettime(&rtc_begin))
> +		tst_brk(TBROK | TERRNO, "tst_rtc_gettime() realtime failed");
> +
> +	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_begin))
> +		tst_brk(TBROK | TERRNO, "tst_clock_gettime() monotonic failed");
> +
> +	clock_saved = 1;

It would be better if we defined rtc_clock_saved for the rtc* functions
instead.

> +}
> +
> +void tst_rtctime_restore(void)
> +{
> +	static struct timespec mono_end, elapsed;
> +	static struct timespec rtc_begin_tm, rtc_adjust;
> +	static struct rtc_time rtc_restore;
> +
> +	if (!clock_saved)
> +		return;
> +
> +	clock_saved = 0;
> +
> +	if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_end))
> +		tst_brk(TBROK | TERRNO, "tst_clock_gettime() monotonic failed");
> +
> +	elapsed = tst_timespec_diff(mono_end, mono_begin);
> +
> +	rtc_begin_tm.tv_sec = tst_rtc_tm_to_time(&rtc_begin);

We should clear the tv_nsec here otherwise it will contain garbage.

> +	rtc_adjust = tst_timespec_add(rtc_begin_tm, elapsed);
> +
> +	tst_rtc_time_to_tm(rtc_adjust.tv_sec, &rtc_restore);
> +
> +	/* restore realtime clock based on monotonic delta */
> +	if (tst_rtc_settime(&rtc_restore))
> +		tst_brk(TBROK | TERRNO, "tst_rtc_settime() realtime failed");
> +}

Other than this, it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
