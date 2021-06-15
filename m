Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A30583A8711
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 19:06:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3CAF83C8948
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Jun 2021 19:06:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A14D53C2E09
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 19:06:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 934561400E1C
 for <ltp@lists.linux.it>; Tue, 15 Jun 2021 19:06:20 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D19221FD65;
 Tue, 15 Jun 2021 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623776779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WrMHkiCaQivA9oX0GnUbpFSNu6wRr8f/28KRDpgrRM=;
 b=y19SZFS5T9dgberH4L2sFo6J+QTUUXi5K+jkrudghczir+UBkr8qXRnZECDxMCwV47P6JF
 h5vW9L5QNQB3h92UfGMfmSOOiIR2ngRtjEXtURUgaqAONpfotwAc2xYOIMo7RgBIx1r+ty
 ymsGQqhIi0OfCVtunm7KzC8KW0v6Bds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623776779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WrMHkiCaQivA9oX0GnUbpFSNu6wRr8f/28KRDpgrRM=;
 b=WJM0aaSgNzejJpuBzT9zFqWFZGixFhNlsGdkWI/+99dS+JUlR+309/hw1Y6oKjxr0xs792
 UlGoJvm16C+4jrAw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B0521118DD;
 Tue, 15 Jun 2021 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623776779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WrMHkiCaQivA9oX0GnUbpFSNu6wRr8f/28KRDpgrRM=;
 b=y19SZFS5T9dgberH4L2sFo6J+QTUUXi5K+jkrudghczir+UBkr8qXRnZECDxMCwV47P6JF
 h5vW9L5QNQB3h92UfGMfmSOOiIR2ngRtjEXtURUgaqAONpfotwAc2xYOIMo7RgBIx1r+ty
 ymsGQqhIi0OfCVtunm7KzC8KW0v6Bds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623776779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WrMHkiCaQivA9oX0GnUbpFSNu6wRr8f/28KRDpgrRM=;
 b=WJM0aaSgNzejJpuBzT9zFqWFZGixFhNlsGdkWI/+99dS+JUlR+309/hw1Y6oKjxr0xs792
 UlGoJvm16C+4jrAw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id C9aWKQveyGDeDwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 15 Jun 2021 17:06:19 +0000
Date: Tue, 15 Jun 2021 18:40:38 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YMjYBoqTw9RSqYqH@yuki>
References: <20210614161413.82389-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614161413.82389-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] controllers/cpuacct: skip cpuacct_100_100
 on small memory systems
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
> +check_free_memory()
> +{
> +	local memneeded
> +	local memfree=`awk '/MemAvailable/ {print $2}' /proc/meminfo`
> +
> +	if [ $? -ne 0 ]; then
> +		local memcached
> +
> +		memfree=`awk '/MemFree/ {print $2}' /proc/meminfo`
> +		test $? || return 0
> +
> +		memcached=`awk '/MemCached/ {print $2}' /proc/meminfo`
> +		test $? || return 0

I do not think that something as basic as awk on /proc/meminfo here will
fail...

> +		memfree=$((memfree + memcached))
> +	fi
> +
> +	# On x86_64, each 100 of processes were using ~16 MB of memory,
> +	# so try to estimate the needed free memory based on this.
> +	memneeded=$((max * nbprocess * 16384 / 100))
> +
> +	if [ $memfree -lt $memneeded ]; then

I would still add some memory margin to the memneeded here. At least
add a hundred of megabytes before we do the check.

> +		tst_brk TCONF "not enough of free memory on this system (approximate need $memneeded kB, free $memfree kB)"
> +	fi
> +	tst_res TINFO "memory requirements fulfilled (approximate need $memneeded kB, free $memfree kB)"
> +
> +	return 0
> +}
> +
> +check_limits()
> +{
> +	local realuid="$SUDO_UID"
> +	local tasksneeded=$((max * nbprocess + 100))
> +
> +	if [ "$realuid" = "" ]; then
> +		realuid=`id -u`
> +		test $? || return 0
> +	fi
> +
> +	local tasksmax=`systemctl show user-${real_uid}.slice | awk -F '=' '/TasksMax/ {print $2}'`
> +	test $? || return 0
> +
> +	if [ $tasksmax -le $tasksneeded ]; then
> +		tst_brk TCONF "limit of tasks is too low (approximate need $tasksneeded, limit $tasksmax)"
> +	fi
> +	tst_res TINFO "task limit fulfilled (approximate need $tasksneeded, limit $tasksmax)"

Huh, is this really needed? The test is supposed to run under root. The
user is supposed to login as a root or at least do 'su -' before
executing LTP anyways.

> +	return 0
> +}
> +
>  setup()
>  {
>  	if ! grep -q -w cpuacct /proc/cgroups; then
>  		tst_brk TCONF "cpuacct not supported on this system"
>  	fi
>  
> +	check_limits
> +	# Don't bother with memory limit checks on smaller tests
> +	if [ $max -ge 100 ] && [ $nbprocess -ge 100 ]; then

We should probably check if the $max * $mbprocess -ge 1000 or something
like that just in a case someone addds a test with large enough
$nbprocess.

> +		check_free_memory
> +	fi
> +
>  	mount_point=`grep -w cpuacct /proc/mounts | cut -f 2 | cut -d " " -f2`
>  	tst_res TINFO "cpuacct: $mount_point"
>  	if [ "$mount_point" = "" ]; then
> -- 
> 2.27.0
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
