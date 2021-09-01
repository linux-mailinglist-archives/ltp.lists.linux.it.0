Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C223FDB8A
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 15:17:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 44F1C3C99A8
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 15:17:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E3713C222D
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:17:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5191C1000D55
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:17:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9138A1FF05;
 Wed,  1 Sep 2021 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630502269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSDDEEKX+hoPLCZYpRGq3F6z0l43IWvWivZsfPzFxbk=;
 b=0l64jHfJQ0s/xyw74jqW9cPUAkbVvpDG9L2B/FJkVRckry8zpSs0HBr+9CllDiP8CLk/W+
 Q+VVzyJfp92ZOHgS0FKL7bBLX1biHMavIfBH5NjBuDVwez/GEjzyfoyPLdGpizA6EDxoUi
 u7XiHGPa5+kpsgpKAP5hxJ/CiYwgKTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630502269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BSDDEEKX+hoPLCZYpRGq3F6z0l43IWvWivZsfPzFxbk=;
 b=yTjVuGTDWOZt8a7cdUmiNOQN/69xBsWNNLysw+SJKiONtg5Qgb4DxK3DxDxJNrjUFXuKh/
 CHYMWT9Aq6FffaCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EF2213AF8;
 Wed,  1 Sep 2021 13:17:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LqgFGn19L2GkAgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 01 Sep 2021 13:17:49 +0000
Date: Wed, 1 Sep 2021 15:17:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <YS99h3rPMLeSEFv5@yuki>
References: <20210827092007.20889-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827092007.20889-1-krzysztof.kozlowski@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] controllers/cpuacct: skip cpuacct_100_100
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
> +		test $? -eq 0 || return 0
> +
> +		memcached=`awk '/MemCached/ {print $2}' /proc/meminfo`
> +		test $? -eq 0 || return 0
> +
> +		memfree=$((memfree + memcached))
> +	fi
> +
> +	# On x86_64, each 100 of processes were using ~16 MB of memory,
> +	# so try to estimate the needed free memory based on this.
> +	memneeded=$((max * nbprocess * 16384 / 100))
> +
> +	if [ $memfree -lt $memneeded ]; then
> +		tst_brk TCONF "not enough of free memory on this system (approximate need $memneeded kB, free $memfree kB)"
> +	fi
> +	tst_res TINFO "memory requirements fulfilled (approximate need $memneeded kB, free $memfree kB)"
> +
> +	return 0
> +}
> +
> +check_limits()
> +{
> +	local real_uid="$SUDO_UID"
> +	local tasksneeded=$((max * nbprocess + 100))
> +
> +	if [ "$real_uid" = "" ]; then
> +		real_uid=`id -u`
> +		test $? -eq 0 || return 0
> +	fi
> +
> +	local tasksmax=`systemctl show user-${real_uid}.slice | awk -F '=' '/TasksMax/ {print $2}'`
> +	test $? -eq 0 || return 0
> +
> +	# Check for number for cases like TasksMax=infinity
> +	[ -n "$tasksmax" ] && [ "$tasksmax" -eq "$tasksmax" ] 2>/dev/null
> +	test $? -eq 0 || return 0

Well we do have a C implementation of this now, it would be better to
have the logic in one place and just call the C function to collect the
number of pids.

If we add tst_get_free_pids.c to the testcases/lib/ directory with:

#define TST_NO_DEFAULT_MAIN
#include <stdio.h>
#include <tst_test.h>

extern struct tst_test *tst_test;

static struct tst_test test = {
};

int main(void)
{
	/* force messages to be printed from new library */
        tst_test = &test;

        printf("%i\n", tst_get_free_pids());

        return 0;
}

We can do FREE_PIDS=$(tst_get_free_pids) here and then just compare the numbers.

> +	if [ $tasksmax -le $tasksneeded ]; then
> +		tst_brk TCONF "limit of tasks is too low (approximate need $tasksneeded, limit $tasksmax)"
> +	fi
> +	tst_res TINFO "task limit fulfilled (approximate need $tasksneeded, limit $tasksmax)"
> +
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
> +		check_free_memory
> +	fi
> +
>  	mount_point=`grep -w cpuacct /proc/mounts | cut -f 2 | cut -d " " -f2`
>  	tst_res TINFO "cpuacct: $mount_point"
>  	if [ "$mount_point" = "" ]; then
> -- 
> 2.30.2
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
