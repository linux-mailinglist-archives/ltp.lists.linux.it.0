Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 273DA8B824
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 14:13:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD2B73C1D26
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 14:13:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 81C193C0752
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 14:13:42 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2EE651400158
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 14:13:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 764CDB62E;
 Tue, 13 Aug 2019 12:13:41 +0000 (UTC)
Date: Tue, 13 Aug 2019 14:13:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190813121340.GC16005@rei.lan>
References: <ee463189a82212a10c1ac06229dc0a418e18305b.1565361031.git.jstancek@redhat.com>
 <e4c5428276c9a85efc6bddaa2d82e2aed5806108.1565361031.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4c5428276c9a85efc6bddaa2d82e2aed5806108.1565361031.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] clock_getres01: add test variants
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
> 0 - default, could be either VDSO or syscall
> 1 - syscall with valid res parameter
> 2 - syscall with NULL res parameter
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/clock_getres/clock_getres01.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> index df3e84271ad9..a4134bc1d3c2 100644
> --- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> +++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> @@ -13,6 +13,7 @@
>  #include <errno.h>
>  
>  #include "tst_test.h"
> +#include "lapi/syscalls.h"
>  #include "lapi/posix_clocks.h"
>  
>  static struct timespec res;
> @@ -39,7 +40,18 @@ static struct test_case {
>  
>  static void do_test(unsigned int i)
>  {
> -	TEST(clock_getres(tcase[i].clk_id, tcase[i].res));
> +	switch (tst_variant) {
> +	case 0:
> +		TEST(clock_getres(tcase[i].clk_id, tcase[i].res));
> +		break;
> +	case 1:
> +		TEST(tst_syscall(__NR_clock_getres, tcase[i].clk_id,
> +			tcase[i].res));
> +		break;
> +	case 2:
> +		TEST(tst_syscall(__NR_clock_getres, tcase[i].clk_id, NULL));
> +		break;
> +	}
>  
>  	if (TST_RET != tcase[i].ret) {
>  		if (TST_ERR == EINVAL) {
> @@ -64,4 +76,5 @@ static void do_test(unsigned int i)
>  static struct tst_test test = {
>  	.test = do_test,
>  	.tcnt = ARRAY_SIZE(tcase),
> +	.test_variants = 3,
>  };

Can we please print which variant we are about to test from the test
setup() as well?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
