Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA2F2EF2FE
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 14:25:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28C6F3C313D
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 14:25:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 1748D3C0722
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 14:25:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3BA2E10007AE
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 14:25:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4B531ACAF;
 Fri,  8 Jan 2021 13:25:45 +0000 (UTC)
Date: Fri, 8 Jan 2021 14:26:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <X/hdjNT81M9CxbaD@yuki.lan>
References: <1606701966-1596-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606701966-1596-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_inherit: Use the original mem value
 instead of N_NODES
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
> Since ltp commit cf33086a1ca, we add cgroup.clone_children switch for
> cpuset.cpus and mems, we used the original memory value to set in cpuset_inherit case.
> 
> After ltp commit 6872ad15a, we improve the node number calculation for N_NODES,
> so it can calculate for N_NODES obtained from the file contains only "0,8".
> 
> But it doesn't think about this patch will affect mem_string value, so this
> cpuset_inherit case will fail on 4 numa nodes pc, as below:
> 
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
> Fix this by using original mem value.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/controllers/cpuset/cpuset_funcs.sh        | 7 +++----
>  .../cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh   | 6 ++----
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> index f4365af2c..b469140ca 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
> @@ -28,10 +28,11 @@
>  
>  NR_CPUS=`tst_ncpus`
>  if [ -f "/sys/devices/system/node/has_high_memory" ]; then
> -	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
> +	mem_string="`cat /sys/devices/system/node/has_high_memory`"
>  else
> -	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
> +	mem_string="`cat /sys/devices/system/node/has_normal_memory`"
>  fi
> +N_NODES="`echo $mem_string | tr ',' ' '`"
>  count=0
>  for item in $N_NODES; do
>  	delta=1
> @@ -42,8 +43,6 @@ for item in $N_NODES; do
>  done
>  N_NODES=$count
>  
> -mem_string="$N_NODES"
> -
>  CPUSET="/dev/cpuset"
>  CPUSET_TMP="/tmp/cpuset_tmp"
>  CLONE_CHILDREN="/dev/cpuset/cgroup.clone_children"
>
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
> index 73eed2cb9..27ff19532 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
> @@ -31,10 +31,8 @@ export TST_COUNT=1
>  check 1 1
>  
>  nr_cpus=$NR_CPUS
> -nr_mems=$N_NODES
>  
>  cpus_all="$(seq -s, 0 $((nr_cpus-1)))"
> -mems_all="$(seq -s, 0 $((nr_mems-1)))"
>  
>  exit_status=0
>  
> @@ -134,10 +132,10 @@ test_mems()
>  	done <<- EOF
>  		0	NULL					EMPTY
>  		0	0					EMPTY
> -		0	$mems_all				EMPTY
> +		0	$mem_string				EMPTY
>  		1	NULL					EMPTY
>  		1	0					0
> -		1	$mems_all				$mem_string
> +		1	$mems_string				$mem_string
>  	EOF
>  	# while read mems result
>  }

I guess that it looks okay to me. I guess that we can commit this before
the release, so acked.

But don't we have the same problem for cpus_all? If we, for instance,
have a machine where cpus are not numbered continously we will fail as
well, right?

I guess that a proper fix would be to rewrite the tests to parse the
strings into a bitflag arrays and compare these arrays instead of the
string comparsion and hacks that keeps up pilling up.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
