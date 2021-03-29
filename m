Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6D734D784
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 20:43:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F7A53C8D20
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 20:43:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 83FDA3C1A31
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 20:43:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AD53A200344
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 20:43:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E04BCAFF5;
 Mon, 29 Mar 2021 18:43:41 +0000 (UTC)
Date: Mon, 29 Mar 2021 20:43:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YGIf3JSsFHn/gwKJ@pevik>
References: <20210315092844.991073-1-lkml@jv-coder.de>
 <20210315092844.991073-2-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210315092844.991073-2-lkml@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] pec: Fix multiple event test
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> +free_fd()
> +{
> +	# Find a free file handle
> +	local found
> +	for fd in $(seq 200); do
> +    	rco="$(true 2>/dev/null >&${fd}; echo $?)"
> +    	rci="$(true 2>/dev/null <&${fd}; echo $?)"
> +    	[[ "${rco}${rci}" = "11" ]] && found=${fd} && break
[[ .. ]] is a bashism, single brackets are enough.
> +	done
> +	echo $found
> +}

NIT: adding a comment to before function and space separating section with local
helps readability.

# Find a free file handle
free_fd()
{
	local found

	for fd in $(seq 200); do
	...

> +
>  setup()
>  {	
>  	if ! grep -q cn_proc /proc/net/connector; then
> @@ -32,35 +64,75 @@ setup()
>  test()
>  {
>  	local event=$2
> +
> +	tst_res TINFO "Testing $2 event (nevents=$num_events)"
> +
>  	pec_listener >lis_$event.log 2>lis_$event.err &
> -	pid=$!
> +	lis_pid=$!
This change is unnecessary, if you prefer $lis_pid, it should have been in
previous patch where you added $pid (no need to repost, I can fix it before
merge).

>  	# Wait for pec_listener to start listening
>  	tst_sleep 100ms

>  	# Run with absolute path, so the generator can exec itself
>  	generator="$(command -v event_generator)"
> -	"$generator" -n $NUM_EVENTS -e $event >gen_$event.log 2>gen_$event.err
> +	"$generator" -n $num_events -e $event >gen_$event.log 2>gen_$event.err
>  	gen_rc=$?

> -	# Sleep until pec_listener has seen and handled all of the generated events
> -	tst_sleep 100ms
> -	kill -s SIGINT $pid 2> /dev/null
> -	wait $pid
> +	kill -s SIGINT $lis_pid 2> /dev/null
> +	wait $lis_pid
>  	lis_rc=$?

>  	if [ $gen_rc -ne 0 -o ! -s gen_$event.log ]; then
> -		tst_brk TBROK "failed to generate process events"
> +		tst_brk TBROK "failed to generate process events: $(cat gen_$event.err)"
>  	fi

>  	if [ $lis_rc -ne 0 ]; then
>  		tst_brk TBROK "failed to execute the listener: $(cat lis_$event.err)"
>  	fi

> -	expected_events="$(cat gen_$event.log)"
> -	if grep -q "$expected_events" lis_$event.log; then
> -		tst_res TPASS "$event detected by listener"
> +	# The listener writes the same messages as the generator, but it can
> +	# also see more events (e.g. for testing exit, a fork is generated).
> +	# So: The events generated by the generator have to be in the same order
> +	# as the events printed by the listener, but my interleaved with other
> +	# messages. To correctly compare them, we have to open both logs
> +	# and iterate over both of them at the same time, skipping messages
> +	# in the listener log, that are not of interest.
> +	# Because some messages may be multiple times in the listener log,
> +	# we have to open it only once!
> +	# This however does not check, if the listener sees more messages,
> +	# than expected.
> +
> +	fd_act=$(free_fd)
> +	[ -z "$fd_act" ] && tst_brk TBROK "No free filehandle found"
> +	eval "exec ${fd_act}<lis_$event.log"
> +
> +	failed=0
> +	act_nevents=0
Again two missing local.

> +	while read -r exp; do
> +		local found=0
> +		act_nevents=$((act_nevents + 1))
> +		while read -r <&${fd_act} act; do
<& is a bashism. Isn't it using just stdin enough?
		while read -r < $fd_act act; do
> +			if [ "$exp" = "$act" ]; then
> +				found=1
> +				break
> +			fi
> +		done
> +		if [ $found -ne 1 ]; then
> +			failed=1
> +			tst_res TFAIL "Event was not detected by the event listener: $exp"
> +			break
> +		fi
> +	done <gen_$event.log
> +
> +	eval "exec ${fd_act}<&-"
> +
> +	if [ $failed -eq 0 ]; then
> +		if [ $act_nevents -ne $num_events ]; then
> +			tst_res TBROK "Expected $num_events, but $act_nevents generated"
> +		else
> +			tst_res TPASS "All events detected"
> +		fi
>  	else
> -		tst_res TFAIL "$event not detected by listener"
> +		cat lis_$event.log
Why removing tst_res TFAIL?
If "cat lis_$event.log" needed, why not having it in previous commit?
>  	fi

Also whole section would be probably more readable written as:

	if [ $failed -eq 0 ]; then
		tst_res TFAIL "$event not detected by listener"
		cat lis_$event.log
		return
	fi

	if [ $act_nevents -ne $num_events ]; then
		tst_brk TBROK "Expected $num_events, but $act_nevents generated"
	fi

	tst_res TPASS "All events detected"

>  }


All changes suggested for shell:
(FYI in: https://github.com/pevik/ltp/commits/joerg/connectors.v1.fixes)

Kind regards,
Petr

diff --git testcases/kernel/connectors/pec/cn_pec.sh testcases/kernel/connectors/pec/cn_pec.sh
index 8bbfe3a19..e0821a8ef 100755
--- testcases/kernel/connectors/pec/cn_pec.sh
+++ testcases/kernel/connectors/pec/cn_pec.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2008 FUJITSU LIMITED
@@ -39,14 +39,18 @@ parse_args()
 	esac
 }
 
+# Find a free file handle
 free_fd()
 {
-	# Find a free file handle
-	local found
+	local fd found rci rco
+
 	for fd in $(seq 200); do
-	rco="$(true 2>/dev/null >&${fd}; echo $?)"
-	rci="$(true 2>/dev/null <&${fd}; echo $?)"
-	[[ "${rco}${rci}" = "11" ]] && found=${fd} && break
+		rco="$(true 2>/dev/null >&$fd; echo $?)"
+		rci="$(true 2>/dev/null <&$fd; echo $?)"
+		if [ "${rco}${rci}" = "11" ]; then
+			found="$fd"
+			break
+		fi
 	done
 	echo $found
 }
@@ -55,7 +59,6 @@ setup()
 {
 	if ! grep -q cn_proc /proc/net/connector; then
 		tst_brk TCONF "Process Event Connector is not supported or kernel is below 2.6.26"
-		exit 0;
 	fi
 
 	tst_res TINFO "Test process events connector"
@@ -64,24 +67,24 @@ setup()
 test()
 {
 	local event=$2
+	local expected_events lis_rc pid
 
 	tst_res TINFO "Testing $2 event (nevents=$num_events)"
 
-	pec_listener >lis_$event.log 2>lis_$event.err &
-	lis_pid=$!
+	ROD pec_listener \>lis_$event.log 2\>lis_$event.err &
+	pid=$!
 	# Wait for pec_listener to start listening
 	tst_sleep 100ms
 
-	# Run with absolute path, so the generator can exec itself
-	generator="$(command -v event_generator)"
-	"$generator" -n $num_events -e $event >gen_$event.log 2>gen_$event.err
+	# generator must be in PATH
+	ROD event_generator -n $num_events -e $event \>gen_$event.log 2\>gen_$event.err
 	gen_rc=$?
 
 	kill -s SIGINT $lis_pid 2> /dev/null
 	wait $lis_pid
 	lis_rc=$?
 
-	if [ $gen_rc -ne 0 -o ! -s gen_$event.log ]; then
+	if [ ! -s gen_$event.log ]; then
 		tst_brk TBROK "failed to generate process events: $(cat gen_$event.err)"
 	fi
 
@@ -103,14 +106,14 @@ test()
 
 	fd_act=$(free_fd)
 	[ -z "$fd_act" ] && tst_brk TBROK "No free filehandle found"
-	eval "exec ${fd_act}<lis_$event.log"
+	eval "exec ${fd_act} < lis_$event.log"
 
-	failed=0
-	act_nevents=0
+	local failed=0
+	local act_nevents=0
 	while read -r exp; do
 		local found=0
 		act_nevents=$((act_nevents + 1))
-		while read -r <&${fd_act} act; do
+		while read -r < $fd_act act; do
 			if [ "$exp" = "$act" ]; then
 				found=1
 				break
@@ -121,19 +124,21 @@ test()
 			tst_res TFAIL "Event was not detected by the event listener: $exp"
 			break
 		fi
-	done <gen_$event.log
+	done < gen_$event.log
 
-	eval "exec ${fd_act}<&-"
+	eval "exec $fd_act <&-"
 
 	if [ $failed -eq 0 ]; then
-		if [ $act_nevents -ne $num_events ]; then
-			tst_res TBROK "Expected $num_events, but $act_nevents generated"
-		else
-			tst_res TPASS "All events detected"
-		fi
-	else
+		tst_res TFAIL "$event not detected by listener"
 		cat lis_$event.log
+		return
 	fi
+
+	if [ $act_nevents -ne $num_events ]; then
+		tst_brk TBROK "Expected $num_events, but $act_nevents generated"
+	fi
+
+	tst_res TPASS "All events detected"
 }
 
 tst_run

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
