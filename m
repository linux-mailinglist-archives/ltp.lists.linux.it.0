Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1711F4196
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 18:59:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D72EF3C2E5B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 18:59:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A2C473C2E50
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 18:59:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A6F04140111E
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 18:59:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 703D7AD7C;
 Tue,  9 Jun 2020 16:59:26 +0000 (UTC)
Date: Tue, 9 Jun 2020 18:59:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200609165921.GA28805@dell5510>
References: <20200609113421.10936-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609113421.10936-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Wrapper for Syzkaller reproducers
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
Cc: Dmitry Vyukov <dvyukov@google.com>, ltp@lists.linux.it,
 Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

> So this has now being floating in limbo for some time. My preference is to
> merge it to make it easy for users to try out with plenty of time before the
> next LTP release. It shouldn't break anything because it is hidden behind a
> configure switch.
+1

Reviewed-by: Petr Vorel <pvorel@suse.cz>

I plan to test it a bit and appreciate if somebody else also test it,
but I see no problem to include this patchset.

> V3:
> + Updated linux-arts commit (thanks Dmitry and Shuah for updating those!)
> + Fixed AC macro

...
> +ifeq ($(WITH_SYZKALLER_REPROS),yes)
> +
> +# This is mainly due to the -m32 flag, but there could be other problems.
> +ifneq ($(HOST_CPU), x86_64))
nit: I guess, there should not be space, it should be
ifneq ($(HOST_CPU),x86_64))

include/mk/config.mk
HOST_CPU		:= x86_64
=> I thought that the trailing space is omitted.
But working with it => not important.

> +$(error "We currently only support building the Syzkaller reproducers on x86_64")
> +endif
> +
> +# The number of reproducers in each runtest file
> +SYZKALLER_RUNFILES_SIZE ?= 100
> +
> +# Extra arguments to pass to syzwrap. Uncomment the below to add some
> +# sandboxing.
> +# SYZWRAP_ARGS ?= -s
> +
> +# Location where reproducers are installed
> +SYZKALLER_INSTALL_DIR ?= $(abspath $(DESTDIR)/$(prefix)/testcases/bin)
> +
> +# If the reproducers directory is missing then we automatically clone the repo.
> +# We then have to call make recursively to revaluate the targets
> +SYZKALLER_REPROS_DIR ?= $(abs_top_srcdir)/testcases/linux-arts/syzkaller-repros/linux
> +$(SYZKALLER_REPROS_DIR):
> +	git submodule update --init $(abs_top_srcdir)/testcases/linux-arts
> +	$(MAKE) syzkaller_runfiles
> +
> +SYZKALLER_REPROS_SRCS = $(wildcard $(SYZKALLER_REPROS_DIR)/*.c)
> +
> +# Some useful compiler flags for the LTP will cause problems with the
> +# syzkaller repros so the repros have seperate flags
> +SYZKALLER_CFLAGS ?= -pthread
> +SYZKALLER_REPROS = $(subst $(abs_top_srcdir),$(abs_top_builddir),$(SYZKALLER_REPROS_SRCS:.c=))

> +$(SYZKALLER_REPROS): %: %.c
> +	-@if grep -q "__NR_mmap2" $^; then \
> +		M32="-m32"; \
> +	fi; \
> +	$(CC) $(SYZKALLER_CFLAGS) $$M32 $(SYZKALLER_LDFLAGS) $^ -o $@; \
> +	echo $(CC) $(SYZKALLER_CFLAGS) $$M32 $(SYZKALLER_LDFLAGS) $^ -o $@;
nit: it'd be worth to mention 32bit compilation environment.
And I like this Makefile :)

I experimentally enabled it on all intel native builds in my LTP fork travis [1]
and it runs well. Failed only in minimal variant [2] (no surprise).
Fedora required to add glibc-devel.i686, other have support by default.
It failed on ubuntu eon on timeout.
I'd suggest to chose one target where this would be running.
Whole job was prolonged from 2 hrs to 2,75 hrs, but running a single job
wouldn't be that bad.

[1] https://travis-ci.org/github/pevik/ltp/builds/696513565
[2] https://travis-ci.org/github/pevik/ltp/jobs/696513571

> +
> +# Generate the names of the runtest files. This uses Shell arithmetic to
> +# calculate how many runtest files there will be.
> +define SYZKALLER_RUNFILES !=
> +	n=$(words $(SYZKALLER_REPROS));
> +	m=$(SYZKALLER_RUNFILES_SIZE);
> +	i=$$(( $$n / $$m + ($$n % $$m > 0) ));
> +	while test $$i -gt 0;
> +	do
> +		echo $(top_srcdir)/runtest/syzkaller$$i;
> +		i=$$(($$i - 1));
> +	done
> +endef
> +
> +++ b/testcases/kernel/syzkaller-repros/README.md
...
> +## Instructions
> +
> +1. Run `ltp/configure` with `--with-syzkaller-repros`.
nit: I'd omit ltp/ (=> ./configure).

> +2. Build and install the LTP as normal.
> +3. Run one or more of syzkallerN runtest files where N is a number.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
