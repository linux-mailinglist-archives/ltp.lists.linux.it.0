Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF73A2E19
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 16:26:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C76C83C5520
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 16:26:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 25CAD3C2192
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 16:26:18 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 872E6200C3C
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 16:26:17 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA55E1FD37;
 Thu, 10 Jun 2021 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623335176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oJamV4VMxT4SKzN0tih9Y3pGioZiCwwPt05DrOM4o4M=;
 b=yXi/mirH3diYnPb1MMX3Tyx+uFNQrfKSoi2/X4RKRjEogmojlFaweL/9wBH3GyR0g1y5xv
 zlicAuRNU8RTSIzF3+W0LFvH1TNe6U8ulTLifOk8qPduLhk4/zsZ/FG4TRosUagp3pfjTj
 wjRERh20u0WXPNPxq6KquEv0XLlmuWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623335176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oJamV4VMxT4SKzN0tih9Y3pGioZiCwwPt05DrOM4o4M=;
 b=+2E3sou/w6OKEWWilU6pkDXgJLeAY228r15ZZEjLQFA7WzsxGgWixhHfz2ayV32Tpk14IS
 da+6RsY+hmHPpXCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id AE197118DD;
 Thu, 10 Jun 2021 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623335176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oJamV4VMxT4SKzN0tih9Y3pGioZiCwwPt05DrOM4o4M=;
 b=yXi/mirH3diYnPb1MMX3Tyx+uFNQrfKSoi2/X4RKRjEogmojlFaweL/9wBH3GyR0g1y5xv
 zlicAuRNU8RTSIzF3+W0LFvH1TNe6U8ulTLifOk8qPduLhk4/zsZ/FG4TRosUagp3pfjTj
 wjRERh20u0WXPNPxq6KquEv0XLlmuWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623335176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oJamV4VMxT4SKzN0tih9Y3pGioZiCwwPt05DrOM4o4M=;
 b=+2E3sou/w6OKEWWilU6pkDXgJLeAY228r15ZZEjLQFA7WzsxGgWixhHfz2ayV32Tpk14IS
 da+6RsY+hmHPpXCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id aVJyKQghwmBjZgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 10 Jun 2021 14:26:16 +0000
Date: Thu, 10 Jun 2021 16:00:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YMIa/eXUzx8ygk9g@yuki>
References: <20210610100927.32015-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610100927.32015-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] controllers/cpuacct: skip cpuacct_100_100 on
 small memory systems
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
> Running cpuacct_100_100 on a system with less than ~4 GB of RAM fails:
> 
>     cpuacct 1 TINFO: timeout per run is 0h 5m 0s
>     cpuacct 1 TINFO: cpuacct: /sys/fs/cgroup/cpu,cpuacct
>     cpuacct 1 TINFO: Creating 100 subgroups each with 100 processes
>     testcases/bin/cpuacct.sh: 0: Cannot fork
> 
> In dmesg:
> 
>     LTP: starting cpuacct_100_100 (cpuacct.sh 100 100)
>     cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope
> 
> It seems system might not handle or not allow that amount of processes,
> so simply skip the test.  The threshold of ~4 GB was found during
> experimenting, so it is not accurate.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  testcases/kernel/controllers/cpuacct/cpuacct.sh | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
> index 323aa7513bf4..2646018d295e 100755
> --- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
> +++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
> @@ -44,6 +44,20 @@ setup()
>  		tst_brk TCONF "cpuacct not supported on this system"
>  	fi
>  
> +	if [ $max -ge 100 ] && [ $nbprocess -ge 100 ]; then
> +		local memtotal=`awk '/MemTotal/ {print $2}' /proc/meminfo`
> +		if [ $? -eq 0 ]; then
> +			# cpuacct.sh 100 100 will fail if memory is less
> +			# than 4 GB with:
> +			#   testcases/bin/cpuacct.sh: 0: Cannot fork
> +			# Choose some limit of total memory, determined
> +			# with experiments: 3*1024+768 MB = 3932160 kB
> +			if [ $memtotal -lt 3932160 ]; then
> +				tst_brk TCONF "not enough of memory on this system (less than 3840 MB)"
> +			fi
> +		fi
> +	fi
> +

This looks quite hacky and ad-hoc.

First of all MemTotal is not a good estimate of usable system memory, if
nothing else this should use better estimate. We have something that is
more or less usable in swapping01.c tests in init_meminfo() function.

Secondly we should create a rough estimage how the memory grows based on
number of processes and on number of subgroups.

The we can have a generic check if there is enough memory for a given
test. The problem is that all these estimates are rough and rest of the
system may eat memory as well, so we will have to make sure there is big
enough margin. If we want to count on the test success it has to be
large and consists "offset" (N * pagesize) and percentage of available
memory 10% or so.

And yes, this is a complex problem that is not easy to fix. If it was
easy it would have been fixed a long time ago...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
