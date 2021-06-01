Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C93971BB
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:42:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AA803C68F6
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 12:42:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70C4B3C1939
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:42:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0B6316011AC
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 12:42:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 71A3D2191B;
 Tue,  1 Jun 2021 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622544169;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sAZvtZ6TyMWlfg+V2/j/H4iZa+TCfpywsVeYlmCc67s=;
 b=ZbV30Coe4PnFh7pGLHk4d2q5A9ZNO9hSQk9jlUz5rqFfR83NYHy4MLwJyFJi4N67ffq98Q
 XES82imS8xTzrVi5HQouNE95XifXLSlI3Fh/hkA8fR9d+G7BW4WmXM3r5mkxIc+x/nQfdu
 C3c5NdvQXQjoHyb0/twx6MJAEfRyVWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622544169;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sAZvtZ6TyMWlfg+V2/j/H4iZa+TCfpywsVeYlmCc67s=;
 b=HCc+wJb1X3BW2bW9jkOQNRSazMIRWi9z0cogY9jsRnj9vLW6LJxCJIRz3kXTgQyDYipW/g
 LfvnalyO/saocSCQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2DAEFA3B91;
 Tue,  1 Jun 2021 10:42:49 +0000 (UTC)
References: <20210521102528.21102-1-rpalethorpe@suse.com>
 <20210521102528.21102-7-rpalethorpe@suse.com>
 <CAEemH2c2yTKbUyW5RQoyqOh2k0JFe3wNJwdcRfBkZD9w8SHG0w@mail.gmail.com>
 <87k0njjj11.fsf@suse.de>
 <CAEemH2fww4Zwqh6E_C+R9erUpXbebKUzS2eHe4JT9LXnsgLUGQ@mail.gmail.com>
 <CAEemH2dTr7vDjdEJ3TsoPnQMM6TSk7-0dPX0yC2Emd1z+8vDFg@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dTr7vDjdEJ3TsoPnQMM6TSk7-0dPX0yC2Emd1z+8vDFg@mail.gmail.com>
Date: Tue, 01 Jun 2021 11:42:48 +0100
Message-ID: <87h7ihkgrb.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/6] sched/cgroup: Add cfs_bandwidth01
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

>> > > [root@dhcp-66-83-181 cfs-scheduler]# ./cfs_bandwidth01
>> > > tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
>> > > tst_buffers.c:55: TINFO: Test is using guarded buffers
>> > > cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '3000 10000'
>> > > cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '2000 10000'
>> > > cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '3000 10000'
>> > > cfs_bandwidth01.c:111: TPASS: Scheduled bandwidth constrained workers
>> > > cfs_bandwidth01.c:42: TBROK:
>> > > vdprintf(10</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2>,
>> > > 'cpu.cfs_quota_us', '%u'<5000>): EINVAL (22)
>> >
>> > I wonder if your kernel disallows setting this on a trunk node after it
>> > has been set on leaf nodes (with or without procs in)?
>>
>> After looking a while, I think the CGrup V1 disallows the parent quota
>> less than the max value of its children.
>>
>> This means we should set in level2 at least '3000/10000', just like what
>> we did for level3.
>>
>>   cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '3000 10000'
>>   cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '2000 10000'
>>   cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '3000 10000'
>>
>> But in the failure, it shows level2 only set to 5000/100000 (far less than
>> 3000/10000), that's because function set_cpu_quota changes the system
>> default value 'cpu.cfs_period_us' from 100000 to 10000.
>
> Or, just reverse the code order to set cfs_period_us first, that also works.
>
> --- a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
> +++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
> @@ -38,10 +38,10 @@ static void set_cpu_quota(const struct
> tst_cgroup_group *const cg,
>                 SAFE_CGROUP_PRINTF(cg, "cpu.max",
>                                    "%u %u", quota_us, period_us);
>         } else {
> -               SAFE_CGROUP_PRINTF(cg, "cpu.max",
> -                                  "%u", quota_us);
>                 SAFE_CGROUP_PRINTF(cg, "cpu.cfs_period_us",
>                                   "%u", period_us);
> +               SAFE_CGROUP_PRINTF(cg, "cpu.max",
> +                                  "%u", quota_us);
>         }

Thanks, that is a nice fix.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
