Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE02F394020
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 11:37:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6DBA03C770F
	for <lists+linux-ltp@lfdr.de>; Fri, 28 May 2021 11:37:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C20333C571E
 for <ltp@lists.linux.it>; Fri, 28 May 2021 11:37:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D9B6710009F1
 for <ltp@lists.linux.it>; Fri, 28 May 2021 11:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622194667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rFZ+1IV70zEWxYakdRU9+uq/KFNHyBa3Bb24UtQpIUE=;
 b=qrZUAh4Xv0E6xAGukyFfq6dfWmUukTKlEVswlygQggeeRWChL8cRgPKDHTlrAIl8PLNVAX
 pd021ymbKDLclLptB1/SQUSUl7C4Chd0u6+hWsGF1NfvFWrawsqHwSaRBI7A2vRyzDMTc8
 96XJzz1PplRIJFXeyfZR3Z4TSkY1eTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622194667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rFZ+1IV70zEWxYakdRU9+uq/KFNHyBa3Bb24UtQpIUE=;
 b=EYGjEeEJ/DWniMHtGgZw66pP7o/2bmnlWLODAY//Ez8bdFWHfYFfUfLUdjxLCFdU2/nCRT
 yyyBF7O4cjaigRAw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B01ACAEAE;
 Fri, 28 May 2021 09:37:47 +0000 (UTC)
References: <20210521102528.21102-1-rpalethorpe@suse.com>
 <20210521102528.21102-7-rpalethorpe@suse.com>
 <CAEemH2c2yTKbUyW5RQoyqOh2k0JFe3wNJwdcRfBkZD9w8SHG0w@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2c2yTKbUyW5RQoyqOh2k0JFe3wNJwdcRfBkZD9w8SHG0w@mail.gmail.com>
Date: Fri, 28 May 2021 10:37:46 +0100
Message-ID: <87k0njjj11.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

Hello, Li,

Li Wang <liwang@redhat.com> writes:

> On Fri, May 21, 2021 at 6:26 PM Richard Palethorpe via ltp
> <ltp@lists.linux.it> wrote:
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  runtest/sched                                 |   1 +
>>  .../kernel/sched/cfs-scheduler/.gitignore     |   1 +
>>  testcases/kernel/sched/cfs-scheduler/Makefile |   4 +-
>>  .../sched/cfs-scheduler/cfs_bandwidth01.c     | 175 ++++++++++++++++++
>>  4 files changed, 179 insertions(+), 2 deletions(-)
>>  create mode 100644 testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
>>
>> diff --git a/runtest/sched b/runtest/sched
>> index bfc4f2711..592898723 100644
>> --- a/runtest/sched
>> +++ b/runtest/sched
>> @@ -6,6 +6,7 @@ pth_str03 pth_str03
>>  time-schedule01                time-schedule
>>  trace_sched01          trace_sched -c 1
>>
>> +cfs_bandwidth01 cfs_bandwidth01 -i 5
>>  hackbench01 hackbench 50 process 1000
>>  hackbench02 hackbench 20 thread 1000
>>
>> diff --git a/testcases/kernel/sched/cfs-scheduler/.gitignore b/testcases/kernel/sched/cfs-scheduler/.gitignore
>> index db2759e4f..c5dacd6ef 100644
>> --- a/testcases/kernel/sched/cfs-scheduler/.gitignore
>> +++ b/testcases/kernel/sched/cfs-scheduler/.gitignore
>> @@ -1 +1,2 @@
>>  /hackbench
>> +cfs_bandwidth01
>> diff --git a/testcases/kernel/sched/cfs-scheduler/Makefile b/testcases/kernel/sched/cfs-scheduler/Makefile
>> index aa3bf8459..2ffe1f7f9 100644
>> --- a/testcases/kernel/sched/cfs-scheduler/Makefile
>> +++ b/testcases/kernel/sched/cfs-scheduler/Makefile
>> @@ -18,8 +18,8 @@
>>
>>  top_srcdir             ?= ../../../..
>>
>> -include $(top_srcdir)/include/mk/env_pre.mk
>> +include $(top_srcdir)/include/mk/testcases.mk
>>
>> -LDLIBS                 += -lpthread
>> +hackbench: LDLIBS                      += -lpthread
>>
>>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
>> diff --git a/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
>> new file mode 100644
>> index 000000000..7c988730e
>> --- /dev/null
>> +++ b/testcases/kernel/sched/cfs-scheduler/cfs_bandwidth01.c
>> @@ -0,0 +1,175 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/* Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com> */
>> +/*\
>> + *
>> + * [Description]
>> + *
>> + * Creates a multi-level CGroup hierarchy with the cpu controller
>> + * enabled. The leaf groups are populated with "busy" processes which
>> + * simulate intermittent cpu load. They spin for some time then sleep
>> + * then repeat.
>> + *
>> + * Both the trunk and leaf groups are set cpu bandwidth limits. The
>> + * busy processes will intermittently exceed these limits. Causing
>> + * them to be throttled. When they begin sleeping this will then cause
>> + * them to be unthrottle.
>> + *
>> + * The test is known to reproduce an issue with an update to
>> + * SLE-15-SP1 (kernel 4.12.14-197.64, bsc#1179093).
>> + */
>> +
>> +#include <stdlib.h>
>> +
>> +#include "tst_test.h"
>> +#include "tst_cgroup.h"
>> +#include "tst_timer.h"
>> +
>> +static const struct tst_cgroup_group *cg_test;
>> +static struct tst_cgroup_group *cg_level2, *cg_level3a, *cg_level3b;
>> +static struct tst_cgroup_group *cg_workers[3];
>> +
>> +static void set_cpu_quota(const struct tst_cgroup_group *const cg,
>> +                         const float quota_percent)
>> +{
>> +       const unsigned int period_us = 10000;
>> +       const unsigned int quota_us = (quota_percent / 100) * (float)period_us;
>> +
>> +       if (TST_CGROUP_VER(cg, "cpu") != TST_CGROUP_V1) {
>> +               SAFE_CGROUP_PRINTF(cg, "cpu.max",
>> +                                  "%u %u", quota_us, period_us);
>> +       } else {
>> +               SAFE_CGROUP_PRINTF(cg, "cpu.max",
>> +                                  "%u", quota_us);
>> +               SAFE_CGROUP_PRINTF(cg, "cpu.cfs_period_us",
>> +                                 "%u", period_us);
>> +       }
>> +
>> +       tst_res(TINFO, "Set '%s/cpu.max' = '%d %d'",
>> +               tst_cgroup_group_name(cg), quota_us, period_us);
>> +}
>> +
>> +static struct tst_cgroup_group *
>> +mk_cpu_cgroup(const struct tst_cgroup_group *const cg_parent,
>> +             const char *const cg_child_name,
>> +             const float quota_percent)
>> +{
>> +       struct tst_cgroup_group *const cg =
>> +               tst_cgroup_group_mk(cg_parent, cg_child_name);
>> +
>> +       set_cpu_quota(cg, quota_percent);
>> +
>> +       return cg;
>> +}
>> +
>> +static void busy_loop(const unsigned int sleep_ms)
>> +{
>> +       for (;;) {
>> +               tst_timer_start(CLOCK_MONOTONIC_RAW);
>> +               while (!tst_timer_expired_ms(20))
>> +                       ;
>> +
>> +               const int ret = tst_checkpoint_wait(0, sleep_ms);
>> +
>> +               if (!ret)
>> +                       exit(0);
>> +
>> +               if (errno != ETIMEDOUT)
>> +                       tst_brk(TBROK | TERRNO, "tst_checkpoint_wait");
>> +       }
>> +}
>> +
>> +static void fork_busy_procs_in_cgroup(const struct tst_cgroup_group *const cg)
>> +{
>> +       const unsigned int sleeps_ms[] = {3000, 1000, 10};
>> +       const pid_t worker_pid = SAFE_FORK();
>> +       size_t i;
>> +
>> +       if (worker_pid)
>> +               return;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(sleeps_ms); i++) {
>> +               const pid_t busy_pid = SAFE_FORK();
>> +
>> +               if (!busy_pid)
>> +                       busy_loop(sleeps_ms[i]);
>> +
>> +               SAFE_CGROUP_PRINTF(cg, "cgroup.procs", "%d", busy_pid);
>> +       }
>> +
>> +       tst_reap_children();
>> +
>> +       exit(0);
>> +}
>> +
>> +static void do_test(void)
>> +{
>> +       size_t i;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(cg_workers); i++)
>> +               fork_busy_procs_in_cgroup(cg_workers[i]);
>> +
>> +       tst_res(TPASS, "Scheduled bandwidth constrained workers");
>> +
>> +       sleep(1);
>> +
>> +       set_cpu_quota(cg_level2, 50);
>
> This test itself looks good.
> But I got a series of warnings when testing on CGroup V1:

