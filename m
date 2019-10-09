Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BBCD11D7
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:57:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 385D53C2266
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:57:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 51B943C2145
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:41:12 +0200 (CEST)
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4BF671000A5B
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:39:42 +0200 (CEST)
Received: by mail-qk1-x744.google.com with SMTP id h126so2405356qke.10
 for <ltp@lists.linux.it>; Wed, 09 Oct 2019 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B5mWAIekQxCJRutIz3kxdljirr7ZNQzHVpU/Nup5Odw=;
 b=PCx/45cE38DolyXNRf6C3LkD1LCXEOYr26qpnCFjrjMj+lWW/q7VRhUYdQ6T7rsUP2
 lLmnt56b6E8s8SJV0w0DfFr5bpZQf+nGlGxl05DxzL5rSZ0HLSMPmxDvHIhZ/UoVht9E
 bHh1TrBkgOvgpwcSS4gfvihMXL1WGeklyQvH0n+/cJ07zaY+MvQs1TmcUZNHBP9s0w7a
 JgypRfjPXvK1TxIHBw4/6q5JN0ET2BJrkUZQF750/zQj6OAw2QGNx90vrT57cpByf6Ud
 LVZi9c1FvctGMpT7ANawTW1Bea/QMffPF/6tl24FjAWhhfvdkKESKxNxJegXJfTByysZ
 pVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B5mWAIekQxCJRutIz3kxdljirr7ZNQzHVpU/Nup5Odw=;
 b=NdZl0afJNtnzUjiTD+LN66ScdzlKpzTsDDicwbAM171JC+QdUXsV4Ke+inhjX53zm+
 +EU0F5/TtBdjOwgQAK+q4P+reYPxK7YBcwjE0nfMXV9uj4YqdYIsAfIzFcrXbBGhbWZW
 S/+dMQKxPxAWELADys9SEfWXFKU7yg030fMJ1XbwM3mdPHUVvov1yAzRHQSC+5IQKRW7
 wlq0E8BK4Q3oKo2rh1RUettEqyOHEll/imKcXVZHvhyxy+31ziy68LVes1Wsdk07i8at
 fbbsZpAN/O2n2WlFuVY+nMDRFRbp1g50dD4/EAllKORq7af0M5Q/WurXQY+TEuuBfZ+5
 NXwA==
X-Gm-Message-State: APjAAAW/M9jw1SDNanuRcrnSxcRn09tuTiBaE0Y1FaM5AIheQNvkGDur
 v/K0it6F3C8nuz/VOtERdVF2WILdie4uweNxY9h0UQ==
X-Google-Smtp-Source: APXvYqzLzgmiFj63SLEzmkD8UGX/19GGegnRxIMrRpNhnUdITp4U2ha3+AamWVWqG3pjWy9w6/PdIq2XzsjGfBy5dJM=
X-Received: by 2002:a37:65d0:: with SMTP id z199mr3576929qkb.407.1570632069499; 
 Wed, 09 Oct 2019 07:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191009142446.6997-1-rpalethorpe@suse.com>
In-Reply-To: <20191009142446.6997-1-rpalethorpe@suse.com>
Date: Wed, 9 Oct 2019 16:40:56 +0200
Message-ID: <CACT4Y+b0tTAQ0r_2gCVjjRh--Xwv=aLzh6MY=ciXMMrK+cAQsA@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 09 Oct 2019 16:57:35 +0200
Subject: Re: [LTP] [RFC PATCH] LTP Wrapper for Syzkaller reproducers
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
From: Dmitry Vyukov via ltp <ltp@lists.linux.it>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Cc: "open list : KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kernelci@groups.io, George Kennedy <george.kennedy@oracle.com>,
 syzkaller <syzkaller@googlegroups.com>, automated-testing@yoctoproject.org,
 chrubis@suse.com, shuah <shuah@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Oct 9, 2019 at 4:26 PM Richard Palethorpe <rpalethorpe@suse.com> wrote:
