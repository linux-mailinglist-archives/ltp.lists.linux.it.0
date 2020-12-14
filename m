Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C287D2D98A1
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 14:18:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79DC53C2DCA
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 14:18:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C9B433C2A09
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 14:18:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 70141600042
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 14:18:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9B5BAC10;
 Mon, 14 Dec 2020 13:18:49 +0000 (UTC)
References: <20201214065528.453216-1-lkml@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20201214065528.453216-1-lkml@jv-coder.de>
Date: Mon, 14 Dec 2020 13:18:48 +0000
Message-ID: <87pn3ch6fb.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] overcommit_memory: Fix unstable subtest
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Joerg Vehlow <lkml@jv-coder.de> writes:

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> Changes to v3:
>  - Change total_batch_size to kB. All sizes used in this test are in kB,
>    using bytes was wrong here
>  - Calculate total_batch_size during setup
>  - Formating of MIN/MAX construct
>
> The test sets overcommit policy to never overcommit and then tries
> to allocate the commit limit reported by /proc/meminfo. This value is an exact
> value (at least at that point in time) of memory, that can be allocated
> according to the policy and ratio settings. This should fail, since there
> is already some memory allocated for running the test programm, but due to
> inaccurate memory accounting in mm/util.c __vm_enough_memory(), the allocation
> can still succeed.
>
> The commited memory is stored in a percpu counter, that counts in 1 + ncpu
> variables. For small allocations and deallocations, the memory is counted
> in a counter per cpu, without locking. If this counter reaches a threshold,
> the value is committed to a global counter. Due to this the global counter
> can become negative. This global counter is the only thing taken into
> account in __vm_enough_memory, propably for performance reasons, because
> otherwise a lock is required.
>
> Because of the inaccuracy the system can overcommit a bit by number of cpus
> times threshold value. By adding this value to the exact commit limit
> reported by /proc/meminfo, we can be sure, that we really always hit the
> memory limit.
>
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>

LGTM

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
