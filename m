Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2DA486395
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jan 2022 12:17:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3FF923C9048
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jan 2022 12:17:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00C353C078E
 for <ltp@lists.linux.it>; Thu,  6 Jan 2022 12:17:40 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 06EAA1000D8F
 for <ltp@lists.linux.it>; Thu,  6 Jan 2022 12:17:39 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4425221106;
 Thu,  6 Jan 2022 11:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1641467859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0JpafTEB3Sy90v1DS0E5FL4NqG+TTm+205C4WOWjVI=;
 b=XQbAAzE7vqC0RroyrFHhogKFmZ9FslhJZ7IUVJBI/H1wmPW8IdeDjfYF5f+VuNziScMUef
 vwalU26tNiIs2ZuzQpbDAsVeWyP/B1Jgjww+p7TjQRyWoBzrRrSGWWdHiYvhLl1+dwgzWk
 PmpxUzECBu4AQiCxCQW/jmtqja2AZcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1641467859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g0JpafTEB3Sy90v1DS0E5FL4NqG+TTm+205C4WOWjVI=;
 b=nff14enIrKEaleqXWI1Qt4aihDFxBJ8FM0O4mwGPpwKAv4JPpet+NnujVtZWoGq6lFVtYX
 +qm47l+j+1BGbZAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D16513C0D;
 Thu,  6 Jan 2022 11:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gS6zBtPP1mEwFwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 06 Jan 2022 11:17:39 +0000
