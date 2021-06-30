Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1EF3B7B71
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 04:07:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AF91E3C8D80
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 04:07:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 429113C1A4B
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 04:07:56 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B43F41A00668
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 04:07:54 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GF4Nj1Bj7zXmfy
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:02:29 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 30 Jun 2021 10:07:48 +0800
Received: from [10.174.178.208] (10.174.178.208) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 30 Jun 2021 10:07:47 +0800
To: <ltp@lists.linux.it>
References: <1617707717-63693-1-git-send-email-zou_wei@huawei.com>
From: Samuel Zou <zou_wei@huawei.com>
Message-ID: <411076e8-3734-a56a-bdcb-841a904aea5d@huawei.com>
Date: Wed, 30 Jun 2021 10:07:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1617707717-63693-1-git-send-email-zou_wei@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset/cpuset_memory_pressure_test: Check whether
 the swap partition is configured
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

ping, and has anybody met the same issue?

On 2021/4/6 19:15, Zou Wei wrote:
> --------------------------
> 
> 1. Fixed a bug where a null value is obtained because swap is not in
>     the fourth line of the free result
> free -m
>          total        used        free      shared  buff/cache   available
> Mem:   128135        3857      120633         158        3644      123219
> Swap:    8191          82        8109
> 
> free -m
>          total       used       free     shared    buffers     cached
> Mem:   419694       9464     410230        234        435       6005
> -/+ buffers/cache:       3022     416671
> Swap:    2053          0       2053
> 
> 2. If no swap partition is configured in the test environment,
>     the testcase will be failed:
> 
> cpuset_memory_pressure 7 TFAIL: sub group's memory_pressure
> didn't have memory pressure rate.
> cpuset_memory_pressure 9 TFAIL: root group's memory_pressure
> didn't have memory pressure rate.
> cpuset_memory_pressure 11 TFAIL: root group's memory_pressure
> didn't have memory pressure rate.
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   .../cpuset_memory_pressure_testset.sh                        | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
> index eddd7f6..2a2d2a1 100755
> --- a/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
> +++ b/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
> @@ -35,8 +35,16 @@ exit_status=0
>   # usable physical memory
>   py_mem=$(free -m | awk '{if(NR==2) print $4 + $6 + $7}')
>   
> -# free swap space
> -sw_mem=$(free -m | awk '{if(NR==4) print $4}')
> +# total swap space
> +sw_mem=$(free -m | awk '{if(NR==4) print $2}')
> +if [ -z $sw_mem ]; then
> +	sw_mem=$(free -m | awk '{if(NR==3) print $2}')
> +fi
> +
> +if [ $sw_mem -eq 0 ]; then
> +	tst_resm TCONF "The size of the swap partition is zero."
> +	exit 32
> +fi
>   
>   # the memory which is going to be used
>   usemem=$((py_mem - 20))
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
