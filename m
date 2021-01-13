Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F52F4771
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:24:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D43903C5DCD
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 10:24:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id F094F3C06D9
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:24:02 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C8BE214004EC
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 10:24:01 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="103439517"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 17:23:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 330904CE6037;
 Wed, 13 Jan 2021 17:23:58 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 17:23:57 +0800
Message-ID: <5FFEBC48.20605@cn.fujitsu.com>
Date: Wed, 13 Jan 2021 17:24:24 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1606701966-1596-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <X/hdjNT81M9CxbaD@yuki.lan> <5FFC14A6.3030408@cn.fujitsu.com>
 <5FFD7D76.6070301@cn.fujitsu.com> <X/29dySZb8kL5Nms@rei.lan>
In-Reply-To: <X/29dySZb8kL5Nms@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 330904CE6037.AAB8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
>> When I look these cpuset cases(cpuset_base_ops_test,
>> cpuset_hierarchy_test, cpuset_inherit_test...), these cases seems all
>> not consider the situation(cpus/memory are not numbered continously). If
>> we want to modify them to be situable for not numbered continously, it
>> will be complexd(especially cpuset_base_ops_test).
>
> Thats why I said that these tests would need to be rewritten ideally
> from a scratch. I guess that it would be easier to work with bitfields
> in C as well.
>
I see.
>> AFAIK, I rarely see not numbered continously for memory node. IMO, we
>> just check whether memory/cpu numbered continously, if not, we just
>> report TCONF and remind user to change their system to meet
>> environment, so their system can be fully tested.
>
> That would be better than unexpected failure at least.
>
Since we are just before a release, I think using this way is ok. I will 
send a patch for this soon.
>> For cpu, maybe we can use the following script to detect
>>
>> cpu_string="`cat /sys/devices/system/cpu/online`"
>> offline_string="`cat /sys/devices/system/cpu/online`"
>> NR_CPUS=`tst_ncpus`
>> ALL_CPUS=`tst_ncpus_conf`
>> if [ $NR_CPUS -eq $ALL_CPUS ]; then
>>          tst_resm TINFO "All($ALL_CPUS) logical cpus on your environment"
>> else
>>         tst_brkm TCONF "Not all logical cpus on, online($cpu_string),offline($offline_string)"
>> fi
>>
>> I wonder if it's worth changing the stable cpuset/memory cases for these
>> rared situation(memory/cpu are not numbered continously).
>
> It would allow us to offline CPUs in the middle of the test and checking
> that offlined CPUs can no longer be added into the mask, which is
> something we cannot test at the moment.
 From this point, it is meaningful.
>
>> What do you think about it?
>
> To be honest I'm not sure if ncpus == ncpus_conf means that the cpu
> numbering is continous.
I see ltp/lib/tst_cpu.c uses 
_SC_NPROCESSORS_ONLN/_SC_NPROCESSORS_CONF[1] sysconf. if ncpus == 
ncpus_conf, it means all cpu enable so the cpu numbering must be continous.

[1]https://www.gnu.org/software/libc/manual/html_node/Processor-Resources.html
>
> I guess that the safest bet would be actually parsing the
> /sys/devices/system/cpu/online instead. I.e. check that the file is in a
> format 0-$(UINT), since that is what the testcases do expect, right?
Yes.
my old way (using _SC_NPROCESSORS_ONLN/_SC_NPROCESSORS_CONF[1] macro) is 
to detect all logcial cpu enabled, your way can cover more situation.
>
>> +#select the first one or two online cpu
>> +select_online_cpus()
>> +{
>> +	ncpus_check ${1:-2}
>> +	local cpus_array="$(seq -s' ' 0 $((ALL_CPUS-1)))"
>> +	local cpuid=
>> +	local iter=0
>> +	for cpuid in $cpus_array
>> +	do
>> +		local file="/sys/devices/system/cpu/cpu$cpuid/online"
>> +		local online="$(cat $file)"
>> +		if [ $online -eq 1 ]; then
>> +			iter=`expr $iter + 1`
>> +			if [ $iter -eq 1 ]; then
>> +				F_ONELINE_CPU=$cpu_id
>> +			elif [ $iter -eq 2 ]; then
>> +				S_ONLINE_CPU=$cpu_id
>> +			else
>> +				break
>> +			fi
>> +		fi
>> +        done
>> +}
>
> Bitfields are akward in shell. So if I was writing these tests I would
> write a function to parse the sysfs file into a cpuset bitfield and
> second function to write the bitfield into a sysfs file. And after that
> we would do all the operations on cpuset bitfields instead.
>
> That way we can, for instance, get any subset of online CPUs easily,
> since that is just one loop over the cpuset bitfield.
Agree.
>
> e.g. to get a subset with half of the online CPUs we would do:
>
> 	int flag = 0, i;
>
> 	for (i = 0; i<  setsize; i++) {
> 		if (CPU_ISSET_S(i, setsize, inset)) {
> 			if (flag)
> 				GPU_SET_S(i, setsize, outset);
>
> 			flag = !flag;
> 		}
> 	}
>
> We can probably reuse the code kernel uses to parse and print these, the
> code to print a bitmap seems to be in bitmap_list_string() in
> lib/vsprintf.c, the parsing seems to be implemented in
> bitmap_parselist_user() in the lib/bitmap.c.
I will see these code when I am free.
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
