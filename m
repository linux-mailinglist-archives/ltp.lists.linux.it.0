Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB6168355
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 17:29:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 731783C2675
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 17:29:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D74143C1C41
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 17:29:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CB04760234E
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 17:29:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DBE8BAD93;
 Fri, 21 Feb 2020 16:29:04 +0000 (UTC)
Date: Fri, 21 Feb 2020 17:29:04 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200221162903.GA26343@rei.lan>
References: <bac938d8a2d57653b9f22e55c6d222a990b6a5cf.1582301521.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bac938d8a2d57653b9f22e55c6d222a990b6a5cf.1582301521.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: fputs() in print_result() is not signal safe
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
> We have tests that use tst_res() from signal handler and current
> implementation leads to rare hangs if signal arrives in bad time:
>   main
>    tst_run_tcases
>     fork_testrun
>      testrun
>       run_tests
>        run
>         tst_res_ -> TINFO from main process
>          tst_vres_
>           print_result
>            fputs
>             __lll_lock_wait_private
>             <signal handler called>
>              tst_res_ -> TINFO from signal handler
>               tst_vres_
>                print_result
>                 fputs
>                  __lll_lock_wait_private -> HANGS
> 
> One example is timer_settime01, where we have TPASS from main process
> and TINFO as response to SIGALRM. SIGALRM happening immediately on older
> kernels might be a bug, but that is beside the point of this patch.

I guess that tst_res() wasn't even supposed to be signal-async-safe but
looking at the code I guess that this is the only change needed to make
it so.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
