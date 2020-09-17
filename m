Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EF026D2F5
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 07:21:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F3203C2AC2
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 07:21:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CC2223C13D9
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 07:21:31 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4F2BD600A9E
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 07:21:29 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,435,1592841600"; d="scan'208";a="99339420"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Sep 2020 13:21:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5076B48990C1
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 13:21:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 17 Sep 2020 13:21:24 +0800
To: Chen Hanxiao <chenhx.fnst@cn.fujitsu.com>, <ltp@lists.linux.it>
References: <20200911092121.1917-1-chenhx.fnst@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7584a7ab-bc37-111f-f9bf-38da2d1e8099@cn.fujitsu.com>
Date: Thu, 17 Sep 2020 13:21:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911092121.1917-1-chenhx.fnst@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5076B48990C1.A89A5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_use_hierarchy_test.sh: skip setting
 use_hierarchy if not available
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

Hi hanxiao


> The precondition of this case is that we can disable use_hierarchy.
> But some distributions such as CentOS 8 had enabled it in root
> cgroup and hard to disabled.
> 
> As [1] describe:
>      NOTE1: Enabling/disabling will fail if either the cgroup already has other
>         cgroups created below it, or if the parent cgroup has use_hierarchy
>         enabled.
> 
> We should check the precondition before testing.
> 
> [1] https://www.kernel.org/doc/Documentation/cgroup-v1/memory.txt
> 
> Signed-off-by: Chen Hanxiao <chenhx.fnst@cn.fujitsu.com>
> ---
>   .../controllers/memcg/functional/memcg_lib.sh | 25 +++++++++++++++----
>   .../functional/memcg_use_hierarchy_test.sh    | 12 +++++++--
>   2 files changed, 30 insertions(+), 7 deletions(-)
> 
> diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> index 22ef4f5e2..4f99c6f59 100755
> --- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> +++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> @@ -491,6 +491,10 @@ cleanup_test()
>   		orig_memory_use_hierarchy=""
>   	fi
>   
> +	if [ -n "$root_memory_use_hierarchy" ];then
> +                root_memory_use_hierarchy=""
> +	fi
> +
>   	killall -9 memcg_process 2>/dev/null
>   	wait
>   
> @@ -514,16 +518,27 @@ setup_test()
>   	# while there are distributions (RHEL7U0Beta for example) that sets
>   	# it to 1.
>   	orig_memory_use_hierarchy=$(cat /dev/memcg/memory.use_hierarchy)
> +        MEMCGROUP_PATH="/sys/fs/cgroup/memory"
> +        if [ -e "$MEMCGROUP_PATH" ];then
> +                root_memory_use_hierarchy=$(cat "$MEMCGROUP_PATH/memory.use_hierarchy")
> +        fi
> +
>   	if [ -z "$orig_memory_use_hierarchy" ];then
>   		tst_resm TINFO "cat /dev/memcg/memory.use_hierarchy failed"
>   	elif [ "$orig_memory_use_hierarchy" = "0" ];then
>   		orig_memory_use_hierarchy=""
>   	else
> -		echo 0 > /dev/memcg/memory.use_hierarchy
> -		if [ $? -ne 0 ];then
> -			tst_resm TINFO "set /dev/memcg/memory.use_hierarchy" \
> -				"to 0 failed"
> -		fi
> +                if [ "$root_memory_use_hierarchy" = "1" ]; then
> +                        tst_resm TINFO "root cgroup has use_hierarchy enabled, " \
> +                            "can't set /dev/memcg/memory.use_hierarchy to 0"
> +                        export root_memory_use_hierarchy
> +                else
> +                        echo 0 > /dev/memcg/memory.use_hierarchy
> +                        if [ $? -ne 0 ];then
> +                                tst_resm TINFO "set /dev/memcg/memory.use_hierarchy" \
> +                                    "to 0 failed"
> +                        fi
> +                fi
I test this patch on centos7 and testcase2 skips. On centos7(without 
installing docker), /sys/fs/cgroup/memory/memory.use_hierarchy value is 
equal to 1 and I still can disable value for 
/dev/memcg/memory.use_hierarchy.

So why not directly use /dev/memcg/memory.use_hierarchy value to judge 
in testcase after setting 0.

Best Regards
Yang Xu
>   	fi
>   
>   	ROD mkdir "/dev/memcg/$TEST_ID"
> diff --git a/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
> index 4cf6b9fc2..1439b6352 100755
> --- a/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
> +++ b/testcases/kernel/controllers/memcg/functional/memcg_use_hierarchy_test.sh
> @@ -34,7 +34,9 @@ TST_TOTAL=3
>   # test if one of the ancestors goes over its limit, the proces will be killed
>   testcase_1()
>   {
> -	echo 1 > memory.use_hierarchy
> +        if [ "$root_memory_use_hierarchy" != "1" ]; then
> +                echo 1 > memory.use_hierarchy
> +        fi
>   	echo $PAGESIZE > memory.limit_in_bytes
>   
>   	mkdir subgroup
> @@ -48,6 +50,10 @@ testcase_1()
>   # test Enabling will fail if the cgroup already has other cgroups
>   testcase_2()
>   {
> +        if [ "$root_memory_use_hierarchy" = "1" ]; then
> +               tst_resm TCONF "root cgroup has use_hierarchy enabled, skip"
> +               return
> +        fi
>   	mkdir subgroup
>   	EXPECT_FAIL echo 1 \> memory.use_hierarchy
>   
> @@ -57,7 +63,9 @@ testcase_2()
>   # test disabling will fail if the parent cgroup has enabled hierarchy.
>   testcase_3()
>   {
> -	echo 1 > memory.use_hierarchy
> +        if [ "$root_memory_use_hierarchy" != "1" ]; then
> +               echo 1 > memory.use_hierarchy
> +        fi
>   	mkdir subgroup
>   	EXPECT_FAIL echo 0 \> subgroup/memory.use_hierarchy
>   
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
