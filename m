Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27491166F60
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 06:59:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD26E3C20BC
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 06:59:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B726F3C0EAD
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 06:59:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1B80E1A0088B
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 06:59:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8EEECABBD;
 Fri, 21 Feb 2020 05:59:38 +0000 (UTC)
Date: Fri, 21 Feb 2020 06:59:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20200221055936.GA13261@dell5510>
References: <20190710072305.25806-1-po-hsu.lin@canonical.com>
 <20190710072305.25806-2-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710072305.25806-2-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCHv2 1/3] zram/zram_lib.sh: fix variable name and
 algorithm retrieval
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

Hi,

> The compression algorithm was stored into a local variable "algs",
> however the variable name zram_algs was used in the for loop later.

> Unify them with algs so the default zram_algs defined in zram01 won't
> be altered.

> Also, use sed to get rid of the square brackets that indicates the
> compression algorithm currently in use.
>     $ cat /sys/block/zram0/comp_algorithm
>     [lzo] lz4 lz4hc 842 zstd

> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  testcases/kernel/device-drivers/zram/zram_lib.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

> diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
> index d0e7704a8..599e5f0f3 100755
> --- a/testcases/kernel/device-drivers/zram/zram_lib.sh
> +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> @@ -98,10 +98,10 @@ zram_compress_alg()

>  	tst_resm TINFO "test that we can set compression algorithm"

> -	local algs="$(cat /sys/block/zram0/comp_algorithm)"
> +	local algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
>  	tst_resm TINFO "supported algs: $algs"
>  	local i=0
> -	for alg in $zram_algs; do
> +	for alg in $algs; do
>  		local sys_path="/sys/block/zram${i}/comp_algorithm"
>  		echo "$alg" >  $sys_path || \
>  			tst_brkm TFAIL "can't set '$alg' to $sys_path"

Sorry for a late reply.

What is the purpose of zram_algs="lzo lzo lzo lzo in zram01.sh?
It should be removed now, right? (as you decided not to set the algorithms to the ones defined in the zram01.sh
test at the end of this function as Cyril suggested at [1]

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2019-July/012674.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
