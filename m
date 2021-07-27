Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F923D76D5
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 15:34:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 457CD3C911E
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Jul 2021 15:34:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7E9FB3C65E9
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 15:34:15 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1C7A1600E55
 for <ltp@lists.linux.it>; Tue, 27 Jul 2021 15:34:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2983C220FA;
 Tue, 27 Jul 2021 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627392853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yF2G6I5C2U159yMHm2ynCn+bV53lko5FVppgbzF8dt8=;
 b=BnxaETpk4phKuaC9bME78PwqqHcOpbUspwSAZwNQzdZwCOWYabpSMyZAGkZN+B1DF/stJe
 LBZzxcewiKvnXO8bYZLdhT/tOCy/CjGjiI8EKWjAUoBt+/qpTFCZ8IW+eHrItZuqhhThQi
 MyI5j2uZUfmVHGFZ7y4aOspLW0Nk9GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627392853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yF2G6I5C2U159yMHm2ynCn+bV53lko5FVppgbzF8dt8=;
 b=vWwXkoFSwtmIrKFtz1F7UiijbjA8LcqjP7ycZPlsBHWd7mgXynQAg82Y8MARqAJbTTujjD
 KWk3HAJYG/9r53DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A91313B77;
 Tue, 27 Jul 2021 13:34:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OfAxAlULAGHxRQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 27 Jul 2021 13:34:13 +0000
Date: Tue, 27 Jul 2021 15:34:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YQALVdEAGOVa+g4H@yuki>
References: <20210726154605.7828-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726154605.7828-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add set_mempolicy05, CVE-2017-7616
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
> --- a/testcases/kernel/syscalls/set_mempolicy/Makefile
> +++ b/testcases/kernel/syscalls/set_mempolicy/Makefile
> @@ -8,4 +8,7 @@ include $(top_srcdir)/include/mk/testcases.mk
>  LDLIBS  += $(NUMA_LIBS)
>  LTPLDLIBS = -lltpnuma
>  
> +set_mempolicy05: LDLIBS=-lltp
> +set_mempolicy05: LTPLDLIBS=

This is rather ugly hack this should be done with:

diff --git a/testcases/kernel/syscalls/set_mempolicy/Makefile b/testcases/kernel/syscalls/set_mempolicy/Makefile
index e6e699808..370a9a85f 100644
--- a/testcases/kernel/syscalls/set_mempolicy/Makefile
+++ b/testcases/kernel/syscalls/set_mempolicy/Makefile
@@ -5,7 +5,9 @@ LTPLIBS = ltpnuma

 include $(top_srcdir)/include/mk/testcases.mk

-LDLIBS  += $(NUMA_LIBS)
-LTPLDLIBS = -lltpnuma
+NEEDS_LIBS=set_mempolicy01 set_mempolicy02 set_mempolicy03 set_mempolicy04
+
+$(NEEDS_LIBS): LDLIBS += $(NUMA_LIBS)
+$(NEEDS_LIBS): LTPLDLIBS = -lltpnuma

 include $(top_srcdir)/include/mk/generic_leaf_target.mk


