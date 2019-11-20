Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0D104081
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 17:16:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0AC73C23DB
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 17:16:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 934363C13DE
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 17:16:38 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2CE28200DBD
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 17:16:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4BCD4B2FAA;
 Wed, 20 Nov 2019 16:16:36 +0000 (UTC)
Date: Wed, 20 Nov 2019 17:16:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191120161634.GA31645@rei>
References: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
 <ec1792be62432bb64e4d5c5085f6ebfa7e5d4b53.1573562645.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec1792be62432bb64e4d5c5085f6ebfa7e5d4b53.1573562645.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] futex_cmp_requeue01: fix test expectations
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

Hi!
> 1. Keeping same uaddr1 value across requeue leads to a side-effect.
> If there is a signal or spurious wakeup, futex_wait() operation can
> be restarted (by kernel) with same input parameters. Which means that
> process requeued for uaddr2, goes back to queueing for uaddr1. Such
> use case is currently not valid as it is expected that uaddr1 value
> changes, so that any late waiter can notice it and goes back with
> -EWOULDBLOCK (-EAGAIN).
> 
> 2. Test doesn't expect possibility of spurious wakeups.
> 
> 3. Test is expecting to get exact values of woken/requeued processes.
> Man page wording like "at most" or "maximum of" does not guarantee
> exact numbers.
> 
> Change futex value before requeue, so child processes can observe
> spurious wakeups.
> 
> Change child process, such that it always sleeps, to guarantee that
> TST_PROCESS_STATE_WAIT() will always succeed finding sleeping process.
> 
> Change default timeout to 5 seconds. Spawning 1000 process on slower
> systems was getting close to 1 second. This doesn't affect runtime in
> PASS-ing case.
> 
> Change checks such that they reflect wording in man page, and don't
> test for absolute values (see comments in code). One exception is
> that we assume futex_wake(tc->num_waiters) will always wake up all
> remaining processes.

I was thinking about this and the only unpreciseness we can get here is
the number of spuriously woken up processes at the end of the test and
that is because we cannot tell where exactly the spurious wakeup
happened, right?

That means that all the assertion we could have made without the
spurious wakeups will still hold, but we will have to take the number of
spurious wakeups as our measurement error, just like in physics.

Also the futex_cmp_requeue() should prefer waking processes up against
requeue operation so basically:

TST_RET - num_requeues = set_wakes

Unless spurious wakeup has happened between the requeue and wake
operation which means that the num_requeues can be smaller because we
will wake up less than requeued processes. So if we sampled spurious
wakeups before the requeue operation and after the futex_wake() for
requeued processes and call it delta_spurious we would get a range:

TST_RET - num_requeues >= set_wakes

&&

TST_RET - num_requeues - delta_spurious <= set_wakes

Similarily the number of processes left waiting on the futex should be
in a range of expected and MIN(0, expected - spurious) where
expected = num_waiter - set_wakes - set_requeues.

And lastly the num_requeues should be between set_requeues and MIN(0,
set_requeues - spurious).

Or did is miss something that invalidates my line of thought?


Also btw, we are missing a tcase where we attempt to wake more processes
that are sleeping on the futex and check that we haven't requeued any
because all were woken up.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
