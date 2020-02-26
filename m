Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD39E16F4F9
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 02:27:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 773B03C202F
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 02:27:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 992703C094C
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 02:27:13 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2E9BF1000949
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 02:27:10 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,486,1574092800"; d="scan'208";a="84142235"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 09:27:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 1451C406AB15;
 Wed, 26 Feb 2020 09:17:20 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 09:27:03 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <1582537946-22098-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200224125802.GA30073@rei.lan>
 <0bfca454-8c44-6435-81fb-a243172ef96f@cn.fujitsu.com>
 <20200225102850.GA5077@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c2a51c9c-2509-7099-23ff-015810048af3@cn.fujitsu.com>
Date: Wed, 26 Feb 2020 09:27:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200225102850.GA5077@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1451C406AB15.AEBCC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
>>> We should just use waitpid with -1 as a pid here and WNOHANG twice,
>>> because if one of the children hangs it's not guaranteed in any way
>>> which one would that be.
>>>
>> On my environment, kernel wakes up the first read and the remaining read
>> doesn't be waked up. (I add three childs, 2,3 doesn't wake up)
> 
> But that behavior is not written down in any standard, that's just how
> the kernel internals are working at the moment, we should not assume it
> will work like this in the future.
Sound reasonable to me, I will follow your advise.
> 
> What I would do here would be:
> 
> 	int ret, cnt = 0, sleep_us = 1, fail = 0;
> 
> 	while (cnt < 2 && sleep_us < 100000) {
> 		ret = waitpid(-1, NULL, WNOHANG);
> 
> 		if (ret < 0)
> 			tst_brk(TBROK | TERRNO, "waitpid()");
> 
> 		if (ret > 0) {
> 			cnt++;
> 			for (i = 0; i < 2; i++) {
> 				if (pid[i] == ret)
> 					pid[i] = 0;
> 			}
> 			continue;
> 		}
> 
> 		usleep(sleep_time);
> 		sleep_time *= 2;
> 	}
> 
> 	for (i = 0; i < 2; i++) {
> 		if (pid[i]) {
> 			tst_res(TINFO, "pid %i still sleeps", pid[i]);
> 			fail = 1;
> 			SAFE_KILL(pid[i], SIGKILL);
> 			SAFE_WAIT(NULL);
> 		}
> 	}
> 
> 	if (fail)
> 		tst_res(TFAIL, "Closed pipe didn't wake everyone");
> 
> 
> 
> This has also advantage that we can easily run the test even for 100
> children as well as two if we change the upper bound of the for loops to
> a variable.
Yes. this way is more wise.

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
