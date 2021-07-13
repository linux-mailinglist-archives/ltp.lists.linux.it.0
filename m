Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91A3C71F8
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 16:17:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B49703C877F
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 16:17:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 852B23C66F6
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:17:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E99911400F35
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:17:37 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 514CF22824;
 Tue, 13 Jul 2021 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626185857;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4WpOSQzANm1kAPYKttk0xZJ56QUJky1EACJistyOcc=;
 b=2BY7V5g7XZig47yPcgycA7EcYWXxpXYI6Ip+CCjKopE2+rqIT00uVDJdD90NCavvgQHmWm
 Ccy3wUYdEI8zI9P3etzClH1SPDRvAn9FIjJvffPV2ZSBGkrVKiowgHW4EHH/wbuFd0DUuU
 pRSUKS6Dcy+Pj+mvHcIU/DS/GUiolQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626185857;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4WpOSQzANm1kAPYKttk0xZJ56QUJky1EACJistyOcc=;
 b=w4cTAnMONCO3LM8uxqIuM2JBRvttupkozSZlvKcE9TvFsR/gXOcTjMQLd1ehZ3S0d5ZrDn
 58C3PJTBd2tZkWCA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 182C7A3B88;
 Tue, 13 Jul 2021 14:17:37 +0000 (UTC)
References: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
 <20210713092210.17141-5-krzysztof.kozlowski@canonical.com>
 <87y2aa5z6q.fsf@suse.de>
 <9e0129f5-2edd-1f49-aedb-0f5aecc72c6d@canonical.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-reply-to: <9e0129f5-2edd-1f49-aedb-0f5aecc72c6d@canonical.com>
Date: Tue, 13 Jul 2021 15:17:36 +0100
Message-ID: <874kcypabj.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:

> On 13/07/2021 11:40, Richard Palethorpe wrote:
>> Hello Krzysztof,
>> 
>> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:
>> 
>>> The memcg_subgroup_charge was failing on kernel v5.8 in around 10% cases
>>> with:
>>>
>>>     memcg_subgroup_charge 1 TINFO: Running memcg_process --mmap-anon -s 135168
>>>     memcg_subgroup_charge 1 TINFO: Warming up pid: 19289
>>>     memcg_subgroup_charge 1 TINFO: Process is still here after warm up: 19289
>>>     memcg_subgroup_charge 1 TFAIL: rss is 0, 135168 expected
>>>     memcg_subgroup_charge 1 TPASS: rss is 0 as expected
>>>
>>> In dmesg one could see that OOM killer killed the process even though
>>> group memory limit was matching the usage:
>>>
>>>     memcg_process invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
>>>     CPU: 4 PID: 19289 Comm: memcg_process Not tainted 5.8.0-1031-oracle #32~20.04.2-Ubuntu
>>>     Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.4.1 12/03/2020
>>>     ...
>>>     memory: usage 132kB, limit 132kB, failcnt 9
>>>     memory+swap: usage 132kB, limit 9007199254740988kB, failcnt 0
>>>     kmem: usage 4kB, limit 9007199254740988kB, failcnt 0
>>>     ...
>>>     Tasks state (memory values in pages):
>>>     [  pid  ]   uid  tgid total_vm      rss pgtables_bytes swapents oom_score_adj name
>>>     [  19289]     0 19289      669      389    40960        0             0 memcg_process
>>>     oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=/,mems_allowed=0,oom_memcg=/ltp_19257,task_memcg=/ltp_19257,task=memcg_process,pid=19289,uid=0
>>>     Memory cgroup out of memory: Killed process 19289 (memcg_process) total-vm:2676kB, anon-rss:84kB, file-rss:1468kB, shmem-rss:4kB, UID:0 pgtables:40kB oom_score_adj:0
>>>     oom_reaper: reaped process 19289 (memcg_process), now anon-rss:0kB, file-rss:0kB, shmem-rss:4kB
>>>
>>> It seems actual kernel memory usage by a given group depends on number
>>> of CPUs, where at least one page is allocated per-cpu beside regular
>>> (expected) allocation.  Fix the test on machines with more CPUs by
>>> including this per-CPU memory in group limits, plus some slack of 4
>>> PAGES.  Increase also memory allocation from 32 to 64 pages to be more
>>> distinctive from kernel per-CPU memory.
>> 
>> Actually I think it is 66 pages? Because PAGESIZES=pagesize*33.
>>
>
> Yes, right. Maybe this could be fixed when applying - no need for resend.
>
>
> Best regards,
> Krzysztof

Well I am more than happy with the patchset.

Acked-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
