Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E53EE364
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:16:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B49053C2509
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 16:16:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id D0E483C2400
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:16:52 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E1C511A00F4C
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 16:16:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 804AFAB7D;
 Mon,  4 Nov 2019 15:16:50 +0000 (UTC)
Date: Mon, 4 Nov 2019 16:16:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20191104151647.GA15477@dell5510>
References: <20191104125228.17173-1-mdoucha@suse.cz>
 <20191104125228.17173-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191104125228.17173-2-mdoucha@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Fix compression ratio calculation in zram01
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

Hi Martin,

> zram01 uses `free -m` to measure zram memory usage. The results are nonsense
> because they are polluted by all running processes on the system.

> Use /sys/block/zram<id>/mm_stat to measure memory usage instead. The file is
> available since kernel 4.1.
+1 even older kernels won't be covered.
Thanks!

...
> --- a/testcases/kernel/device-drivers/zram/zram01.sh
>  zram_fill_fs()
>  {
> -	tst_test_cmds awk bc dd free
> -	local mem_free0=$(free -m | awk 'NR==2 {print $4}')
> +	tst_test_cmds awk bc dd

>  	for i in $(seq 0 $(($dev_num - 1))); do
>  		tst_resm TINFO "fill zram$i..."
> @@ -75,29 +74,26 @@ zram_fill_fs()
>  			tst_brkm TBROK "cannot fill zram"
>  		fi
>  		tst_resm TINFO "zram$i can be filled with '$b' KB"
> -	done
> -
> -	local mem_free1=$(free -m | awk 'NR==2 {print $4}')
> -	local used_mem=$(($mem_free0 - $mem_free1))
> -
> -	local total_size=0
> -	for sm in $zram_sizes; do
> -		local s=$(echo $sm | sed 's/M//')
> -		total_size=$(($total_size + $s))
> -	done

> -	[ $used_mem -eq 0 ] && tst_brkm TBROK "no memory used by zram"
> +		if [ ! -f "/sys/block/zram$i/mm_stat" ]; then
> +			if [ $i -eq 0 ]; then
> +				tst_resm TCONF "zram compression ratio test requires zram mm_stat sysfs file"
I wonder if /sys/block/zram0/mm_stat is missing whether it can be on any other
zram<id>. Is it it's presence file system specific? Shouldn't we just quit whole
test wit tst_brk TCONF.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
