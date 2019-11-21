Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67483104D34
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:05:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FC463C1CA6
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:05:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D5D903C1C8B
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:05:05 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 4B91120111A
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:05:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574323503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0EonCvstGT7BLZsulPJwExIlDIWNUAZiPXfQfiIsg+8=;
 b=H/GtTzTrRXtFqUUUQUy62SP1JBRX6UNfmN1mQE1t/Yluh2MwS1QZ5JUStvF/xwDU/eNmoB
 /10U7vV6f/f2ec2aXajiKOZ+rJvEAlk7Yh/HCv5UVOYN2ReEMgMakR4K/CGV1uUFH15kH9
 x7taW91KoJI/btzrSpxhFfDCchgK5MI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-ysw7aqU1OK-PXdGiA86oew-1; Thu, 21 Nov 2019 03:04:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEC2C8024F0;
 Thu, 21 Nov 2019 08:04:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B8F5D713;
 Thu, 21 Nov 2019 08:04:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 788F04BB5B;
 Thu, 21 Nov 2019 08:04:56 +0000 (UTC)
Date: Thu, 21 Nov 2019 03:04:56 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1318319247.13280749.1574323496266.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191120161634.GA31645@rei>
References: <1059626680.11523678.1573489826970.JavaMail.zimbra@redhat.com>
 <ec1792be62432bb64e4d5c5085f6ebfa7e5d4b53.1573562645.git.jstancek@redhat.com>
 <20191120161634.GA31645@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.10]
Thread-Topic: futex_cmp_requeue01: fix test expectations
Thread-Index: KSDVB4RHD7X1171OEk4BVJ1Jej/3lg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ysw7aqU1OK-PXdGiA86oew-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> I was thinking about this and the only unpreciseness we can get here is
> the number of spuriously woken up processes at the end of the test and
> that is because we cannot tell where exactly the spurious wakeup
> happened, right?
> 
> That means that all the assertion we could have made without the
> spurious wakeups will still hold
>, but we will have to take the number of
> spurious wakeups as our measurement error, just like in physics.
> 
> Also the futex_cmp_requeue() should prefer waking processes up against
> requeue operation so basically:
> 
> TST_RET - num_requeues = set_wakes

It comes down to how we interpret man page (more below).

> 
> Unless spurious wakeup has happened between the requeue and wake
> operation which means that the num_requeues can be smaller because we
> will wake up less than requeued processes. So if we sampled spurious
> wakeups before the requeue operation and after the futex_wake() for
> requeued processes and call it delta_spurious we would get a range:
> 
> TST_RET - num_requeues >= set_wakes

This doesn't look correct if we consider spurious wakeups:

5 processes, set_wakes = 5, set_requeue = 0, 1 spuriously wakes up,
remaining 4 are woken up by futex(), 0 are requeued:

4 - 0 >= 5

> 
> &&
> 
> TST_RET - num_requeues - delta_spurious <= set_wakes

This seems ok - number of processes woken up by futex_cmp_requeue
must be less than set_wakes. 

If number of processes we find on uaddr1/uaddr2 have expected
values and nothing timed out, that should imply above as well.

> 
> Similarily the number of processes left waiting on the futex should be
> in a range of expected and MIN(0, expected - spurious) where

I don't get the "MIN()". It's 0 or less than zero?

> expected = num_waiter - set_wakes - set_requeues.

This might be where I took man page too pessimistically. Specifically
this part: "wakes up a maximum of val waiters". I took that as "can 
wake up fewer waiters at any time". While your formulas seem to imply
that "if there are _enough_ waiters, it will _always_ wake up val
waiters".

Looking at futex_requeue():
                if (++task_count <= nr_wake && !requeue_pi) {
                        mark_wake_futex(&wake_q, this);
                        continue;
                }
the latter looks plausible. We don't use FUTEX_CMP_REQUEUE_PI,
which appears to be only way to avoid wakeup (when there are enough
waiters).

If we go with latter case, then I agree v2 is unnecessarily cautious
in its assertions. 

> 
> And lastly the num_requeues should be between set_requeues and MIN(0,
> set_requeues - spurious).

Was MIN supposed to be MAX?

> 
> Or did is miss something that invalidates my line of thought?
> 
> 
> Also btw, we are missing a tcase where we attempt to wake more processes
> that are sleeping on the futex and check that we haven't requeued any
> because all were woken up.

That looks like it would complicate things  because we no longer assume
there are "enough waiters".

  expected = num_waiter - set_wakes - set_requeues

could go negative. It might be enough to have tcase where num_waiter == set_wakes
and set_requeues = 0.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
