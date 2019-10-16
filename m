Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C460D8FD0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 13:44:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18C573C22BB
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 13:44:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 1643A3C2214
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 13:44:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7CA26100093D
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 13:44:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C31F9B052;
 Wed, 16 Oct 2019 11:44:25 +0000 (UTC)
Date: Wed, 16 Oct 2019 13:44:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191016114424.GB27278@rei.lan>
References: <9c5134dc4b39f870f6e6cfab55c193f05b204b78.1571225074.git.jstancek@redhat.com>
 <51dce875f4ad2c234031101cd5c7a85eace53caa.1571225074.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51dce875f4ad2c234031101cd5c7a85eace53caa.1571225074.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] perf_event_open02: make test more reliable on
 -rt kernels
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
Cc: jlelli@redhat.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  .../kernel/syscalls/perf_event_open/perf_event_open02.c   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> index 1cfe29bb3d8a..6fc6f4afa119 100644
> --- a/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> +++ b/testcases/kernel/syscalls/perf_event_open/perf_event_open02.c
> @@ -52,6 +52,7 @@ Usage is: ./performance_counter02  [-v]
>  The -v flag makes it print out the values of each counter.
>  */
>  
> +#define _GNU_SOURCE
>  #include <stdio.h>
>  #include <stddef.h>
>  #include <stdlib.h>
> @@ -222,6 +223,20 @@ static void setup(void)
>  	int i;
>  	struct perf_event_attr tsk_event, hw_event;
>  
> +#ifdef HAVE_SCHED_GETCPU
> +	cpu_set_t mask;

Don't we have to allocate the mask dynamically so that we do not fail on
systems with more than CPU_SETSIZE (1024) CPUs?

We already have fallback macros for older libc in include/lapi/cpuset.h
so that we can use CPU_ALLOC() unconditionally.

> +	int cpu = sched_getcpu();
> +
> +	if (cpu == -1)
> +		tst_brkm(TBROK | TERRNO, NULL, "sched_getcpu() failed");
> +
> +	CPU_ZERO(&mask);
> +	CPU_SET(cpu, &mask);
> +
> +	if (sched_setaffinity(0, sizeof(cpu_set_t), &mask) == -1)
> +		tst_brkm(TBROK | TERRNO, NULL, "sched_setaffinity() failed");
> +#endif
> +
>  	/*
>  	 * According to perf_event_open's manpage, the official way of
>  	 * knowing if perf_event_open() support is enabled is checking for
> -- 
> 1.8.3.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
