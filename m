Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 446767A564
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:01:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E742C3C1D78
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Jul 2019 12:01:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7B3333C1D1C
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:01:47 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7A6F3601A18
 for <ltp@lists.linux.it>; Tue, 30 Jul 2019 12:01:44 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,326,1559491200"; d="scan'208";a="72518795"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2019 18:01:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 9F5804CDE889;
 Tue, 30 Jul 2019 18:01:42 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 30 Jul 2019 18:01:36 +0800
Message-ID: <5D401581.8000605@cn.fujitsu.com>
Date: Tue, 30 Jul 2019 18:01:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1564216031-2973-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190730090754.GA7528@rei.lan>
In-Reply-To: <20190730090754.GA7528@rei.lan>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 9F5804CDE889.AE2F2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


> Hi!
>> +static struct tcase {
>> +	unsigned long setvalue;
>> +	unsigned long cmptime;
>> +} tcases[] = {
>> +	{1, 50000},
>> +	{70000, 120000},
>> +	{INT_MAX, 50000},
>> +};
>> +
>> +static int proc_flag = 1;
>> +
>> +static void check_proc_ns(char *message, unsigned long value)
>> +{
>> +	unsigned long proc_value;
>> +
>> +	SAFE_FILE_SCANF(PROC_NS_PATH, "%lu",&proc_value);
>> +	if (proc_value == value)
>> +		tst_res(TPASS, "%s %s  got %lu expectedly",
>> +				message, PROC_NS_PATH, proc_value);
>> +	else
>> +		tst_res(TFAIL, "%s %s expected %lu got %lu",
>> +				message, PROC_NS_PATH, value, proc_value);
>> +}
>> +
>> +static void check_get_timerslack(char *message, unsigned long value)
>> +{
>> +	TEST(prctl(PR_GET_TIMERSLACK));
>> +	if ((unsigned long)TST_RET == value)
>> +		tst_res(TPASS, "%s prctl(PR_GET_TIMERSLACK) got %lu expectedly",
>> +				message, value);
>> +	else
>> +		tst_res(TFAIL, "%s prctl(PR_GET_TIMERSLACK) expected %lu got %lu",
>> +				message, value, TST_RET);
>> +
>> +	if (proc_flag)
>> +		check_proc_ns(message, value);
>> +}
>> +
>> +static void verify_prctl(unsigned int n)
>> +{
>> +	struct tcase *tc =&tcases[n];
>> +	int pid;
>> +
>> +	struct timespec timereq = { .tv_sec = 0, .tv_nsec = 50000 };
>> +	struct timespec timecmp = { .tv_sec = 0, .tv_nsec = tc->cmptime};
>> +
>> +	TEST(prctl(PR_SET_TIMERSLACK, tc->setvalue));
>> +	if (TST_RET == -1) {
>> +		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_TIMERSLACK, %lu) failed",
>> +				tc->setvalue);
>> +		return;
>> +	}
>> +	tst_res(TPASS, "prctl(PR_SET_TIMERSLACK, %lu) success", tc->setvalue);
>> +
>> +	pid = SAFE_FORK();
>> +	if (pid == 0) {
>> +		check_get_timerslack("child process", tc->setvalue);
>> +		/* A value of 0 means using default */
>> +		prctl(PR_SET_TIMERSLACK, 0);
> Why do we reset the slack before the measurements?
Hi Cyril

    I reset it because  I want to test whether default timer_slack in child process is the same as the current value
of the creating thread.

I also sent a patch about PR_SET_TIMERSLACK to man-page, as below:
https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=c14f79303f2885f7f4f4bf0d63922551b520a4b8



>> +		check_get_timerslack("After set 0, child process", tc->setvalue);
>> +
>> +		tst_timer_start(CLOCK_MONOTONIC);
>> +		TEST(nanosleep(&timereq, NULL));
>> +		tst_timer_stop();
>> +
>> +		if (tst_timespec_lt(tst_timer_elapsed(), timecmp))
>> +			tst_brk(TFAIL, "nanosleep() slept less than timecmp");
> I do not get what we are trying to assert here.
>
> As far as I understand it the timer slack is a way how to inform kernel
> that it's okay if the timers are slightly less precise. However the
> timer still can fire somewhere between sleep time and sleep time +
> slack, or even maybe later if the system is under load.
Yes. timer still can fire somewhere in [sleep, sleep+slack] range even later.

> BTW we do have a formula that tries to compute maximal time the timers
> should sleep based on timer slack in lib/tst_timer_test.c but even with
> that we have to take more samples and compute truncated mean because
> single short sleep may be delayed unless it's a RT kernel...
>
Yes . Agree. Single short sleep may be delayed and I will take more samples.

>> +		tst_res(TPASS, "nanosleep() slept more than timecmp, %llius",
>> +				tst_timer_elapsed_us());
>> +		exit(0);
>> +	}
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	if (access(PROC_NS_PATH, F_OK) == -1) {
>> +		tst_res(TCONF, "proc doesn't support timerslack_ns interface");
>> +		proc_flag = 0;
>> +	}
>> +}
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.test = verify_prctl,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +	.forks_child = 1,
>> +};
>> -- 
>> 2.18.1
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
