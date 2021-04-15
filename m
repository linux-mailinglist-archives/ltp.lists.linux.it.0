Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B2360306
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 09:12:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E51903C7031
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 09:12:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0A57F3C1B11
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 09:12:03 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5855B600E26
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 09:11:59 +0200 (CEST)
Received: from localhost (unknown [192.168.167.139])
 by vipregular1.263.net (Postfix) with ESMTP id 66FD230D;
 Thu, 15 Apr 2021 15:11:56 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.43.141] (unknown [122.96.46.111])
 by smtp.263.net (postfix) whith ESMTP id
 P10818T139817492936448S1618470715408592_; 
 Thu, 15 Apr 2021 15:11:55 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <c67d44c41e15154c8c9f4e0940db7698>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-SENDER-IP: 122.96.46.111
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210330104613.1059-1-zhanglianjie@uniontech.com>
 <YHRcJOUer87SUn6v@yuki>
From: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <cded02a5-6668-8524-d588-b965ed1a7086@uniontech.com>
Date: Thu, 15 Apr 2021 15:11:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YHRcJOUer87SUn6v@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Modify the test logic of mincore.
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
>> Currently mincore has a vulnerability and is easy to be attacked.
>> CVE has fixed the vulnerability.
>> Please see https://www.linuxkernelcves.com/cves/CVE-2019-5489
>>
>> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
>> ---
>>   testcases/kernel/syscalls/mincore/mincore04.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/mincore/mincore04.c b/testcases/kernel/syscalls/mincore/mincore04.c
>> index ed0ab7dfa..345dedd9a 100644
>> --- a/testcases/kernel/syscalls/mincore/mincore04.c
>> +++ b/testcases/kernel/syscalls/mincore/mincore04.c
>> @@ -95,12 +95,12 @@ static void test_mincore(void)
>>   	locked_pages = count_pages_in_cache();
>>   	tst_reap_children();
>>
>> -	if (locked_pages == NUM_PAGES)
>> -		tst_res(TPASS, "mincore reports all %d pages locked by child process "
>> -			"are resident", locked_pages);
>> -	else
>> -		tst_res(TFAIL, "mincore reports %d pages resident but %d pages "
>> +	if (locked_pages == 0)
>> +		tst_res(TPASS, "mincore reports %d pages resident but %d pages "
>>   			"locked by child process", locked_pages, NUM_PAGES);
>> +	else
>> +		tst_res(TFAIL, "mincore reports all %d pages locked by child process "
>> +			"are resident", locked_pages);
>>   }
> 
> This does not make any sense, the kernel commit explicitly states that
> all mapped pages are reported as in core. We do call mlock() in the
> child, which will fault all the pages and lock them in memory. So the
> test should work both before and after the fix as well.
> 
> The kernel commit in question weakened mincore() in a sense that it's
> more likely to report pages in core than it previously was. Now all that
> is needed is to fault the pages by reading some bytes from them to make
> sure they are reported as in core.
> 
> If the test fails for you, something is probably broken at your end.
> 

Using the CVE patch on mips, the test will fail because the child 
process mlocks all pages, but the parent process cannot obtain these 
pages through mincore and is locked.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
