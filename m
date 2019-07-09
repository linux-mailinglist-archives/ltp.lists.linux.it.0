Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9658B63515
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 13:42:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 414233C1CFC
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 13:42:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 353423C003C
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 13:42:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 17C4C100126B
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 13:42:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 49A70AC58;
 Tue,  9 Jul 2019 11:42:05 +0000 (UTC)
Date: Tue, 9 Jul 2019 13:42:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20190709114204.GB5888@rei.lan>
References: <20190703102303.32166-1-po-hsu.lin@canonical.com>
 <20190703102303.32166-4-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703102303.32166-4-po-hsu.lin@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] zram/zram_lib.sh: iterate through all
 available compression algorithms for all zram block devices
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
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  .../kernel/device-drivers/zram/zram_lib.sh     | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
> index d50be699d..96400b2d9 100755
> --- a/testcases/kernel/device-drivers/zram/zram_lib.sh
> +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> @@ -101,12 +101,18 @@ zram_compress_alg()
>  	local zram_algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
>  	tst_resm TINFO "supported algs: $zram_algs"
>  	local i=0
> -	for alg in $zram_algs; do
> -		local sys_path="/sys/block/zram${i}/comp_algorithm"
> -		echo "$alg" >  $sys_path || \
> -			tst_brkm TFAIL "can't set '$alg' to $sys_path"
> -		i=$(($i + 1))
> -		tst_resm TINFO "$sys_path = '$alg' ($i/$dev_num)"
> +	local dev_max=0
> +	while [ -d /sys/block/zram$(($dev_max + 1)) ]; do
> +		dev_max=$(($dev_max + 1))
> +	done

The zram01.sh test defines dev_num that is passed to the modprobe zram
as num_devices, there is no point in counting the block devices like
this.

> +	for i in $(seq 0 $dev_max); do
> +		for alg in $zram_algs; do
> +			local sys_path="/sys/block/zram${i}/comp_algorithm"
> +			echo "$alg" >  $sys_path || \
> +				tst_brkm TFAIL "can't set '$alg' to $sys_path"
> +			tst_resm TINFO "$sys_path = '$alg' ($i/$dev_max)"
> +		done
>  	done

This is OK, but we should make sure we end up with expected compression
method for subsequent tests.

Maybe we should just set the alg to the zram_algs="" as defined in the
zram01.sh after this loop.

>  	tst_resm TPASS "test succeeded"
> -- 
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
