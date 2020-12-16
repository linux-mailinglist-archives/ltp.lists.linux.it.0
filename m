Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DCF2DC110
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 14:20:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A82463C57EA
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 14:20:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 099DA3C2B2E
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 14:20:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 45AEB1A00F24
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 14:20:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EE30AFF1;
 Wed, 16 Dec 2020 13:20:48 +0000 (UTC)
Date: Wed, 16 Dec 2020 14:21:45 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <X9oJ6U8fPcx7C93u@yuki.lan>
References: <5b2a65fa61ea2eb897a9a79827ad7b5f0a8e61cd.1608115761.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b2a65fa61ea2eb897a9a79827ad7b5f0a8e61cd.1608115761.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls: init_module: Add tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/testcases/kernel/syscalls/init_module/dummy_mod.c b/testcases/kernel/syscalls/init_module/dummy_mod.c
> new file mode 100644
> index 000000000000..7c0b7a06aaa4
> --- /dev/null
> +++ b/testcases/kernel/syscalls/init_module/dummy_mod.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Dummy test module.
> + *
> + * [ALGORITHM]
> + *
> + * The module accepts a single argument named "status" and it fails
> + * initialization if the status is set to "invalid".
> +\*/

This is pointless since the source is not test (does not define the
tst_test structure) it will be ignored by the docparser.

> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/proc_fs.h>
> +#include <linux/kernel.h>
> +
> +static char status[20];
> +module_param_string(status, status, 20, 0444);
> +
> +static int dummy_init(void)
> +{
> +	struct proc_dir_entry *proc_dummy;
> +
> +	if (!strcmp(status, "invalid"))
> +		return -EINVAL;
> +
> +	proc_dummy = proc_mkdir("dummy", 0);
> +	return 0;
> +}
> +module_init(dummy_init);
> +
> +static void dummy_exit(void)
> +{
> +	remove_proc_entry("dummy", 0);
> +}
> +module_exit(dummy_exit);
> +
> +MODULE_LICENSE("GPL");

Also I guess that the module file name should be prefixed by the syscall
name, otherwise it will be overwritten on 'make install' since we
install all test binaries into a single directory.

> diff --git a/testcases/kernel/syscalls/init_module/init_module01.c b/testcases/kernel/syscalls/init_module/init_module01.c
> new file mode 100644
> index 000000000000..9e8b03553a11
> --- /dev/null
> +++ b/testcases/kernel/syscalls/init_module/init_module01.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Basic init_module() tests.
> + *
> + * [ALGORITHM]
> + *
> + * Inserts a simple module after opening and mmaping the module file.
> +\*/
> +
> +#include <errno.h>
> +#include "lapi/init_module.h"
> +#include "old_module.h"

The old headers should not be used in the new library.

So that should be done here is to export the fucntion to a new library
properly by:

Renaming the function the the tst_module.c so that the functions ends
with under score, e.g. tst_module_unload() -> tst_module_unload_().

The old_module.h header will then include static inline functions that
would just pass all the arguments to the functions eg.

static inline void tst_module_unload(void (cleanup_fn)(void), const char *mod_name)
{
	tst_module_unload_(cleanup_fn, mod_name);
}

and the new library will omit the cleanup argument as:

static inline void tst_module_unload(const char *mod_name)
{
	tst_module_unload(NULL, mod_name);
}


Another alternative is to port all the 8 tescases that call the
tst_module* functions and port the tst_module.c to new library as well.


> +#define MODULE_NAME	"dummy_mod.ko"
> +
> +static struct stat sb;
> +static void *buf;
> +
> +static void setup(void)
> +{
> +	int fd;
> +
> +	fd = SAFE_OPEN(MODULE_NAME, O_RDONLY|O_CLOEXEC);
> +	SAFE_FSTAT(fd, &sb);
> +	buf = SAFE_MMAP(0, sb.st_size, PROT_READ|PROT_EXEC, MAP_PRIVATE, fd, 0);
> +	SAFE_CLOSE(fd);
> +}
> +
> +static void run(void)
> +{
> +	TEST(init_module(buf, sb.st_size, "status=valid"));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "init_module() failed for %s",
> +			MODULE_NAME);
> +		return;
> +	}

