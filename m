Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BB7103A1A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 13:33:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0B103C2381
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 13:33:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1415F3C14F0
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 13:33:40 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 750D61A01D2A
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 13:33:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF2A8BE13;
 Wed, 20 Nov 2019 12:33:39 +0000 (UTC)
Date: Wed, 20 Nov 2019 13:33:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191120123339.GE14963@rei.lan>
References: <cover.1574087532.git.jstancek@redhat.com>
 <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] perf_event_open02: make do_work() run for
 specified time
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

> -static void do_work(void)
> +void alarm_handler(int sig LTP_ATTRIBUTE_UNUSED)

static void ?

> +{
> +	work_done = 1;
> +}
> +
> +static void do_work(int time_ms)
>  {
>  	int i;
> +	struct sigaction sa;
> +	struct itimerval val;
>  
> -	for (i = 0; i < LOOPS; ++i)
> -		asm volatile (""::"g" (i));
> -}
> +	work_done = 0;
> +	memset(&val, 0, sizeof(val));
> +	val.it_value.tv_sec = time_ms / 1000;
> +	val.it_value.tv_usec = (time_ms % 1000) * 1000;
>  
> +	sa.sa_handler = alarm_handler;
> +	sa.sa_flags = SA_RESETHAND;
> +	SAFE_SIGACTION(SIGALRM, &sa, NULL);

I would have set up the signal handler just once in the test setup.

> +	if (setitimer(ITIMER_REAL, &val, NULL))
> +		tst_brk(TBROK | TERRNO, "setitimer");
> +
> +	while (!work_done) {
> +		for (i = 0; i < 100000; ++i)
> +			asm volatile (""::"g" (i));
> +	}
> +}

Otherwise it looks great, acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
