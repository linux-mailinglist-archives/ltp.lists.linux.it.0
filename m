Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B1C308E38
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 21:17:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76F4B3C5E62
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 21:17:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2A8973C28F3
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 21:17:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C0D5E140124F
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 21:17:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12D9FACB0;
 Fri, 29 Jan 2021 20:17:22 +0000 (UTC)
Date: Fri, 29 Jan 2021 21:17:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YBRtUD8vJUuF4S6V@pevik>
References: <20210129194144.31299-1-pvorel@suse.cz>
 <20210129194144.31299-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210129194144.31299-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/6] zram01.sh: Generate test setup variables
 in setup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> -# List of parameters for zram devices.
> -# For each number the test creates own zram device.
> -zram_max_streams="2 3 5 8"
Not sure about the meaning of zram_max_streams.
It looks like sequence of i+3, starting from 0.
Maybe instead of having variable behaving like array,
zram_max_streams() loop could be based on $dev_num.
But that's just cosmetic.
...
> +generate_vars()
> +{
> +	local fs limit size stream=-1
> +	dev_num=0
> +
> +	for fs in $(tst_supported_fs | grep -v -e fat -e ntfs -e fuse); do
> +		size="26214400"
> +		limit="25M"
> +		if [ "$fs" = "btrfs" ]; then
> +			get_btrfs_size || continue
> +			size="402653184"
> +			limit="$((size/1024/1024))M"
> +		fi
> +
> +		stream=$((stream+3))
> +		dev_num=$((dev_num+1))
> +		zram_filesystems="$zram_filesystems $fs"
> +		zram_mem_limits="$zram_mem_limits $limit"
> +		zram_sizes="$zram_sizes $size"
> +		zram_max_streams="$zram_max_streams $stream"

...
> +++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
> @@ -36,10 +36,12 @@ zram_load()
>  {
>  	local tmp

> -	dev_num=0
> -	for tmp in $zram_max_streams; do
> -		dev_num=$((dev_num+1))
> -	done
> +	if [ -z "$dev_num" ]; then
> +		dev_num=0
> +		for tmp in $zram_max_streams; do
> +			dev_num=$((dev_num+1))
> +		done
> +	fi

>  	if [ $dev_num -le 0 ]; then
>  		tst_brk TBROK "dev_num must be > 0"
> @@ -129,6 +131,7 @@ zram_set_disksizes()

>  		i=$(($i + 1))
>  		tst_res TINFO "$sys_path = '$ds' ($i/$dev_num)"
> +		[ $i -eq $dev_num ] && break
This check is not needed any more.
>  	done

>  	tst_res TPASS "test succeeded"
> @@ -155,6 +158,7 @@ zram_set_memlimit()

>  		i=$(($i + 1))
>  		tst_res TINFO "$sys_path = '$ds' ($i/$dev_num)"
> +		[ $i -eq $dev_num ] && break
And here.
>  	done

>  	tst_res TPASS "test succeeded"
> @@ -191,13 +195,10 @@ zram_swapoff()

>  zram_makefs()
>  {
> -	tst_require_cmds mkfs
>  	local i=0
> +	local fs

>  	for fs in $zram_filesystems; do
> -		# if requested fs not supported default it to ext2
> -		tst_supported_fs $fs 2> /dev/null || fs=ext2
> -
>  		tst_res TINFO "make $fs filesystem on /dev/zram$i"
>  		mkfs.$fs /dev/zram$i > err.log 2>&1
>  		if [ $? -ne 0 ]; then
> @@ -206,6 +207,7 @@ zram_makefs()
>  		fi

>  		i=$(($i + 1))
> +		[ $i -eq $dev_num ] && break
And here
>  	done

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
