Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F33118AF4
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 15:33:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF0693C220A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 15:33:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 338083C12B6
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 15:32:59 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 33752140180A
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 15:32:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27E31ABC6;
 Tue, 10 Dec 2019 14:32:57 +0000 (UTC)
Date: Tue, 10 Dec 2019 15:32:56 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <20191210143256.GA30547@rei.lan>
References: <20191209064110.67975-1-lkml@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209064110.67975-1-lkml@jv-coder.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> This is a proposal for a fifo library that can be used to synchronize
> tests internally, e.g. between a shell script and c program or between forks.
> If the proposal is accepted, I will also add documentation.
> 
> The library allows an arbitrary number of fifos to be created. The only requirement
> is that the test needs TST_NEEDS_TMPDIR=1.
> Reading and writing to the fifo is also a synchronization point.
> 
> Each fifo requires two queues: One for sending a message to the other process
> and the second one is used for receive acknowledgement. Otherwise two messages
> can be received at the same time, if the sender sends them too fast, before the receiver
> has closed its file handle.
> 
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>  include/tst_fifo.h                      |  12 +++
>  lib/newlib_tests/.gitignore             |   2 +
>  lib/newlib_tests/shell/tst_fifo_test.sh |  56 ++++++++++++
>  lib/newlib_tests/tst_fifo.c             |  51 +++++++++++
>  lib/newlib_tests/tst_fifo_proc.c        |  42 +++++++++
>  lib/tst_fifo.c                          | 115 ++++++++++++++++++++++++
>  testcases/Makefile                      |   2 +-
>  testcases/lib/tst_fifo.sh               |  58 ++++++++++++
>  testcases/lib/tst_test.sh               |   4 +-
>  9 files changed, 340 insertions(+), 2 deletions(-)
>  create mode 100644 include/tst_fifo.h
>  create mode 100644 lib/newlib_tests/shell/tst_fifo_test.sh
>  create mode 100644 lib/newlib_tests/tst_fifo.c
>  create mode 100644 lib/newlib_tests/tst_fifo_proc.c
>  create mode 100644 lib/tst_fifo.c
>  create mode 100644 testcases/lib/tst_fifo.sh
> 
> diff --git a/include/tst_fifo.h b/include/tst_fifo.h
> new file mode 100644
> index 000000000..f5f61dee7
> --- /dev/null
> +++ b/include/tst_fifo.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> + */
> +
> +void tst_fifo_init(void);
> +
> +void tst_fifo_create(const char *name);
> +void tst_fifo_destroy(const char *name);
> +
> +void tst_fifo_send(const char *name, const char *data);
> +int tst_fifo_receive(const char *name, char *data, int maxlen);
> \ No newline at end of file

You are missing guards here. I.e. the #ifdef TST_FIFO__, #define ...

> diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
> index d4aa4935f..1d887e0ab 100644
> --- a/lib/newlib_tests/.gitignore
> +++ b/lib/newlib_tests/.gitignore
> @@ -17,6 +17,8 @@ test16
>  tst_capability01
>  tst_capability02
>  tst_device
> +tst_fifo
> +tst_fifo_proc
>  tst_safe_fileops
>  tst_res_hexd
>  tst_strstatus
> diff --git a/lib/newlib_tests/shell/tst_fifo_test.sh b/lib/newlib_tests/shell/tst_fifo_test.sh
> new file mode 100644
> index 000000000..f124a5f0a
> --- /dev/null
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
> +        tst_res TPASS "Received first expected answer"
> +    else
> +        tst_res TFAIL "First expected answer mismatch ('$data')"
> +    fi
> +
> +    data=$(tst_fifo_receive $P2S)
> +    if [ "$data" == "answer 2" ]; then
> +        tst_res TPASS "Received second expected answer"
> +    else
> +        tst_res TFAIL "Second expected answer mismatch ('$data')"
> +    fi
> +
> +    data=$(tst_fifo_receive $P2S)
> +    if [ "$data" == "answer 3" ]; then
> +        tst_res TPASS "Received third expected answer"
> +    else
> +        tst_res TFAIL "Third expected answer mismatch ('$data')"
> +    fi
> +
> +    tst_res TINFO "Waiting for tst_fifo_proc to terminate"
> +    wait $pid
> +
> +    tst_res TPASS "All tests passed"
> +}
> +
> +
> +tst_run
> \ No newline at end of file
> diff --git a/lib/newlib_tests/tst_fifo.c b/lib/newlib_tests/tst_fifo.c
> new file mode 100644
> index 000000000..c7d68cb08
> --- /dev/null
> +++ b/lib/newlib_tests/tst_fifo.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> + */
> +
> +#include "tst_test.h"
> +#include "tst_fifo.h"
> +
> +#define MSG_P2C "AbcD"
> +#define MSG_C2P "Hello World"
> +
> +static void do_setup(void)
> +{
> +    tst_fifo_init();
> +}
> +
> +static void do_test(void)
> +{
> +    tst_fifo_create("p2c");
> +    tst_fifo_create("c2p");
> +
> +    pid_t pid = SAFE_FORK();
> +    if (pid == 0) {
> +        char data[sizeof(MSG_P2C)];
> +        if (tst_fifo_receive("p2c", data, sizeof(data)) != strlen(MSG_P2C))
> +            tst_res(TFAIL, "Child did not receive expected length");
> +        if (strcmp(data, MSG_P2C) != 0)
> +            tst_res(TFAIL, "Child did not receive expected value ('%s' != '%s')", MSG_P2C, data);
> +        else
> +            tst_res(TPASS, "Child received expected value");
> +        
> +        tst_fifo_send("c2p", MSG_C2P);
> +    } else {
> +        tst_fifo_send("p2c", MSG_P2C);
> +
> +        char data[sizeof(MSG_C2P)];
> +        if (tst_fifo_receive("c2p", data, sizeof(data)) != strlen(MSG_C2P))
> +            tst_res(TFAIL, "Parent did not receive expected length");
> +        if (strcmp(data, MSG_C2P) != 0)
> +            tst_res(TFAIL, "Parent did not receive expected value ('%s' != '%s')", MSG_C2P, data);
> +        else
> +            tst_res(TPASS, "Parent received expected value");
> +    }
> +}
> +
> +static struct tst_test test = {
> +    .needs_tmpdir = 1,
> +    .forks_child = 1,
> +    .setup = do_setup,
> +	.test_all = do_test
> +};

It's a minor thing but the whitespaces are all mangled in this source
and in the others. Have you used checkpatch.pl (which is shipped along
with kernel sources) to check for common mistakes in a patch?

> diff --git a/lib/newlib_tests/tst_fifo_proc.c b/lib/newlib_tests/tst_fifo_proc.c
> new file mode 100644
> index 000000000..bd9604741
> --- /dev/null
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

If nothing else this macro is a reason to nack this patchset, it's quite
ugly as it is.

I was wondering if we can could keep the fds open, but I guess that the
code is depending on a fact that the processes are blocked and
synchronized on open() on the fifo, right?

But if that's true we do not need full blown bidirectional communication
for the memcg tests. We just need one fifo, where the parent reads from
it and the C child writes there after it finished allocation. The parent
will either get read some data or the read in the parent will return
with 0 (EOF), if the other side of the fifo has been closed (the process
killed).

