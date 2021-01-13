Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D94232F4FD6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 17:22:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33B7E3C5DC3
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 17:22:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EFF653C2698
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 17:22:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 00F5F1400258
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 17:22:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C442AD57;
 Wed, 13 Jan 2021 16:22:34 +0000 (UTC)
Date: Wed, 13 Jan 2021 17:23:32 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <X/8ehCeZbWs6TIA4@yuki.lan>
References: <X/29dySZb8kL5Nms@rei.lan>
 <1610539423-4315-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610539423-4315-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] cpuset: skip test when cpu or nodes are not
 numbered continously from 0
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

Hi!
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> index f4365af2c..5b1bde114 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> @@ -26,23 +26,34 @@
>  
>  . test.sh
>  
> +cpu_string="`cat /sys/devices/system/cpu/online`"
>  NR_CPUS=`tst_ncpus`
> +
>  if [ -f "/sys/devices/system/node/has_high_memory" ]; then
> -	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
> +	mem_string="`cat /sys/devices/system/node/has_high_memory`"
>  else
> -	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
> +	mem_string="`cat /sys/devices/system/node/has_normal_memory`"
>  fi
> +N_NODES="`echo $mem_string | tr ',' ' '`"
>  count=0
> +final_node=0
>  for item in $N_NODES; do
>  	delta=1
>  	if [ "${item#*-*}" != "$item" ]; then
>  		delta=$((${item#*-*} - ${item%*-*} + 1))
>  	fi
> +	final_node=${item#*-*}
>  	count=$((count + $delta))
>  done
> +final_node=`expr $final_node + 1`

Why don't we use $(()) as in the rest of the code?

>  N_NODES=$count
>  
> -mem_string="$N_NODES"
> +final_cpu=0
> +N_CPUS="`echo $cpu_string | tr ',' ' '`"
> +for item in $N_CPUS; do
> +	final_cpu=${item#*-*}
> +done
> +final_cpu=`expr $final_cpu + 1`

Here as well.

>  CPUSET="/dev/cpuset"
>  CPUSET_TMP="/tmp/cpuset_tmp"
> @@ -78,6 +89,12 @@ ncpus_check()
>  	if [ $NR_CPUS -lt $1 ]; then
>  		tst_brkm TCONF "The total of CPUs is less than $1"
>  	fi
> +	# check online cpu whether match 0-num
> +	if [ $final_cpu -eq $NR_CPUS ]; then
> +		tst_resm TINFO "cpus enable continuously from 0($cpu_string)"
                                     ^
				     This does not make much sense.

This should probably be:
	"CPUs numbered continuously starting at 0 ($cpu_string)"


> +	else
> +		tst_brkm TCONF "cpus don't enable continuously from 0($cpu_string)"

Here it should be:
	"CPUs are not numbered continuously starting at 0 ($cpu_string)"

> +	fi
>  }
>  
>  nnodes_check()
> @@ -85,6 +102,12 @@ nnodes_check()
>  	if [ $N_NODES -lt $1 ]; then
>  		tst_brkm TCONF "The total of nodes is less than $1"
>  	fi
> +	# check online whether match 0-num
> +	if [ $final_node -eq $count ]; then
                               ^
			I guess that N_NODES would be better here.

> +		tst_resm TINFO "nodes enable continuously from 0($mem_string)"
> +	else
> +		tst_brkm TCONF "nodes don't enable continuously from 0($mem_string)"

These two messages should be adjusted as well.

> +	fi
>  }
>  
>  user_check()
> -- 
> 2.23.0
> 
> 
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
