Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7308651B1
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 08:04:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67FC23C1C9A
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 08:04:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 63C0B3C1B49
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 08:03:57 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0477B601E61
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 08:03:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C52FB0BE;
 Thu, 11 Jul 2019 06:03:54 +0000 (UTC)
Date: Thu, 11 Jul 2019 08:03:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20190711060357.GA28190@dell5510>
References: <1562769310-4918-1-git-send-email-ice_yangxiao@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562769310-4918-1-git-send-email-ice_yangxiao@163.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] rcu/rcu_torture.sh: Rewrite test
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xiao,

> 1) Cleanup and convert to new API
> 2) Update valid rcutorture types(rcu, srcu, srcud, tasks)

> Note:
> Exclude valid busted* types(busted, busted_srcud) that check
> the test itself and expect failures, suggested by:
> https://www.spinics.net/lists/kernel/msg3045252.html

> Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
Acked-by: Petr Vorel <pvorel@suse.cz>

Only few comments below (nits).

>  # default options
> -test_time=60
> +test_time=30
You shortened the test to half, good :).

...
> +rcutorture_setup()
> +{
> +	local module=1

> -	if tst_kvcmp -lt "3.11"; then
> -		rcu_type="$rcu_type srcu_raw srcu_raw_sync"
> -	fi
> -fi
> +	# check if rcutorture is built as a kernel module by inserting
> +	# and then removing it
> +	modprobe rcutorture >/dev/null 2>&1 ||  module=0
> +	modprobe -r rcutorture >/dev/null 2>&1 || module=0

This can be just module=1 or module= (none value).
(+ -q is enough instead of redirections). i.e.:

modprobe rcutorture -q || module=
modprobe -r rcutorture -q || module=
[ -n "$module" ] && \

(or even [ "$module" ] && \ )

We usually don't use 0 for shell scripts in LTP.
But that's a nit.

> -TST_TOTAL=$(echo "$rcu_type" | wc -w)
> +	[ $module -eq 0 ] && \
> +		tst_brk TCONF "rcutorture is built-in, non-existent or in use"
> +}

> -est_time=`echo "scale=2; $test_time * $TST_TOTAL / 60 " | bc`
> -tst_resm TINFO "estimate time $est_time min"
> +rcutorture_test()
> +{
> +	local rcu_type=$1

> -for type in $rcu_type; do
> +	tst_res TINFO "${rcu_type}-torture: running ${test_time} sec..."
	tst_res TINFO "${rcu_type}-torture: running $test_time sec..."
(I prefer using brackets ${foo} only when needed - $foo is more readable).

> -	tst_resm TINFO "$type: running $test_time sec..."
> +	modprobe rcutorture nfakewriters=${num_writers} \
> +		torture_type=${rcu_type} >/dev/null 2>&1
Again, use -q:
modprobe -q rcutorture nfakewriters=$num_writers torture_type=$rcu_type

> +	if [ $? -ne 0 ]; then
> +		dmesg | grep -q "invalid torture type: \"${rcu_type}\"" && \
> +			tst_brk TCONF "invalid ${rcu_type} type"
and here ${foo} => $foo

> -	modprobe rcutorture nfakewriters=$num_writers \
> -	         stat_interval=60 test_no_idle_hz=1 shuffle_interval=3 \
> -	         stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 \
> -	         fqs_stutter=3 test_boost=1 test_boost_interval=7 \
> -	         test_boost_duration=4 shutdown_secs=0 \
> -	         stall_cpu=0 stall_cpu_holdoff=10 n_barrier_cbs=0 \
> -	         onoff_interval=0 onoff_holdoff=0 torture_type=$type \
> -	         > /dev/null 2>&1 || tst_brkm TBROK "failed to load module"
> +		tst_brk TBROK "failed to load module"
And here. But I'd prefer to keep stderr (in case of failure it's better
to see immediately what the problem was).
> +	fi

> -	sleep $test_time
> +	sleep ${test_time}
	sleep $test_time

> -	rmmod rcutorture > /dev/null 2>&1 || \
> -		tst_brkm TBROK "failed to unload module"
> +	modprobe -r rcutorture >/dev/null 2>&1 || \
> +		tst_brk TBROK "failed to unload module"
The same here (here I'd also keep stdout)

>  	# check module status in dmesg
> -	result_str=`dmesg | sed -nE '$s/.*End of test: ([A-Z]+):.*/\1/p'`
> -	if [ "$result_str" = "SUCCESS" ]; then
> -		tst_resm TPASS "$type: completed"
> +	local res=$(dmesg | sed -nE "s/.* ${rcu_type}-torture:.* End of test: (.*): .*/\1/p" | tail -n1)
> +	if [ "$res" = "SUCCESS" ]; then
> +		tst_res TPASS "${rcu_type}-torture: $res"
>  	else
> -		tst_resm TFAIL "$type: $result_str, see dmesg"
> +		tst_res TFAIL "${rcu_type}-torture: $res, see dmesg"
Maybe print dmesg (for automated tests, when you don't have direct access to
machine).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
