Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2973A9BC0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 15:13:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3374C3C5655
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 15:13:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 545463C183E
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 15:13:33 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0FA28600558
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 15:13:30 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G4lsg4vTqz70Tm
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 21:10:15 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 21:13:20 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 21:13:20 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210616093606.214856-1-xieziyao@huawei.com>
 <20210616093606.214856-3-xieziyao@huawei.com> <YMnk5QUhwnOHrWLi@yuki>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <8f8852e0-eed3-f7ae-744e-db48724e9b02@huawei.com>
Date: Wed, 16 Jun 2021 21:13:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YMnk5QUhwnOHrWLi@yuki>
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/getrusage: Cleanup and bugfix for
 getrusage03
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

Hi, Cyril,

>>
>> -int main(int argc, char *argv[])
>> +static void check_result(int result, char *msg)
>>   {
>> -	int lc;
>> -
>> -	tst_parse_opts(argc, argv, NULL, NULL);
>> -
>> -	setup();
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -		tst_count = 0;
>> -
>> -		tst_resm(TINFO, "allocate 100MB");
>> -		consume(100);
>> -
>> -		inherit_fork();
>> -		inherit_fork2();
>> -		fork_malloc();
>> -		grandchild_maxrss();
>> -		zombie();
>> -		sig_ign();
>> -		exec_without_fork();
>> -	}
>> -	cleanup();
>> -	tst_exit();
>> +	if (result == 1)
>> +		tst_res(TPASS, "%s", msg);
>> +	else if (result == 0)
>> +		tst_res(TFAIL, "%s", msg);
>> +	else
>> +		tst_res(TFAIL, "unexpected result???%d", result);
>>   }
> 
> The new test library allows you to report PASS/FAIL from child processes
> so we can get rid of this check result function here.
Thanks, I'll change this. The same modification will apply to all of the 
following ways of returning results via exit() in child process.

