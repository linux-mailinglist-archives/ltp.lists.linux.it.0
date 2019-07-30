Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B357A3A8
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 11:08:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72E3D3C1D4A
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 11:08:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2C4413C1D30
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 11:08:01 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E4E0601A0F
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 11:07:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09B55AEC3;
 Tue, 30 Jul 2019 09:07:56 +0000 (UTC)
Date: Tue, 30 Jul 2019 11:07:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190730090754.GA7528@rei.lan>
References: <1564216031-2973-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564216031-2973-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/prctl08: New test for prctl() with
 PR_{SET, GET}_TIMERSLACK
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

Hi!
> +static struct tcase {
> +	unsigned long setvalue;
> +	unsigned long cmptime;
> +} tcases[] = {
> +	{1, 50000},
> +	{70000, 120000},
> +	{INT_MAX, 50000},
> +};
> +
> +static int proc_flag = 1;
> +
> +static void check_proc_ns(char *message, unsigned long value)
> +{
> +	unsigned long proc_value;
> +
> +	SAFE_FILE_SCANF(PROC_NS_PATH, "%lu", &proc_value);
> +	if (proc_value == value)
> +		tst_res(TPASS, "%s %s  got %lu expectedly",
> +				message, PROC_NS_PATH, proc_value);
> +	else
> +		tst_res(TFAIL, "%s %s expected %lu got %lu",
> +				message, PROC_NS_PATH, value, proc_value);
> +}
> +
> +static void check_get_timerslack(char *message, unsigned long value)
> +{
> +	TEST(prctl(PR_GET_TIMERSLACK));
> +	if ((unsigned long)TST_RET == value)
> +		tst_res(TPASS, "%s prctl(PR_GET_TIMERSLACK) got %lu expectedly",
> +				message, value);
> +	else
> +		tst_res(TFAIL, "%s prctl(PR_GET_TIMERSLACK) expected %lu got %lu",
> +				message, value, TST_RET);
> +
> +	if (proc_flag)
> +		check_proc_ns(message, value);
> +}
> +
> +static void verify_prctl(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +	int pid;
> +
> +	struct timespec timereq = { .tv_sec = 0, .tv_nsec = 50000 };
> +	struct timespec timecmp = { .tv_sec = 0, .tv_nsec = tc->cmptime};
> +
> +	TEST(prctl(PR_SET_TIMERSLACK, tc->setvalue));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_TIMERSLACK, %lu) failed",
> +				tc->setvalue);
> +		return;
> +	}
> +	tst_res(TPASS, "prctl(PR_SET_TIMERSLACK, %lu) success", tc->setvalue);
> +
> +	pid = SAFE_FORK();
> +	if (pid == 0) {
> +		check_get_timerslack("child process", tc->setvalue);
> +		/* A value of 0 means using default */
> +		prctl(PR_SET_TIMERSLACK, 0);

Why do we reset the slack before the measurements?

> +		check_get_timerslack("After set 0, child process", tc->setvalue);
> +
> +		tst_timer_start(CLOCK_MONOTONIC);
> +		TEST(nanosleep(&timereq, NULL));
> +		tst_timer_stop();
> +
> +		if (tst_timespec_lt(tst_timer_elapsed(), timecmp))
> +			tst_brk(TFAIL, "nanosleep() slept less than timecmp");

I do not get what we are trying to assert here.

As far as I understand it the timer slack is a way how to inform kernel
that it's okay if the timers are slightly less precise. However the
timer still can fire somewhere between sleep time and sleep time +
slack, or even maybe later if the system is under load.

BTW we do have a formula that tries to compute maximal time the timers
should sleep based on timer slack in lib/tst_timer_test.c but even with
that we have to take more samples and compute truncated mean because
single short sleep may be delayed unless it's a RT kernel...

> +		tst_res(TPASS, "nanosleep() slept more than timecmp, %llius",
> +				tst_timer_elapsed_us());
> +		exit(0);
> +	}
> +}
> +
> +static void setup(void)
> +{
> +	if (access(PROC_NS_PATH, F_OK) == -1) {
> +		tst_res(TCONF, "proc doesn't support timerslack_ns interface");
> +		proc_flag = 0;
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test = verify_prctl,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.forks_child = 1,
> +};
> -- 
> 2.18.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
