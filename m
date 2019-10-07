Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3ACE2E9
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 15:17:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA5E43C1CBA
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Oct 2019 15:17:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 66D713C1773
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 15:17:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 458CA1A011D4
 for <ltp@lists.linux.it>; Mon,  7 Oct 2019 15:17:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84EC5ADDD;
 Mon,  7 Oct 2019 13:17:03 +0000 (UTC)
Date: Mon, 7 Oct 2019 15:17:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191007131702.GC20170@rei.lan>
References: <20191007065017.86054-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007065017.86054-1-lkml@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] lsmod01: Add kernel module
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/testcases/commands/lsmod/lsmod01.sh b/testcases/commands/lsmod/lsmod01.sh
> index ad170dcd4..c761a91af 100755
> --- a/testcases/commands/lsmod/lsmod01.sh
> +++ b/testcases/commands/lsmod/lsmod01.sh
> @@ -5,11 +5,43 @@
>  #
>  # Test basic functionality of lsmod command.
>  
> +TST_CLEANUP=cleanup
> +TST_SETUP=setup
>  TST_TESTFUNC=lsmod_test
>  TST_NEEDS_TMPDIR=1
>  TST_NEEDS_CMDS="lsmod"
> +TST_NEEDS_MODULE="ltp_lsmod01.ko"

Sigh, there is another problem here, this causes the library to exit the
test if the module does not exist, which disables the test in a case
that the module wasn't compiled i.e. kernel-devel wasn't installed, but
in the most cases the test will run just fine on such configuration.

I guess that we need to patch the library so that we can get a path to a
module without exitting the test. Maybe we should add
TST_GET_MODPATH="foo.ko" which will do the same as TST_NEEDS_MODULE but
will not exit the test if not found. Then we can check if "$TST_MODPATH"
is empty in the test setup just before we attempt insmod.

>  . tst_test.sh
>  
> +inserted=0
> +
> +setup()
> +{
> +	if [ -z "$(cat /proc/modules)" ]; then
> +		tst_res TINFO "Loading dummy kernel module"
> +		insmod "$TST_MODPATH"
> +		if [ $? -ne 0 ]; then
> +			tst_res TBROK "insmod failed"
> +			return
> +		fi
> +
> +		inserted=1
> +	fi
> +}
> +
> +cleanup()
> +{
> +	if [ $inserted -ne 0 ]; then
> +		tst_res TINFO "Unloading dummy kernel module"
> +		rmmod ltp_lsmod01
> +		if [ $? -ne 0 ]; then
> +			tst_res TWARN "rmmod failed"
> +		fi
> +		inserted=0
> +	fi
> +}
> +
> +
>  lsmod_test()
>  {
>  	lsmod_output=$(lsmod | awk '!/Module/{print $1, $2, $3}' | sort)
> diff --git a/testcases/commands/lsmod/ltp_lsmod01.c b/testcases/commands/lsmod/ltp_lsmod01.c
> new file mode 100644
> index 000000000..19f9d9145
> --- /dev/null
> +++ b/testcases/commands/lsmod/ltp_lsmod01.c
> @@ -0,0 +1,28 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (c) 2016 Fujitsu Ltd.
> + * Author: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
> + *
> + * Description:
> + *  This is a kernel loadable module programme used by lssmod01.sh
> + *  testcase which inserts this module for test of lsmod command.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +
> +static int test_init(void)
> +{
> +	return 0;
> +}
> +
> +static void test_exit(void)
> +{
> +
> +}
> +
> +MODULE_LICENSE("GPL");
> +
> +module_init(test_init);
> +module_exit(test_exit);
> -- 
> 2.20.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
