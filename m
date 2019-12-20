Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5146F127668
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 08:19:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD0083C243A
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 08:19:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5155C3C1C90
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 08:19:55 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A53FB20297E
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 08:19:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,334,1571673600"; d="scan'208";a="80560357"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 15:19:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 106A54CE1C9A;
 Fri, 20 Dec 2019 15:11:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 20 Dec 2019 15:19:46 +0800
To: Pengfei Xu <pengfei.xu@intel.com>
References: <20191219131855.28799-1-pengfei.xu@intel.com>
 <20191219131855.28799-4-pengfei.xu@intel.com>
 <9ac02979-d8ec-4a11-7705-bb484dd79a20@cn.fujitsu.com>
 <20191220060151.nqvekuzs24yipia7@xpf-desktop>
 <5e859ac0-d009-3281-e712-fc86f7c72986@cn.fujitsu.com>
 <20191220070926.i4jknfoo6pdhersl@xpf-desktop>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <257bd5cb-1277-def3-f4ac-e20b15e4273d@cn.fujitsu.com>
Date: Fri, 20 Dec 2019 15:19:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191220070926.i4jknfoo6pdhersl@xpf-desktop>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 106A54CE1C9A.A19AC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/4] lib: add any kconfig to match the expected
 value function document
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Pengfei
> Hi Xu,
>    Due to memory copy, there is some bit and display issue in last string.
> 
>    So for your question, for CONFIG_A|CONFIG_B without expect value, maybe y
>    or m.
>    We could add it with below style:
>    "CONFIG_A|CONFIG_B|NA", and add it into guidelines, NA will not be solved,
>    actually you could fill with any string after last '|'.
>    Is it ok?
It sounds reasonable. I think it is ok.

Kind Regards
Yang Xu
> 
>    Thanks!
> 
> On 2019-12-20 at 14:00:00 +0800, Yang Xu wrote:
>> Hi Pengfei
>>> Hi Xu,
>>>
>>>
>>>> Before your patch, I know we can use the following two formats kconfigs
>>>> CONFIG_A
>>>> CONFIG_A=y/m/v
>>>> after your patch set, we can use the following three formats kconfigs
>>>> CONFIG_A
>>>> CONFIG_A=y/m/v
>>>> CONFIG_A|CONFIGB=y/m/v
>>>> As the usual extend logic,  we think  CONFIGA|CONFIGB is also ok. But in
>>>> fact, we use "|" or "=" to delim string. So  we can't parse CONFIGA|CONFIGB
>>>> correctly. So, if we can tell user or developer about this in here, it will
>>>> be better.
>>>>
>>>> ps: we can add configA| config B test in your third patch.
>>>>
>>>     Actually present patch could support CONFIG_A|CONFIG_B style, and it works
>>> well, you could change "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y" to
>>> "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP" in test_kconfig.c and have a try. : )
>> "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP" is useful because
>> CONFIG_X86_INTEL_UMIP is in our kernel configs . If you use
>> "CONFIG_X86_UMIP|CONFIG_X86_INTEL_UMIP", it will report error.
>>
>> Kind Regards
>> Yang Xu
>>>
>>> Thanks!
>>>> Kind Regards
>>>> Yang Xu
>>>>>     #include "tst_test.h"
>>>>>     static const char *kconfigs[] = {
>>>>> -	"CONFIG_X86_INTEL_UMIP",
>>>>> +	"CONFIG_EXT4_FS=y",
>>>>> +	"CONFIG_MMU",
>>>>> +	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
>>>>>     	NULL
>>>>>     };
>>>>>
>>>>
>>>>
>>>
>>>
>>
>>
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
