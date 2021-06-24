Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D42D63B3705
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 21:30:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 627A63C6F77
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Jun 2021 21:30:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4F2D93C5863
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 21:30:34 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 61BC2600F6D
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 21:30:34 +0200 (CEST)
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lwV3Z-0002Q3-F9
 for ltp@lists.linux.it; Thu, 24 Jun 2021 19:30:33 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so2025437wmq.7
 for <ltp@lists.linux.it>; Thu, 24 Jun 2021 12:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7VRxx0LOs3BHt9wS/srNiPjUgZNcvfLMVwQrQWNf3nQ=;
 b=mYKKy+DStEAsgCwdnzk1R6PNKSzWAln7cIqqu4fQADYHf6lA9kvcanLHQFHQbc7QXy
 zrhF1Up6LRdJzZAU6zi+bf6jklHYlnsvFiVdfHsz75ot+rByy6ABKtkjyEMAyWAtdtMM
 LCN2/6R30IDAbzdD+VQ67H7HUSLMKCQrLJcThIu6Guz6LW6Cb2UdHRb5EMbdVR6KrWA5
 sqmHfZFN611yzDp0ppuElHVPGs71pVnhlprhopv9PmApdxBCXH26jz3fkO7FHl+IHj+8
 1xBCdUBZJRNIKdkNCK+MPdmVkUM2wEVqLrFwwe5zuGN9dg1oCq9exQOwFlvk7unTKqjs
 oqAQ==
X-Gm-Message-State: AOAM532mkOJB5IyEUwPh+c2sQ/otqN/JKsSyyjbOIzlRwTZpbm9fW2hz
 ESF6+ok/1TbwhUZDetej9SQR9PbLDvekRBVUt9HpJKLY11I9gwsiEd6618mDJZ9KHaoUIwGAX14
 grn1N8PQyMP7vh1nAYVhk1StyXNpf
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr6126892wmc.183.1624563032918; 
 Thu, 24 Jun 2021 12:30:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNTuS19m5A4JTXjK9e9sb4PkkOp1Vsv4uWBs4bgPiUWFtCBag8PT5RCXGZQsdb8peui3llhg==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr6126875wmc.183.1624563032743; 
 Thu, 24 Jun 2021 12:30:32 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id u12sm4151686wrq.50.2021.06.24.12.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 12:30:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210614161413.82389-1-krzysztof.kozlowski@canonical.com>
 <YMjYBoqTw9RSqYqH@yuki> <ae81aa2b-da04-4ec5-aee9-4db1e511fdbf@canonical.com>
 <893b4dd3-7dae-e4c3-3d5a-a6c467a179c8@canonical.com>
Message-ID: <dd3dbaa4-adac-04b9-e0ce-eb0fb4db8b34@canonical.com>
Date: Thu, 24 Jun 2021 21:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <893b4dd3-7dae-e4c3-3d5a-a6c467a179c8@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
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

On 16/06/2021 09:28, Krzysztof Kozlowski wrote:
> On 16/06/2021 09:27, Krzysztof Kozlowski wrote:
>> On 15/06/2021 18:40, Cyril Hrubis wrote:
>>> Hi!
>>>> +check_free_memory()
>>>> +{
>>>> +	local memneeded
>>>> +	local memfree=`awk '/MemAvailable/ {print $2}' /proc/meminfo`
>>>> +
>>>> +	if [ $? -ne 0 ]; then
>>>> +		local memcached
>>>> +
>>>> +		memfree=`awk '/MemFree/ {print $2}' /proc/meminfo`
>>>> +		test $? || return 0
>>>> +
>>>> +		memcached=`awk '/MemCached/ {print $2}' /proc/meminfo`
>>>> +		test $? || return 0
>>>
>>> I do not think that something as basic as awk on /proc/meminfo here will
>>> fail...
>>
>> It's still nice pattern to check for return values but if you insist, I
>> can drop it.
>>
>>>
>>>> +		memfree=$((memfree + memcached))
>>>> +	fi
>>>> +
>>>> +	# On x86_64, each 100 of processes were using ~16 MB of memory,
>>>> +	# so try to estimate the needed free memory based on this.
>>>> +	memneeded=$((max * nbprocess * 16384 / 100))
>>>> +
>>>> +	if [ $memfree -lt $memneeded ]; then
>>>
>>> I would still add some memory margin to the memneeded here. At least
>>> add a hundred of megabytes before we do the check.
>>
>> Sure.
>>
>>>
>>>> +		tst_brk TCONF "not enough of free memory on this system (approximate need $memneeded kB, free $memfree kB)"
>>>> +	fi
>>>> +	tst_res TINFO "memory requirements fulfilled (approximate need $memneeded kB, free $memfree kB)"
>>>> +
>>>> +	return 0
>>>> +}
>>>> +
>>>> +check_limits()
>>>> +{
>>>> +	local realuid="$SUDO_UID"
>>>> +	local tasksneeded=$((max * nbprocess + 100))
>>>> +
>>>> +	if [ "$realuid" = "" ]; then
>>>> +		realuid=`id -u`
>>>> +		test $? || return 0
>>>> +	fi
>>>> +
>>>> +	local tasksmax=`systemctl show user-${real_uid}.slice | awk -F '=' '/TasksMax/ {print $2}'`
>>>> +	test $? || return 0
>>>> +
>>>> +	if [ $tasksmax -le $tasksneeded ]; then
>>>> +		tst_brk TCONF "limit of tasks is too low (approximate need $tasksneeded, limit $tasksmax)"
>>>> +	fi
>>>> +	tst_res TINFO "task limit fulfilled (approximate need $tasksneeded, limit $tasksmax)"
>>>
>>> Huh, is this really needed? The test is supposed to run under root. The
>>> user is supposed to login as a root or at least do 'su -' before
>>> executing LTP anyways.
>>
>> Yeah, because even root sessions (user-0.slice) have the PID limit set
>> by systemd.
>>
>> $ ssh root@....
>> $ grep . /sys/fs/cgroup/pids/user.slice/*/*
>> /sys/fs/cgroup/pids/user.slice/user-0.slice/cgroup.clone_children:0
>> /sys/fs/cgroup/pids/user.slice/user-0.slice/notify_on_release:0
>> /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.current:5
>> /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.events:max 0
>> /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207
> 
> I forgot to mention: that's a default Ubuntu 20.04 LTS system on 2 GB
> RAM machine, with systemd 245.4-4ubuntu3.6.

Any further comments here or something to fix? I think there were no
objections to this patch, right?


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