Thanks for testing it.

>
> # uname -r
> 4.18.0-296.el8.x86_64
>
> [root@dhcp-66-83-181 cfs-scheduler]# ./cfs_bandwidth01
> tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
> tst_buffers.c:55: TINFO: Test is using guarded buffers
> cfs_bandwidth01.c:48: TINFO: Set 'worker1/cpu.max' = '3000 10000'
> cfs_bandwidth01.c:48: TINFO: Set 'worker2/cpu.max' = '2000 10000'
> cfs_bandwidth01.c:48: TINFO: Set 'worker3/cpu.max' = '3000 10000'
> cfs_bandwidth01.c:111: TPASS: Scheduled bandwidth constrained workers
> cfs_bandwidth01.c:42: TBROK:
> vdprintf(10</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2>,
> 'cpu.cfs_quota_us', '%u'<5000>): EINVAL (22)

I wonder if your kernel disallows setting this on a trunk node after it
has been set on leaf nodes (with or without procs in)?

I'm not sure whether this should be considered a fail or it is just how
older kernels work.

> tst_cgroup.c:896: TWARN:
> unlinkat(11</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2/level3a>,
> 'worker1', AT_REMOVEDIR): EBUSY (16)
> tst_cgroup.c:896: TWARN:
> unlinkat(11</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2/level3a>,
> 'worker2', AT_REMOVEDIR): EBUSY (16)
> tst_cgroup.c:896: TWARN:
> unlinkat(14</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2/level3b>,
> 'worker3', AT_REMOVEDIR): EBUSY (16)
> tst_cgroup.c:896: TWARN:
> unlinkat(10</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2>,
> 'level3a', AT_REMOVEDIR): EBUSY (16)
> tst_cgroup.c:896: TWARN:
> unlinkat(10</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450/level2>,
> 'level3b', AT_REMOVEDIR): EBUSY (16)
> tst_cgroup.c:896: TWARN:
> unlinkat(9</sys/fs/cgroup/cpu,cpuacct/ltp/test-8450>, 'level2',
> AT_REMOVEDIR): EBUSY (16)
> tst_cgroup.c:766: TWARN: unlinkat(7</sys/fs/cgroup/cpu,cpuacct/ltp>,
> 'test-8450', AT_REMOVEDIR): EBUSY (16)

This happens because the child processes are still running at cleanup
because we skipped stopping them. I guess I should fix that.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
