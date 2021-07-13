Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CCE3C6DB6
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:48:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 779E43C8763
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:48:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2222D3C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:48:12 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0213A200A0F
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:48:11 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 4F09C405D1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626169691;
 bh=+Jh3BP5B981NarvEcnCSuuxJa5cAEQY/ZJKG8PS3OKM=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=M+URLeYhJHg1oIs+ZjFNfD5e66/S52UryJ0WKMLYYyztz6Yl+jMLFLRQ+gThhZTX+
 If3C501+SPqYiHjt2eDdLvYlmBcnlV8aYdEHGw1Ul8FO39/w79QHziB0RSPLX9rQBo
 c01bmsaYbpdv/nwwUjf0jdYpm0+uEA5w2cvEcHottZbECfu5OBxWq05Vj6PJZMK30P
 biMCI/Ls16Owp9gYTaoVAi56Qvvdsbf3ajI+J579tSElZyHxHTlqRHkBJuF+RBhmMr
 /HpDmkOicNY+PkFLD6RZ9PdcAcNr+WoJz0GKNSvaRIwNAF+BegL3g/lr6auqahSZ6U
 ca9AMA+VCHFrw==
Received: by mail-ed1-f69.google.com with SMTP id
 j7-20020aa7c4070000b02903a4b519b413so4620533edq.9
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 02:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Jh3BP5B981NarvEcnCSuuxJa5cAEQY/ZJKG8PS3OKM=;
 b=I4hl5Bvv90C214dG1afur15CKlJA4q+T36eezq/im6nNvK6H4D6793h9GCxKZA4SOn
 f9hklnC+fQNn+Il6fsJbXWiZNviB77YelEKuHPuC97ubs1VZBicGlxDnXLC7rF9MMmwS
 DOOZInYevekZGXK5M7wZyAByJ2li0cyVualrVcweEQmfDRwLWkbppg5QlOXL/PABesZu
 x4Mi89USiL9ntMMAh3Hyk3oa4avLl2Z1iFXaQSJOc3s/n8fTjgHmA/OqlE1hq86Z4IM2
 +t0GHIVgswy9wn5s7L2ubA4p/uhaWYA/wHh6t4ViaO6x4XKZWfHxtSnpiWcH+kFah18f
 kxUA==
X-Gm-Message-State: AOAM533PV+srryP6cUBoQ4VbtNZvgKZTWsvKVkWYaI+CLuUeGeHdcbzn
 AOYp8OTZW1hQxArBtyFtKi8J8E+8Xkg1gUchcEOJCY4upQXUO8R9A+aOyph9vBNrDoTFF6L3wuW
 v+eo8QQnqeCQ4nkdEHuOW8tf8YEnh
X-Received: by 2002:a05:6402:51:: with SMTP id
 f17mr4538352edu.359.1626169690628; 
 Tue, 13 Jul 2021 02:48:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEL3hufJWlYuLizZ44hBc1FyaBVmUxgD8b6775tefU0DX6JeohhwbNBMuudOddeh94jcMzTw==
X-Received: by 2002:a05:6402:51:: with SMTP id
 f17mr4538345edu.359.1626169690532; 
 Tue, 13 Jul 2021 02:48:10 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id ot18sm2483814ejb.109.2021.07.13.02.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 02:48:10 -0700 (PDT)
To: rpalethorpe@suse.de
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
 <20210713092210.17141-5-krzysztof.kozlowski@canonical.com>
 <87y2aa5z6q.fsf@suse.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9e0129f5-2edd-1f49-aedb-0f5aecc72c6d@canonical.com>
Date: Tue, 13 Jul 2021 11:48:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87y2aa5z6q.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/5] controllers/memcg: increase memory limit
 in subgroup charge
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

On 13/07/2021 11:40, Richard Palethorpe wrote:
> Hello Krzysztof,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:
> 
>> The memcg_subgroup_charge was failing on kernel v5.8 in around 10% cases
>> with:
>>
>>     memcg_subgroup_charge 1 TINFO: Running memcg_process --mmap-anon -s 135168
>>     memcg_subgroup_charge 1 TINFO: Warming up pid: 19289
>>     memcg_subgroup_charge 1 TINFO: Process is still here after warm up: 19289
>>     memcg_subgroup_charge 1 TFAIL: rss is 0, 135168 expected
>>     memcg_subgroup_charge 1 TPASS: rss is 0 as expected
>>
>> In dmesg one could see that OOM killer killed the process even though
>> group memory limit was matching the usage:
>>
>>     memcg_process invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
>>     CPU: 4 PID: 19289 Comm: memcg_process Not tainted 5.8.0-1031-oracle #32~20.04.2-Ubuntu
>>     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1 12/03/2020
>>     ...
>>     memory: usage 132kB, limit 132kB, failcnt 9
>>     memory+swap: usage 132kB, limit 9007199254740988kB, failcnt 0
>>     kmem: usage 4kB, limit 9007199254740988kB, failcnt 0
>>     ...
>>     Tasks state (memory values in pages):
>>     [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
>>     [  19289]     0 19289      669      389    40960        0             0 memcg_process
>>     oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=/,mems_allowed=0,oom_memcg=/ltp_19257,task_memcg=/ltp_19257,task=memcg_process,pid=19289,uid=0
>>     Memory cgroup out of memory: Killed process 19289 (memcg_process) total-vm:2676kB, anon-rss:84kB, file-rss:1468kB, shmem-rss:4kB, UID:0 pgtables:40kB oom_score_adj:0
>>     oom_reaper: reaped process 19289 (memcg_process), now anon-rss:0kB, file-rss:0kB, shmem-rss:4kB
>>
>> It seems actual kernel memory usage by a given group depends on number
>> of CPUs, where at least one page is allocated per-cpu beside regular
>> (expected) allocation.  Fix the test on machines with more CPUs by
>> including this per-CPU memory in group limits, plus some slack of 4
>> PAGES.  Increase also memory allocation from 32 to 64 pages to be more
>> distinctive from kernel per-CPU memory.
> 
> Actually I think it is 66 pages? Because PAGESIZES=pagesize*33.
>

Yes, right. Maybe this could be fixed when applying - no need for resend.


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
