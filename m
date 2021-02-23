Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83D32251B
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 06:15:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC2E83C612D
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 06:15:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8B3763C58DB
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 06:15:39 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5A0EC1000991
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 06:15:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,199,1610380800"; d="scan'208";a="104754733"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Feb 2021 13:15:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 93CA24CE731E;
 Tue, 23 Feb 2021 13:15:30 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 23 Feb 2021 13:15:19 +0800
Message-ID: <60348F6E.2040302@cn.fujitsu.com>
Date: Tue, 23 Feb 2021 13:15:26 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Zhao Gongyi <zhaogongyi@huawei.com>
References: <20210223033738.22666-1-zhaogongyi@huawei.com>
In-Reply-To: <20210223033738.22666-1-zhaogongyi@huawei.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 93CA24CE731E.ACE05
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpu_hotplug: Add executable file's path
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

Hi Gongyi
> When env PATH is not include current path, run cpuhotplug_do_disk_write_loop/
> cpuhotplug_do_spin_loop/cpuhotplug_do_kcompile_loop/
> cpuhotplug_report_proc_interrupts will fail.
>
This patch is useless.

For shell-script case, usually, runltp will set environment variables. 
or, you need to set environment variables yourself if not want to use 
runltp(more info see[1]).
For cpuhotplug02 case, we can run as below:
#export LTPROOT=/opt/ltp
#export PATH="$PATH:$LTPROOT/testcases/bin"
#cpuhotplug02.sh -c 1 -l 1

[1]https://github.com/linux-test-project/ltp/blob/master/README.md

Best Regards
Yang Xu
> For those:
> 	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
> 	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
> 	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
> 	testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
>
> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> ---
>   .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh     | 4 ++--
>   .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh     | 2 +-
>   .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh     | 2 +-
>   .../kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh     | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
> index 1ba937cc7..b1c8a9b97 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug01.sh
> @@ -137,7 +137,7 @@ cpu_states=$(get_all_cpu_states)
>   CPU_COUNT=0
>
>   # Start up a process that writes to disk; keep track of its PID
> -cpuhotplug_do_disk_write_loop>  /dev/null 2>&1&
> +./cpuhotplug_do_disk_write_loop>  /dev/null 2>&1&
>   WRL_ID=$!
>
>   until [ $LOOP_COUNT -gt $HOTPLUG01_LOOPS ]
> @@ -181,7 +181,7 @@ do
>   	# Print out a report showing the changes in IRQs
>   	echo
>   	echo
> -	cpuhotplug_report_proc_interrupts "$IRQ_START" "$IRQ_END"
> +	./cpuhotplug_report_proc_interrupts "$IRQ_START" "$IRQ_END"
>   	echo
>
>   	sleep $TM_DLY
> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
> index 792f8cd73..f8a1395c1 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug02.sh
> @@ -77,7 +77,7 @@ fi
>   TST_CLEANUP=do_clean
>
>   # Start up a process that just uses CPU cycles
> -cpuhotplug_do_spin_loop>  /dev/null&
> +./cpuhotplug_do_spin_loop>  /dev/null&
>   SPIN_LOOP_PID=$!
>
>   sleep 5
> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
> index 9ea49f0e1..75a05a3c9 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug03.sh
> @@ -102,7 +102,7 @@ until [ $LOOP_COUNT -gt $HOTPLUG03_LOOPS ]; do
>   	# so we can kill them later.
>   	number_of_procs=$((cpus_num*2))
>   	until [ $number_of_procs -eq 0 ]; do
> -		cpuhotplug_do_spin_loop>  /dev/null 2>&1&
> +		./cpuhotplug_do_spin_loop>  /dev/null 2>&1&
>   		echo $!>>  /var/run/hotplug4_$$.pid
>   		number_of_procs=$((number_of_procs-1))
>   	done
> diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
> index 278304618..e8ab78e8c 100755
> --- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
> +++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug07.sh
> @@ -81,7 +81,7 @@ fi
>
>   TST_CLEANUP=do_clean
>
> -cpuhotplug_do_kcompile_loop $KERNEL_DIR>  /dev/null 2>&1&
> +./cpuhotplug_do_kcompile_loop $KERNEL_DIR>  /dev/null 2>&1&
>   KCOMPILE_LOOP_PID=$!
>
>   tst_resm TINFO "initial CPU affinity for kernel compile is: \
> --
> 2.17.1
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