Date: Thu, 6 Jan 2022 12:19:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YdbQLuuSAiN+d+Cs@yuki>
References: <YdWsZpTjnBLszubC@pevik>
 <1641461121-2212-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1641461121-2212-3-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1641461121-2212-3-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] shell: add kconfig parse api
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
> Use tst_check_kconfigs command to call tst_kconfig_check function in internal.
> It introduces two variables in tst_test.sh
> TST_NEEDS_KCONFIGS
> TST_NEEDS_KCONFIGS_IFS (default value is comma)
> 
> Also, we can use tst_check_kconfigs in your shell case if you want to skip subtest
> case instead the whole test.
> 
> Fixes:#891
> Suggested-by: Petr Vorel <pvorel@suse.cz>
> Suggested-by: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
>  doc/shell-test-api.txt                        | 54 +++++++++++++------
>  lib/newlib_tests/runtest.sh                   |  3 +-
>  lib/newlib_tests/shell/tst_check_kconfig01.sh | 26 +++++++++
>  lib/newlib_tests/shell/tst_check_kconfig02.sh | 16 ++++++
>  lib/newlib_tests/shell/tst_check_kconfig03.sh | 15 ++++++
>  lib/newlib_tests/shell/tst_check_kconfig04.sh | 16 ++++++
>  lib/newlib_tests/shell/tst_check_kconfig05.sh | 26 +++++++++
>  testcases/lib/.gitignore                      |  1 +
>  testcases/lib/Makefile                        |  3 +-
>  testcases/lib/tst_check_kconfigs.c            | 18 +++++++
>  testcases/lib/tst_test.sh                     | 35 ++++++++++++
>  11 files changed, 195 insertions(+), 18 deletions(-)
>  create mode 100755 lib/newlib_tests/shell/tst_check_kconfig01.sh
>  create mode 100755 lib/newlib_tests/shell/tst_check_kconfig02.sh
>  create mode 100755 lib/newlib_tests/shell/tst_check_kconfig03.sh
>  create mode 100755 lib/newlib_tests/shell/tst_check_kconfig04.sh
>  create mode 100755 lib/newlib_tests/shell/tst_check_kconfig05.sh
>  create mode 100644 testcases/lib/tst_check_kconfigs.c
> 
> diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
> index b993a9e1e..a1ec6ba2a 100644
> --- a/doc/shell-test-api.txt
> +++ b/doc/shell-test-api.txt
> @@ -193,22 +193,25 @@ simply by setting right '$TST_NEEDS_FOO'.
>  
>  [options="header"]
>  |=============================================================================
> -| Variable name      | Action done
> -| 'TST_NEEDS_ROOT'   | Exit the test with 'TCONF' unless executed under root.
> -|                    | Alternatively the 'tst_require_root' command can be used.
> -| 'TST_NEEDS_TMPDIR' | Create test temporary directory and cd into it.
> -| 'TST_NEEDS_DEVICE' | Prepare test temporary device, the path to testing
> -                       device is stored in '$TST_DEVICE' variable.
> -                       The option implies 'TST_NEEDS_TMPDIR'.
> -| 'TST_NEEDS_CMDS'   | String with command names that has to be present for
> -                       the test (see below).
> -| 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
> -| 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
> -| 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must be int >= 1,
> -                       or -1 (special value to disable timeout), default is 300.
> -                       Variable is meant be set in tests, not by user.
> -                       It's an equivalent of `tst_test.timeout` in C, can be set
> -                       via 'tst_set_timeout(timeout)' after test has started.
> +| Variable name            | Action done
> +| 'TST_NEEDS_ROOT'         | Exit the test with 'TCONF' unless executed under root.
> +|                          | Alternatively the 'tst_require_root' command can be used.
> +| 'TST_NEEDS_TMPDIR'       | Create test temporary directory and cd into it.
> +| 'TST_NEEDS_DEVICE'       | Prepare test temporary device, the path to testing
> +                             device is stored in '$TST_DEVICE' variable.
> +                             The option implies 'TST_NEEDS_TMPDIR'.
> +| 'TST_NEEDS_CMDS'         | String with command names that has to be present for
> +                             the test (see below).
> +| 'TST_NEEDS_MODULE'       | Test module name needed for the test (see below).
> +| 'TST_NEEDS_DRIVERS'      | Checks kernel drivers support for the test.
> +| 'TST_NEEDS_KCONFIGS'     | Checks kernel kconfigs support for the test (see below).
> +| 'TST_NEEDS_KCONFIGS_IFS' | Used for splitting '$TST_NEEDS_KCONFIGS' variable,
> +                             default value is comma.
> +| 'TST_TIMEOUT'            | Maximum timeout set for the test in sec. Must be int >= 1,
> +                             or -1 (special value to disable timeout), default is 300.
> +                             Variable is meant be set in tests, not by user.
> +                             It's an equivalent of `tst_test.timeout` in C, can be set
> +                             via 'tst_set_timeout(timeout)' after test has started.
>  |=============================================================================
>  
>  [options="header"]
> @@ -742,3 +745,22 @@ TST_NEEDS_CHECKPOINTS=1
>  Since both the implementations are compatible, it's also possible to start
>  a child binary process from a shell test and synchronize with it. This process
>  must have checkpoints initialized by calling 'tst_reinit()'.
> +
> +1.7 Parsing kernel .config
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The shell library provides an implementation of the kconfig parsing interface
> +compatible with the C version.
> +
> +It's possible to pass kernel kconfig list for tst_require_kconfigs API with
> +'$TST_NEEDS_KCONFIGS'.
> +Optional '$TST_NEEDS_KCONFIGS_IFS' is used for splitting, default value is comma.
> +
> +Now, we support the length of kconfig list is 10.
> +
> +-------------------------------------------------------------------------------
> +#!/bin/sh
> +TST_NEEDS_KCONFIGS="CONFIG_EXT4_FS, CONFIG_QUOTACTL=y"
> +
> +. tst_test.sh
> +-------------------------------------------------------------------------------
> diff --git a/lib/newlib_tests/runtest.sh b/lib/newlib_tests/runtest.sh
> index 8b2fe347a..b34a582b7 100755
> --- a/lib/newlib_tests/runtest.sh
> +++ b/lib/newlib_tests/runtest.sh
> @@ -6,7 +6,8 @@ tst_needs_cmds01 tst_needs_cmds02 tst_needs_cmds03 tst_needs_cmds06
>  tst_needs_cmds07 tst_bool_expr test_exec test_timer tst_res_hexd tst_strstatus
>  tst_fuzzy_sync03 test_zero_hugepage.sh}"
>  
> -LTP_SHELL_API_TESTS="${LTP_SHELL_API_TESTS:-shell/tst_check_driver.sh shell/net/*.sh}"
> +LTP_SHELL_API_TESTS="${LTP_SHELL_API_TESTS:-shell/tst_check_driver.sh
> +shell/tst_check_kconfig0[1-4].sh shell/net/*.sh}"
>  
>  cd $(dirname $0)
>  PATH="$PWD/../../testcases/lib/:$PATH"
> diff --git a/lib/newlib_tests/shell/tst_check_kconfig01.sh b/lib/newlib_tests/shell/tst_check_kconfig01.sh
> new file mode 100755
> index 000000000..90e76360e
> --- /dev/null
> +++ b/lib/newlib_tests/shell/tst_check_kconfig01.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2022 FUJITSU LIMITED. All rights reserved.
> +
> +TST_TESTFUNC=do_test
> +TST_NEEDS_CMDS="tst_check_kconfigs"
> +TST_NEEDS_KCONFIGS="CONFIG_GENERIC_IRQ_PROBE=y,
> +CONFIG_GENERIC_IRQ_SHOW=y,
> +CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y,
> +CONFIG_GENERIC_PENDING_IRQ=y,
> +CONFIG_GENERIC_IRQ_MIGRATION=y,
> +CONFIG_IRQ_DOMAIN=y,
> +CONFIG_IRQ_DOMAIN_HIERARCHY=y,
> +CONFIG_GENERIC_MSI_IRQ=y,
> +CONFIG_GENERIC_MSI_IRQ_DOMAIN=y,
> +CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y,
> +CONFIG_GENERIC_IRQ_RESERVATION_MODE=y"
> +
> +. tst_test.sh
> +
> +do_test()
> +{
> +	tst_res TFAIL "kernel config check functionality only supports 10 kernel kconfigs"
> +}
> +
> +tst_run
> diff --git a/lib/newlib_tests/shell/tst_check_kconfig02.sh b/lib/newlib_tests/shell/tst_check_kconfig02.sh
> new file mode 100755
> index 000000000..065a20fd2
> --- /dev/null
> +++ b/lib/newlib_tests/shell/tst_check_kconfig02.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2022 FUJITSU LIMITED. All rights reserved.
> +
> +TST_TESTFUNC=do_test
> +TST_NEEDS_CMDS="tst_check_kconfigs"
> +TST_NEEDS_KCONFIGS="CONFIG_EXT4"
> +
> +. tst_test.sh
> +
> +do_test()
> +{
> +	tst_res TFAIL "kernel .config doesn't have CONFIG_EXT4"
> +}
> +
> +tst_run
> diff --git a/lib/newlib_tests/shell/tst_check_kconfig03.sh b/lib/newlib_tests/shell/tst_check_kconfig03.sh
> new file mode 100755
> index 000000000..ebdec70f8
> --- /dev/null
> +++ b/lib/newlib_tests/shell/tst_check_kconfig03.sh
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2022 FUJITSU LIMITED. All rights reserved.
> +
> +TST_TESTFUNC=do_test
> +TST_NEEDS_CMDS="tst_check_kconfigs"
> +TST_NEEDS_KCONFIGS="CONFIG_EXT4_FS: CONFIG_XFS_FS"
> +. tst_test.sh
> +
> +do_test()
> +{
> +	tst_res TFAIL "invalid kconfig delimter"
> +}
> +
> +tst_run
> diff --git a/lib/newlib_tests/shell/tst_check_kconfig04.sh b/lib/newlib_tests/shell/tst_check_kconfig04.sh
> new file mode 100755
> index 000000000..c5f046b79
> --- /dev/null
> +++ b/lib/newlib_tests/shell/tst_check_kconfig04.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2022 FUJITSU LIMITED. All rights reserved.
> +
> +TST_TESTFUNC=do_test
> +TST_NEEDS_CMDS="tst_check_kconfigs"
> +TST_NEEDS_KCONFIGS="CONFIG_EXT4_FS : CONFIG_XFS_FS"
> +TST_NEEDS_KCONFIGS_IFS=":"
> +. tst_test.sh
> +
> +do_test()
> +{
> +	tst_res TPASS "valid kconfig delimter"
> +}
> +
> +tst_run
> diff --git a/lib/newlib_tests/shell/tst_check_kconfig05.sh b/lib/newlib_tests/shell/tst_check_kconfig05.sh
> new file mode 100755
> index 000000000..1a214016a
> --- /dev/null
> +++ b/lib/newlib_tests/shell/tst_check_kconfig05.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2022 FUJITSU LIMITED. All rights reserved.
> +
> +TST_TESTFUNC=do_test
> +TST_NEEDS_CMDS="tst_check_kconfigs"
> +. tst_test.sh
> +
> +do_test()
> +{
> +	tst_check_kconfigs "CONFIG_EXT4_FS"
> +	if [ $? -eq 0 ]; then
> +		tst_res TPASS "kernel .config has CONFIG_EXT4_fs"
> +	else
> +		tst_res TFAIL "kernel .config doesn't have CONFIG_EXT4_FS"
> +	fi
> +
> +	tst_check_kconfigs "CONFIG_EXT4"
> +	if [ $? -eq 0 ]; then
> +		tst_res TFAIL "kernel .config has CONFIG_EXT4"
> +	else
> +		tst_res TPASS "kernel .config doesn't have CONFIG_EXT4"
> +	fi
> +}
> +
> +tst_run
> diff --git a/testcases/lib/.gitignore b/testcases/lib/.gitignore
> index 9625d9043..c0d4dc851 100644
> --- a/testcases/lib/.gitignore
> +++ b/testcases/lib/.gitignore
> @@ -1,4 +1,5 @@
>  /tst_check_drivers
> +/tst_check_kconfigs
>  /tst_checkpoint
>  /tst_device
>  /tst_getconf
> diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
> index d6b4c7a91..f2de0c832 100644
> --- a/testcases/lib/Makefile
> +++ b/testcases/lib/Makefile
> @@ -11,6 +11,7 @@ INSTALL_TARGETS		:= *.sh
>  MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
>  			   tst_device tst_net_iface_prefix tst_net_ip_prefix tst_net_vars\
>  			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
> -			   tst_get_median tst_hexdump tst_get_free_pids tst_timeout_kill
> +			   tst_get_median tst_hexdump tst_get_free_pids tst_timeout_kill\
> +			   tst_check_kconfigs
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/lib/tst_check_kconfigs.c b/testcases/lib/tst_check_kconfigs.c
> new file mode 100644
> index 000000000..5c387a62d
> --- /dev/null
> +++ b/testcases/lib/tst_check_kconfigs.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright (c) 2022 FUJITSU LIMITED. All rights reserved. */
> +
> +#include <stdio.h>
> +#include "tst_kconfig.h"
> +
> +int main(int argc, const char *argv[])
> +{
> +	if (argc < 2) {
> +		fprintf(stderr, "Please provide kernel kconfig list\n");
> +		return 1;
> +	}
> +
> +	if (tst_kconfig_check(argv+1))
> +		return 1;
> +
> +	return 0;
> +}
> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 2556b28f5..0097c8d43 100644
> --- a/testcases/lib/tst_test.sh
> +++ b/testcases/lib/tst_test.sh
> @@ -412,6 +412,37 @@ tst_require_drivers()
>  	return 0
>  }
>  
> +tst_require_kconfigs()
> +{
> +	[ $# -eq 0 ] && return 0
> +
> +	local kconfigs
> +	local kconfig_i
> +	local kconfig_max
> +
> +	kconfigs=$@
> +	[ -z "$kconfigs" ] && return 0
> +
> +	tst_check_cmds cut tr wc
> +	kconfig_max=$(( $(echo "$kconfigs" | tr -cd "$TST_NEEDS_KCONFIGS_IFS" | wc -c) +1))
> +	if [ $kconfig_max -gt 10 ]; then
> +		tst_brk TCONF "The max number of kconfig is 10!"
> +	fi

There is really no reason to have this artificial limit if we are not
passing the configs in a set of variables.

> +	for kconfig_i in $(seq $kconfig_max); do
> +		eval "local kconfig$kconfig_i"
> +		eval "kconfig$kconfig_i='$(echo "$kconfigs" | cut -d"$TST_NEEDS_KCONFIGS_IFS" -f$kconfig_i)'"
> +	done

This part is a bit ugly, I guess that it may as well be easier to
process in C. A long as we pass it as:

tst_check_kconfigs "$TST_NEEDS_KCONFIGS_IFS" "$TST_NEEDS_KCONFIGS"

We can easily split the TST_NEEDS_KCONFIGS with strchr() and single
loop.

> +	tst_check_kconfigs $kconfig1 $kconfig2 $kconfig3 $kconfig4 $kconfig5 $kconfig6\
> +			$kconfig7 $kconfig8 $kconfig9 $kconfig10
> +	if [ $? -ne 0 ]; then
> +		tst_brk TCONF "Aborting due to unsuitable kernel config, see above!"
> +	fi
> +
> +	return 0
> +}
> +
>  tst_is_int()
>  {
>  	[ "$1" -eq "$1" ] 2>/dev/null
> @@ -587,6 +618,7 @@ tst_run()
>  			NEEDS_ROOT|NEEDS_TMPDIR|TMPDIR|NEEDS_DEVICE|DEVICE);;
>  			NEEDS_CMDS|NEEDS_MODULE|MODPATH|DATAROOT);;
>  			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
> +			NEEDS_KCONFIGS|NEEDS_KCONFIGS_IFS);;
>  			IPV6|IPV6_FLAG|IPVER|TEST_DATA|TEST_DATA_IFS);;
>  			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
>  			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG|NETLOAD_CLN_NUMBER);;
> @@ -627,6 +659,7 @@ tst_run()
>  	[ "$TST_DISABLE_SELINUX" = 1 ] && tst_disable_selinux
>  
>  	tst_require_cmds $TST_NEEDS_CMDS
> +	tst_require_kconfigs $TST_NEEDS_KCONFIGS
>  	tst_require_drivers $TST_NEEDS_DRIVERS
>  
>  	if [ -n "$TST_MIN_KVER" ]; then
> @@ -748,6 +781,8 @@ if [ -z "$TST_NO_DEFAULT_RUN" ]; then
>  
>  	TST_TEST_DATA_IFS="${TST_TEST_DATA_IFS:- }"
>  
> +	TST_NEEDS_KCONFIGS_IFS="${TST_NEEDS_KCONFIGS_IFS:-,}"
> +
>  	if [ -n "$TST_CNT" ]; then
>  		if ! tst_is_int "$TST_CNT"; then
>  			tst_brk TBROK "TST_CNT must be integer"
> -- 
> 2.23.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
