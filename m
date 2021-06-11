Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E79C23A3EFC
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 11:22:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 696A83C6055
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 11:22:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1ACA73C2684
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 11:22:52 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 535C6601200
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 11:22:51 +0200 (CEST)
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrdNK-0004UI-Am
 for ltp@lists.linux.it; Fri, 11 Jun 2021 09:22:50 +0000
Received: by mail-wm1-f70.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so5192684wmj.4
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 02:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=21uES1t4OaKBmNyruP/zM45fAmzQBDHWGH2lQFPBWDU=;
 b=bo2V2vsRUR6BZahMqBQ7PwV5sWNecSZzTlfK0I8Q8+IU0x7VYJ5sM8ustqPtfyVEX1
 EGDxAdn0C3h6tBAc3t10TXEhYe/voDilOfTYLVSH3HbS45OhK0Ows7X5O2L2S6/Y6s4k
 ynIm2efkS8YTTaBViNTpOGY5UGir3iLL4nLfdrwXoK8klfFRKfXstNgimqrkc4r5zeVB
 P75Hd5X5rrr/mRnpzbCjZ4f5shwqH1TfWYzRfMMW7WJvY3Oh3V8MGxxwUk5bgKJb33Xq
 ZdgN1+Dy2VtbQg+E3dfRc4UEWTqaFJ5BmDcr9OQKTsvUGeMyLUIKJF/4G3pqbOaVSdi9
 e2lA==
X-Gm-Message-State: AOAM531Kw3KmJzPRTAwxDYzz2yX0pq/+NgZLYrrQNJFq4KH8m6U19FKv
 YnAA1VjVMTcXn4r+gDH8hIICjCxOrDOyCJoTT3Gjg4sA3s2/D7uzYJKyTN1o93r8VMUmnDCCs+4
 bxqi1kPVLfwiJ+drziGUIDEN3zQtn
X-Received: by 2002:a7b:ce13:: with SMTP id m19mr3045031wmc.159.1623403369843; 
 Fri, 11 Jun 2021 02:22:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqBfJBjjIzhUZpmh0aSwrujQXdAEa7MGWXV+RJR0NwbPcxgMDSmxuElCwOruY9kuXWFPD8dA==
X-Received: by 2002:a7b:ce13:: with SMTP id m19mr3045015wmc.159.1623403369609; 
 Fri, 11 Jun 2021 02:22:49 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id k12sm12081435wmr.2.2021.06.11.02.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 02:22:49 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210610100927.32015-1-krzysztof.kozlowski@canonical.com>
 <YMIa/eXUzx8ygk9g@yuki>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c4f3198b-62b5-51ab-6dc6-0c6dc8e1cbb8@canonical.com>
Date: Fri, 11 Jun 2021 11:22:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMIa/eXUzx8ygk9g@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

On 10/06/2021 16:00, Cyril Hrubis wrote:
> Hi!
>> Running cpuacct_100_100 on a system with less than ~4 GB of RAM fails:
>>
>>     cpuacct 1 TINFO: timeout per run is 0h 5m 0s
>>     cpuacct 1 TINFO: cpuacct: /sys/fs/cgroup/cpu,cpuacct
>>     cpuacct 1 TINFO: Creating 100 subgroups each with 100 processes
>>     testcases/bin/cpuacct.sh: 0: Cannot fork
>>
>> In dmesg:
>>
>>     LTP: starting cpuacct_100_100 (cpuacct.sh 100 100)
>>     cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope
>>
>> It seems system might not handle or not allow that amount of processes,
>> so simply skip the test.  The threshold of ~4 GB was found during
>> experimenting, so it is not accurate.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  testcases/kernel/controllers/cpuacct/cpuacct.sh | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
>> index 323aa7513bf4..2646018d295e 100755
>> --- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
>> +++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
>> @@ -44,6 +44,20 @@ setup()
>>  		tst_brk TCONF "cpuacct not supported on this system"
>>  	fi
>>  
>> +	if [ $max -ge 100 ] && [ $nbprocess -ge 100 ]; then
>> +		local memtotal=`awk '/MemTotal/ {print $2}' /proc/meminfo`
>> +		if [ $? -eq 0 ]; then
>> +			# cpuacct.sh 100 100 will fail if memory is less
>> +			# than 4 GB with:
>> +			#   testcases/bin/cpuacct.sh: 0: Cannot fork
>> +			# Choose some limit of total memory, determined
>> +			# with experiments: 3*1024+768 MB = 3932160 kB
>> +			if [ $memtotal -lt 3932160 ]; then
>> +				tst_brk TCONF "not enough of memory on this system (less than 3840 MB)"
>> +			fi
>> +		fi
>> +	fi
>> +
> 
> This looks quite hacky and ad-hoc.
> 
> First of all MemTotal is not a good estimate of usable system memory, if
> nothing else this should use better estimate. We have something that is
> more or less usable in swapping01.c tests in init_meminfo() function.
> 
> Secondly we should create a rough estimage how the memory grows based on
> number of processes and on number of subgroups.
> 
> The we can have a generic check if there is enough memory for a given
> test. The problem is that all these estimates are rough and rest of the
> system may eat memory as well, so we will have to make sure there is big
> enough margin. If we want to count on the test success it has to be
> large and consists "offset" (N * pagesize) and percentage of available
> memory 10% or so.
> 
> And yes, this is a complex problem that is not easy to fix. If it was
> easy it would have been fixed a long time ago...

I understand, thanks for the hints. I'll try to come up with some more
generic solution based on available memory (like mentioned init_meminfo).


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
