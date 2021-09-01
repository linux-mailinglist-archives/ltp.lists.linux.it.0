Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A64733FDDC2
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:23:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6848C3C2CE9
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 16:23:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E7F563C2A3D
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:23:26 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 984511A00E10
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 16:23:25 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D3A1C40180
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630506202;
 bh=NxzRX7Ee2fxfZsqsDYMyvUddV0Okt7J7IFCPvQfOXjc=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=TjxHhMu0buw/J0CBw3e7S8fHzqWBXzdN56BloMDfX9HmgfoeBBWhwOFiIhwCKqJmb
 DXQ6xXR6w68xhmj5n3qxUys1ZTKctk0kA/PLmGvVhBLB9NTMPRPQ8zQzcXoVTxIfa6
 0/skG4RbI2xCE30b6XD8KxwlKHZshG6kbTzeMifmN+F+lSBB+D5Ab+joZI/v3bzawT
 jQ7ftTpzwGLox9cp+X5ObY2YXhFWnzVN0w5ufLxxOZBwnBG102/B+C6uNg1WNT+w7N
 uEdEl2pcf/0PTvBicSik6i+fTmIJq99XFAJpP4cLRJRww9Io6i59YYgARGPTEKLE8r
 zV/kjlYb08rHw==
Received: by mail-wm1-f71.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso1100636wma.4
 for <ltp@lists.linux.it>; Wed, 01 Sep 2021 07:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NxzRX7Ee2fxfZsqsDYMyvUddV0Okt7J7IFCPvQfOXjc=;
 b=Ly9N9fbQ8ktyHQiDzDT45ohhw6tyDssA46vyD1VKHsfcgZ535usUxaPmwGRwjhz8Qg
 QX22ZXcz81sZNRwRCOnyhMd9Lyzu1TZ1JEAY8hnbL1tKqfdtY+nvwaYKFG65vgW91gOL
 qUWzsOnK4Y7Td9wFEwgwgCaGjoDPgtXy60KbkpSwR7Ms1P9x4srAJeaD5lukvKejSNgK
 ha3Dbg2iT/H83fD3HwJzV7vQxHYU1p6aSvhRGqpl1d8aW4MGyp9f/fUpdhrDWv3c4bWO
 +FBN+yziDMa876rcgHt1yOBmAcFwSzv0oNfhhSi7JyVqDVzSBPcWZrqXzTTd3C1UH+Ke
 MzvA==
X-Gm-Message-State: AOAM533F51qGuT/8UlhXC0VgfiQQss8dXcF1Hk9AyRbvI590gqHLjAG1
 kHAXn6mhsN6DIW135sDafFKUQsSxoX7OM835FzbHs8bQSUKPH6FdN/fAfzY6k8tS+Kn6MSdK7ew
 o94FVTqcDCD/4voCrt+pvzLsOThNh
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr10071891wmi.50.1630506200972; 
 Wed, 01 Sep 2021 07:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz8rJtGTmSwiPLiCmh6ExP1nA2H1nuSCxoK6mHoCXpyILac/vWk1wUOePeX3tqbnOgPZLc7w==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr10071651wmi.50.1630506198453; 
 Wed, 01 Sep 2021 07:23:18 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.134])
 by smtp.gmail.com with ESMTPSA id m24sm28660825wrb.18.2021.09.01.07.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 07:23:16 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210827092007.20889-1-krzysztof.kozlowski@canonical.com>
 <YS99h3rPMLeSEFv5@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <440b0bcf-63b5-bb78-6a0b-565a5266d9da@canonical.com>
Date: Wed, 1 Sep 2021 16:23:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS99h3rPMLeSEFv5@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

On 01/09/2021 15:17, Cyril Hrubis wrote:
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
>> +		test $? -eq 0 || return 0
>> +
>> +		memcached=`awk '/MemCached/ {print $2}' /proc/meminfo`
>> +		test $? -eq 0 || return 0
>> +
>> +		memfree=$((memfree + memcached))
>> +	fi
>> +
>> +	# On x86_64, each 100 of processes were using ~16 MB of memory,
>> +	# so try to estimate the needed free memory based on this.
>> +	memneeded=$((max * nbprocess * 16384 / 100))
>> +
>> +	if [ $memfree -lt $memneeded ]; then
>> +		tst_brk TCONF "not enough of free memory on this system (approximate need $memneeded kB, free $memfree kB)"
>> +	fi
>> +	tst_res TINFO "memory requirements fulfilled (approximate need $memneeded kB, free $memfree kB)"
>> +
>> +	return 0
>> +}
>> +
>> +check_limits()
>> +{
>> +	local real_uid="$SUDO_UID"
>> +	local tasksneeded=$((max * nbprocess + 100))
>> +
>> +	if [ "$real_uid" = "" ]; then
>> +		real_uid=`id -u`
>> +		test $? -eq 0 || return 0
>> +	fi
>> +
>> +	local tasksmax=`systemctl show user-${real_uid}.slice | awk -F '=' '/TasksMax/ {print $2}'`
>> +	test $? -eq 0 || return 0
>> +
>> +	# Check for number for cases like TasksMax=infinity
>> +	[ -n "$tasksmax" ] && [ "$tasksmax" -eq "$tasksmax" ] 2>/dev/null
>> +	test $? -eq 0 || return 0
> 
> Well we do have a C implementation of this now, it would be better to
> have the logic in one place and just call the C function to collect the
> number of pids.
> 
> If we add tst_get_free_pids.c to the testcases/lib/ directory with:
> 
> #define TST_NO_DEFAULT_MAIN
> #include <stdio.h>
> #include <tst_test.h>
> 
> extern struct tst_test *tst_test;
> 
> static struct tst_test test = {
> };
> 
> int main(void)
> {
> 	/* force messages to be printed from new library */
>         tst_test = &test;
> 
>         printf("%i\n", tst_get_free_pids());
> 
>         return 0;
> }
> 
> We can do FREE_PIDS=$(tst_get_free_pids) here and then just compare the numbers.
> 

I'll move this piece, as you suggested. The free memory limits is okay
to stay here?


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
