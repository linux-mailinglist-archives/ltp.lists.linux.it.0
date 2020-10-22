Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 168A3295850
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:27:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32C8E3C5683
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:27:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 519F23C25E9
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:27:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 987D3140112F
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:27:16 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,403,1596470400"; d="scan'208";a="100399096"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Oct 2020 14:27:15 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 0FE224CE34F4;
 Thu, 22 Oct 2020 14:27:15 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Oct 2020 14:27:12 +0800
Message-ID: <5F912641.9090004@cn.fujitsu.com>
Date: Thu, 22 Oct 2020 14:27:13 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <20201021193547.GA49488@x230>
 <CAEemH2cAeMzbr6WWDOTTNYkU8b+1J+7WEHjGU283r3qWtXP8TA@mail.gmail.com>
 <5F90F214.20102@cn.fujitsu.com> <5F91163D.9030307@cn.fujitsu.com>
 <CAEemH2eUfSgvmDB4EA6i3K6O9CCgiSa8CA5sKLQS2a_wOhDtXw@mail.gmail.com>
 <5F91252F.3040504@cn.fujitsu.com>
In-Reply-To: <5F91252F.3040504@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 0FE224CE34F4.AC1BC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Broken Fedora build
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/10/22 14:22, Yang Xu wrote:
> Hi Li
>> Xiao Yang<yangx.jy@cn.fujitsu.com>  wrote:
>>
>>>>> I prefer to go replace ftime() by gettimeofday() or clock_gettime()
>>>>> way to solve this from root.
>>>> +1
>>>>
>>>> I have seen the hugetlb.c and trace_sched.c code, they all use the
>>>> time to generate a random value for ftok or sched_priority. So using
>>>> gettimeofday() also looks ok.
>>> Hi,
>>>
>>> It is fine for me to replace ftime(), but I wonder if we can remove
>>> fime() and srand()/srandom() directly? :-)
>>> It seems unnecessary to set the seed for random number.
>>
>> That's true, but random() will generate the same number each time.
> Agree. If we don't call srandom, repeatly call random binary will give 
> same  random num. ie
> root@localhost ~]# ./random
> random num 1804289383
> random num 846930886
> random num 1681692777
> random num 1714636915
> random num 1957747793
> random num 424238335
> random num 719885386
> random num 1649760492
> random num 596516649
> random num 1189641421
> [root@localhost ~]# ./random
> random num 1804289383
> random num 846930886
> random num 1681692777
> random num 1714636915
> random num 1957747793
> random num 424238335
> random num 719885386
> random num 1649760492
> random num 596516649
> random num 1189641421
> [root@localhost ~]# cat random.c
> #include <stdlib.h>
> #include <stdio.h>
>
> void main(void)
> {
>         int num,i;
>         for (i=0;i<10;i++) {
>                 num =random();
>                 printf("random num %d\n", num);
>         }
> }
> [root@localhost ~]#
>
> So keep this maybe better.
Hi Li, Yang

Thanks for your replies. It's reasonable for me to keep it. :-)

Best Regards,
Xiao Yang
>
> Best Regards
> Yang Xu
>> I slightly tend to keep setting the seed by srandom() to get a different
>> randomized number for test variety.
>>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
