Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6A6A9DD
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 15:50:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 644813C1D2F
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 15:50:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id F08683C1C68
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 15:50:07 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 5CE671A0117F
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 15:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=oj4b/
 tRDL9hUfoaxH9KaxlloGGILwSsQQRSHcsSffXY=; b=nWXMy2vRJ6mQ4TGa8/dm6
 zTT/3N9jAbvILGbV8QqfTuAIaXQ0aidHUIIR3mABzakXLn9UB8PA6ywDUjSp8WZH
 J9AkA5i+8/WnuvJ/bt64s1AaPN9fKpSeGQ8hByAlb5HcJgpMJq1WBYF65CrKW8Tk
 ig3be5kPt6hFg1FACN+irg=
Received: from [192.168.0.10] (unknown [183.210.51.51])
 by smtp8 (Coremail) with SMTP id DMCowAA3mgwJ1i1dZjHKCg--.52734S2;
 Tue, 16 Jul 2019 21:50:03 +0800 (CST)
To: ltp@lists.linux.it
References: <1562843429-4633-1-git-send-email-ice_yangxiao@163.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <f6d4dfd5-7f84-8587-049b-2cf2e61fdba7@163.com>
Date: Tue, 16 Jul 2019 21:50:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1562843429-4633-1-git-send-email-ice_yangxiao@163.com>
Content-Language: en-US
X-CM-TRANSID: DMCowAA3mgwJ1i1dZjHKCg--.52734S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AryrXw1fArWfWw45GFyrtFb_yoWxJF1UpF
 W7GF1agF48XFy7Way8ZF1ruF43AayfZr1jvry5K3yjgF1UX34kAFya93Z8tF98WFWj9w1I
 va1Fy3y7Jw18ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07boBM_UUUUU=
X-Originating-IP: [183.210.51.51]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEAvzXlUMOHVCagAAsK
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] rcu/rcu_torture.sh: Rewrite test
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

Hi all,

I will push it tomorrow if nobody has objection. :-)

Best Regards,

Xiao Yang

