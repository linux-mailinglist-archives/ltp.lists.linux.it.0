Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF82293EE1
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 16:39:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B57553C31B6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 16:39:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 951F93C31AC
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 16:39:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0D1011A00A22
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 16:39:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3832FAE5C;
 Tue, 20 Oct 2020 14:39:42 +0000 (UTC)
Date: Tue, 20 Oct 2020 16:39:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20201020143940.GB23197@dell5510>
References: <20201015122056.20715-1-alexey.kodanev@oracle.com>
 <20201015122056.20715-2-alexey.kodanev@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015122056.20715-2-alexey.kodanev@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] lib/tst_net: calc mean in tst_netload()
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

> Add TST_NETLOAD_RUN_COUNT to control how many times netstress
> test will be run to calculate the mean time value. Default is 5.

> This value will divide the total number of requests in order
> not to significantly increase the time for the test after this
> patch.

> Moreover, one of the runs can fail once, it will produce only a
> warning. The test will broke after the second failure. It can
> be useful to make sure we have reproducible results.

> Signed-off-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> ---
>  testcases/lib/tst_net.sh | 95 ++++++++++++++++++++++++++--------------
>  1 file changed, 62 insertions(+), 33 deletions(-)

> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index b29e076c3..1912b984d 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -623,9 +623,11 @@ tst_wait_ipv6_dad()
>  	done
>  }

> -tst_dump_rhost_cmd()
> +tst_netload_brk()
>  {
>  	tst_rhost_run -c "cat $TST_TMPDIR/netstress.log"
> +	cat tst_netload.log
> +	tst_brk_ $1 $2
>  }

>  # Run network load test, see 'netstress -h' for option description
> @@ -640,6 +642,7 @@ tst_netload()
>  	# common options for client and server
>  	local cs_opts=

> +	local run_cnt="$TST_NETLOAD_RUN_COUNT"
>  	local c_num="$TST_NETLOAD_CLN_NUMBER"
>  	local c_requests="$TST_NETLOAD_CLN_REQUESTS"
>  	local c_opts=
> @@ -692,51 +695,76 @@ tst_netload()
>  	local expect_ret=0
>  	[ "$expect_res" != "pass" ] && expect_ret=3

> -	tst_rhost_run -c "pkill -9 netstress\$"
> -	s_opts="${cs_opts}${s_opts}-R $s_replies -B $TST_TMPDIR"
> -	tst_res_ TINFO "run server 'netstress $s_opts'"
> -	tst_rhost_run -c "netstress $s_opts" > tst_netload.log 2>&1
> -	if [ $? -ne 0 ]; then
> -		cat tst_netload.log
> -		local ttype="TFAIL"
> -		grep -e 'CONF:' tst_netload.log && ttype="TCONF"
> -		tst_brk_ $ttype "server failed"
> +	local was_failure=0
nit: I prefer have local variables at the top and boolean like variables as empty vs.
"1" (tested with [ "$foo" = 1 ] (see: if [ "$bind_to_device" = 1 -a "$TST_NETLOAD_BINDTODEVICE" = 1 ]; then
few lines above).

This style is used in tst_test.sh, which is consistent, but style in tst_net.sh
varies on this a lot. It's just a style and it wasn't introduced before this
commit, thus feel free to ignore it, but it'd be nice to be consistent in
library file.

> +	if [ "$run_cnt" -lt 2 ]; then
maybe: if [ "$run_cnt" -lt 1 ]; then

BTW we should also check all numeric variables (TST_NETLOAD_CLN_REQUESTS, ...)
with tst_is_int (but don't bother with it now).

> +		run_cnt=1
> +		was_failure=1
Hm, $was_failure set before loop. Shouldn't it be inside for i in $(seq 1
$run_cnt); do loop? And updated on each failure (be a error counter, not boolean)?
>  	fi

> -	local port=$(tst_rhost_run -s -c "cat $TST_TMPDIR/netstress_port")
> -	c_opts="${cs_opts}${c_opts}-a $c_num -r $c_requests -d $rfile -g $port"
> +	s_opts="${cs_opts}${s_opts}-R $s_replies -B $TST_TMPDIR"
> +	c_opts="${cs_opts}${c_opts}-a $c_num -r $((c_requests / run_cnt)) -d $rfile"
> +
> +	tst_res_ TINFO "run server 'netstress $s_opts'"
> +	tst_res_ TINFO "run client 'netstress -l $c_opts' $run_cnt times"

> -	tst_res_ TINFO "run client 'netstress -l $c_opts'"
> -	netstress -l $c_opts > tst_netload.log 2>&1 || ret=$?
>  	tst_rhost_run -c "pkill -9 netstress\$"
> +	rm -f tst_netload.log
> +
> +	local res=0
> +	local passed=0
> +
> +	for i in $(seq 1 $run_cnt); do
> +		tst_rhost_run -c "netstress $s_opts" > tst_netload.log 2>&1
> +		if [ $? -ne 0 ]; then
> +			cat tst_netload.log
> +			local ttype="TFAIL"
> +			grep -e 'CONF:' tst_netload.log && ttype="TCONF"
> +			tst_brk_ $ttype "server failed"
> +		fi

> -	if [ "$expect_ret" -ne 0 ]; then
> -		if [ $((ret & expect_ret)) -ne 0 ]; then
> -			tst_res_ TPASS "netstress failed as expected"
> -		else
> -			tst_res_ TFAIL "expected '$expect_res' but ret: '$ret'"
> +		local port=$(tst_rhost_run -s -c "cat $TST_TMPDIR/netstress_port")
> +		netstress -l ${c_opts} -g $port > tst_netload.log 2>&1
> +		ret=$?
> +		tst_rhost_run -c "pkill -9 netstress\$"
> +
> +		if [ "$expect_ret" -ne 0 ]; then
> +			if [ $((ret & expect_ret)) -ne 0 ]; then
> +				tst_res_ TPASS "netstress failed as expected"
> +			else
> +				tst_res_ TFAIL "expected '$expect_res' but ret: '$ret'"
> +			fi
> +			return $ret
> +		fi
> +
> +		if [ "$ret" -ne 0 ]; then
> +			[ $((ret & 32)) -ne 0 ] && \
> +				tst_netload_brk TCONF "not supported configuration"
> +
> +			[ $((ret & 3)) -ne 0 -a $was_failure -gt 0 ] && \
> +				tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"
Instead the 2 lines above maybe this? Or am I missing something?

			if [ $((ret & 3)) -ne 0 ]; then
				was_failure=$((was_failure+1))
			fi
			[ $was_failure -gt 0 ] && \
				tst_netload_brk TFAIL "expected '$expect_res' but ret: '$ret'"
> +
> +			tst_res_ TWARN "netstress failed, ret: $ret"
> +			was_failure=1
> +			continue
>  		fi
> -		return $ret
> -	fi
...

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
