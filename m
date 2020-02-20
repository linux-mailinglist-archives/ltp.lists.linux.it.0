Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA784165B8E
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 11:31:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA0DD3C223E
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 11:31:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A85903C2231
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 11:31:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 80102602041
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 11:31:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,463,1574092800"; d="scan'208";a="83629522"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Feb 2020 18:31:24 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D9E45406AB15;
 Thu, 20 Feb 2020 18:21:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 20 Feb 2020 18:31:19 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200220095908.14980-1-chrubis@suse.cz>
 <c2168ced-4634-a7d4-7112-ac8e2ceba830@cn.fujitsu.com>
 <20200220101811.GA11142@rei>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <d6202108-5f3d-c25f-bb0f-baf21a4e2260@cn.fujitsu.com>
Date: Thu, 20 Feb 2020 18:31:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200220101811.GA11142@rei>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D9E45406AB15.AA607
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fgetxattr02: Use loop instead of RAM disk
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



Hi
> Hi!
>>> which makes this test fail with ENXIO when we attempt to open the block
>>> device in the test setup.
>>>
>>> LTP depends on heavily on loop device driver already so it makes sense
>>> to switch over to a loop device backed block device instead.
>>>
>>> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
>>> ---
>>>    testcases/kernel/syscalls/fgetxattr/fgetxattr02.c | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c b/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
>>> index 02e81810a..82fb676be 100644
>>> --- a/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
>>> +++ b/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
>>> @@ -210,7 +210,8 @@ static void setup(void)
>>>    	size_t i = 0;
>>>    	struct sockaddr_un sun;
>>>    
>>> -	dev_t dev = makedev(1, 3);
>>> +	dev_t chr_dev = makedev(1, 3);
>>> +	dev_t blk_dev = makedev(7, 3);
>>    Can we use tst_find_free_loopdev to avoid a fixed loop dev like
>> copy_file_range02.c?
> 
> I do not think that it matters here, we are not actually touching the
> block device here, we just need to be able to open the block device so
> that we can add an attribute to the file we have created. I does not
> matter if it's used or not.
Sound reasonable, feel free to add
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
