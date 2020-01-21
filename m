Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40668143F1F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 15:15:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC17A3C24EB
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 15:15:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1B8D03C23F6
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 15:15:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6173E20148D
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 15:14:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ABD1EB289;
 Tue, 21 Jan 2020 14:14:55 +0000 (UTC)
Date: Tue, 21 Jan 2020 15:14:54 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200121141454.GA6337@rei>
References: <20200117063600.3451-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117063600.3451-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] memcg/stress: Lower swap memory use
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
Cc: Zuo Liu <lz843723683@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Fix freeze on systems, where where swap size is more
> or less equal to a system RAM.
> 
> Fixes: #632
> 
> Reported-by: Zuo Liu <lz843723683@gmail.com>
> Tested-by: Zuo Liu <lz843723683@gmail.com>
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> index ad8605e16..a48d21e6e 100755
> --- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> +++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
> @@ -33,7 +33,7 @@ setup()
>  	local swap_free=`cat /proc/meminfo | grep SwapFree | awk '{ print $2 }'`
>  	local pgsize=`tst_getconf PAGESIZE`
>  
> -	MEM=$(( $mem_free + $swap_free / 2 ))
> +	MEM=$(( $mem_free + $swap_free / 1O ))

I wonder if we can be a bit smarter about this. Maybe we should add some
percentage of RAM if enough swap is present.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
