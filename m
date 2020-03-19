Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB518ABF7
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 06:10:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1F343C554C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 06:10:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id F03823C29B2
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 06:10:17 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 637B2600829
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 06:10:15 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,570,1574092800"; d="scan'208";a="86580998"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Mar 2020 13:10:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 37D6550A9983;
 Thu, 19 Mar 2020 13:00:03 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 19 Mar 2020 13:10:08 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200127162016.GD30831@rei.lan>
 <1580969073-27367-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200221160351.GA26393@rei.lan>
 <8d1a7c73-7122-2c3d-6a73-024bed066966@cn.fujitsu.com>
 <20200224142034.GA2210@rei>
 <1d62bf3e-3f34-fd05-8662-08ff16523673@cn.fujitsu.com>
 <9e73a02e-7169-7229-8bc0-2ac84129bf31@cn.fujitsu.com>
 <20200318110212.GA1690@haruka.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0bde87a1-c4c4-c9fc-4656-cfcc0ed262a5@cn.fujitsu.com>
Date: Thu, 19 Mar 2020 13:10:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200318110212.GA1690@haruka.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 37D6550A9983.AA64D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

Hi Cyril


> Hi!
>> Ping.
>> diff as below:
>> diff --git a/testcases/kernel/syscalls/fcntl/fcntl30.c
>> b/testcases/kernel/syscalls/fcntl/fcntl30.c
>> index 860d42e8d..28cdee165 100644
>> --- a/testcases/kernel/syscalls/fcntl/fcntl30.c
>> +++ b/testcases/kernel/syscalls/fcntl/fcntl30.c
>> @@ -31,8 +31,7 @@ static struct tcase {
>>           {0, 0, 0, 1, "set a value of below page size"},
>>           {0, 0, 0, 1, "set a normal value"},
>>           {0, 0, 1, 1, "set a value of below page size"},
>> -       {0, 0, 1, 1, "set a normal value"},
>> -       {0, 0, 1, 1, "set a max value"},
>> +       {0, 0, 1, 1, "set a normal value(8M)"},
>>           {0, 0, 1, 0, "set a value beyond max"},
>>    };
>>
>> @@ -145,13 +144,10 @@ static void setup(void)
>>           tcases[2].setsize = (1 << pg_shift) - 1;
>>           tcases[2].expsize = 1 << pg_shift;
>>
>> -       tcases[3].setsize = 2 << pg_shift;
>> -       tcases[3].expsize = 2 << pg_shift;
>> +       tcases[3].setsize = 1 << 23;
>> +       tcases[3].expsize = 1 << 23;
>>
>> -       tcases[4].setsize = 1 << shift;
>> -       tcases[4].expsize = 1 << shift;
>> -
>> -       tcases[5].setsize = (1 << shift) + 1;
>> +       tcases[4].setsize = (1 << shift) + 1;
>>
>>           pw = SAFE_GETPWNAM("nobody");
>>    }
> 
> Do we have to keep the shift in here?
> 
> Given that we are not aiming at a precise value now, we should be fine
> as long as we request the buffer to be a few megabytes in lenght and we
> can drop all the arch specific code from here, right?
Yes, if we don't want to test ENOMEM error, this arch specific code can 
be removed. Since only few people will set so large pipe size and 
trigger this error, I think we can remove this.

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
