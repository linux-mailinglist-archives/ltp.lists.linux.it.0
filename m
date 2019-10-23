Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85016E19CE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 14:19:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 426093C1CE6
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 14:19:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id C457D3C1C90
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 14:19:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9CBF9601D45
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 14:19:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC7A7AC26;
 Wed, 23 Oct 2019 12:19:04 +0000 (UTC)
Date: Wed, 23 Oct 2019 14:19:03 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191023121901.GA25868@dell5510>
References: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower
 false positives
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

Hi Jan,

...
> -lsmod_test()
> +lsmod_matches_proc_modules()
>  {
>  	lsmod_output=$(lsmod | awk '!/Module/{print $1, $2, $3}' | sort)
>  	if [ -z "$lsmod_output" ]; then
> -		tst_res TFAIL "Failed to parse the output from lsmod"
> -		return
> +		tst_brk TBROK "Failed to parse the output from lsmod"
>  	fi

> -	modules_output=$(awk '{print $1, $2, $3}' /proc/modules | sort)
> +	modules_output=$(awk '{print $1, $2, $3} 1' /proc/modules | sort)
>  	if [ -z "$modules_output" ]; then
> -		tst_res TFAIL "Failed to parse /proc/modules"
> -		return
> +		tst_brk TBROK "Failed to parse /proc/modules"
>  	fi

>  	if [ "$lsmod_output" != "$modules_output" ]; then
> -		tst_res TFAIL "lsmod output different from /proc/modules."
> +		tst_res TINFO "lsmod output different from /proc/modules."

>  		echo "$lsmod_output" > temp1
>  		echo "$modules_output" > temp2
>  		diff temp1 temp2

> -		return
> +		return 1
>  	fi
> +	return 0
> +}

> -	tst_res TPASS "'lsmod' passed."
> +lsmod_test()
> +{
> +	for i in $(seq 1 5); do
> +		if lsmod_matches_proc_modules; then
> +			tst_res TPASS "'lsmod' passed."
> +			return
> +		fi
> +		tst_res TINFO "Trying again"
> +		sleep 1
> +	done
This is similar pattern to TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF()
(for both shell and C). I wonder if we also have use for TPASS/TFAIL
instead of just TBROK and specifying number of tries instead of time to be
setup.
C and shell usage is a bit different, so maybe
TST_RETRY_FUNC()/TST_RETRY_FN_EXP_BACKOFF() doesn't make much sense for shell
(actually nothing uses them in shell) and I don't see much usage for my proposal
in C.

> +	tst_res TFAIL "'lsmod' doesn't match /proc/modules output"

+ we forget to use local (for lsmod_outputa and i), but that's not that
important.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