TST_EXP_PASS() ?

> +	tst_module_unload(NULL, MODULE_NAME);
> +
> +	tst_res(TPASS, "init_module() passed");
> +}
> +
> +static void cleanup(void)
> +{
> +	munmap(buf, sb.st_size);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +};
> diff --git a/testcases/kernel/syscalls/init_module/init_module02.c b/testcases/kernel/syscalls/init_module/init_module02.c
> new file mode 100644
> index 000000000000..d93c5cec856b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/init_module/init_module02.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Basic init_module() failure tests.
> + *
> + * [ALGORITHM]
> + *
> + * Tests various failure scenarios for init_module().
> +\*/
> +
> +#include <linux/capability.h>
> +#include <errno.h>
> +#include "lapi/init_module.h"
> +#include "old_module.h"
> +#include "tst_capability.h"
> +
> +#define MODULE_NAME	"dummy_mod.ko"
> +
> +static unsigned long size, zero_size;
> +static void *buf, *faulty_buf, *null_buf;
> +
> +static struct tst_cap cap_req = TST_CAP(TST_CAP_REQ, CAP_SYS_MODULE);
> +static struct tst_cap cap_drop = TST_CAP(TST_CAP_DROP, CAP_SYS_MODULE);
> +
> +static struct tcase {
> +	const char *name;
> +	void **buf;
> +	unsigned long *size;
> +	const char *param;
> +	int cap;
> +	int exp_errno;
> +} tcases[] = {
> +	{"NULL-buffer", &null_buf, &size, "", 0, EFAULT},
> +	{"faulty-buffer", &faulty_buf, &size, "", 0, EFAULT},
> +	{"null-param", &buf, &size, NULL, 0, EFAULT},
> +	{"zero-size", &buf, &zero_size, "", 0, ENOEXEC},
> +	{"invalid_param", &buf, &size, "status=invalid", 0, EINVAL},
> +	{"no-perm", &buf, &size, "", 1, EPERM},
> +	{"module-exists", &buf, &size, "", 0, EEXIST},
> +};
> +
> +static void setup(void)
> +{
> +	struct stat sb;
> +	int fd;
> +
> +	fd = SAFE_OPEN(MODULE_NAME, O_RDONLY|O_CLOEXEC);
> +	SAFE_FSTAT(fd, &sb);
> +	size = sb.st_size;
> +	buf = SAFE_MMAP(0, size, PROT_READ|PROT_EXEC, MAP_PRIVATE, fd, 0);
> +	SAFE_CLOSE(fd);
> +
> +	faulty_buf = tst_get_bad_addr(NULL);
> +}
> +
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	if (tc->cap)
> +		tst_cap_action(&cap_drop);
> +
> +	TEST(init_module(*tc->buf, *tc->size, tc->param));
> +
> +	/* Insert module twice */
> +	if (tc->exp_errno == EEXIST) {
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL | TTERRNO,
> +				"%s: init_module() failed unexpectedly",
> +				tc->name);
> +			return;
> +		}
> +
> +		TEST(init_module(*tc->buf, *tc->size, tc->param));
> +		tst_module_unload(NULL, MODULE_NAME);
> +	}
> +
> +	if (tc->cap)
> +		tst_cap_action(&cap_req);
> +
> +	if (TST_RET != -1) {
> +		tst_module_unload(NULL, MODULE_NAME);
> +		tst_res(TFAIL, "%s: init_module() passed unexpectedly",
> +			tc->name);
> +		return;
> +	}
> +
> +	if (tc->exp_errno != TST_ERR) {
> +		tst_res(TFAIL | TTERRNO,
> +			"%s: init_module() should fail with %s", tc->name,
> +			tst_strerrno(tc->exp_errno));
> +		return;
> +	}
> +
> +	tst_res(TPASS | TTERRNO, "%s: init_module() failed as expected",
> +		tc->name);
> +}
> +
> +static void cleanup(void)
> +{
> +	munmap(buf, size);
> +}
> +
> +static struct tst_test test = {
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +};
> -- 
> 2.25.0.rc1.19.g042ed3e048af
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
