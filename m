Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BB36BCF0
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 03:35:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05AF13C6778
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 03:35:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F7393C19BB
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 03:35:16 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 144782009AB
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 03:35:14 +0200 (CEST)
Received: from dggeml763-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FTklv1GF5z5vhY
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 09:32:43 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggeml763-chm.china.huawei.com (10.1.199.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 09:35:10 +0800
Received: from [10.174.178.100] (10.174.178.100) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 09:35:10 +0800
To: <ltp@lists.linux.it>
References: <1617701249-62196-1-git-send-email-zou_wei@huawei.com>
From: Samuel Zou <zou_wei@huawei.com>
Message-ID: <437bb60b-4f97-4884-8713-c7b619dab211@huawei.com>
Date: Tue, 27 Apr 2021 09:35:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1617701249-62196-1-git-send-email-zou_wei@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.100]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

A friendly reminder for the two patchs in:

https://patchwork.ozlabs.org/project/ltp/patch/1617707717-63693-1-git-send-email-zou_wei@huawei.com/

https://patchwork.ozlabs.org/project/ltp/patch/1617701249-62196-1-git-send-email-zou_wei@huawei.com/

Can someone please review the patchs, comment, and if appropriate commit
them?

Regards,
Zou Wei

On 2021/4/6 17:27, Zou Wei wrote:
> --------------------------
> 
> 1. The method of obtaining $task_cpus from root_cpu_hotplug_test is
> incorrect, because the value of Cpus_allowed_list is related
> to /sys/devices/system/cpu/possible and
> /sys/devices/system/cpu/isolated.
> 
> 2. If isolcpus is configured in cmdline, the value of
> Cpus_allowed_list is equal to /sys/devices/system/cpu/possible minus
> /sys/devices/system/cpu/isolated. In this case, $task_cpus is inconsistent
> with $expect_task_cpus, test will be failed.
> 
> 3. Need to change the method of obtaining $task_cpu
> from /sys/devices/system/cpu/present.
> 
> 4. The description of cpu_present_mask:
>     Bitmap of CPUs currently present in the system.
>     Not all of them may be online. When physical hotplug is processed
>     by the relevant subsystem (e.g ACPI) can change and new bit either be
>     added or removed from the map depending on the event is
>     hot-add/hot-remove. There are currently no locking rules as of now.
>     Typical usage is to init topology during boot,
>     at which time hotplug is disabled.
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   .../controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh      | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
> index 155e536..2c6993a 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
> @@ -93,8 +93,7 @@ root_cpu_hotplug_test()
>   
>   	root_cpus="`cat $CPUSET/cpuset.cpus`"
>   
> -	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
> -	task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
> +	task_cpus="`cat /sys/devices/system/cpu/present`"
>   
>   	check_result "$root_cpus" "$expect_cpus"
>   	ret=$?
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