On 07/11/2019 07:10 PM, Xiao Yang wrote:
> 1) Cleanup and convert to new API
> 2) Update valid rcutorture types(rcu, srcu, srcud, tasks)
>
> Note:
> Exclude valid busted* types(busted, busted_srcud) that check
> the test itself and expect failures, suggested by:
> https://www.spinics.net/lists/kernel/msg3045252.html
>
> Reviewed-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> Acked-by: Petr Vorel <pvorel@suse.cz>
> Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
> ---
>   testcases/kernel/device-drivers/rcu/rcu_torture.sh | 140 +++++++++------------
>   1 file changed, 62 insertions(+), 78 deletions(-)
>
> diff --git a/testcases/kernel/device-drivers/rcu/rcu_torture.sh b/testcases/kernel/device-drivers/rcu/rcu_torture.sh
> index c3739f9..bca1530 100755
> --- a/testcases/kernel/device-drivers/rcu/rcu_torture.sh
> +++ b/testcases/kernel/device-drivers/rcu/rcu_torture.sh
> @@ -1,20 +1,7 @@
>   #!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
>   # Copyright (c) 2014-2015 Oracle and/or its affiliates. All Rights Reserved.
> -#
> -# This program is free software; you can redistribute it and/or
> -# modify it under the terms of the GNU General Public License as
> -# published by the Free Software Foundation; either version 2 of
> -# the License, or (at your option) any later version.
> -#
> -# This program is distributed in the hope that it would be useful,
> -# but WITHOUT ANY WARRANTY; without even the implied warranty of
> -# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -# GNU General Public License for more details.
> -#
> -# You should have received a copy of the GNU General Public License
> -# along with this program; if not, write the Free Software Foundation,
> -# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> -#
> +# Copyright (C) 2019 Xiao Yang <ice_yangxiao@163.com>
>   # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
>   #
>   # One of the possible ways to test RCU is to use rcutorture kernel module.
> @@ -23,89 +10,86 @@
>   # dmesg output for module's test results.
>   # For more information, please read Linux Documentation: RCU/torture.txt
>   
> -TCID="rcu_torture"
> -TST_TOTAL=14
> -TST_CLEANUP=cleanup
> +TST_CNT=4
> +TST_SETUP=rcutorture_setup
> +TST_TESTFUNC=do_test
> +TST_NEEDS_ROOT=1
> +TST_NEEDS_CMDS="modprobe dmesg sed tail"
> +TST_OPTS="t:w:"
> +TST_USAGE=rcutorture_usage
> +TST_PARSE_ARGS=rcutorture_parse_args
>   
> -. test.sh
> +. tst_test.sh
>   
>   # default options
> -test_time=60
> +test_time=30
>   num_writers=5
>   
> -while getopts :ht:w: opt; do
> -	case "$opt" in
> -	h)
> -		echo "Usage:"
> -		echo "h        help"
> -		echo "t x      time in seconds for each test-case"
> -		echo "w x      number of writers"
> -		exit 0
> -	;;
> -	t) test_time=$OPTARG ;;
> -	w) num_writers=$OPTARG ;;
> -	*)
> -		tst_brkm TBROK "unknown option: $opt"
> -	;;
> -	esac
> -done
> -
> -cleanup()
> +rcutorture_usage()
>   {
> -	tst_resm TINFO "cleanup"
> -	rmmod rcutorture > /dev/null 2>&1
> +	echo "Usage:"
> +	echo "-t x    time in seconds for each test-case"
> +	echo "-w x    number of writers"
>   }
>   
> -tst_require_root
> -
> -# check if module is present
> -modprobe rcutorture > /dev/null 2>&1 || \
> -	tst_brkm TCONF "Test requires rcutorture module"
> -rmmod rcutorture > /dev/null 2>&1
> -
> -trap cleanup INT
> -
> -rcu_type="rcu rcu_bh srcu sched"
> -
> -if tst_kvcmp -lt "3.12"; then
> -	rcu_type="$rcu_type rcu_sync rcu_expedited rcu_bh_sync rcu_bh_expedited \
> -	          srcu_sync srcu_expedited sched_sync sched_expedited"
> +rcutorture_parse_args()
> +{
> +	case $1 in
> +	t) test_time=$2 ;;
> +	w) num_writers=$2 ;;
> +	esac
> +}
>   
> -	if tst_kvcmp -lt "3.11"; then
> -		rcu_type="$rcu_type srcu_raw srcu_raw_sync"
> -	fi
> -fi
> +rcutorture_setup()
> +{
> +	local module=1
>   
> -TST_TOTAL=$(echo "$rcu_type" | wc -w)
> +	# check if rcutorture is built as a kernel module by inserting
> +	# and then removing it
> +	modprobe -q rcutorture ||  module=
> +	modprobe -qr rcutorture || module=
>   
> -est_time=`echo "scale=2; $test_time * $TST_TOTAL / 60 " | bc`
> -tst_resm TINFO "estimate time $est_time min"
> +	[ -z "$module" ] && \
> +		tst_brk TCONF "rcutorture is built-in, non-existent or in use"
> +}
>   
> -for type in $rcu_type; do
> +rcutorture_test()
> +{
> +	local rcu_type=$1
>   
> -	tst_resm TINFO "$type: running $test_time sec..."
> +	tst_res TINFO "$rcu_type-torture: running $test_time sec..."
>   
>   	modprobe rcutorture nfakewriters=$num_writers \
> -	         stat_interval=60 test_no_idle_hz=1 shuffle_interval=3 \
> -	         stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 \
> -	         fqs_stutter=3 test_boost=1 test_boost_interval=7 \
> -	         test_boost_duration=4 shutdown_secs=0 \
> -	         stall_cpu=0 stall_cpu_holdoff=10 n_barrier_cbs=0 \
> -	         onoff_interval=0 onoff_holdoff=0 torture_type=$type \
> -	         > /dev/null 2>&1 || tst_brkm TBROK "failed to load module"
> +		torture_type=$rcu_type >/dev/null
> +	if [ $? -ne 0 ]; then
> +		dmesg | grep -q "invalid torture type: \"$rcu_type\"" && \
> +			tst_brk TCONF "invalid $rcu_type type"
> +
> +		tst_brk TBROK "failed to load module"
> +	fi
>   
>   	sleep $test_time
>   
> -	rmmod rcutorture > /dev/null 2>&1 || \
> -		tst_brkm TBROK "failed to unload module"
> +	modprobe -r rcutorture >/dev/null || \
> +		tst_brk TBROK "failed to unload module"
>   
>   	# check module status in dmesg
> -	result_str=`dmesg | sed -nE '$s/.*End of test: ([A-Z]+):.*/\1/p'`
> -	if [ "$result_str" = "SUCCESS" ]; then
> -		tst_resm TPASS "$type: completed"
> +	local res=$(dmesg | sed -nE "s/.* $rcu_type-torture:.* End of test: (.*): .*/\1/p" | tail -n1)
> +	if [ "$res" = "SUCCESS" ]; then
> +		tst_res TPASS "$rcu_type-torture: $res"
>   	else
> -		tst_resm TFAIL "$type: $result_str, see dmesg"
> +		tst_res TFAIL "$rcu_type-torture: $res, see dmesg"
>   	fi
> -done
> +}
> +
> +do_test()
> +{
> +	case $1 in
> +	1) rcutorture_test rcu;;
> +	2) rcutorture_test srcu;;
> +	3) rcutorture_test srcud;;
> +	4) rcutorture_test tasks;;
> +	esac
> +}
>   
> -tst_exit
> +tst_run



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
