Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCB1050F7
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 12:02:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 330973C22D6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 12:02:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F0E213C1C8B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 12:02:38 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 207341B601B5
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 12:02:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A245B2AE;
 Thu, 21 Nov 2019 11:02:37 +0000 (UTC)
Date: Thu, 21 Nov 2019 12:02:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191121110236.GB14186@rei.lan>
References: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
 <ec1792be62432bb64e4d5c5085f6ebfa7e5d4b53.1573562645.git.jstancek@redhat.com>
 <20191120161634.GA31645@rei>
 <1318319247.13280749.1574323496266.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1318319247.13280749.1574323496266.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Unless spurious wakeup has happened between the requeue and wake
> > operation which means that the num_requeues can be smaller because we
> > will wake up less than requeued processes. So if we sampled spurious
> > wakeups before the requeue operation and after the futex_wake() for
> > requeued processes and call it delta_spurious we would get a range:
> > 
> > TST_RET - num_requeues >= set_wakes
> 
> This doesn't look correct if we consider spurious wakeups:
> 
> 5 processes, set_wakes = 5, set_requeue = 0, 1 spuriously wakes up,
> remaining 4 are woken up by futex(), 0 are requeued:
> 
> 4 - 0 >= 5

Well I was betting on the fact that we wake up much less processes than
we attempt to lock on the futex and that waking up processes takes
precedence. I we can add delta_spurious to the right side that wouldn't
change much and we end up being correct all the time, i.e.

TST_RET + delta_spurious - num_requeues >= set_wakes

That together with the next one gives us range:

TST_RET - num_requeues = set_wakes +-delta_spurious

> > 
> > &&
> > 
> > TST_RET - num_requeues - delta_spurious <= set_wakes
> 
> This seems ok - number of processes woken up by futex_cmp_requeue
> must be less than set_wakes. 
> 
> If number of processes we find on uaddr1/uaddr2 have expected
> values and nothing timed out, that should imply above as well.
> 
> > 
> > Similarily the number of processes left waiting on the futex should be
> > in a range of expected and MIN(0, expected - spurious) where
> 
> I don't get the "MIN()". It's 0 or less than zero?

Sigh, should have been MAX() to avoid negative numbers in case that
spurious > expected.

> > expected = num_waiter - set_wakes - set_requeues.
> 
> This might be where I took man page too pessimistically. Specifically
> this part: "wakes up a maximum of val waiters". I took that as "can 
> wake up fewer waiters at any time". While your formulas seem to imply
> that "if there are _enough_ waiters, it will _always_ wake up val
> waiters".
> 
> Looking at futex_requeue():
>                 if (++task_count <= nr_wake && !requeue_pi) {
>                         mark_wake_futex(&wake_q, this);
>                         continue;
>                 }
> the latter looks plausible. We don't use FUTEX_CMP_REQUEUE_PI,
> which appears to be only way to avoid wakeup (when there are enough
> waiters).
> 
> If we go with latter case, then I agree v2 is unnecessarily cautious
> in its assertions. 

As far as I can tell the wording in man page is there to suggest that it
cannot wake more processes than it's sleeping on the futex. I do not
think that it's explicitelly written anywhere that it will never fail to
wake up waiters it was requested to but all of the code from the
original futex tests was depending on that and the rewritten tests does
as well, have a look at futex_wake02.c for instance. Also there is no
point in waking less than available, it would only complicate the API
since we would have to loop over each futex_wake() in userspace. Having
a look at "Futexes are tricky" by Drepper none of the example code does
that either.

> > And lastly the num_requeues should be between set_requeues and MIN(0,
> > set_requeues - spurious).
> 
> Was MIN supposed to be MAX?

Yes, indeed, sorry.

> > Or did is miss something that invalidates my line of thought?
> > 
> > 
> > Also btw, we are missing a tcase where we attempt to wake more processes
> > that are sleeping on the futex and check that we haven't requeued any
> > because all were woken up.
> 
> That looks like it would complicate things  because we no longer assume
> there are "enough waiters".
> 
>   expected = num_waiter - set_wakes - set_requeues
> 
> could go negative. It might be enough to have tcase where num_waiter == set_wakes
> and set_requeues = 0.

I was thinking of putting that case into a separate testcase, all that
we would have to check there as a PASS would be that there are none
sleepers requeued if number of processes to wake was >= than the number
of sleeping processes.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
