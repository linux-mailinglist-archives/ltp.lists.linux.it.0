Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAAA634D4
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 13:20:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 413DB3C1CF7
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 13:20:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1B25F3C0300
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 13:20:52 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 16144140171F
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 13:20:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 159D0AF25;
 Tue,  9 Jul 2019 11:20:48 +0000 (UTC)
Date: Tue, 9 Jul 2019 13:20:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190709112046.GC4914@rei.lan>
References: <1561356551-2970-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1561356551-2970-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/prctl07.c: New test for prctl() with
 PR_CAP_AMBIENT
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
> Since Linux 4.3, PR_CAP_AMBIENT has been supported. We can read or change
> the ambient capability set of the calling thread by using the following
> option: PR_CAP_AMBIENT_RAISE, PR_CAP_AMBIENT_LOWER,PR_CAP_AMBIENT_IS_SET,
> PR_CAP_AMBIENT_CLEAR_ALL.
> 
> links:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5831905
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=32ae976
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  configure.ac                               |   2 +
>  include/lapi/prctl.h                       |   8 +
>  include/lapi/securebits.h                  |  15 ++
>  runtest/syscalls                           |   1 +
>  testcases/kernel/syscalls/prctl/.gitignore |   1 +
>  testcases/kernel/syscalls/prctl/Makefile   |   2 +
>  testcases/kernel/syscalls/prctl/prctl07.c  | 196 +++++++++++++++++++++
>  7 files changed, 225 insertions(+)
>  create mode 100644 include/lapi/securebits.h
>  create mode 100644 testcases/kernel/syscalls/prctl/prctl07.c
> 
> diff --git a/configure.ac b/configure.ac
> index f78db90ce..cf1e121bd 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -33,6 +33,7 @@ AC_PROG_YACC
>  AC_PREFIX_DEFAULT(/opt/ltp)
>  
>  AC_CHECK_HEADERS([ \
> +    cap-ng.h \
>      ifaddrs.h \
>      keyutils.h \
>      linux/can.h \
> @@ -47,6 +48,7 @@ AC_CHECK_HEADERS([ \
>      linux/module.h \
>      linux/netlink.h \
>      linux/seccomp.h \
> +    linux/securebits.h \
>      linux/userfaultfd.h \
>      mm.h \
>      netinet/sctp.h \
> diff --git a/include/lapi/prctl.h b/include/lapi/prctl.h
> index 54b3da20f..8ee492259 100644
> --- a/include/lapi/prctl.h
> +++ b/include/lapi/prctl.h
> @@ -29,4 +29,12 @@
>  # define PR_GET_NO_NEW_PRIVS 39
>  #endif
>  
> +#ifndef PR_CAP_AMBIENT
> +# define PR_CAP_AMBIENT             47
> +# define PR_CAP_AMBIENT_IS_SET      1
> +# define PR_CAP_AMBIENT_RAISE       2
> +# define PR_CAP_AMBIENT_LOWER       3
> +# define PR_CAP_AMBIENT_CLEAR_ALL   4
> +#endif
> +
>  #endif /* LAPI_PRCTL_H__ */
> diff --git a/include/lapi/securebits.h b/include/lapi/securebits.h
> new file mode 100644
> index 000000000..9c9216e13
> --- /dev/null
> +++ b/include/lapi/securebits.h
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +#ifndef LAPI_SECUREBITS_H
> +#define LAPI_SECUREBITS_H
> +
> +# ifdef HAVE_LINUX_SECUREBITS_H
> +#  include <linux/securebits.h>
> +# endif /* HAVE_LINUX_SECUREBITS_H*/
> +# ifndef SECBIT_NO_CAP_AMBIENT_RAISE
> +#  define SECBIT_NO_CAP_AMBIENT_RAISE  6
> +# endif
> +#endif /* LAPI_SECUREBITS_H */
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 742739c2c..4a03c5818 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -868,6 +868,7 @@ prctl03 prctl03
>  prctl04 prctl04
>  prctl05 prctl05
>  prctl06 prctl06
> +prctl07 prctl07
>  
>  pread01 pread01
>  pread01_64 pread01_64
> diff --git a/testcases/kernel/syscalls/prctl/.gitignore b/testcases/kernel/syscalls/prctl/.gitignore
> index f52f6f665..b913d1798 100644
> --- a/testcases/kernel/syscalls/prctl/.gitignore
> +++ b/testcases/kernel/syscalls/prctl/.gitignore
> @@ -4,3 +4,4 @@
>  /prctl04
>  /prctl05
>  /prctl06
> +/prctl07
> diff --git a/testcases/kernel/syscalls/prctl/Makefile b/testcases/kernel/syscalls/prctl/Makefile
> index bd617d806..6bb839a7d 100644
> --- a/testcases/kernel/syscalls/prctl/Makefile
> +++ b/testcases/kernel/syscalls/prctl/Makefile
> @@ -20,4 +20,6 @@ top_srcdir		?= ../../../..
>  
>  include $(top_srcdir)/include/mk/testcases.mk
>  
> +LDLIBS			+= -lcap-ng

This will break the compilation without the cap-ng library, we have to
check for the presence in the configure script.

See for example m4/ltp-cap.m4 where we define a variable that is then
used Makefiles e.g. in syscalls/pivot_root/Makefile.

Also LTP depends on libcap already, so maybe it would be better to use
the libcap instead of cap-ng in order to keep the number of libraries we
depend on as small as possible.

>  include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/prctl/prctl07.c b/testcases/kernel/syscalls/prctl/prctl07.c
> new file mode 100644
> index 000000000..a7c8596a3
> --- /dev/null
> +++ b/testcases/kernel/syscalls/prctl/prctl07.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * Test the PR_CAP_AMBIENT of prctl(2).
> + * Reads or changes the ambient capability set of the calling thread,
> + * according to the value of arg2, which must be one of the following:
> + * 1)PR_CAP_AMBIENT_RAISE:
> + * The capability specified in arg3 is added to the ambient set.
> + * The specified capability must already be present in both pE and pI.
> + * If we set SECBIT_NO_CAP_AMBIENT_RAISE bit, raise option will be rejected
> + * and retrun EPERM. We also raise a CAP twice.
> + * 2)PR_CAP_AMBIENT_LOWER:
> + * The capability specified in arg3 is removed from the ambient set.
> + * Even though this cap is not in set, it also should return 0.
> + * 3)PR_CAP_AMBIENT_IS_SET:
> + * Returns 1 if the capability in arg3 is in the ambient set and 0 if it
> + * is not.
> + * 4)PR_CAP_AMBIENT_CLEAR_ALL:
> + * All capabilities will be removed from the ambient set. This operation
> + * requires setting arg3 to zero.
> + */
> +
> +#include <sys/prctl.h>
> +#include <string.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/capability.h>
> +#include <linux/capability.h>
> +#include "config.h"
> +#if HAVE_CAP_NG_H
> +#include <cap-ng.h>
> +#endif
> +#include "lapi/syscalls.h"
> +#include "lapi/prctl.h"
> +#include "lapi/securebits.h"
> +#include "tst_test.h"
> +
> +#if HAVE_CAP_NG_H
> +static void check_proc_capamb(char *message, char *path, int flag)
> +{
> +	unsigned int cap_num;
> +	char CapAmb[20];
> +
> +	SAFE_FILE_LINES_SCANF(path, "CapAmb:%s", CapAmb);
> +	cap_num = atoi(CapAmb);
> +	if (flag == 2) {
> +		if (cap_num == 0)
> +			tst_res(TPASS,
> +				"%s, %s CapAmb has been clear as %d",
> +				message, path, cap_num);
> +		else
> +			tst_res(TFAIL,
> +				"%s, %s CapAmb has been clear expect 0, got %d",
> +				message, path, cap_num);
> +		return;
> +	}
> +
> +	if (cap_num ==  400)
> +		tst_res(flag ? TPASS : TFAIL,
> +			"%s, CapAmb in %s has CAP_NET_BIND_SERVICE",
> +			message, path);
> +	else
> +		tst_res(flag ? TFAIL : TPASS,
> +			"%s, CapAmb in %s doesn't have CAP_NET_BIND_SERVICE",
> +			message, path);
> +}
> +
> +static void check_cap_raise(unsigned int cap, char *message, int fail_flag)
> +{
> +	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, cap, 0, 0, 0));
> +	switch (fail_flag) {
> +	case 0:
> +	if (TST_RET == 0)
> +		tst_res(TPASS, "PR_CAP_AMBIENT_RAISE %s succeeded", message);
> +	else
> +		tst_res(TFAIL, "PR_CAP_AMBIENT_RAISE %s failed unexpectedly",
> +			message);
> +	break;
> +	case 1:
> +	if (TST_RET == 0)
> +		tst_res(TFAIL,
> +			"PR_CAP_AMBIENT_RAISE succeeded unexpectedly %s",
> +			message);
> +	else if (TST_ERR == EPERM)
> +		tst_res(TPASS,
> +			"PR_CAP_AMBIENT_RAISE failed with EPERM %s", message);
> +	else
> +		tst_res(TFAIL | TERRNO,
> +			"PR_CAP_AMBIENT_RAISE failed %s", message);
> +	break;
> +	}
> +}
> +
> +static void check_cap_is_set(unsigned int cap, char *message, int val)
> +{
> +	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_IS_SET, cap, 0, 0, 0));
> +	if (TST_RET == 1)
> +		tst_res(val ? TPASS : TFAIL,
> +			"PR_CAP_AMBIENT_IS_SET %s in AmbientCap", message);
> +	else if (TST_RET == 0)
> +		tst_res(val ? TFAIL : TPASS,
> +			"PR_CAP_AMBIENT_IS_SET %s not in AmbientCap", message);
> +	else
> +		tst_res(TFAIL | TERRNO, "PR_CAP_AMBIENT_IS_SET failed");
> +}
> +
> +static void check_cap_lower(unsigned int cap, char *message)
> +{
> +	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_LOWER, cap, 0, 0, 0));
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TERRNO,
> +			"PR_CAP_AMBIENT_LOWER %s failed", message);
> +	else
> +		tst_res(TPASS, "PR_CAP_AMBIENT_LOWER %s succeeded", message);
> +}
> +#endif
> +
> +static void verify_prctl(void)
> +{
> +#if HAVE_CAP_NG_H
> +	pid_t pid;
> +	char path[50];
> +
> +	pid = getpid();
> +	sprintf(path, "/proc/%d/status", pid);
			^
                       Why not just /proc/self/status ?

> +	check_proc_capamb("At the beginning", path, 0);
> +
> +	capng_get_caps_process();
> +	capng_update(CAPNG_DROP, CAPNG_INHERITABLE, CAP_NET_BIND_SERVICE);
> +	if (capng_apply(CAPNG_SELECT_CAPS) != 0)
> +		return;

> +	check_cap_raise(CAP_NET_BIND_SERVICE, "on non-inheritable cap", 1);
> +
> +	capng_update(CAPNG_ADD, CAPNG_INHERITABLE, CAP_NET_RAW);
> +	capng_update(CAPNG_DROP, CAPNG_PERMITTED, CAP_NET_RAW);
> +	capng_update(CAPNG_DROP, CAPNG_EFFECTIVE, CAP_NET_RAW);
> +	if (capng_apply(CAPNG_SELECT_CAPS) != 0)
> +		return;
> +	check_cap_raise(CAP_NET_RAW, "on non-permitted cap", 1);
> +
> +	capng_update(CAPNG_ADD, CAPNG_INHERITABLE, CAP_NET_BIND_SERVICE);
> +	if (capng_apply(CAPNG_SELECT_CAPS) != 0)
> +		return;
> +	prctl(PR_SET_SECUREBITS, SECBIT_NO_CAP_AMBIENT_RAISE);
> +	check_cap_raise(CAP_NET_BIND_SERVICE, "because of NO_RAISE_SECBIT set", 1);
> +	prctl(PR_SET_SECUREBITS, 0);
> +
> +	check_cap_raise(CAP_NET_BIND_SERVICE, "CAP_NET_BIND_SERVICE", 0);
> +	/*Even this cap has been in ambient set, raise succeeds and return 0*/
> +	check_cap_raise(CAP_NET_BIND_SERVICE, "CAP_NET_BIND_SERIVCE twice", 0);
> +
> +	check_proc_capamb("After PR_CAP_AMBIENT_RAISE", path, 1);
> +
> +	check_cap_is_set(CAP_NET_BIND_SERVICE, "CAP_NET_BIND_SERVICE was", 1);
> +	check_cap_is_set(CAP_NET_RAW, "CAP_NET_RAW was", 0);
> +	/*move a cap what was not in ambient set, it also return 0*/
> +	check_cap_lower(CAP_NET_RAW, "CAP_NET_RAW(it wasn't in ambient set)");
> +	check_cap_lower(CAP_NET_BIND_SERVICE, "CAP_NET_BIND_SERVICE(it was in ambient set)");
> +	check_proc_capamb("After PR_CAP_AMBIENT_LORWER", path, 0);
> +
> +	prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_RAISE, CAP_NET_BIND_SERVICE, 0, 0, 0);
> +	tst_res(TINFO, "raise cap for clear");
> +	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0, 0));
> +	if (TST_RET == 0)
> +		tst_res(TPASS, "PR_CAP_AMBIENT_CLEAR ALL succeeded");
> +	else
> +		tst_res(TFAIL | TERRNO, "PR_AMBIENT_CLEAR_ALL failed");
> +
> +	check_proc_capamb("After PR_CAP_AMBIENT_CLEAN_ALL", path, 2);
> +#else
> +	tst_res(TCONF, "system doesn't have cap-ng library");
> +#endif
> +}
> +
> +static void setup(void)
> +{
> +	TEST(prctl(PR_CAP_AMBIENT, PR_CAP_AMBIENT_CLEAR_ALL, 0, 0, 0, 0));
> +	if (TST_RET == 0) {
> +		tst_res(TINFO, "kernel supports PR_CAP_AMBIENT");
> +		return;
> +	}
> +
> +	if (TST_ERR == EINVAL)
> +		tst_brk(TCONF, "kernel doesn't support PR_CAP_AMBIENT");
> +
> +	tst_brk(TBROK | TERRNO,
> +		"current environment doesn't permit PR_CAP_AMBIENT");
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test_all = verify_prctl,
> +	.needs_root = 1,
> +};
> -- 
> 2.18.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
