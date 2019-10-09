Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F165D115B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:34:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07BF83C2288
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:34:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1AD313C0B92
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:34:36 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 73FA7601F87
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:34:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D55C2AC68;
 Wed,  9 Oct 2019 14:34:35 +0000 (UTC)
Date: Wed, 9 Oct 2019 16:34:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191009143434.GE7561@rei.lan>
References: <20190930145916.20465-1-pvorel@suse.cz>
 <20190930145916.20465-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930145916.20465-3-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v4 2/5] shell: Introduce TST_TIMEOUT variable,
 add checks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  _tst_setup_timer()
>  {
> +	TST_TIMEOUT=${TST_TIMEOUT:-300}
>  	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
>  
> -	local sec=$((300 * LTP_TIMEOUT_MUL))
> +	if [ "$TST_TIMEOUT" = -1 ]; then
> +		tst_res TINFO "Timeout per run is disabled"
> +		return
> +	fi
> +
> +	local err="LTP_TIMEOUT_MUL must be number >= 1!"
> +
> +	tst_is_num "$LTP_TIMEOUT_MUL" || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
> +
> +	if ! tst_is_int "$LTP_TIMEOUT_MUL"; then
> +		tst_test_cmds cut

I do not think that it's necessary to check for the presense of the cut
command.

> +		LTP_TIMEOUT_MUL=$(echo "$LTP_TIMEOUT_MUL" | cut -d. -f1)
> +		LTP_TIMEOUT_MUL=$((LTP_TIMEOUT_MUL+1))
> +		tst_res TINFO "ceiling LTP_TIMEOUT_MUL to $LTP_TIMEOUT_MUL"
> +	fi
> +	[ "$LTP_TIMEOUT_MUL" -ge 1 ] || tst_brk TCONF "$err ($LTP_TIMEOUT_MUL)"
> +
> +	if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
> +		tst_brk TBROK "TST_TIMEOUT must be int >= 1! ($TST_TIMEOUT)"
> +	fi
> +
> +	local sec
> +	if [ "$is_float" ]; then
> +		sec=`echo | awk '{printf("%d\n", '$TST_TIMEOUT' * '$LTP_TIMEOUT_MUL'+ 0.5)}'`
> +	else
> +		sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
> +	fi

Is this a leftover? Now that LTP_TIMEOUT_MUL has been converted to int
we can simply do what is done in the else branch.

>  	local h=$((sec / 3600))
>  	local m=$((sec / 60 % 60))
>  	local s=$((sec % 60))
> @@ -418,7 +446,7 @@ tst_run()
>  			NEEDS_CMDS|NEEDS_MODULE|MODPATH|DATAROOT);;
>  			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
>  			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
> -			RETRY_FUNC|RETRY_FN_EXP_BACKOFF);;
> +			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
>  			NET_MAX_PKT);;
>  			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
>  			esac
> -- 
> 2.23.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
