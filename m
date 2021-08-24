Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF193F5D12
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 13:28:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 170313C31F1
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 13:28:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC2893C1A29
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 13:28:41 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 837E31A001C9
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 13:28:38 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 17OBRkcs059758;
 Tue, 24 Aug 2021 19:27:46 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from ubuntu02 (10.0.12.212) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Tue, 24 Aug 2021 19:27:44 +0800
Date: Tue, 24 Aug 2021 19:27:37 +0800
From: Leo Liang <ycliang@andestech.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YSTXqWWebzq+mBIQ@ubuntu02>
References: <20210804015248.GA22328@andestech.com>
 <YSOuhTL87oYnwfk3@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSOuhTL87oYnwfk3@pevik>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Originating-IP: [10.0.12.212]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 17OBRkcs059758
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6,
 1/4] lib: tst_umount: umount a mount point instead of a device
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Understood! Thanks for explaining everything!
I will send a v7 soon including all the modifications needed.

Best regards,
Leo

On Mon, Aug 23, 2021 at 04:19:49PM +0200, Petr Vorel wrote:
> Hi Leo,
> 
> as I noted at forth patch, some tests use tst_umount with the default parameter.
> Thus we should set the default TST_MNTPOINT to use $PWD as well.
> 
> I'd also add quotes around $mntpoint in TCONF/TINFO messages in tst_mount() as
> the original message was a bit confusing when the mountpoint was called
> 'mntpoint' (TWARN: The mntpoint is not an absolute path).
> 
> Kind regards,
> Petr
> 
> +++ testcases/lib/tst_test.sh
> @@ -279,31 +279,35 @@ tst_mount()
>  
>  tst_umount()
>  {
> -	local device="${1:-$TST_DEVICE}"
> +	local mntpoint="${1:-$TST_MNTPOINT}"
>  	local i=0
>  
> -	[ -z "$device" ] && return
> +	[ -z "$mntpoint" ] && return
>  
> -	if ! grep -q "$device" /proc/mounts; then
> -		tst_res TINFO "The $device is not mounted, skipping umount"
> +	if ! echo "$mntpoint" | grep -q ^/; then
> +		tst_brk TCONF "The '$mntpoint' is not an absolute path"
> +	fi
> +
> +	if ! grep -q "${mntpoint%/}" /proc/mounts; then
> +		tst_res TINFO "The '$mntpoint' is not mounted upon, skipping umount"
Will add this in v7!
>  		return
>  	fi
>  
>  	while [ "$i" -lt 50 ]; do
> -		if umount "$device" > /dev/null; then
> +		if umount "$mntpoint" > /dev/null; then
>  			return
>  		fi
>  
>  		i=$((i+1))
>  
> -		tst_res TINFO "umount($device) failed, try $i ..."
> +		tst_res TINFO "umount($mntpoint) failed, try $i ..."
>  		tst_res TINFO "Likely gvfsd-trash is probing newly mounted "\
>  		              "fs, kill it to speed up tests."
>  
>  		tst_sleep 100ms
>  	done
>  
> -	tst_res TWARN "Failed to umount($device) after 50 retries"
> +	tst_res TWARN "Failed to umount($mntpoint) after 50 retries"
>  }
>  
>  tst_mkfs()
> @@ -628,7 +632,7 @@ tst_run()
>  		cd "$TST_TMPDIR"
>  	fi
>  
> -	TST_MNTPOINT="${TST_MNTPOINT:-mntpoint}"
> +	TST_MNTPOINT="${TST_MNTPOINT:-$PWD/mntpoint}"
This is a good catch.
I think I did notice that df01.sh uses tst_umount as a clean up
function, but didn't realize that this should be changed!
Thanks for the heads up!
>  	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
>  
>  		TST_DEVICE=$(tst_device acquire)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
