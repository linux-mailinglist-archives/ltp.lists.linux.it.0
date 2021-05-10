Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 641CB378B6D
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 14:10:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB25B3C654A
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 14:10:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6A9FE3C4FB1
 for <ltp@lists.linux.it>; Mon, 10 May 2021 14:10:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 891FB10007F7
 for <ltp@lists.linux.it>; Mon, 10 May 2021 14:10:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7DB3B034;
 Mon, 10 May 2021 12:10:33 +0000 (UTC)
Date: Mon, 10 May 2021 13:44:10 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YJkcikSmQeNwzDY1@yuki>
References: <20210508055109.16914-3-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210508055109.16914-3-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/4] shell: Prevent orphan timeout sleep
 processes
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> --- a/lib/newlib_tests/shell/timeout04.sh
> +++ b/lib/newlib_tests/shell/timeout04.sh
> @@ -9,7 +9,7 @@ TST_TIMEOUT=1
>  
>  do_test()
>  {
> -	tst_res TINFO "Start"
> +    tst_res TINFO "Start"
>      sleep 5
>      tst_res TFAIL "End"
>  }

This should be really fixed in the previous patch rather than here.

Other than this the rest looks good.

With the indentation fix moved to previous patch:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 951518785..ed2699175 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -23,14 +23,6 @@ export TST_LIB_LOADED=1
>  # default trap function
>  trap "tst_brk TBROK 'test interrupted or timed out'" INT
>  
> -_tst_cleanup_timer()
> -{
> -	if [ -n "$_tst_setup_timer_pid" ]; then
> -		kill $_tst_setup_timer_pid 2>/dev/null
> -		wait $_tst_setup_timer_pid 2>/dev/null
> -	fi
> -}
> -
>  _tst_do_exit()
>  {
>  	local ret=0
> @@ -463,6 +455,25 @@ _tst_kill_test()
>  	fi
>  }
>  
> +_tst_cleanup_timer()
> +{
> +	if [ -n "$_tst_setup_timer_pid" ]; then
> +		kill -TERM $_tst_setup_timer_pid 2>/dev/null
> +		wait $_tst_setup_timer_pid 2>/dev/null
> +	fi
> +}
> +
> +_tst_timeout_process()
> +{
> +	local sleep_pid
> +
> +	sleep $sec &
> +	sleep_pid=$!
> +	trap "kill $sleep_pid; exit" TERM
> +	wait $sleep_pid
> +	_tst_kill_test
> +}
> +
>  _tst_setup_timer()
>  {
>  	TST_TIMEOUT=${TST_TIMEOUT:-300}
> @@ -486,7 +497,8 @@ _tst_setup_timer()
>  	tst_res TINFO "timeout per run is ${h}h ${m}m ${s}s"
>  
>  	_tst_cleanup_timer
> -	sleep $sec && _tst_kill_test &
> +
> +	_tst_timeout_process &
>  
>  	_tst_setup_timer_pid=$!
>  }
> -- 
> 2.30.2
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
