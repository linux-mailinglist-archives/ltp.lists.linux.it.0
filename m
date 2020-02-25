Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4BC16BE7D
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:20:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89E9A3C25E8
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Feb 2020 11:20:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A88E53C12E6
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:20:41 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id E789B100159B
 for <ltp@lists.linux.it>; Tue, 25 Feb 2020 11:20:38 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,483,1574092800"; d="scan'208";a="83930571"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Feb 2020 18:20:36 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 99FDC50A997A;
 Tue, 25 Feb 2020 18:10:50 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 25 Feb 2020 18:20:33 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200127162016.GD30831@rei.lan>
 <1580969073-27367-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200221160351.GA26393@rei.lan>
 <8d1a7c73-7122-2c3d-6a73-024bed066966@cn.fujitsu.com>
 <20200224142034.GA2210@rei>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1d62bf3e-3f34-fd05-8662-08ff16523673@cn.fujitsu.com>
Date: Tue, 25 Feb 2020 18:20:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200224142034.GA2210@rei>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 99FDC50A997A.AEEA1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] syscalls/fcntl30: clean up && add more
 range test
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
>>> I was playing with the test and it seems that the kernel allocation may
>>> fail even for much smaller sizes for various reasons. I guess that
>>> memory framentation on long running systems may be the culprit here
>>> because kmalloc() allocates physically continuous memory.
>>>
>>> I guess that the safest bet here would be limiting the maximal size we
>>> try to resize the pipe and succeed to something as 8MB which would be
>>> something as 32 pages to allocate.
>>>
>> Agree.
>>> At the same time I would just define the size we expect to fail with
>>> ENOMEM to 1<<30 and that would save us from this architecture specific
>>> trickery that will probably fail on stranger architectures anyway.
>> On 64kb page size, it will over 1 <<30 for ENOMEM error .I think we can
>> test MAX_SIZE+pg_size(< 1<<31) for ENOMEM error. If  beyond 1<<31,
>> expect EINVAL error.
> 
> Hmm, maybe we can just double the size in a loop until we hit either
> ENOMEM or EINVAL then and fail the test if we hit them too soon.
I plan to remove this max test because of unknown kmalloc fail, test 
range as below

         {0, 0, 0, 1, "set a value of below page size"},
         {0, 0, 0, 1, "set a normal value"},             //under 
non-privileged user,maybe 128k (<1024k )
         {0, 0, 1, 1, "set a value of below page size"},
         {0, 0, 1, 1, "set a normal value"},    // test 8M as you suggested,
         {0, 0, 1, 0, "set a value beyond max"},  //expect EINVAL or ENOMEM
};

What do you think about it?

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
