Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9DA3478
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 11:51:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9EF83C2043
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 11:51:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F0EB73C04F4
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 11:50:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 58E121A03FEC
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 11:50:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,446,1559491200"; d="scan'208";a="74580262"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Aug 2019 17:50:53 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id DE4034CE089F;
 Fri, 30 Aug 2019 17:50:51 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 30 Aug 2019 17:50:51 +0800
Message-ID: <5D68F179.3000402@cn.fujitsu.com>
Date: Fri, 30 Aug 2019 17:50:49 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <yangx.jy@cn.fujitsu.com>, Petr Vorel <pvorel@suse.cz>
References: <1566987255-3010-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190829203826.GA5711@dell5510> <5D688449.3080906@cn.fujitsu.com>
In-Reply-To: <5D688449.3080906@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: DE4034CE089F.AE75F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] runtest/syscalls: add set_mempolicy*
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

on 2019/08/30 10:04, Xiao Yang wrote:

> On 2019/08/30 4:38, Petr Vorel wrote:
>> Hi,
>>> Since commit 55ee8a5ad ("syscalls: Add set_mempolicy numa tests"),
>>> these cases have been added into runtests/numa, but forget to add it
>>> in runtest/syscalls.
>>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> Reviewed-by: Petr Vorel<pvorel@suse.cz>
>>> ---
>>>    runtest/syscalls | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>> diff --git a/runtest/syscalls b/runtest/syscalls
>>> index c41ba2a0d..1694ef147 100644
>>> --- a/runtest/syscalls
>>> +++ b/runtest/syscalls
>>> @@ -1177,6 +1177,11 @@ setitimer01 setitimer01
>>>    setitimer02 setitimer02
>>>    setitimer03 setitimer03
>>> +set_mempolicy01 set_mempolicy01
>>> +set_mempolicy02 set_mempolicy02
>>> +set_mempolicy03 set_mempolicy03
>>> +set_mempolicy04 set_mempolicy04
>>> +
>>>    setns01 setns01
>>>    setns02 setns02
>> Wouldn't be better to move all NUMA tests out of syscalls?
>> Syscalls are big already.
> Hi Petr,
> all NUMA tests actually verify the functionality of
> syscalls(move_pages(2), set_mempolicy(2), etc)
> so I think that they can be added into syscalls group.
> PS: If someone want to run syscalls from LTP as many as possible, they
> just need to run syscalls group directly.
+1 , set_mempolicy syscall should belong to numa and syscall group.

> Best Regards,
> Xiao Yang
>> BTW I'm looking forward to the new testrunner [1][2], which also solve problem
>> of runtest files :)
Hi Petr

For new testrunner,  I think it is a good improvement to save test time by parallel running case.
I am also looking forward to it.

>> Kind regards,
>> Petr
>> [1] https://people.kernel.org/metan/towards-parallel-kernel-test-runs
>> [2] https://github.com/metan-ucw/ltp/tree/master/docparse
>> .
> .




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
