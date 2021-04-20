Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B510C3653F4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 10:22:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 634AF3C6C90
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Apr 2021 10:22:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A73FA3C1C66
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 10:22:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4EA2D200C6A
 for <ltp@lists.linux.it>; Tue, 20 Apr 2021 10:22:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAA21B49C;
 Tue, 20 Apr 2021 08:22:41 +0000 (UTC)
Date: Tue, 20 Apr 2021 10:22:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YH6PT2HKt6t1xZxR@pevik>
References: <20210420075351.16059-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420075351.16059-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: print more info for debugging
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
Cc: xuyang2018.jy@cn.fujitsu.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> We can NOT reproduce the problem by manual with both ppc64le and s390x,
> so let's print more useful info from test when getting fail.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM, just some remarks below

>  mkfs01 1 TPASS: 'mkfs -t ext4  /dev/loop0 ' passed.
>  mkfs01 2 TFAIL: 'mkfs -t ext4  /dev/loop0 16000' failed, not expected.
>  mkfs01 3 TPASS: 'mkfs -t ext4 -c /dev/loop0 ' passed.
>  mkfs01 4 TPASS: 'mkfs -V   ' passed.
>  mkfs01 5 TPASS: 'mkfs -h   ' passed.

> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/commands/mkfs/mkfs01.sh | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

> diff --git a/testcases/commands/mkfs/mkfs01.sh b/testcases/commands/mkfs/mkfs01.sh
> index 90368190d..55296c8df 100755
> --- a/testcases/commands/mkfs/mkfs01.sh
> +++ b/testcases/commands/mkfs/mkfs01.sh
> @@ -128,7 +128,8 @@ mkfs_test()
>  	if [ -n "$device" ]; then
>  		mkfs_verify_type "$fs_type" "$device"
>  		if [ $? -ne 0 ]; then
> -			tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> +			tst_res TFAIL "'${mkfs_cmd}' failed, not expected type."
Maybe "unexpected type"?

I'd also change ${mkfs_cmd} to $mkfs_cmd (more readable).

> +			cat temp
>  			return
>  		fi
>  	fi
> @@ -136,7 +137,8 @@ mkfs_test()
>  	if [ -n "$size" ]; then
>  		mkfs_verify_size "$fs_type" "$size"
>  		if [ $? -ne 0 ]; then
> -			tst_res TFAIL "'${mkfs_cmd}' failed, not expected."
> +			tst_res TFAIL "'${mkfs_cmd}' failed, not expected size."
The same here.

Kind regards,
Petr

> +			cat temp
>  			return
>  		fi
>  	fi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
