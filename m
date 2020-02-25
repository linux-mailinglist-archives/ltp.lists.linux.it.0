Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4216BD07
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 10:08:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 790D63C25EE
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 10:08:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5672B3C137A
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 10:08:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E89381401ABB
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 10:08:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,483,1574092800"; d="scan'208";a="83915143"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Feb 2020 17:07:43 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 4F43050A997E;
 Tue, 25 Feb 2020 16:57:55 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 25 Feb 2020 17:07:36 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1582537946-22098-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200224125802.GA30073@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0bfca454-8c44-6435-81fb-a243172ef96f@cn.fujitsu.com>
Date: Tue, 25 Feb 2020 17:07:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200224125802.GA30073@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4F43050A997E.AC753
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pipe13: Add regression test for pipe to
 wake up all readers
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

Hi!

> Hi!
>> +static void verify_pipe(void)
>> +{
>> +	int fds[2];
>> +	int status1, status2;
>> +	pid_t p1, p2;
>> +	int ret;
>> +
>> +	SAFE_PIPE(fds);
>> +
>> +	p1 = SAFE_FORK();
>> +	if (p1 == 0) {
>> +		SAFE_CLOSE(fds[1]);
>> +		SAFE_READ(0, fds[0], &status1, sizeof(status1));
>                                          ^
> 					Why status1 here?
> 
> 					can't we just pass a dummy
> 					char buf; and size 1 here?
> 
> 					It's not being written to
> 					anyways.
>> +		exit(0);
>> +	}
>> +	p2 = SAFE_FORK();
>> +	if (p2 == 0) {
>> +		SAFE_CLOSE(fds[1]);
>> +		SAFE_READ(0, fds[0], &status2, sizeof(status2));
>                                        ^
> 				      Here as well.
>> +		exit(0);
>> +	}
>> +
>> +	sleep(1);
> 
> This sleep here has to be replaced by a proper synchronization given
> that it's here to make sure both of the readers sleep on the pipe we
> should:
> 
> * Use checkpoints to make sure both of the children have managed
>    to get before the SAFE_READ().
> 
> * The the parent should use the TST_PROCESS_STATE_WAIT() to make sure
>    both of the chidlren are sleeping
OK, I will use wait and wakeup api as below:


static void do_child(int i)
{
         char buf;
         SAFE_CLOSE(fds[1]);
         TST_CHECKPOINT_WAKE(i);
         SAFE_READ(0, fds[0], &buf, 1);
         exit(0);
}

staic void verify_pipe(void)
....
for (i = 0; i < 2; i++) {
                 pid[i] = SAFE_FORK();
                 if (pid[i] == 0)
                         do_child(i);
                 TST_CHECKPOINT_WAIT(i);
                 TST_PROCESS_STATE_WAIT(pid[i], 'S', 0);
         }
....
> 
>> +	SAFE_CLOSE(fds[1]);
>> +
>> +	SAFE_WAITPID(p1, &status1, 0);
>> +	ret = waitpid(p2, &status2, WNOHANG);
> 
> We should just use waitpid with -1 as a pid here and WNOHANG twice,
> because if one of the children hangs it's not guaranteed in any way
> which one would that be.
> 
On my environment, kernel wakes up the first read and the remaining read 
doesn't be waked up. (I add three childs, 2,3 doesn't wake up)
>> +	if (ret == p2) {
>> +		tst_res(TPASS, "pipe wakes up everybody when last write closes");
>> +	} else {
>> +		tst_res(TFAIL, "pipe doesn't wake up every body when last write closes");
>> +		SAFE_KILL(p2, SIGKILL);
>> +		SAFE_WAIT(&status2);
>> +	}
>> +}
>> +
>> +static struct tst_test test = {
>> +	.test_all = verify_pipe,
>> +	.forks_child = 1,
>> +	.tags = (const struct tst_tag[]) {
>> +		{"linux-git", "6551d5c56eb"},
>> +		{}
>> +	}
>> +};
>> -- 
>> 2.18.0
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
