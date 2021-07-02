Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7303BA0E1
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 15:05:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47E5C3C8E5D
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 15:05:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 433933C6AD2
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 15:05:05 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 29B45601CF0
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 15:05:04 +0200 (CEST)
Received: from mail-ej1-f70.google.com ([209.85.218.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzIqu-0002LN-A0
 for ltp@lists.linux.it; Fri, 02 Jul 2021 13:05:04 +0000
Received: by mail-ej1-f70.google.com with SMTP id
 h14-20020a1709070b0eb02904d7c421e00bso377464ejl.2
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 06:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZI5E3z2KosxAArSMNEQO9O/fu3Mc/DR8SBryeVLpqng=;
 b=RpRLX1b6nnB1ePVhj2G6za5brtxVSfgHqDXtgj6Ze+bCtz7Wmwvfmv3ynAfSo+lZfM
 PrM0jIaPdOk6x0WTjuxJ9fLD4wJI7869BvaT9fDogggztKoGZLq74j4r8Be6sKUFteZX
 B64NiDWX0JrVA7yowc9F6zw/XOKBJZCj0PvnA1D0nABgPBS3dP6MRU2dyEC8sHvFiNSO
 lYymaWoJW9AfUohWy4bSL5MKsTczDKY1+ZPLnrvtwWmivjFYQah5iTasKGOCczKA5Bfl
 wP6bh0PHieo4OpiMXm0H5fBH+eakmLce7R31fTju9b7cqhHLLEh2eb708JjwELAaxEH9
 zCig==
X-Gm-Message-State: AOAM532t9JsV3sfdgz9dkR5914E08gU7xnLdYqs5PIPd9aLNypXKOxDO
 dYz4NuhpyGRxmg3/Vu28SP+1I1Yk4+B89pmK9EUg+qfkT0ncBEw2q1/md87vNEnIe8NNZCdfvFV
 oz/Gq5HzdPjrDyLcdNq8IQj5mHAGV
X-Received: by 2002:a50:85cc:: with SMTP id q12mr6580501edh.182.1625231103764; 
 Fri, 02 Jul 2021 06:05:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+nORNqY/PXw9UOyJXjQOd/ZuqzoZKSeuCbVDXp3m+XmRogBkMYC4xo8yValJVvgTwlir6bA==
X-Received: by 2002:a50:85cc:: with SMTP id q12mr6580483edh.182.1625231103604; 
 Fri, 02 Jul 2021 06:05:03 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e2sm1141075edy.12.2021.07.02.06.05.03
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 06:05:03 -0700 (PDT)
To: ltp@lists.linux.it
References: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
 <20210702125338.43248-5-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d0f82783-2d56-d8e0-efb3-15f468624dac@canonical.com>
Date: Fri, 2 Jul 2021 15:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702125338.43248-5-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 4/5] controllers/memcg: increase memory limit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


On 02/07/2021 14:53, Krzysztof Kozlowski wrote:
> The memcg_subgroup_charge was failing on kernel v5.8 in around 10% cases
> with:
> 
>     memcg_subgroup_charge 1 TINFO: Running memcg_process --mmap-anon -s 135168
>     memcg_subgroup_charge 1 TINFO: Warming up pid: 19289
>     memcg_subgroup_charge 1 TINFO: Process is still here after warm up: 19289
>     memcg_subgroup_charge 1 TFAIL: rss is 0, 135168 expected
>     memcg_subgroup_charge 1 TPASS: rss is 0 as expected
> 
> In dmesg one could see that OOM killer killed the process even though
> group memory limit was matching the usage:
> 
>     memcg_process invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
>     CPU: 4 PID: 19289 Comm: memcg_process Not tainted 5.8.0-1031-oracle #32~20.04.2-Ubuntu
>     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1 12/03/2020
>     ...
>     memory: usage 132kB, limit 132kB, failcnt 9
>     memory+swap: usage 132kB, limit 9007199254740988kB, failcnt 0
>     kmem: usage 4kB, limit 9007199254740988kB, failcnt 0
>     ...
>     Tasks state (memory values in pages):
>     [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
>     [  19289]     0 19289      669      389    40960        0             0 memcg_process
>     oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=/,mems_allowed=0,oom_memcg=/ltp_19257,task_memcg=/ltp_19257,task=memcg_process,pid=19289,uid=0
>     Memory cgroup out of memory: Killed process 19289 (memcg_process) total-vm:2676kB, anon-rss:84kB, file-rss:1468kB, shmem-rss:4kB, UID:0 pgtables:40kB oom_score_adj:0
>     oom_reaper: reaped process 19289 (memcg_process), now anon-rss:0kB, file-rss:0kB, shmem-rss:4kB
> 
> It seems using 100% of memory assigned to given group might trigger OOM,
> so add a space of at least one page.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../memcg/functional/memcg_subgroup_charge.sh    | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> index 9b23177a4dc5..88ddbabf7fa9 100755
> --- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> +++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
> @@ -19,9 +19,21 @@ TST_CNT=3
>  # $2 - memory.limit_in_bytes in sub group
>  test_subgroup()
>  {
> +	local limit_parent=$1
> +	local limit_subgroup=$2
> +
> +	# OOM might start killing if memory usage is 100%, so give it
> +	# always one page size more:
> +	if [ $limit_parent -ne 0 ]; then
> +		limit_parent=$((limit_parent + PAGESIZE))

This patch is independent from the other usage_in_bytes checks. I
included it here but maybe that's just noise...

Anyway, for v5.11 I just saw that increasing the limit by one page is
not enough.  Probably due to kernel memory accounted to the group:

[23868.177525] memory: usage 140kB, limit 140kB, failcnt 19
[23868.177527] memory+swap: usage 140kB, limit 9007199254740988kB, failcnt 0
[23868.177529] kmem: usage 16kB, limit 9007199254740988kB, failcnt 0

I am thinking of increasing this to 4 pages, although in the future it might not be enough.

> +	fi
> +	if [ $limit_subgroup -ne 0 ]; then
> +		limit_subgroup=$((limit_subgroup + PAGESIZE))
> +	fi
> +
>  	mkdir subgroup
> -	echo $1 > memory.limit_in_bytes
> -	echo $2 > subgroup/memory.limit_in_bytes
> +	echo $limit_parent > memory.limit_in_bytes
> +	echo $limit_subgroup > subgroup/memory.limit_in_bytes
>  
>  	start_memcg_process --mmap-anon -s $PAGESIZES
>  
> 


Best regards,
Krzysztof

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
