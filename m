Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F62E3A93D8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:27:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0DA393C4CB9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:27:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2942C3C2DD7
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:27:46 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 93325600C51
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:27:45 +0200 (CEST)
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ltPxf-0005d5-O2
 for ltp@lists.linux.it; Wed, 16 Jun 2021 07:27:43 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so530950edq.4
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 00:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dex7622phYrmu8l+hE4phDsFYtClvuXHjXNSDInMs1g=;
 b=eNmQbHCMi7ymsCeDYpaR/4nXEYGUdN510yMnXpMVlaj4+Gg6uKVQs1ulxm2QJxH0/4
 nLphGhC63Kes/7PU+wWgghO5D2xgFPhsxlenbVgqmwVfSzIf1hjzSZSVQT151mXFTgTh
 csYCHe7RKTrLYpvkJxKmqLRCXAAoqy8jl60j/I0BSr91IHkranKWhukfSizMgjInrc9k
 du+V/xvEXIHKHq3rn1w889raOxcqchXyJzFJ2d/tb9eW8q+DqkCeExD3yes5rocG43Wn
 sGFQXUTcY42OiJRRexWQpetlptdPD8y2+hy6YdfEDcZZ1l16YEWN3ceZLELsVV0nqfTF
 sU2g==
X-Gm-Message-State: AOAM532orbiAvolPEl75RvLwEQG9ZGn4FXr3rUJ8uxb03Ptk046rRWND
 VM8y3ZuJ+bB20IAtCzBFkhbIBfxonFzCeyl3O6RH4Lle4sP27pgClhlPIZtvbkq+1kCMX9yQdiE
 AHnp2kEZsO/ATY9/3gi5zP0580/WP
X-Received: by 2002:a50:8e18:: with SMTP id 24mr2467401edw.275.1623828463280; 
 Wed, 16 Jun 2021 00:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg+iZJ4HSPjMP1MYu1KSLJ3gW/i1FbmY+W7Qfz5y4eazGwZqeZEM4DrSK85hsjGD8c3YCYsg==
X-Received: by 2002:a50:8e18:: with SMTP id 24mr2467394edw.275.1623828463132; 
 Wed, 16 Jun 2021 00:27:43 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b14sm1029245edz.21.2021.06.16.00.27.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 00:27:42 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210614161413.82389-1-krzysztof.kozlowski@canonical.com>
 <YMjYBoqTw9RSqYqH@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ae81aa2b-da04-4ec5-aee9-4db1e511fdbf@canonical.com>
Date: Wed, 16 Jun 2021 09:27:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMjYBoqTw9RSqYqH@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.2 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

On 15/06/2021 18:40, Cyril Hrubis wrote:
> Hi!
>> +check_free_memory()
>> +{
>> +	local memneeded
>> +	local memfree=`awk '/MemAvailable/ {print $2}' /proc/meminfo`
>> +
>> +	if [ $? -ne 0 ]; then
>> +		local memcached
>> +
>> +		memfree=`awk '/MemFree/ {print $2}' /proc/meminfo`
>> +		test $? || return 0
>> +
>> +		memcached=`awk '/MemCached/ {print $2}' /proc/meminfo`
>> +		test $? || return 0
> 
> I do not think that something as basic as awk on /proc/meminfo here will
> fail...

It's still nice pattern to check for return values but if you insist, I
can drop it.

> 
>> +		memfree=$((memfree + memcached))
>> +	fi
>> +
>> +	# On x86_64, each 100 of processes were using ~16 MB of memory,
>> +	# so try to estimate the needed free memory based on this.
>> +	memneeded=$((max * nbprocess * 16384 / 100))
>> +
>> +	if [ $memfree -lt $memneeded ]; then
> 
> I would still add some memory margin to the memneeded here. At least
> add a hundred of megabytes before we do the check.

Sure.

> 
>> +		tst_brk TCONF "not enough of free memory on this system (approximate need $memneeded kB, free $memfree kB)"
>> +	fi
>> +	tst_res TINFO "memory requirements fulfilled (approximate need $memneeded kB, free $memfree kB)"
>> +
>> +	return 0
>> +}
>> +
>> +check_limits()
>> +{
>> +	local realuid="$SUDO_UID"
>> +	local tasksneeded=$((max * nbprocess + 100))
>> +
>> +	if [ "$realuid" = "" ]; then
>> +		realuid=`id -u`
>> +		test $? || return 0
>> +	fi
>> +
>> +	local tasksmax=`systemctl show user-${real_uid}.slice | awk -F '=' '/TasksMax/ {print $2}'`
>> +	test $? || return 0
>> +
>> +	if [ $tasksmax -le $tasksneeded ]; then
>> +		tst_brk TCONF "limit of tasks is too low (approximate need $tasksneeded, limit $tasksmax)"
>> +	fi
>> +	tst_res TINFO "task limit fulfilled (approximate need $tasksneeded, limit $tasksmax)"
> 
> Huh, is this really needed? The test is supposed to run under root. The
> user is supposed to login as a root or at least do 'su -' before
> executing LTP anyways.

Yeah, because even root sessions (user-0.slice) have the PID limit set
by systemd.

$ ssh root@....
$ grep . /sys/fs/cgroup/pids/user.slice/*/*
/sys/fs/cgroup/pids/user.slice/user-0.slice/cgroup.clone_children:0
/sys/fs/cgroup/pids/user.slice/user-0.slice/notify_on_release:0
/sys/fs/cgroup/pids/user.slice/user-0.slice/pids.current:5
/sys/fs/cgroup/pids/user.slice/user-0.slice/pids.events:max 0
/sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207


> 
>> +	return 0
>> +}
>> +
>>  setup()
>>  {
>>  	if ! grep -q -w cpuacct /proc/cgroups; then
>>  		tst_brk TCONF "cpuacct not supported on this system"
>>  	fi
>>  
>> +	check_limits
>> +	# Don't bother with memory limit checks on smaller tests
>> +	if [ $max -ge 100 ] && [ $nbprocess -ge 100 ]; then
> 
> We should probably check if the $max * $mbprocess -ge 1000 or something
> like that just in a case someone addds a test with large enough
> $nbprocess.

Makes sense, optionally the check can be done always.

Thanks for the review!


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
