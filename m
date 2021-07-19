Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AAC3CCE1C
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 08:48:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E7D63C2E5C
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Jul 2021 08:48:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33F0D3C0131
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 08:48:13 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C272D1001F53
 for <ltp@lists.linux.it>; Mon, 19 Jul 2021 08:48:12 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 10972201D2;
 Mon, 19 Jul 2021 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626677292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dSPMxuaR8qFMJN+llrRDszWanukXQNfYcGlbVGVQtOQ=;
 b=JIq6V2vdVXVshfvN7ic2R411ANmvQj9hfFiMXf2CnanH6xGZowI8+EonalF5rCNZ20E5qO
 SZGDTNrcxytLXGdWnyvNk0A2rvSCofJ6X9sszwLOZB06VSqK5RRWKcKqXFRSYS+Rh6SYs3
 b3H8r+WugUxYv62BOjgy6MtcNUmbn08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626677292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dSPMxuaR8qFMJN+llrRDszWanukXQNfYcGlbVGVQtOQ=;
 b=P83lEIkUtiV8IN7BBju94Rcln2XOEXWI8qzeZ1CGeCq1zbkTJALQ5FpxinN/bKVEnthCes
 rz+Rhm50kTwSGaBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6CBC13C9B;
 Mon, 19 Jul 2021 06:48:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Cs1xJysg9WBHfQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 19 Jul 2021 06:48:11 +0000
Date: Mon, 19 Jul 2021 08:48:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Leo Liang <ycliang@andestech.com>
Message-ID: <YPUgKpSqTLYVCSRF@pevik>
References: <20210716140235.GA22205@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716140235.GA22205@andestech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3,
 2/2] cgroup/cgroup_regression_test: Fix umount failure
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
Cc: richiejp@f-m.fm, alankao@andestech.com, metan@ucw.cz,
 ycliang@cs.nctu.edu.tw, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> The test sequence
> 	mount -t cgroup -o <controllers> <path>
> 	mkdir <path>/<dir>
> 	rmdir <path>/<dir>
> 	umount <path>
> 	mount -t cgroup -o <controllers> <path>
> would easily fail at the last mount with -EBUSY on certain platform.

> The reason is that this test sequence would have the chance of
> missing a release code path when doing rmdir and umount.

> Adding a little delay between "rmdir" and "umount" could fix the problem,
> so use tst_umount API instead of umount in "rmdir, umount" sequence.

> Fixes: #839

> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
>  .../controllers/cgroup/cgroup_regression_test.sh       | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

> diff --git a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> index 1f7f3820e..056166f11 100755
> --- a/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> +++ b/testcases/kernel/controllers/cgroup/cgroup_regression_test.sh
> @@ -145,7 +145,7 @@ test2()
>  	fi

>  	rmdir cgroup/0 cgroup/1
> -	umount cgroup/
> +	tst_umount cgroup/
As I note in previous patch, with suggested change to tst_umount() to always add
trailing "/" it'd be enough just "tst_umount cgroup".

I'm not sure what is better: automatic handling or having to explicitly add
trailing "/".

Kind regards,
Petr

>  }

>  #---------------------------------------------------------------------------
> @@ -193,7 +193,7 @@ test3()
>  	wait $pid2 2>/dev/null

>  	rmdir $cpu_subsys_path/0 2> /dev/null
> -	umount cgroup/ 2> /dev/null
> +	tst_umount cgroup/ 2> /dev/null
>  	check_kernel_bug
>  }

> @@ -222,7 +222,7 @@ test4()
>  	mount -t cgroup -o none,name=foo cgroup cgroup/
>  	mkdir cgroup/0
>  	rmdir cgroup/0
> -	umount cgroup/
> +	tst_umount cgroup/

>  	if dmesg | grep -q "MAX_LOCKDEP_SUBCLASSES too low"; then
>  		tst_res TFAIL "lockdep BUG was found"
> @@ -254,7 +254,7 @@ test5()
>  	mount -t cgroup none cgroup 2> /dev/null
>  	mkdir cgroup/0
>  	rmdir cgroup/0
> -	umount cgroup/ 2> /dev/null
> +	tst_umount cgroup/ 2> /dev/null
>  	check_kernel_bug
>  }

> @@ -290,7 +290,7 @@ test6()

>  	mount -t cgroup -o ns xxx cgroup/ > /dev/null 2>&1
>  	rmdir cgroup/[1-9]* > /dev/null 2>&1
> -	umount cgroup/
> +	tst_umount cgroup/
>  	check_kernel_bug
>  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
