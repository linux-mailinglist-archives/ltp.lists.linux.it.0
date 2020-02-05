Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A9152A31
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 12:48:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 736DE3C264C
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 12:48:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CB0A83C2632
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 12:48:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 208BF1000AC9
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 12:48:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C10DACC6
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 11:48:42 +0000 (UTC)
References: <20200203113956.13176-1-mdoucha@suse.cz>
 <20200203113956.13176-2-mdoucha@suse.cz>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20200203113956.13176-2-mdoucha@suse.cz>
Date: Wed, 05 Feb 2020 12:48:42 +0100
Message-ID: <87pnetgspx.fsf@our.domain.is.not.set>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Fix BPF test program loading issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

This looks like a considerable improvement, but a few comments below.

Martin Doucha <mdoucha@suse.cz> writes:

> BPF programs require locked memory which will be released asynchronously.
> If a BPF program gets loaded too many times too quickly, memory allocation
> may fail due to race condition with asynchronous cleanup.
>
> Wrap the bpf() test calls in a retry loop to fix the issue.
>
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/kernel/syscalls/bpf/Makefile     |  3 +
>  testcases/kernel/syscalls/bpf/bpf_common.c | 89 ++++++++++++++++++++
>  testcases/kernel/syscalls/bpf/bpf_common.h | 42 ++--------
>  testcases/kernel/syscalls/bpf/bpf_prog01.c | 97 +++++++---------------
>  testcases/kernel/syscalls/bpf/bpf_prog02.c | 28 +------
>  testcases/kernel/syscalls/bpf/bpf_prog03.c | 20 ++---
>  6 files changed, 136 insertions(+), 143 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/bpf/bpf_common.c
>
> diff --git a/testcases/kernel/syscalls/bpf/Makefile b/testcases/kernel/syscalls/bpf/Makefile
> index 990c8c83c..2241bce9b 100644
> --- a/testcases/kernel/syscalls/bpf/Makefile
> +++ b/testcases/kernel/syscalls/bpf/Makefile
> @@ -5,6 +5,9 @@ top_srcdir		?= ../../../..
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> +FILTER_OUT_MAKE_TARGETS	:= bpf_common
>  CFLAGS			+= -D_GNU_SOURCE
>  
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> +
> +$(MAKE_TARGETS): %: %.o bpf_common.o
> diff --git a/testcases/kernel/syscalls/bpf/bpf_common.c b/testcases/kernel/syscalls/bpf/bpf_common.c
> new file mode 100644
> index 000000000..8e61b3a74
> --- /dev/null
> +++ b/testcases/kernel/syscalls/bpf/bpf_common.c
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2019-2020 Linux Test Project
> + */
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "lapi/bpf.h"
> +#include "bpf_common.h"
> +
> +void rlimit_bump_memlock(void)
> +{
> +	struct rlimit memlock_r;
> +
> +	SAFE_GETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
> +	memlock_r.rlim_cur += BPF_MEMLOCK_ADD;
> +	tst_res(TINFO, "Raising RLIMIT_MEMLOCK to %ld",
> +		(long)memlock_r.rlim_cur);
> +
> +	if (memlock_r.rlim_cur <= memlock_r.rlim_max) {
> +		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
> +	} else if ((geteuid() == 0)) {
> +		memlock_r.rlim_max += BPF_MEMLOCK_ADD;
> +		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
> +	} else {
> +		tst_res(TINFO, "Can't raise RLIMIT_MEMLOCK, test may fail "
> +			"due to lack of max locked memory");
> +	}
> +}
> +
> +int bpf_map_create(union bpf_attr *attr)
> +{
> +	TST_SPIN_TEST(bpf(BPF_MAP_CREATE, attr, sizeof(*attr)));

We should use exponential backoff on all of these. Unless you have some
reason to think it will cause problems?

> +	if (TST_RET == -1) {
> +		if (TST_ERR == EPERM) {
> +			tst_res(TCONF, "Hint: check also /proc/sys/kernel/unprivileged_bpf_disabled");
> +			tst_brk(TCONF | TTERRNO,
> +				"bpf() requires CAP_SYS_ADMIN on this system");
> +		} else {
> +			tst_brk(TBROK | TTERRNO, "Failed to create array map");
> +		}
> +	}
> +
> +	return TST_RET;
> +}
> +
> +void prepare_bpf_prog_attr(union bpf_attr *attr, const struct
> bpf_insn *prog,

How about just init_bpf_prog_attr?

> +	size_t prog_size, char *log_buf, size_t log_size)
> +{
> +	static struct bpf_insn *buf;
> +	static size_t buf_size;
> +	size_t prog_len = prog_size / sizeof(*prog);
> +
> +	/* all guarded buffers will be free()d automatically by LTP library */
> +	if (!buf || prog_size > buf_size) {
> +		buf = tst_alloc(prog_size);
> +		buf_size = prog_size;
> +	}
> +
> +	memcpy(buf, prog, prog_size);
> +	memset(attr, 0, sizeof(*attr));
> +	attr->prog_type = BPF_PROG_TYPE_SOCKET_FILTER;
> +	attr->insns = ptr_to_u64(buf);
> +	attr->insn_cnt = prog_len;
> +	attr->license = ptr_to_u64("GPL");
> +	attr->log_buf = ptr_to_u64(log_buf);
> +	attr->log_size = log_size;
> +	attr->log_level = 1;
> +}
> +
> +int load_bpf_prog(union bpf_attr *attr, const char *log)

Probably best to always put bpf at the begining so that someone can
simply search "bpf_" to get all the library functions related to that.

> +{
> +	TST_SPIN_TEST(bpf(BPF_PROG_LOAD, attr, sizeof(*attr)));

Same here for exponential backoff.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
