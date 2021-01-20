Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FBC2FC705
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 02:45:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA5863C53EC
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 02:45:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 296793C24E4
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 02:45:14 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 63C79600786
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 02:45:12 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,359,1602518400"; d="scan'208";a="103641035"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jan 2021 09:45:10 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B64094CE603F;
 Wed, 20 Jan 2021 09:45:09 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 20 Jan 2021 09:45:03 +0800
Message-ID: <60078B41.4020906@cn.fujitsu.com>
Date: Wed, 20 Jan 2021 09:45:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <X/8ehCeZbWs6TIA4@yuki.lan>
 <1610590728-15813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <600543C9.9080708@cn.fujitsu.com> <YAbAvorwMJUaeIGP@pevik>
In-Reply-To: <YAbAvorwMJUaeIGP@pevik>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B64094CE603F.AAD30
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] cpuset: skip test when cpu or nodes are
 not numbered continuously from 0
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

Hi Petr
> Hi Xu,
>
>>> These cpuset cases(cpuset_base_ops_test, cpuset_hierarchy_test, cpuset_inherit_test...)
>>> seem all not consider the situation(cpus/memory are not numbered continuously). It is
>>> continuously from 0 as default. Skip test if there are not numbered continuously to
>>> avoid unexpected error.
>
>>> This patch also fix cpu_inherit error by using original mem value.
>
>>> cpuset_inherit case fails on 4 numa nodes pc, as below:
>>> cpuset_inherit 1 TPASS: cpus: Inherited information is right!
>>> cpuset_inherit 3 TPASS: cpus: Inherited information is right!
>>> cpuset_inherit 5 TPASS: cpus: Inherited information is right!
>>> cpuset_inherit 7 TPASS: cpus: Inherited information is right!
>>> cpuset_inherit 9 TPASS: cpus: Inherited information is right!
>>> cpuset_inherit 11 TPASS: cpus: Inherited information is right!
>>> cpuset_inherit 13 TPASS: mems: Inherited information is right!
>>> cpuset_inherit 15 TPASS: mems: Inherited information is right!
>>> cpuset_inherit 17 TPASS: mems: Inherited information is right!
>>> cpuset_inherit 19 TPASS: mems: Inherited information is right!
>>> cpuset_inherit 21 TPASS: mems: Inherited information is right!
>>> cpuset_inherit 23 TFAIL: mems: Test result - 0-3 Expected string - "4"
>
> Good catch :).
>
> BTW how this happen? hot-unplug on lpar?
> Maybe add brief note about it into commit message.
I have added it and merged this patchset, thanks for you and cyril's review.
>
> Reviewed-by: Petr Vorel<pvorel@suse.cz>
>
> ...
>>> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
>>> @@ -26,23 +26,34 @@
>
>>>    . test.sh
>
>>> +cpu_string="`cat /sys/devices/system/cpu/online`"
>>>    NR_CPUS=`tst_ncpus`
>>> +
>>>    if [ -f "/sys/devices/system/node/has_high_memory" ]; then
>>> -	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
>>> +	mem_string="`cat /sys/devices/system/node/has_high_memory`"
>>>    else
>>> -	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
>>> +	mem_string="`cat /sys/devices/system/node/has_normal_memory`"
>>>    fi
>>> +N_NODES="`echo $mem_string | tr ',' ' '`"
>
> nit: I'd personally do:
>
> f="/sys/devices/system/node/has_high_memory"
> [ -f "$f" ] || f="/sys/devices/system/node/has_normal_memory"
> N_NODES="$(cat $f | tr ',' ' ')"
>
> but that's a tiny detail.
>
> It'd be great to rewrite these tests into C.
Yes, I will create a issue to avoid we forget this.
>
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
