Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2E8640B6
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 07:33:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21DE13C1D04
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 07:33:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 06B1B3C104A
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 07:33:07 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id AAF46201116
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 07:33:03 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,473,1557158400"; d="scan'208";a="71078507"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Jul 2019 13:32:59 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id AE1A44CDDD42;
 Wed, 10 Jul 2019 13:32:59 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 10 Jul 2019 13:33:01 +0800
Message-ID: <5D25788A.6040506@cn.fujitsu.com>
Date: Wed, 10 Jul 2019 13:32:58 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <7ad6c506-e195-db0d-3b2b-a30b95c42f8a@oracle.com>
 <1559922050-15221-1-git-send-email-ice_yangxiao@163.com>
 <20190709154536.GA8195@rei.lan>
In-Reply-To: <20190709154536.GA8195@rei.lan>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: AE1A44CDDD42.AD7E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] rcu/rcu_torture.sh: Rewrite test
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

On 2019/07/09 23:45, Cyril Hrubis wrote:
> Hi!
>> +rcutorture_setup()
>> +{
>> +	# do test by inserting and removing rcutorture module
>> +	# so check if it is built-in, loaded or unbuilt
>> +	modprobe -n --first-time rcutorture>/dev/null 2>&1 || \
>> +		tst_brk TCONF "built-in, loaded or unbuilt rcutorture"
> Wouldn't the --first-time disable the test on subsequent runs? Or do I
> misunderstand how --first-time is supposed to work?
Hi,
No, -n option doesn't execute any operations.

We has to build rcutorture as a module if we want to run the test, so I 
just want to check
if rcutorture is built as a module instead of built-in or unbuilt by 
--first-time.

> Also I guess that some modprobe implementations may not support
> --first-time e.g. busybox.
Is there any way to check if rcutorture is only built as a module?
>> +}
>>
>> -trap cleanup INT
>> +rcutorture_test()
>> +{
>> +	local rcu_type=$1
>>
>> -rcu_type="rcu rcu_bh srcu sched"
>> +	tst_res TINFO "${rcu_type}-torture: running ${test_time} sec..."
>>
>> -if tst_kvcmp -lt "3.12"; then
>> -	rcu_type="$rcu_type rcu_sync rcu_expedited rcu_bh_sync rcu_bh_expedited \
>> -	          srcu_sync srcu_expedited sched_sync sched_expedited"
>> +	modprobe rcutorture nfakewriters=${num_writers} \
>> +		torture_type=${rcu_type}>/dev/null 2>&1
>> +	if [ $? -ne 0 ]; then
>> +		dmesg | grep -q "invalid torture type: \"${rcu_type}\""&&  \
>> +			tst_brk TCONF "invalid ${rcu_type} type"
>>
>> -	if tst_kvcmp -lt "3.11"; then
>> -		rcu_type="$rcu_type srcu_raw srcu_raw_sync"
>> +		tst_brk TBROK "failed to load module"
>>   	fi
>> -fi
>> -
>> -TST_TOTAL=$(echo "$rcu_type" | wc -w)
>> -
>> -est_time=`echo "scale=2; $test_time * $TST_TOTAL / 60 " | bc`
>> -tst_resm TINFO "estimate time $est_time min"
>> -
>> -for type in $rcu_type; do
>> -
>> -	tst_resm TINFO "$type: running $test_time sec..."
>> -
>> -	modprobe rcutorture nfakewriters=$num_writers \
>> -	         stat_interval=60 test_no_idle_hz=1 shuffle_interval=3 \
>> -	         stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 \
>> -	         fqs_stutter=3 test_boost=1 test_boost_interval=7 \
>> -	         test_boost_duration=4 shutdown_secs=0 \
>> -	         stall_cpu=0 stall_cpu_holdoff=10 n_barrier_cbs=0 \
>> -	         onoff_interval=0 onoff_holdoff=0 torture_type=$type \
>> -	>  /dev/null 2>&1 || tst_brkm TBROK "failed to load module"
>>
>> -	sleep $test_time
>> +	sleep ${test_time}
>>
>> -	rmmod rcutorture>  /dev/null 2>&1 || \
>> -		tst_brkm TBROK "failed to unload module"
>> +	rmmod rcutorture>/dev/null 2>&1 || \
>> +		tst_brk TBROK "failed to unload module"
> This should be modprobe -r, rmmod has been deprecated for quite some
> time.
I will use modprobe -r instead.

Best Regards,
Xiao Yang
>>   	# check module status in dmesg
>> -	result_str=`dmesg | sed -nE '$s/.*End of test: ([A-Z]+):.*/\1/p'`
>> -	if [ "$result_str" = "SUCCESS" ]; then
>> -		tst_resm TPASS "$type: completed"
>> +	local res=$(dmesg | sed -nE "s/.* ${rcu_type}-torture:.* End of test: (.*): .*/\1/p" | tail -n1)
>> +	if [ "$res" = "SUCCESS" ]; then
>> +		tst_res TPASS "${rcu_type}-torture: $res"
>>   	else
>> -		tst_resm TFAIL "$type: $result_str, see dmesg"
>> +		tst_res TFAIL "${rcu_type}-torture: $res, see dmesg"
>>   	fi
>> -done
>> +}
>> +
>> +do_test()
>> +{
>> +	case $1 in
>> +	1) rcutorture_test rcu;;
>> +	2) rcutorture_test srcu;;
>> +	3) rcutorture_test srcud;;
>> +	4) rcutorture_test tasks;;
>> +	esac
>> +}
>>
>> -tst_exit
>> +tst_run
>> -- 
>> 1.8.3.1
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
