Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679A2C3EF3
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:23:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCC543C2E0E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:23:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id E5B0F3C2350
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:22:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 08A6210009FA
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:22:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73088AC41;
 Wed, 25 Nov 2020 11:22:58 +0000 (UTC)
References: <20201125101633.30154-1-liwang@redhat.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <20201125101633.30154-1-liwang@redhat.com>
Date: Wed, 25 Nov 2020 11:22:57 +0000
Message-ID: <87eekhof3i.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fzsync: skip test when avaliable CPUs less than 2
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Li Wang <liwang@redhat.com> writes:

> It makes no sense to run parallel thread to simulate race conditions on
> system with CPU number less than two, especially for kvm guest, it does
> not have any chance to get real parallel running and probably encounter
> failure as below:

Most of the tests using FuzzySync do not need true parallism. We were
able to reproduce a number of race conditions on a single vCPU. Infact
it may actually benefit some races because one thread has to pause to
allow the other to run, perhaps creating a huge race window.

>
> === 100% reproducible on a 1cpu guest ===
>
> cmdline="af_alg07"
> contacts=""
> analysis=exit
> <<<test_output>>>
> tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
> ../../../include/tst_fuzzy_sync.h:507: TINFO: Minimum sampling period ended
> ../../../include/tst_fuzzy_sync.h:330: TINFO: loop = 1024, delay_bias = 0
> ../../../include/tst_fuzzy_sync.h:318: TINFO: start_a - start_b: { avg = -137522ns, avg_dev = 854248ns, dev_ratio = 6.21 }
> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - start_a  : { avg =  1915ns, avg_dev =   535ns, dev_ratio = 0.28 }
> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_b - start_b  : { avg =  1885ns, avg_dev =    42ns, dev_ratio = 0.02 }
> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - end_b    : { avg = -137492ns, avg_dev = 854818ns, dev_ratio = 6.22 }
> ../../../include/tst_fuzzy_sync.h:318: TINFO: spins            : { avg = 554786  , avg_dev =  7355  , dev_ratio = 0.01 }
> ../../../include/tst_fuzzy_sync.h:636: TINFO: Exceeded execution time, requesting exit
> af_alg07.c:96: TFAIL: fchownat() failed to fail, kernel may be vulnerable
>
> Signed-off-by: Li Wang <liwang@redhat.com>
> CC: Richard Palethorpe <rpalethorpe@suse.de>
> ---
>  include/tst_fuzzy_sync.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
> index 4141f5c64..2e864b312 100644
> --- a/include/tst_fuzzy_sync.h
> +++ b/include/tst_fuzzy_sync.h
> @@ -281,6 +281,9 @@ static void tst_init_stat(struct tst_fzsync_stat *s)
>  static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>  				  void *(*run_b)(void *))
>  {
> +	if (get_nprocs() < 2)
> +		tst_brk(TCONF, "Fuzzy Sync requires at least two CPUs available");
> +
>  	tst_fzsync_pair_cleanup(pair);
>  
>  	tst_init_stat(&pair->diff_ss);

Perhaps this test would pass with more loops and a big enough delay
range, but this is also wasting time on a single vCPU. I'm not sure
whether we should filter this test at the LTP level; it may trigger the
bug on some single CPU configs.

Why not print a warning instead of refusing to run?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
