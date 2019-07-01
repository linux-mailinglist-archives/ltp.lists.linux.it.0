Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E65B587
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:12:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 59DC83C1DBE
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 09:12:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9DB9F3C1D7C
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:12:28 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 66CC71401118
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 09:12:25 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="70350136"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Jul 2019 15:12:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id E883B4CDE8CC;
 Mon,  1 Jul 2019 15:12:23 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 1 Jul 2019 15:12:24 +0800
Message-ID: <5D19B256.5080609@cn.fujitsu.com>
Date: Mon, 1 Jul 2019 15:12:22 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
References: <20190628103900.10113-1-po-hsu.lin@canonical.com>
 <5D19A7E1.10607@cn.fujitsu.com>
 <CAMy_GT96S3dVkevTkE2GUwyz_ugFjb1RsHd_ATARUB-BaYQo6Q@mail.gmail.com>
In-Reply-To: <CAMy_GT96S3dVkevTkE2GUwyz_ugFjb1RsHd_ATARUB-BaYQo6Q@mail.gmail.com>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: E883B4CDE8CC.AE0B7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] scenario_groups/default: run the kernel_misc test
 after the cve test
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

On 2019/07/01 14:58, Po-Hsu Lin wrote:
> Hello,
>
> I am not sure if we can restore the value in /proc/sys/kernel/tainted,
> which can be changed manually:
>      # cat  /proc/sys/kernel/tainted
>      0
>      # echo 12800>  /proc/sys/kernel/tainted
>      # cat  /proc/sys/kernel/tainted
>      12800
> But it can't be reset back to 0.
Hi,

It seems that the value of /proc/sys/kernel/tainted only be increased.

Best Regards,
Xiao Yang
> > From the Documentation/admin-guide/tainted-kernels.rst, it states that:
> "Note the kernel will remain tainted even after you undo what caused the taint
> (i.e. unload a proprietary kernel module), to indicate the kernel remains not
> trustworthy."
>
> Thanks
>
> On Mon, Jul 1, 2019 at 2:27 PM Xiao Yang<yangx.jy@cn.fujitsu.com>  wrote:
>> Hi,
>>
>> Your patch just workarounds the issue for now, because it still happens
>> if a new test designed to taint
>> kernel is added to the group before cve group in future.
>>
>> Could we save the value of tainted before running block_dev and then
>> restore it after running block_dev?
>>
>> Best Regards,
>> Xiao Yang
>> On 2019/06/28 18:39, Po-Hsu Lin wrote:
>>> The block_dev test in kernel_misc will taint kernel with a warning flag,
>>> this is an expected behaviour.
>>>
>>> However, if you run the cve-2017-17053 after it, as the test is looking
>>> for a warning / died flag for a tainted kernel, it will cause false
>>> alarm with:
>>>     tst_taint.c:88: BROK: Kernel is already tainted: 14849
>>>
>>> The kernel_misc test was executed before the cve test in the default
>>> test plan. Move the kernel_misc test to the end of the list to
>>> workaround this issue.
>>>
>>> Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
>>> ---
>>>    scenario_groups/default | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scenario_groups/default b/scenario_groups/default
>>> index 1f3e5b27f..e5b34782c 100644
>>> --- a/scenario_groups/default
>>> +++ b/scenario_groups/default
>>> @@ -22,7 +22,6 @@ power_management_tests
>>>    hugetlb
>>>    commands
>>>    hyperthreading
>>> -kernel_misc
>>>    fs_ext4
>>>    can
>>>    cpuhotplug
>>> @@ -30,3 +29,4 @@ net.ipv6_lib
>>>    input
>>>    cve
>>>    crypto
>>> +kernel_misc
>>
>>
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
