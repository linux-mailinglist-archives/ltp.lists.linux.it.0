Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5516210734B
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 14:33:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DDA53C2271
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Nov 2019 14:33:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 57EEB3C224B
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 14:33:45 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E829120120E
 for <ltp@lists.linux.it>; Fri, 22 Nov 2019 14:33:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C2E2B132;
 Fri, 22 Nov 2019 13:33:44 +0000 (UTC)
Date: Fri, 22 Nov 2019 14:33:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191122133343.GD19146@rei.lan>
References: <5b0f2a837117f3af1351d8b3da357cacecaa1463.1574087532.git.jstancek@redhat.com>
 <219b1b89de51fda28a0af02f6b15e6da8c73ab7c.1574363475.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <219b1b89de51fda28a0af02f6b15e6da8c73ab7c.1574363475.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] perf_event_open02: make do_work() run for
 specified time
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
> do_work() runtime varies a lot, because it's based on a fixed
> number of iterations. Use a timer and measure how many iterations
> are needed to run for specified time. We don't need fine accuracy,
> just some coarse runtime across all systems. verify() function is
> using larger value to get more precision for "ratio" calculation.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  .../syscalls/perf_event_open/perf_event_open02.c   | 52 +++++++++++++++++++---
>  1 file changed, 45 insertions(+), 7 deletions(-)
> 
> Notes for v2
> --------------
> 
> Problem with v1 is that it hangs on -rt kernel. With FIFO scheduling
> signal handler never runs and there's nothing to stop do_work().
> Adding sched_yield() to periodically call in do_work() is problem too,
> because test spends more time in kernel and it breaks the expectation
> for 'ratio'.
> 
> So in v2, use timer only to estimate number of (100 thousands) loops
> needed to run for specified time. Actual test will use the estimated
> number (or multiple of it).
> 
> Tested with: 5.3.0-0.rc6.git0.1.fc31.x86_64
> 	     4.18.0-143.el8.x86_64
> 	     4.18.0-147.rt24.93.el8.x86_64

Looks good, acked.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