> +void tst_fifo_init(void)
> +{
> +    if (tst_tmpdir_created()) {
> +        FIFO_DIR = tst_get_tmpdir();
> +        setenv(FIFO_ENV_VAR, FIFO_DIR, 1);
> +    } else {
> +        FIFO_DIR = getenv(FIFO_ENV_VAR);
> +    }

Shouldn't the env variable take precedence?

I wonder if there would be a case where two tests each with it's own
temporary directory would need to communicate. But I guess that we can
fix this at any point.

> +    if (!FIFO_DIR)
> +        tst_brk(TBROK, "no tempdir and " FIFO_ENV_VAR " not set");
> +}
> +
> +void tst_fifo_create(const char *name)
> +{
> +    INIT_FIFO_FUNCTION(0, 0);
> +
> +    if (mkfifo(path_req, S_IRWXU | S_IRWXG | S_IRWXO)) 
> +        tst_brk(TBROK, "mkfifo(%s) failed with %s", path_req, tst_strerrno(errno));
> +
> +    if (mkfifo(path_ack, S_IRWXU | S_IRWXG | S_IRWXO)) 
> +        tst_brk(TBROK, "mkfifo(%s) failed with %s", path_ack, tst_strerrno(errno));
> +}
> +
> +void tst_fifo_destroy(const char *name)
> +{
> +    INIT_FIFO_FUNCTION(R_OK | W_OK, R_OK | W_OK);
> +
> +    if (remove(path_req))
> +        tst_brk(TBROK, "unable to remove fifo '%s'", path_req);
> +    if (remove(path_ack))
> +        tst_brk(TBROK, "unable to remove fifo '%s'", path_ack);
> +}
> +
> +void tst_fifo_send(const char *name, const char *data)
> +{
> +    int fd;
> +    char ack[2];
> +    INIT_FIFO_FUNCTION(W_OK, R_OK);
> +
> +    fd = SAFE_OPEN(path_req, O_WRONLY);
> +    SAFE_WRITE(1, fd, data, strlen(data));
> +    SAFE_CLOSE(fd);
> +
> +    fd = SAFE_OPEN(path_ack, O_RDONLY);
> +    SAFE_READ(1, fd, ack, 2);
> +    SAFE_CLOSE(fd);
> +}
> +
> +int tst_fifo_receive(const char *name, char *data, int maxlen)
> +{
> +    int fd;
> +    int nbyte;
> +    int pos;
> +    INIT_FIFO_FUNCTION(R_OK, W_OK);
> +
> +    fd = SAFE_OPEN(path_req, O_RDONLY);
> +    pos = 0;
> +    while (1) {
> +        nbyte = SAFE_READ(0, fd, data + pos, maxlen - pos);
> +        if (nbyte == 0)
> +            break;
> +        pos += nbyte;
> +        if (pos == maxlen)
> +            tst_brk(TBROK, "buffer is not big enough");
> +    }
> +
> +    SAFE_CLOSE(fd);
> +
> +    fd = SAFE_OPEN(path_ack, O_WRONLY);
> +    SAFE_WRITE(1, fd, "OK", 2);
> +    SAFE_CLOSE(fd);

I'm not sure we want to implement automatic ack like this. Why can't we
just keep this as generic two-directional communication. I would also
say that code that explicitly reads acks from the pipe would be easier
to read as well, because there will be less hidden in the library.

> +    data[pos] = 0;
> +    return pos;
> +}

These functions would be better if they both included a timeout
parameter. The fifo fds would have to be opened in non-blocking
and we would have to use poll(). That way we wouldn't end up stuck if
the other side is not dead but got stuck somehow.

> diff --git a/testcases/Makefile b/testcases/Makefile
> index b04e6309f..47c110972 100644
> --- a/testcases/Makefile
> +++ b/testcases/Makefile
> @@ -28,7 +28,7 @@ include $(top_srcdir)/include/mk/env_pre.mk
>  # 1. kdump shouldn't be compiled by default, because it's runtime based and
>  #    WILL crash the build host (the tests need to be fixed to just build, not
>  #    run).
> -FILTER_OUT_DIRS		:= kdump
> +FILTER_OUT_DIRS		:= kdump open_posix_testsuite realtime kernel network misc
>  
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
> +
> +[ "$TST_NEEDS_TMPDIR" != 1 ] && tst_brk TCONF "fifo library requires TST_NEEDS_TMPDIR=1"
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
> +    cat "$_tst_path_ack" > /dev/null
> +}
> +
> +tst_fifo_receive()
> +{
> +    [ $# -ne 1 ] && tst_brk TBROK "tst_fifo_receive expects 1 parameter"
> +    local _tst_path_req="${TST_TMPDIR}/tst_fifo_$1.req"
> +    local _tst_path_ack="${TST_TMPDIR}/tst_fifo_$1.ack"
> +
> +    [ -p "$_tst_path_req" ] || tst_brk TBROK "tst_fifo_receive fifo '$_tst_path_req' does not exist"
> +    [ -p "$_tst_path_ack" ] || tst_brk TBROK "tst_fifo_receive fifo '$_tst_path_ack' does not exist"
> +
> +    cat "$_tst_path_req"
> +    echo -n "OK" > "$_tst_path_ack"
> +}

Can we please create a small C helper, as we do for checkpoints, so that
we will have only one implementation of the FIFO?

> diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
> index 70c1ef2e3..2352c5eea 100644
> --- a/testcases/lib/tst_test.sh
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
>  
> +	[ "$TST_NEEDS_FIFO" = 1 ] && . tst_fifo.sh
> +
>  	TST_MNTPOINT="${TST_MNTPOINT:-mntpoint}"
>  	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
>  		if [ -z ${TST_TMPDIR} ]; then
> -- 
> 2.20.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
