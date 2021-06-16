Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA83A99A0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:54:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0AAD3C4CC0
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:54:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE35F3C232D
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:54:33 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AC6CC140115E
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:54:31 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G4k6Y3LMLz70RH
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 19:51:17 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 19:54:27 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 19:54:26 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210616093606.214856-1-xieziyao@huawei.com>
 <20210616093606.214856-2-xieziyao@huawei.com> <YMnavJjzrS7B8fgd@yuki>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <55d788bc-a454-0c9a-f0bd-733aaf0b95c1@huawei.com>
Date: Wed, 16 Jun 2021 19:54:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YMnavJjzrS7B8fgd@yuki>
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] lib: tst_process_state: Add
 tst_process_release_wait()
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

Hi,

> 
> First of all changes in license and whitespaces should be in a separate
> patch from the newly added functionality.
Agree with you, thx.

> 
>>   #include <stdio.h>
>> @@ -28,9 +12,8 @@
>>   #include "test.h"
>>   #include "tst_process_state.h"
>>
>> -int tst_process_state_wait(const char *file, const int lineno,
>> -                            void (*cleanup_fn)(void), pid_t pid,
>> -			    const char state, unsigned int msec_timeout)
>> +int tst_process_state_wait(const char *file, const int lineno, void (*cleanup_fn)(void),
>> +			   pid_t pid, const char state, unsigned int msec_timeout)
>>   {
>>   	char proc_path[128], cur_state;
>>   	unsigned int msecs = 0;
>> @@ -39,7 +22,7 @@ int tst_process_state_wait(const char *file, const int lineno,
>>
>>   	for (;;) {
>>   		safe_file_scanf(file, lineno, cleanup_fn, proc_path,
>> -		                "%*i %*s %c", &cur_state);
>> +				"%*i %*s %c", &cur_state);
>>
>>   		if (state == cur_state)
>>   			break;
>> @@ -84,3 +67,26 @@ int tst_process_state_wait2(pid_t pid, const char state)
>>   		usleep(10000);
>>   	}
>>   }
>> +
>> +int tst_process_release_wait(pid_t pid, unsigned int msec_timeout)
>> +{
>> +	char proc_path[128];
>> +	unsigned int msecs = 0;
>> +
>> +	snprintf(proc_path, sizeof(proc_path), "/proc/%i", pid);
>> +
>> +	for (;;) {
>> +		if (access(proc_path, F_OK))
>> +			break;
>> +
>> +		usleep(1000);
>> +		msecs += 1;
>> +
>> +		if (msec_timeout && msecs >= msec_timeout) {
>> +			errno = ETIMEDOUT;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	return 1;
>> +}
> 
> What exactly do we need this for?
> 
> When does /proc/$PID ceases to exit? My guess would be that the
> directory ceases to exists once the child has been waited() for by a
> parent process and we do not need this at all since call to system()
> does wait for it's children anyways.
Hi, this function is writtten for sig_ign() in getrusage03, which tests 
getrusage by ignoring the SIGCHLD signal.

When a child is terminated, a corresponding SIGCHLD signal is delivered 
to the parent, if we call the signal(SIGCHLD,SIG_IGN), then the SIGCHLD 
signal is ignored by the system, and the child process entry is deleted 
from the process table. Thus, no zombie is created. However, in this 
case, the parent cannot know about the exit status of the child.

So I checked /proc/$PID here instead of using waitpid().


Thanks for your review.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