>
> First attempt at wrapping the Syzkaller reproducers in the LTP library. I am
> posting this in case anyone wants to experiment with it early or has a
> radically different approach in mind.
>
> This just uses exec to run the reproducer executables as per Metan's
> suggestion. There is a simple script which creates a runtest file allowing it
> to work with existing LTP test runners, albeit with a bit of extra work for
> now.
>
> This would benefit from the following LTP library patch:
> https://patchwork.ozlabs.org/patch/935568/
>
> Running it without KASAN and the other kernel debugging options is not a good
> idea. We can easily detect when the kernel config is wrong and print a
> warning or even refuse to run, but I haven't added it yet.
>
> Having to download, compile and install the reproducers seperately is annoying
> and I bet most users won't do it. We can probably automate that as part of the
> install, it is just a question of how much we do as default.
>
> ---
>  runtest/.gitignore                            |  1 +
>  testcases/kernel/Makefile                     |  1 +
>  testcases/kernel/syzkaller-repros/.gitignore  |  1 +
>  testcases/kernel/syzkaller-repros/Makefile    | 10 +++
>  testcases/kernel/syzkaller-repros/README.md   | 39 +++++++++
>  .../kernel/syzkaller-repros/gen-runtest.sh    |  8 ++
>  testcases/kernel/syzkaller-repros/syzwrap.c   | 85 +++++++++++++++++++
>  7 files changed, 145 insertions(+)
>  create mode 100644 runtest/.gitignore
>  create mode 100644 testcases/kernel/syzkaller-repros/.gitignore
>  create mode 100644 testcases/kernel/syzkaller-repros/Makefile
>  create mode 100644 testcases/kernel/syzkaller-repros/README.md
>  create mode 100755 testcases/kernel/syzkaller-repros/gen-runtest.sh
>  create mode 100644 testcases/kernel/syzkaller-repros/syzwrap.c
>
> diff --git a/runtest/.gitignore b/runtest/.gitignore
> new file mode 100644
> index 000000000..e3725dd42
> --- /dev/null
> +++ b/runtest/.gitignore
> @@ -0,0 +1 @@
> +syzkaller-repros
> diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
> index 3319b3163..0150cfb4f 100644
> --- a/testcases/kernel/Makefile
> +++ b/testcases/kernel/Makefile
> @@ -53,6 +53,7 @@ SUBDIRS                       += connectors \
>                            sched \
>                            security \
>                            sound \
> +                          syzkaller-repros \
>                            tracing \
>                            uevents \
>
> diff --git a/testcases/kernel/syzkaller-repros/.gitignore b/testcases/kernel/syzkaller-repros/.gitignore
> new file mode 100644
> index 000000000..dbda1c71f
> --- /dev/null
> +++ b/testcases/kernel/syzkaller-repros/.gitignore
> @@ -0,0 +1 @@
> +syzwrap
> diff --git a/testcases/kernel/syzkaller-repros/Makefile b/testcases/kernel/syzkaller-repros/Makefile
> new file mode 100644
> index 000000000..8e74805c2
> --- /dev/null
> +++ b/testcases/kernel/syzkaller-repros/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2019 Linux Test Project
> +
> +top_srcdir             ?= ../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +CFLAGS                 += -D_GNU_SOURCE
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syzkaller-repros/README.md b/testcases/kernel/syzkaller-repros/README.md
> new file mode 100644
> index 000000000..e95ae19e2
> --- /dev/null
> +++ b/testcases/kernel/syzkaller-repros/README.md
> @@ -0,0 +1,39 @@
> +LTP wrapper for Syzkaller reproducers
> +=====================================
> +
> +This allows you to run the autogenerated bug reproducers from the Syzkaller
> +fuzzer within the LTP framework. Meaning that you may use an existing test
> +runner compatible with the LTP.
> +
> +However some extra setup is currently required.
> +
> +Instructions
> +------------
> +
> +1. Download and compile the reproducers.
> +2. Build the LTP as normal
> +3. Use the gen-runtest.sh script to create a runtest file
> +4. Install the LTP and the reproducers to the SUT
> +5. Execute the tests in the syzkaller-repros runtest file
> +
> +For now you can download the reproducers from here:
> +https://github.com/dvyukov/syzkaller-repros. Soon they will be available on
> +kernel.org.
> +
> +The gen-runtest takes two arguments:
> +
> +1. The directory where the reproducer executables are currently accessible
> +2. The *absolute* path to the directory where they will be on the SUT (If
> +   different, can be omitted)
> +
> +For example:
> +```
> +./gen-runtest.sh ~/qa/syzkaller-repros/bin /mnt/syzkaller-repros/bin >
> +~/qa/ltp-build/runtest/syzkaller-repros
> +```
> +
> +For the LTP, just doing `make install` will copy all the relevant files
> +(assuming you put the runtest file in the runtest folder). However you will
> +need to copy the reproducers yourself.
> +
> +
> diff --git a/testcases/kernel/syzkaller-repros/gen-runtest.sh b/testcases/kernel/syzkaller-repros/gen-runtest.sh
> new file mode 100755
> index 000000000..091818fb2
> --- /dev/null
> +++ b/testcases/kernel/syzkaller-repros/gen-runtest.sh
> @@ -0,0 +1,8 @@
> +#!/usr/bin/sh
> +
> +BUILD_DIR=$1
> +SUT_DIR=$2
> +
> +for f in $(ls $BUILD_DIR); do
> +    echo $f syzwrap -d ${SUT_DIR:-$BUILD_DIR} -n $f
> +done
> diff --git a/testcases/kernel/syzkaller-repros/syzwrap.c b/testcases/kernel/syzkaller-repros/syzwrap.c
> new file mode 100644
> index 000000000..7951d1819
> --- /dev/null
> +++ b/testcases/kernel/syzkaller-repros/syzwrap.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
> + *
> + * Run a single reproducer generated by the Syzkaller fuzzer.
> + */
> +
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <signal.h>
> +#include <stdio.h>
> +
> +#include "tst_test.h"
> +#include "tst_taint.h"
> +#include "tst_safe_stdio.h"
> +
> +static char *dir;
> +static char *name;
> +static char *path;
> +
> +static struct tst_option options[] = {
> +       {"d:", &dir, "Mandatory directory containing reproducers"},
> +       {"n:", &name, "Mandatory executable name of reproducer"},
> +       {NULL, NULL, NULL}
> +};
> +
> +static void setup(void)
> +{
> +       tst_taint_init(TST_TAINT_W | TST_TAINT_D);
> +
> +       if (!dir)
> +               tst_brk(TBROK, "No reproducer directory specified");
> +
> +       if (!name)
> +               tst_brk(TBROK, "No reproducer name specified");
> +
> +       tst_res(TINFO, "https://syzkaller.appspot.com/bug?id=%s", name);
> +
> +       SAFE_ASPRINTF(&path, "%s/%s", dir, name);
> +       tst_res(TINFO, "%s", path);
> +}
> +
> +static void run(void)
> +{
> +       unsigned int backoff = 100;
> +       int rem, status, sent_kill = 0;
> +       float exec_time_start = (float)tst_timeout_remaining();
> +       int pid = SAFE_FORK();
> +
> +       if (!pid) {
> +               execle(path, name, environ);
> +               tst_brk(TBROK | TERRNO, "Failed to exec reproducer");
> +       }
> +
> +       while (!waitpid(pid, &status, WNOHANG)) {
> +               rem = tst_timeout_remaining();
> +
> +               if (!sent_kill && rem / exec_time_start < 0.98) {
> +                       tst_res(TINFO, "Timeout; killing reproducer");
> +
> +                       TEST(kill(pid, SIGKILL));
> +                       if (TST_RET == -1)
> +                               tst_res(TWARN | TTERRNO, "kill() failed");
> +                       else
> +                               sent_kill = 1;
> +               }
> +
> +               usleep(backoff);
> +               backoff = MIN(2 * backoff, 1000000);
> +       }
> +
> +       if (tst_taint_check()) {
> +               tst_res(TFAIL, "Kernel is tainted");
> +       } else {
> +               tst_res(TPASS, "Kernel is not tainted");
> +       }
> +}
> +
> +static struct tst_test test = {
> +       .setup = setup,
> +       .test_all = run,
> +       .options = options,
> +       .needs_tmpdir = 1,
> +       .forks_child = 1,
> +};

Hi Richard,

I don't have prior experience with LTP tests, but from reading the
code it looks reasonable to me.

I assume that .needs_tmpdir = 1 ensures that each test runs in its own
new temp dir, which is later removed.

I've stared for a while at "rem / exec_time_start < 0.98" trying to
understand what is that tst_timeout_remaining() returns that we want
to kill that process when the ratio is < 0.98... provided that we
convert 1 to float but not the other var. I failed to come up with the
answer. I have potential answers for "<0.02" and ">0.98". But I assume
you know what you are doing :)

Re tst_res(TINFO, "Timeout; killing reproducer"). Not sure how much it
pollutes output on 3000 tests. If it is, it can make sense to remove
it. Lots of tests run forever, killing it is not something of
particular interest generally.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
