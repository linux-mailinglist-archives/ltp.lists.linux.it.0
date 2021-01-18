Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B622F9B0E
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 09:15:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B4823C30BE
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 09:15:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id ADD603C25D8
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 09:15:42 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4DAAF2009AA
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 09:15:40 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="103575870"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Jan 2021 16:15:37 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 0D5944CE603D;
 Mon, 18 Jan 2021 16:15:34 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 Jan 2021 16:15:36 +0800
Message-ID: <600543C9.9080708@cn.fujitsu.com>
Date: Mon, 18 Jan 2021 16:16:09 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <chrubis@suse.cz>
References: <X/8ehCeZbWs6TIA4@yuki.lan>
 <1610590728-15813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1610590728-15813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 0D5944CE603D.AF86E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

HI Cyril
ping.

Best Regards
Yang Xu
> These cpuset cases(cpuset_base_ops_test, cpuset_hierarchy_test, cpuset_inherit_test...)
> seem all not consider the situation(cpus/memory are not numbered continuously). It is
> continuously from 0 as default. Skip test if there are not numbered continuously to
> avoid unexpected error.
> 
> This patch also fix cpu_inherit error by using original mem value.
> 
> cpuset_inherit case fails on 4 numa nodes pc, as below:
> cpuset_inherit 1 TPASS: cpus: Inherited information is right!
> cpuset_inherit 3 TPASS: cpus: Inherited information is right!
> cpuset_inherit 5 TPASS: cpus: Inherited information is right!
> cpuset_inherit 7 TPASS: cpus: Inherited information is right!
> cpuset_inherit 9 TPASS: cpus: Inherited information is right!
> cpuset_inherit 11 TPASS: cpus: Inherited information is right!
> cpuset_inherit 13 TPASS: mems: Inherited information is right!
> cpuset_inherit 15 TPASS: mems: Inherited information is right!
> cpuset_inherit 17 TPASS: mems: Inherited information is right!
> cpuset_inherit 19 TPASS: mems: Inherited information is right!
> cpuset_inherit 21 TPASS: mems: Inherited information is right!
> cpuset_inherit 23 TFAIL: mems: Test result - 0-3 Expected string - "4"
> 
> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   .../kernel/controllers/cpuset/cpuset_funcs.sh | 29 +++++++++++++++++--
>   1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> index f4365af2c..84b87d17e 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> @@ -26,23 +26,34 @@
> 
>   . test.sh
> 
> +cpu_string="`cat /sys/devices/system/cpu/online`"
>   NR_CPUS=`tst_ncpus`
> +
>   if [ -f "/sys/devices/system/node/has_high_memory" ]; then
> -	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
> +	mem_string="`cat /sys/devices/system/node/has_high_memory`"
>   else
> -	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
> +	mem_string="`cat /sys/devices/system/node/has_normal_memory`"
>   fi
> +N_NODES="`echo $mem_string | tr ',' ' '`"
>   count=0
> +final_node=0
>   for item in $N_NODES; do
>   	delta=1
>   	if [ "${item#*-*}" != "$item" ]; then
>   		delta=$((${item#*-*} - ${item%*-*} + 1))
>   	fi
> +	final_node=${item#*-*}
>   	count=$((count + $delta))
>   done
> +final_node=$((final_node + 1))
>   N_NODES=$count
> 
> -mem_string="$N_NODES"
> +final_cpu=0
> +N_CPUS="`echo $cpu_string | tr ',' ' '`"
> +for item in $N_CPUS; do
> +	final_cpu=${item#*-*}
> +done
> +final_cpu=$((final_cpu + 1))
> 
>   CPUSET="/dev/cpuset"
>   CPUSET_TMP="/tmp/cpuset_tmp"
> @@ -78,6 +89,12 @@ ncpus_check()
>   	if [ $NR_CPUS -lt $1 ]; then
>   		tst_brkm TCONF "The total of CPUs is less than $1"
>   	fi
> +	# check online cpus whether match 0-num
> +	if [ $final_cpu -eq $NR_CPUS ]; then
> +		tst_resm TINFO "CPUs are numbered continuously starting at 0 ($cpu_string)"
> +	else
> +		tst_brkm TCONF "CPUs are not numbered continuously starting at 0 ($cpu_string)"
> +	fi
>   }
> 
>   nnodes_check()
> @@ -85,6 +102,12 @@ nnodes_check()
>   	if [ $N_NODES -lt $1 ]; then
>   		tst_brkm TCONF "The total of nodes is less than $1"
>   	fi
> +	# check online nodes whether match 0-num
> +	if [ $final_node -eq $N_NODES ]; then
> +		tst_resm TINFO "Nodes are numbered continuously starting at 0 ($mem_string)"
> +	else
> +		tst_brkm TCONF "Nodes are not numbered continuously starting at 0 ($mem_string)"
> +	fi
>   }
> 
>   user_check()




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