> 
>> -/* Testcase #01: fork inherit
>> - * expect: initial.self ~= child.self */
>> -static void inherit_fork(void)
>> +static void inherit_fork1(void)
>>   {
>> -	tst_resm(TINFO, "Testcase #01: fork inherit");
>> -
>> -	SAFE_GETRUSAGE(cleanup, RUSAGE_SELF, &ru);
>> -	tst_resm(TINFO, "initial.self = %ld", ru.ru_maxrss);
>> +	SAFE_GETRUSAGE(RUSAGE_SELF, &ru);
>> +	maxrss_init = ru.ru_maxrss;
>>
>> -	switch (pid = fork()) {
>> -	case -1:
>> -		tst_brkm(TBROK | TERRNO, cleanup, "fork #1");
>> -	case 0:
>> -		maxrss_init = ru.ru_maxrss;
>> -		SAFE_GETRUSAGE(cleanup, RUSAGE_SELF, &ru);
>> -		tst_resm(TINFO, "child.self = %ld", ru.ru_maxrss);
>> -		exit(is_in_delta(maxrss_init - ru.ru_maxrss));
>> -	default:
>> -		break;
>> +	if ((pid = SAFE_FORK()) == 0) {
> 
> We do not use the pid value for anything so this can be just:
> 
> 	if (!SAFE_FORK()) {
> 		...
Agreed.

>> -
>> -/* Testcase #03: fork + malloc
>> - * expect: initial.self + 50MB ~= child.self */
>> -static void fork_malloc(void)
>> -{
>> -	tst_resm(TINFO, "Testcase #03: fork + malloc");
>> -
>> -	SAFE_GETRUSAGE(cleanup, RUSAGE_SELF, &ru);
>> -	tst_resm(TINFO, "initial.self = %ld", ru.ru_maxrss);
>> +	SAFE_GETRUSAGE(RUSAGE_CHILDREN, &ru);
>> +	check_result(is_in_delta(ru.ru_maxrss - 102400), "check that initial.children ~= 100MB");
> 
> Can we just do the check here instead? I.e.
> 
> 	if (is_in_delta(ru.ru_maxrss - 102400))
> 		tst_res(TPASS, "Initial ru.ru_maxrss ~= 100MB");
> 	else
> 		tst_res(TFAIL, "Initial ru.ru_maxrss = %liB", ru.ru_maxrss);
Fine, thanks.


>>
>> -/* Testcase #04: grandchild maxrss
>> - * expect: post_wait.children ~= 300MB */
>>   static void grandchild_maxrss(void)
>>   {
>> -	tst_resm(TINFO, "Testcase #04: grandchild maxrss");
>> -
>> -	SAFE_GETRUSAGE(cleanup, RUSAGE_CHILDREN, &ru);
>> -	tst_resm(TINFO, "initial.children = %ld", ru.ru_maxrss);
>> -
>> -	switch (pid = fork()) {
>> -	case -1:
>> -		tst_brkm(TBROK | TERRNO, cleanup, "fork #4");
>> -	case 0:
>> -		retval = system("getrusage03_child -g 300");
>> +	if ((pid = SAFE_FORK()) == 0) {
> 
> 	Here as well.
> 
>> +		retval = tst_system("getrusage03_child grand_consume 300");
> 
> We have already forked so there is no point in using system(). All that
> we have to do here is execve() as:
> 
> 		const char *argv[] = {"getrusage03_child", "grand_consume", "300", NULL};
> 
> 		execve(argv[0], argv[], environ);
> 
> 		tst_brk(TBROK | TERRNO, "execve() failed");
Fine, I'll try this way.

>>
>> -/* Testcase #06: SIG_IGN
>> - * expect: initial ~= after_zombie */
>>   static void sig_ign(void)
>>   {
>> -	tst_resm(TINFO, "Testcase #06: SIG_IGN");
>> -
>> -	SAFE_GETRUSAGE(cleanup, RUSAGE_CHILDREN, &ru);
>> -	tst_resm(TINFO, "initial.children = %ld", ru.ru_maxrss);
>> -	signal(SIGCHLD, SIG_IGN);
>> +	SAFE_GETRUSAGE(RUSAGE_CHILDREN, &ru);
>>   	maxrss_init = ru.ru_maxrss;
>> +	SAFE_SIGNAL(SIGCHLD, SIG_IGN);
>>
>> -	switch (pid = fork()) {
>> -	case -1:
>> -		tst_brkm(TBROK, cleanup, "fork #6");
>> -	case 0:
>> -		retval = system("getrusage03_child -n 500");
>> +	if ((pid = SAFE_FORK()) == 0) {
>> +		retval = tst_system("getrusage03_child consume 500");
>>   		if ((WIFEXITED(retval) && WEXITSTATUS(retval) != 0))
>> -			tst_brkm(TBROK | TERRNO, cleanup, "system");
>> +			tst_brk(TBROK, "system(\"getrusage03_child consume 500\")");
>>   		exit(0);
>> -	default:
>> -		break;
>>   	}
> 
> 
> And here as well.
> 
>> -	sleep(1);		/* children become zombie */
>> -	SAFE_GETRUSAGE(cleanup, RUSAGE_CHILDREN, &ru);
>> -	tst_resm(TINFO, "after_zombie.children = %ld", ru.ru_maxrss);
>> -	if (is_in_delta(ru.ru_maxrss - maxrss_init))
>> -		tst_resm(TPASS, "initial.children ~= after_zombie.children");
>> -	else
>> -		tst_resm(TFAIL, "initial.children !~= after_zombie.children");
>> -	signal(SIGCHLD, SIG_DFL);
>> +	TST_PROCESS_RELEASE_WAIT(pid, 0);
> 
> Why can't we use the TST_PROCESS_STATE_WAIT(pid, 'Z', 0) here as well? I
> fail to see how this is different from the previous test.
Same with lib: tst_process_state: Add tst_process_release_wait().

If we call the signal(SIGCHLD,SIG_IGN), the SIGCHLD signal is ignored by 
the system. Thus, no zombie is created before the child is terminated. 
The logs are as follows:

getrusage03.h:27: TINFO: allocate 400MB
getrusage03.c:39: TPASS: check that initial.children ~= pre_wait.children
getrusage03.c:39: TPASS: check that post_wait.children ~= 400MB
getrusage03.h:27: TINFO: allocate 500MB
getrusage03.c:123: TBROK: Failed to open FILE '/proc/84598/stat' for 
reading: ENOENT (2)

So I write TST_PROCESS_RELEASE_WAIT() here to check /proc/$PID.


>> -
>> -static void consume(int mega)
>> -{
>> -	size_t sz;
>> -	void *ptr;
>> -
>> -	sz = mega * 1024 * 1024;
>> -	ptr = SAFE_MALLOC(cleanup, sz);
>> -	memset(ptr, 0, sz);
>> +	inherit_fork1();
>> +	inherit_fork2();
>> +	grandchild_maxrss();
>> +	zombie();
>> +	sig_ign();
>> +	inherit_exec();
> 
> Can we split these into a several tests?
> 
> Have a look at snd_seq01.c and testfunc_list array how this is done.
I'll change this way, thanks.


>> diff --git a/testcases/kernel/syscalls/getrusage/getrusage03.h b/testcases/kernel/syscalls/getrusage/getrusage03.h
>> new file mode 100644
>> index 000000000..5fbf57272
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/getrusage/getrusage03.h
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2011  Red Hat, Inc.
>> + * Copyright (c) 2021 Xie Ziyao <xieziyao@huawei.com>
>> + */
>> +
>> +#ifndef LTP_GETRUSAGE03_H
>> +#define LTP_GETRUSAGE03_H
>> +
>> +#include "tst_test.h"
>> +
>> +#define DELTA_MAX 20480
>> +
>> +static void consume(int consume_nr)
>                 ^
> 	       This should be called consume_mb() so that it's clear
> 	       that the parameter is in megabytes.
Fine, thanks.

>> diff --git a/testcases/kernel/syscalls/getrusage/getrusage03_child.c b/testcases/kernel/syscalls/getrusage/getrusage03_child.c
>> index 972c38e4e..58da481cb 100644
>> --- a/testcases/kernel/syscalls/getrusage/getrusage03_child.c
>> +++ b/testcases/kernel/syscalls/getrusage/getrusage03_child.c
>> @@ -1,168 +1,63 @@

>> -static void usage(void);
>> -static void consume(int mega);
>> -static void setup(void);
>> -static void cleanup(void);
>> +#include "tst_test.h"
>> +#include "getrusage03.h"
>>
>>   int main(int argc, char *argv[])
>>   {
>> -	int lc;
>> +	if (argc < 3)
>> +		tst_brk(TFAIL, "argc is %d, expected more", argc);
> 
> This is TBROK and also the message could be more clear such as:
> 
> 	"expected at least two parameters"
Fine, thanks.

> 
>> +	if (!strcmp(argv[1], "consume")) {
>> +		consume_nr = SAFE_STRTOL(argv[2], 0, LONG_MAX);
>> +		consume(consume_nr);
>> +	}
>> +	else if (!strcmp(argv[1], "grand_consume")) {
> 
> The else has to be on the same line as }
Sorry for the mistake, thanks.

> 
>> +		grand_consume_nr = SAFE_STRTOL(argv[2], 0, LONG_MAX);
>> +
>> +		pid = fork();
>> +		if (pid == -1)
>> +			tst_brk(TBROK, "fork failed");
>> +		else if (pid == 0) {
>> +			consume(grand_consume_nr);
>> +			exit(0);
>>   		}
> 
> Just use SAFE_FORK() here.
I noticed that some safe_ micro checks tst_test->forks_child or other 
tst_test->xx, while tst_test is not defined in some functions with 
#define TST_NO_DEFAULT_MAIN.

>> -static void setup(void)
>> -{
>> -	tst_sig(FORK, DEF_HANDLER, cleanup);
>> -
>> -	TEST_PAUSE;
>> -}
>> +		if (!is_in_delta(maxrss_self - self_nr) || !is_in_delta(maxrss_children - child_nr))
>> +			tst_brk(TBROK, "check that initial.self ~= exec.self, initial.children ~= exec.children");
> 
> This should produce TPASS/TFAIL messages and for each of them
> respectivelly as:
> 
> 		if (is_in_delta(maxrss_self - self_nr))
> 			tst_res(TPASS, ...);
> 		else
> 			tst_res(TFAIL, ...);
> 
> 		if (is_in_delta(maxrss_children - child_nr))
> 			tst_res(TPASS, ...);
> 		else
> 			tst_res(TFAIL, ...);
> 	}
I'll change it, thanks.

Thanks for your review.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
