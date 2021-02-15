Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D931B582
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 08:04:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E8293C59A5
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 08:04:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E46493C2D29
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 08:04:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8D41F1000760
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 08:04:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92CE6AEBF;
 Mon, 15 Feb 2021 07:04:11 +0000 (UTC)
Date: Mon, 15 Feb 2021 08:04:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <YCoc6Yj2ha7/k/5C@pevik>
References: <YCQvL8/DMNVLLuuf@pevik>
 <b74d54ed-85ba-df4c-c114-fe11d50a3bce@gmail.com>
 <270c474f-476a-65d2-1f5b-57d3330efb04@kernel.dk>
 <YCZ5ZS5Sr2tPiUvP@pevik>
 <8e7ad2f3-eb35-71fe-5989-b5f09476eb24@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e7ad2f3-eb35-71fe-5989-b5f09476eb24@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] CVE-2020-29373 reproducer fails on v5.11
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
Cc: Jens Axboe <axboe@kernel.dk>, Nicolai Stange <nstange@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, io-uring@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Pavel,

> On 12/02/2021 12:49, Petr Vorel wrote:
> > Hi all,

> >> On 2/10/21 12:32 PM, Pavel Begunkov wrote:
> >>> On 10/02/2021 19:08, Petr Vorel wrote:
> >>>> Hi all,

> >>>> I found that the reproducer for CVE-2020-29373 from Nicolai Stange (source attached),
> >>>> which was backported to LTP as io_uring02 by Martin Doucha [1] is failing since
> >>>> 10cad2c40dcb ("io_uring: don't take fs for recvmsg/sendmsg") from v5.11-rc1.

> >>> Thanks for letting us know, we need to revert it

> >> I'll queue up a revert. Would also be nice to turn that into
> >> a liburing regression test.

> > Jens (or others), could you please have look that the other commit 907d1df30a51
> > ("io_uring: fix wqe->lock/completion_lock deadlock") from v5.11-rc6 didn't cause
> > any regression? Changed behavior causing io_uring02 test [1] and the original
> > reproducer [2] to fail is probably a test bug, but better double check that.

> Thanks for keeping an eye on it. That's on the test because DRAIN doesn't
> punt to worker threads anymore, and DRAIN is used for those prepended
> requests.

> Can we just use IOSQE_ASYNC instead and fallback to DRAIN for older kernels
> as you mentioned? It would be much more reliable. Or replace IOSQE_IO_DRAIN
> with IOSQE_IO_LINK, but there are nuances to that... 

Thanks for your tips!

Kind regards,
Petr

> > Kind regards,
> > Petr

> > [1] https://github.com/linux-test-project/ltp/tree/master/testcases/kernel/syscalls/io_uring/io_uring02.c
> > [2] https://lore.kernel.org/io-uring/YCQvL8%2FDMNVLLuuf@pevik/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