>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/set_mempolicy/set_mempolicy05.c b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy05.c
> new file mode 100644
> index 000000000..86f6a95dc
> --- /dev/null
> +++ b/testcases/kernel/syscalls/set_mempolicy/set_mempolicy05.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
> + */
> +/*\
> + *
> + * [Description]
> + *
> + * This will reproduce an information leak in the set_mempolicy 32-bit
> + * compat syscall. The catch is that the 32-bit compat syscall is not
> + * used in x86_64 upstream. So at the time of writing, 32-bit programs
> + * on large x86_64 numa systems will be broken if they use
> + * set_mempolicy. OTOH they could not have been exploited either.
> + *
> + * On other architectures the compat syscall is connected. Including
> + * PowerPC which has also been included as well. It is possible some
> + * vendors connected the x86_64 compat call in their kernel branch.
> + *
> + * The kernel allocates memory from the user's stack as a temporary
> + * work area. Allowing it to copy the node array of 32-bit fields to
> + * 64-bit fields. It uses user memory so that it can share the
> + * non-compatability syscall functions which use copy_from_user()
> + * internally.
> + *
> + * Originally the compat call would copy a chunk of the
> + * uninitialized kernel stack to the user stack before checking the
> + * validation result. This meant when the user passed in an invalid
> + * node_mask_ptr. They would get kernel stack data somewhere below
> + * their stack pointer.
> + *
> + * So we allocate and set an array on the stack (larger than any
> + * redzone). Then move the stack pointer to the beginning of the
> + * array. Then move it back after the syscall. We can then check to
> + * see if the array has been modified.
> + */
> +
> +#include "config.h"
> +#include "tst_test.h"
> +
> +#if defined(__i386__) || defined(__powerpc__)
> +
> +#include <string.h>
> +
> +static unsigned int i;
> +static int sys_ret;
> +#ifdef __i386__
> +static const int sys_num = 276;
> +static const int mode;
> +static const int node_mask_ptr = UINT_MAX;
> +static const int node_mask_sz = UINT_MAX;
> +#endif
> +static volatile char *stack_ptr;
> +
> +static void run(void)
> +{
> +#ifdef __powerpc__
> +	register long sys_num __asm__("r0");
> +	register long mode __asm__("r3");
> +	register long node_mask_ptr __asm__("r4");
> +	register long node_mask_sz __asm__("r5");
> +#endif
> +	char stack_pattern[0x400];
> +
> +	stack_ptr = stack_pattern;
> +	memset(stack_pattern, 0xA5, sizeof(stack_pattern));
> +	tst_res(TINFO, "stack pattern is in %p-%p", stack_ptr, stack_ptr + 0x400);
> +
> +#ifdef __powerpc__
> +	sys_num = 261;
> +	mode = 0;
> +	node_mask_ptr = ~0UL;
> +	node_mask_sz = ~0UL;
> +	asm volatile (
> +		"addi 1,1,1024\n\t"
> +		"sc\n\t"
> +		"addi 1,1,-1024\n\t" :
> +		"+r"(sys_num), "+r"(mode), "+r"(node_mask_ptr), "+r"(node_mask_sz) :
> +		:
> +		"memory", "cr0", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
> +	sys_ret = mode;
> +#else /* __i386__ */
> +	asm volatile (
> +		"add $0x400, %%esp\n\t"
> +		"int $0x80\n\t"
> +		"sub $0x400, %%esp\n\t" :
> +		"=a"(sys_ret) :
> +		"a"(sys_num), "b"(mode), "c"(node_mask_ptr), "d"(node_mask_sz) :
> +		"memory");
> +	sys_ret = -sys_ret;
> +#endif

I guess that we are doing this so that a call to a syscall() does not
clobber the stack we have initialized to the pattern. I guess that if
more tests that need this arise we may as well add the magic macros
glibc uses to generate these into lapi/ somewhere...

Also it may make sense to write a more generic test that calls different
syscalls and scans stack for any data leakage, which should be far more
useful than this.

> +	for (i = 0; i < sizeof(stack_pattern); i++) {
> +		if (stack_ptr[i] != (char)0xA5) {
> +			tst_brk(TFAIL,
> +				"User stack was overwritten with something at %d", i);
> +		}
> +	}
> +
> +	switch (sys_ret) {
> +	case EFAULT:
> +		tst_res(TPASS,
> +			"set_mempolicy returned EFAULT (compat assumed)");
> +		break;
> +	case EINVAL:
> +		tst_res(TCONF,
> +			"set_mempolicy returned EINVAL (non compat assumed)");
> +		break;
> +	default:
> +		tst_res(TFAIL,
> +			"set_mempolicy should fail with EFAULT or EINVAL, instead returned %ld",
> +			(long)sys_ret);
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "cf01fb9985e8"},
> +		{"CVE", "CVE-2017-7616"},
> +		{}
> +	}
> +};
> +
> +#else /* #if defined(__x86_64__) || defined(__powerpc__) */
> +
> +TST_TEST_TCONF("not i386 or powerpc");
> +
> +#endif /* #else #if defined(__x86_64__) || defined(__powerpc__) */
> -- 
> 2.31.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
