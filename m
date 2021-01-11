Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AA2F0EBA
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 10:04:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 300223C5FF2
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 10:04:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8159A3C29C7
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 10:04:32 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 9745C2001D8
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 10:04:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,338,1602518400"; d="scan'208";a="103359040"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jan 2021 17:04:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id F40B14CE5CCA;
 Mon, 11 Jan 2021 17:04:15 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 11 Jan 2021 17:04:17 +0800
Message-ID: <5FFC14A6.3030408@cn.fujitsu.com>
Date: Mon, 11 Jan 2021 17:04:38 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1606701966-1596-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <X/hdjNT81M9CxbaD@yuki.lan>
In-Reply-To: <X/hdjNT81M9CxbaD@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F40B14CE5CCA.A007B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril
> Hi!
>> Since ltp commit cf33086a1ca, we add cgroup.clone_children switch for
>> cpuset.cpus and mems, we used the original memory value to set in cpuset_inherit case.
>>
>> After ltp commit 6872ad15a, we improve the node number calculation for N_NODES,
>> so it can calculate for N_NODES obtained from the file contains only "0,8".
>>
>> But it doesn't think about this patch will affect mem_string value, so this
>> cpuset_inherit case will fail on 4 numa nodes pc, as below:
>>
>> cpuset_inherit 1 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 3 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 5 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 7 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 9 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 11 TPASS: cpus: Inherited information is right!
>> cpuset_inherit 13 TPASS: mems: Inherited information is right!
>> cpuset_inherit 15 TPASS: mems: Inherited information is right!
>> cpuset_inherit 17 TPASS: mems: Inherited information is right!
>> cpuset_inherit 19 TPASS: mems: Inherited information is right!
>> cpuset_inherit 21 TPASS: mems: Inherited information is right!
>> cpuset_inherit 23 TFAIL: mems: Test result - 0-3 Expected string - "4"
>>
>> Fix this by using original mem value.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   testcases/kernel/controllers/cpuset/cpuset_funcs.sh        | 7 +++----
>>   .../cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh   | 6 ++----
>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
>> index f4365af2c..b469140ca 100755
>> --- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
>> +++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
>> @@ -28,10 +28,11 @@
>>
>>   NR_CPUS=`tst_ncpus`
>>   if [ -f "/sys/devices/system/node/has_high_memory" ]; then
>> -	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
>> +	mem_string="`cat /sys/devices/system/node/has_high_memory`"
>>   else
>> -	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
>> +	mem_string="`cat /sys/devices/system/node/has_normal_memory`"
>>   fi
>> +N_NODES="`echo $mem_string | tr ',' ' '`"
>>   count=0
>>   for item in $N_NODES; do
>>   	delta=1
>> @@ -42,8 +43,6 @@ for item in $N_NODES; do
>>   done
>>   N_NODES=$count
>>
>> -mem_string="$N_NODES"
>> -
>>   CPUSET="/dev/cpuset"
>>   CPUSET_TMP="/tmp/cpuset_tmp"
>>   CLONE_CHILDREN="/dev/cpuset/cgroup.clone_children"
>>
>> diff --git a/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
>> index 73eed2cb9..27ff19532 100755
>> --- a/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
>> +++ b/testcases/kernel/controllers/cpuset/cpuset_inherit_test/cpuset_inherit_testset.sh
>> @@ -31,10 +31,8 @@ export TST_COUNT=1
>>   check 1 1
>>
>>   nr_cpus=$NR_CPUS
>> -nr_mems=$N_NODES
>>
>>   cpus_all="$(seq -s, 0 $((nr_cpus-1)))"
>> -mems_all="$(seq -s, 0 $((nr_mems-1)))"
>>
>>   exit_status=0
>>
>> @@ -134,10 +132,10 @@ test_mems()
>>   	done<<- EOF
>>   		0	NULL					EMPTY
>>   		0	0					EMPTY
>> -		0	$mems_all				EMPTY
>> +		0	$mem_string				EMPTY
>>   		1	NULL					EMPTY
>>   		1	0					0
>> -		1	$mems_all				$mem_string
>> +		1	$mems_string				$mem_string
here has a typo, mems_string->mem_string
>>   	EOF
>>   	# while read mems result
>>   }
>
> I guess that it looks okay to me. I guess that we can commit this before
> the release, so acked.
>
> But don't we have the same problem for cpus_all? If we, for instance,
> have a machine where cpus are not numbered continously we will fail as
> well, right?
Yes, it has the same problem for cpus_all.
>
> I guess that a proper fix would be to rewrite the tests to parse the
> strings into a bitflag arrays and compare these arrays instead of the
> string comparsion and hacks that keeps up pilling up.
Will do it in v2.
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
