Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA81265EF5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 13:45:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B361D3C4FB5
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 13:45:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 933183C2BF4
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 13:45:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 260ED60049D
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 13:45:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD336ACDB;
 Fri, 11 Sep 2020 11:45:53 +0000 (UTC)
Date: Fri, 11 Sep 2020 13:45:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200911114536.GA14099@dell5510>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
 <20200911095314.GA9505@dell5510>
 <20200911103950.kehhklgyie2tqpxh@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911103950.kehhklgyie2tqpxh@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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

> On 11-09-20, 11:53, Petr Vorel wrote:
> > Hi Viresh,
> > One of the commits fails on various tests [1].

> > Some failures (I haven't checked all):

> > * missing nfds_t (<poll.h> is probably from old commits) [2]:

> > CC testcases/kernel/syscalls/mq_open/mq_open01
> > In file included from ../../../../include/time64_variants.h:13,
> >                  from /usr/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq_timed.h:10,
> >                  from mq_timedreceive01.c:17:
> > /usr/include/sys/poll.h:1:2: warning: #warning redirecting incorrect #include <sys/poll.h> to <poll.h> [-Wcpp]
> >     1 | #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
> >       |  ^~~~~~~
> > In file included from /usr/src/ltp/testcases/kernel/syscalls/mq_timedreceive/../utils/mq_timed.h:10,
> >                  from mq_timedreceive01.c:17:
> > ../../../../include/time64_variants.h:41:35: error: unknown type name 'nfds_t'
> > 41 |  int (*ppoll)(struct pollfd *fds, nfds_t nfds, void *tmo_p,

> > * <libaio.h> not found [3]:
> > BUILD libltpnewipc.a
> > make[6]: Nothing to be done for 'all'.
> > In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop02.c:29:
> > In file included from In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop01.c:15:
> > In file included from /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop.h:7:
> > /usr/src/ltp/include/time64_variants.h:10:10: fatal error: /usr/src/ltp/testcases/kernel/syscalls/ipc/semop/semop.h'libaio.h' file not
> >       found
> > :7:
> > /usr/src/ltp/include/time64_variants.h:10:10: fatal error: 'libaio.h' file#include <libaio.h>
> >          ^~~~~~~~~~
> >  not
> >       found
> > #include <libaio.h>

> I didn't get any of these on my x86 box :(

This is also confusing for me.

Maybe enable travis CI builds for your ltp fork?
You contribute a lot, catching bugs early would be great.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
