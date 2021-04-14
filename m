Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C082A35F4E1
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 15:31:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 699873C70E1
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 15:31:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 38D9A3C1B4D
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 15:31:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AD92B1000D4D
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 15:31:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA7EFAE93;
 Wed, 14 Apr 2021 13:31:39 +0000 (UTC)
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B5467@dggeml531-mbx.china.huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: zhaogongyi <zhaogongyi@huawei.com>
In-reply-to: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B5467@dggeml531-mbx.china.huawei.com>
Date: Wed, 14 Apr 2021 14:31:38 +0100
Message-ID: <87blah2ds5.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

zhaogongyi <zhaogongyi@huawei.com> writes:

> Hi Richard,
>
> That's right. I have a Misunderstanding of cgroup.procs. Actrually, we can write pid or tgid to cgroup.procs instead of pgid.
>
> I'll update the code as:
>
> 	SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpid());
>
> BTW I find that the testcase run passed on my local system, it seems
> that tst_* will not trig memory allocation:

After a short search I found do_tty_write can return ENOMEM due to a
call to kmalloc with GFP_KERNEL.

As I said previously stderr can point to many things with different
write implementations. Some of these are likely to trigger memory
allocation. Please see my previous reply and suggestion.

Also please note the warning message in the kernel log when using
memory.kmem.limit_in_bytes.

>
> tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> memcg_kmem_limit_in_bytes.c:58: TPASS: fork fail as expected
> memcg_kmem_limit_in_bytes.c:73: TPASS: kmem alloc is controled by
> memory.kmem.limit_in_bytes
>
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  0
> warnings 0
>
>
> Thanks very much!
>
> Best Regards,
> Gongyi
>
>> 
>> Hello,
>> 
>> zhaogongyi <zhaogongyi@huawei.com> writes:
>> 
>> > Hi Richard,
>> >
>> > Calling setpgid in this testcase is aim to make the task group be
>> controlled by memory.kmem.limit_in_bytes since we have set the pgid to
>> cgroup.procs.
>> >
>> 
>> Please see cgroup_procs_write_start in cgroup/cgroup.c. It calls
>> find_task_by_vpid which interprets pid as PIDTYPE_PID not PIDTYPE_PGID.
>> 
>> --
>> Thank you,
>> Richard.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
