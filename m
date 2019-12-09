Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9170D11793A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 23:26:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E5D93C234C
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 23:26:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 202B23C2092
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 23:26:01 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4917F10028B7
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 23:25:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56C75AD07;
 Mon,  9 Dec 2019 22:25:59 +0000 (UTC)
Date: Mon, 9 Dec 2019 23:25:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191209222557.GA31054@dell5510>
References: <20191209064110.67975-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209064110.67975-1-lkml@jv-coder.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: Add fifo library
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM. Good work, thanks!

...
> +++ b/lib/newlib_tests/shell/tst_fifo_test.sh
> @@ -0,0 +1,56 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2019 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> +
> +TST_TESTFUNC=do_test
> +TST_NEEDS_FIFO=1
> +TST_NEEDS_TMPDIR=1
> +
> +. tst_test.sh
> +
> +S2P="fifo_shell_to_proc"
> +P2S="fifo_proc_to_shell"
> +
> +do_test()
> +{
> +    tst_fifo_create $S2P
> +    tst_fifo_create $P2S
> +
> +    tst_fifo_proc &
> +    pid=$!
> +
> +    tst_fifo_send $S2P "init message"
> +    tst_res TPASS "init message send"
> +
> +    tst_fifo_send $S2P "second init message"
> +    tst_res TPASS "second init message send"
> +
> +    data=$(tst_fifo_receive $P2S)
> +    if [ "$data" == "answer 1" ]; then
Please use just = (bashism).

...
> +++ b/lib/newlib_tests/tst_fifo_proc.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> + */
> +
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "tst_fifo.h"
> +
> +#define S2P "fifo_shell_to_proc"
> +#define P2S "fifo_proc_to_shell"
> +
> +int main()
tst_fifo_proc.c:14:5: warning: old-style function definition [-Wold-style-definition]
=> int main(void)
> +{
> +    char data[128];
> +
> +    TCID = "tst_fifo_proc";
> +
> +    tst_fifo_init();
> +
> +    tst_fifo_receive(S2P, data, sizeof(data));
> +    tst_res(strcmp(data, "init message") == 0 ? TPASS : TFAIL,
> +            "Received expected init message (%s)", data);
> +
> +    // Wait a bit for asynchronous access to pipe
> +    sleep(1);
> +
> +    tst_fifo_receive(S2P, data, sizeof(data));
> +    tst_res(strcmp(data, "second init message") == 0 ? TPASS : TFAIL,
> +            "Received expected second init message");
> +
> +    tst_fifo_send(P2S, "answer 1");
> +    sleep(1);
> +    tst_fifo_send(P2S, "answer 2");
> +    sleep(1);
> +    tst_fifo_send(P2S, "answer 3");
> +
> +    tst_res(TPASS, "All tests passed");
> +
> +    return 0;
> +}
> \ No newline at end of file
> diff --git a/lib/tst_fifo.c b/lib/tst_fifo.c
> new file mode 100644
> index 000000000..7d139624b
> --- /dev/null
> +++ b/lib/tst_fifo.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> + */
> +#define _GNU_SOURCE
If _GNU_SOURCE is not needed, drop it please.

> +#include <stddef.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "old_tmpdir.h"
> +#include "tst_fifo.h"
> +
> +#ifndef PATH_MAX
> +#ifdef MAXPATHLEN
> +#define PATH_MAX	MAXPATHLEN
> +#else
> +#define PATH_MAX	1024
> +#endif
> +#endif
Hm, this is copy paste from old tests (all use test.h, even quite new and clean tests/tst_tmpdir_test.c).
I wonder if this is still relevant, can't we use #include <limits.h>?

> +
> +#define FIFO_ENV_VAR "LTP_FIFO_PATH"
> +
> +static char *FIFO_DIR = NULL;
> +
> +#define INIT_FIFO_FUNCTION(req_mode, ack_mode) \
> +    char path_req[PATH_MAX]; \
> +    char path_ack[PATH_MAX]; \
> +    if (!FIFO_DIR) \
> +        tst_brk(TBROK, "you must call tst_fifo_init first"); \
> +    snprintf(path_req, sizeof(path_req), "%s/tst_fifo_%s.req", FIFO_DIR, name); \
> +    snprintf(path_ack, sizeof(path_ack), "%s/tst_fifo_%s.ack", FIFO_DIR, name);
> +    //if (required_mode && access(path, required_mode)) \
> +     //   tst_brk(TBROK, "cannot access '%s'", path);
Commented out code forgotten :).
...

