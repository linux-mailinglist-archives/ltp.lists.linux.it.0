Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C150265D05
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 11:53:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1EAC3C2CDE
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 11:53:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 68DF13C2BF8
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 11:53:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BFE1014012C0
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 11:53:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99A30B197;
 Fri, 11 Sep 2020 09:53:31 +0000 (UTC)
Date: Fri, 11 Sep 2020 11:53:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200911095314.GA9505@dell5510>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls: Use common variants structure
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> Hi Cyril,

> As you suggested earlier, here is an attempt to use a common structure
> prototype at most of the places.

> futex, clock_adjtime() and clock_getres() tests are left with their own
> implementations due to compatibility issues.

> Viresh Kumar (16):
>   syscalls: Add common time64 variants structure
>   syscalls: clock_gettime: Reuse struct time64_variants
>   syscalls: clock_nanosleep: Reuse struct time64_variants
>   syscalls: clock_settime: Reuse struct time64_variants
>   syscalls: io_pgetevents: Reuse struct time64_variants
>   syscalls: semop: Reuse struct time64_variants
>   syscalls: mq_timed: Reuse struct time64_variants
>   syscalls: ppoll: Reuse struct time64_variants
>   syscalls: rt_sigtimedwait: Reuse struct time64_variants
>   syscalls: sched_rr_get_interval: Reuse struct time64_variants
>   syscalls: sendmmsg: Reuse struct time64_variants
>   syscalls: timer_settime: Reuse struct time64_variants
>   syscalls: timer_gettime: Reuse struct time64_variants
>   syscalls: timerfd: Reuse struct time64_variants
>   syscalls: utimensat: Reuse struct time64_variants
>   futex: Move variants struct definition to common header
One of the commits fails on various tests [1].

Some failures (I haven't checked all):

* missing nfds_t (<poll.h> is probably from old commits) [2]:

CC testcases/kernel/syscalls/mq_open/mq_open01
In file included from ../../../../include/time64_variants.h:13,
                 from /usr/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq_timed.h:10,
                 from mq_timedreceive01.c:17:
/usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
    1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
      |  ^~~~~~~
In file included from /usr/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq_timed.h:10,
                 from mq_timedreceive01.c:17:
../../../../include/time64_variants.h:41:35: error: unknown type name 'nfds_t'
41 |  int (*ppoll)(struct pollfd *fds, nfds_t nfds, void *tmo_p,

* <libaio.h> not found [3]:
BUILD libltpnewipc.a
make[6]: Nothing to be done for 'all'.
In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop02.c:29:
In file included from In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop01.c:15:
In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop.h:7:
/usr/src/ltp/include/time64_variants.h:10:10: fatal error: /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop.h'libaio.h' file not
      found
:7:
/usr/src/ltp/include/time64_variants.h:10:10: fatal error: 'libaio.h' file#include <libaio.h>
         ^~~~~~~~~~
 not
      found
#include <libaio.h>

[1] https://travis-ci.org/github/pevik/ltp/builds/726197434
[2] https://travis-ci.org/github/pevik/ltp/jobs/726197439#L5295
[3] https://travis-ci.org/github/pevik/ltp/jobs/726197440#L6649

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
