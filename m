Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62024CB85D
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 12:34:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B10A3C229E
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Oct 2019 12:34:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 284653C225D
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:34:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 69F3B1A019DF
 for <ltp@lists.linux.it>; Fri,  4 Oct 2019 12:34:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 66F79ADF1;
 Fri,  4 Oct 2019 10:34:16 +0000 (UTC)
Date: Fri, 4 Oct 2019 12:34:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191004103414.GE1231@rei>
References: <20190927092024.97928-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927092024.97928-1-lkml@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lsmod01: Add kernel module
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
> Forgot calling cleanup in v1
> 
> The test fails, if no kernel module is loaded. Now at least one module is
> always loaded.
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  testcases/commands/.gitignore          |  1 +
>  testcases/commands/lsmod/Makefile      | 15 +++++++++++++++
>  testcases/commands/lsmod/lsmod01.sh    | 26 ++++++++++++++++++++++++++
>  testcases/commands/lsmod/ltp_lsmod01.c | 26 ++++++++++++++++++++++++++
>  4 files changed, 68 insertions(+)
>  create mode 100644 testcases/commands/lsmod/ltp_lsmod01.c
> 
> diff --git a/testcases/commands/.gitignore b/testcases/commands/.gitignore
> index 0ed343881..ed5e13e29 100644
> --- a/testcases/commands/.gitignore
> +++ b/testcases/commands/.gitignore
> @@ -2,3 +2,4 @@
>  /ldd/datafiles/*.obj.so
>  /eject/eject_check_tray
>  /insmod/ltp_insmod01.ko
> +/lsmod/ltp_lsmod01.ko
> diff --git a/testcases/commands/lsmod/Makefile b/testcases/commands/lsmod/Makefile
> index 2af91b3de..8fc3b1436 100644
> --- a/testcases/commands/lsmod/Makefile
> +++ b/testcases/commands/lsmod/Makefile
> @@ -13,10 +13,25 @@
>  #    GNU General Public License for more details.
>  #
>  
> +ifneq ($(KERNELRELEASE),)
> +
> +obj-m := ltp_lsmod01.o
> +
> +else
> +
>  top_srcdir		?= ../../..
>  
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +REQ_VERSION_MAJOR       := 2
> +REQ_VERSION_PATCH       := 6
> +MAKE_TARGETS            := ltp_lsmod01.ko
> +
>  include $(top_srcdir)/include/mk/env_pre.mk
>  
>  INSTALL_TARGETS		:= lsmod01.sh
>  
> +include $(top_srcdir)/include/mk/module.mk
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +
> +endif
> diff --git a/testcases/commands/lsmod/lsmod01.sh b/testcases/commands/lsmod/lsmod01.sh
> index ad170dcd4..7f9dd284e 100755
> --- a/testcases/commands/lsmod/lsmod01.sh
> +++ b/testcases/commands/lsmod/lsmod01.sh
> @@ -5,13 +5,37 @@
>  #
>  # Test basic functionality of lsmod command.
>  
> +TST_CLEANUP=cleanup
>  TST_TESTFUNC=lsmod_test
>  TST_NEEDS_TMPDIR=1
>  TST_NEEDS_CMDS="lsmod"
> +TST_NEEDS_MODULE="ltp_lsmod01.ko"
>  . tst_test.sh
>  
> +inserted=0
> +
> +cleanup()
> +{
> +	if [ $inserted -ne 0 ]; then
> +		tst_res TINFO "running rmmod ltp_lsmod01"
> +		rmmod ltp_lsmod01
> +		if [ $? -ne 0 ]; then
> +			tst_res TWARN "failed to rmmod ltp_lsmod01"
> +		fi
> +		inserted=0
> +	fi
> +}
> +
> +
>  lsmod_test()
>  {
> +	insmod "$TST_MODPATH"
> +	if [ $? -ne 0 ]; then
> +		tst_res TFAIL "insmod failed"
> +		return
> +	fi
> +	inserted=1

This should be in the test setup. Also can insert the module only and
only if /proc/modules is empty?

>  	lsmod_output=$(lsmod | awk '!/Module/{print $1, $2, $3}' | sort)
>  	if [ -z "$lsmod_output" ]; then
>  		tst_res TFAIL "Failed to parse the output from lsmod"
> @@ -34,6 +58,8 @@ lsmod_test()
>  		return
>  	fi
>  
> +	cleanup

If you define the cleanup in TST_CLEANUP the library will call it for
you, do not call it yourself here.

>  	tst_res TPASS "'lsmod' passed."
>  }
>  
> diff --git a/testcases/commands/lsmod/ltp_lsmod01.c b/testcases/commands/lsmod/ltp_lsmod01.c
> new file mode 100644
> index 000000000..8ba786276
> --- /dev/null
> +++ b/testcases/commands/lsmod/ltp_lsmod01.c
> @@ -0,0 +1,26 @@
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
> +module_init(test_init);
> +module_exit(test_exit);

You are missing the GPL license here, without it the module will taint
the kernel.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