> +++ b/testcases/Makefile
> @@ -28,7 +28,7 @@ include $(top_srcdir)/include/mk/env_pre.mk
>  # 1. kdump shouldn't be compiled by default, because it's runtime based and
>  #    WILL crash the build host (the tests need to be fixed to just build, not
>  #    run).
> -FILTER_OUT_DIRS		:= kdump
> +FILTER_OUT_DIRS		:= kdump open_posix_testsuite realtime kernel network misc
I guess this is unrelated change for your debug.

>  ifneq ($(WITH_OPEN_POSIX_TESTSUITE),yes)
>  FILTER_OUT_DIRS		+= open_posix_testsuite
> diff --git a/testcases/lib/tst_fifo.sh b/testcases/lib/tst_fifo.sh
> new file mode 100644
> index 000000000..922b24059
> --- /dev/null
> +++ b/testcases/lib/tst_fifo.sh
> @@ -0,0 +1,58 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2019 Joerg Vehlow <joerg.vehlow@aox-tech.de>
tst_security.sh and tst_net.sh have each it's guard:
[ -n "$TST_SECURITY_LOADED" ] && return 0
tst_fifo.sh should probably have one as well.

> +[ "$TST_NEEDS_TMPDIR" != 1 ] && tst_brk TCONF "fifo library requires TST_NEEDS_TMPDIR=1"
If we apply https://patchwork.ozlabs.org/patch/1206399/, it should be
$TST_NEEDS_TMPDIR=1


> +[ -z "$TST_TMPDIR" ] && tst_brk TCONF "TST_TMPDIR is not supposed to be empty"
> +
> +export LTP_FIFO_PATH="$TST_TMPDIR"
> +
> +tst_fifo_create()
> +{
> +    [ $# -ne 1 ] && tst_brk TBROK "tst_fifo_create expects 1 parameter"
> +    local _tst_path_req="${TST_TMPDIR}/tst_fifo_$1.req"
> +    local _tst_path_ack="${TST_TMPDIR}/tst_fifo_$1.ack"
> +
> +    mkfifo "$_tst_path_req" || tst_brk TBROK "unable to create fifo '$_tst_path_req'"
> +    mkfifo "$_tst_path_ack" || tst_brk TBROK "unable to create fifo '$_tst_path_ack'"
> +}
> +
> +tst_fifo_destroy()
> +{
> +    [ $# -ne 1 ] && tst_brk TBROK "tst_fifo_destroy expects 1 parameter"
> +    local _tst_path_req="${TST_TMPDIR}/tst_fifo_$1.req"
> +    local _tst_path_ack="${TST_TMPDIR}/tst_fifo_$1.ack"
> +
> +    [ -p "$_tst_path_req" ] || tst_brk TBROK "tst_fifo_destroy fifo '$_tst_path_req' does not exist"
> +    [ -p "$_tst_path_ack" ] || tst_brk TBROK "tst_fifo_destroy fifo '$_tst_path_ack' does not exist"
> +
> +    rm "$_tst_path_req"  || tst_brk TBROK "unable to destroy fifo '$_tst_path_req'"
> +    rm "$_tst_path_ack"  || tst_brk TBROK "unable to destroy fifo '$_tst_path_ack'"
> +}
> +
> +tst_fifo_send()
> +{
> +    [ $# -ne 2 ] && tst_brk TBROK "tst_fifo_send expects 2 parameters"
> +    local _tst_path_req="${TST_TMPDIR}/tst_fifo_$1.req"
> +    local _tst_path_ack="${TST_TMPDIR}/tst_fifo_$1.ack"
> +    local _tst_msg="$2"
> +
> +    [ -p "$_tst_path_req" ] || tst_brk TBROK "tst_fifo_send fifo '$_tst_path_req' does not exist"
> +    [ -p "$_tst_path_ack" ] || tst_brk TBROK "tst_fifo_send fifo '$_tst_path_ack' does not exist"
> +
> +    echo -n "$_tst_msg" > "$_tst_path_req"
nit: I'd prefer printf
> +    cat "$_tst_path_ack" > /dev/null
> +}
> +

...
> +++ b/testcases/lib/tst_test.sh
> @@ -479,7 +479,7 @@ tst_run()
>  			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
>  			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
>  			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
> -			NET_MAX_PKT);;
> +			NET_MAX_PKT|NEEDS_FIFO);;
>  			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
>  			esac
>  		done
> @@ -537,6 +537,8 @@ tst_run()
>  		cd "$TST_TMPDIR"
>  	fi

> +	[ "$TST_NEEDS_FIFO" = 1 ] && . tst_fifo.sh
I'd load it at the top, just below
. tst_ansi_color.sh
. tst_security.sh

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
