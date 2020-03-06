Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD617C0D0
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 15:46:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4FC3A3C63E5
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 15:46:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 7C3933C1A4E
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 15:46:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C462E1007EA9
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 15:46:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E092FADAD;
 Fri,  6 Mar 2020 14:46:03 +0000 (UTC)
Date: Fri, 6 Mar 2020 15:46:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200306144603.GA31015@rei.lan>
References: <6b3d4c2c92b4a4e6eeef708ac181b57cf7affda4.1583233870.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b3d4c2c92b4a4e6eeef708ac181b57cf7affda4.1583233870.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls/openat2: New tests
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
> +void openat2_supported_by_kernel(void)
> +{
> +	if ((tst_kvercmp(5, 6, 0)) < 0) {
> +		/* Check if the syscall is backported on an older kernel */
> +		TEST(syscall(__NR_openat2, -1, NULL, NULL, 0));
> +		if (TST_RET == -1 && TST_ERR == ENOSYS)
> +			tst_brk(TCONF, "Test not supported on kernel version < v5.2");

The test is for 5.6 but the message says 5.2, so which one is correct?

> +	}
> +}
> +
> +#endif /* OPENAT2_H */
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 14df8d34338e..6a571408b005 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -845,6 +845,10 @@ openat01 openat01
>  openat02 openat02
>  openat03 openat03
>  
> +openat201 openat201
> +openat202 openat202
> +openat203 openat203
> +
>  open_tree01 open_tree01
>  open_tree02 open_tree02
>  
> diff --git a/testcases/kernel/syscalls/openat2/.gitignore b/testcases/kernel/syscalls/openat2/.gitignore
> new file mode 100644
> index 000000000000..5a0843a85229
> --- /dev/null
> +++ b/testcases/kernel/syscalls/openat2/.gitignore
> @@ -0,0 +1,3 @@
> +openat201
> +openat202
> +openat203
> diff --git a/testcases/kernel/syscalls/openat2/Makefile b/testcases/kernel/syscalls/openat2/Makefile
> new file mode 100644
> index 000000000000..18896b6f28c0
> --- /dev/null
> +++ b/testcases/kernel/syscalls/openat2/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/openat2/openat201.c b/testcases/kernel/syscalls/openat2/openat201.c
> new file mode 100644
> index 000000000000..e2c2456769f4
> --- /dev/null
> +++ b/testcases/kernel/syscalls/openat2/openat201.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Basic openat2() test.
> + */
> +#include "tst_test.h"
> +#include "lapi/openat2.h"
> +
> +#define TEST_FILE "test_file"
> +#define TEST_DIR "test_dir"
> +
> +static struct open_how *how;
> +static struct open_how_pad *phow;
> +
> +static int dir_fd = -1, fd_atcwd = AT_FDCWD;
> +
> +static struct tcase {
> +	int *dfd;
> +	const char *pathname;
> +	uint64_t flags;
> +	uint64_t mode;
> +	uint64_t resolve;
> +	struct open_how **how;
> +	size_t size;
> +} tcases[] = {
> +	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, 0, &how, sizeof(*how)},
> +	{&dir_fd, TEST_FILE, O_RDONLY, S_IRUSR, 0, &how, sizeof(*how)},
> +	{&dir_fd, TEST_FILE, O_WRONLY, S_IWUSR, 0, &how, sizeof(*how)},
> +	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_XDEV, &how, sizeof(*how)},
> +	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_MAGICLINKS, &how, sizeof(*how)},
> +	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_SYMLINKS, &how, sizeof(*how)},
> +	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_BENEATH, &how, sizeof(*how)},
> +	{&dir_fd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_IN_ROOT, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, 0, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_RDONLY, S_IRUSR, 0, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_WRONLY, S_IWUSR, 0, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_XDEV, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_MAGICLINKS, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_NO_SYMLINKS, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_BENEATH, &how, sizeof(*how)},
> +	{&fd_atcwd, TEST_FILE, O_RDWR, S_IRWXU, RESOLVE_IN_ROOT, (struct open_how **)&phow, sizeof(*how) + 1},
                                                                                                         ^
								since the padd is 64bit this should be + 8
> +};
> +
> +static void cleanup(void)
> +{
> +	if (dir_fd != -1)
> +		SAFE_CLOSE(dir_fd);
> +}
> +
> +static void setup(void)
> +{
> +	openat2_supported_by_kernel();
> +
> +	phow->pad = 0x00;
> +	SAFE_MKDIR(TEST_DIR, 0700);
> +	dir_fd = SAFE_OPEN(TEST_DIR, O_DIRECTORY);
> +}
> +
> +static void run(unsigned int n)
> +{
> +	int fd;
> +	struct stat file_stat;
> +	struct tcase *tc = &tcases[n];
> +	struct open_how *myhow = *tc->how;
> +
> +	myhow->flags = tc->flags | O_CREAT;
> +	myhow->mode = tc->mode;
> +	myhow->resolve = tc->resolve;
> +
> +	TEST(fd = openat2(*tc->dfd, tc->pathname, myhow, tc->size));
> +	if (fd < 0) {
> +		tst_res(TFAIL | TTERRNO, "openat2() failed (%d)", n);
> +		return;
> +	}
> +
> +	SAFE_FSTAT(fd, &file_stat);
> +
> +	if (file_stat.st_size == 0)
> +		tst_res(TPASS, "openat2() passed (%d)", n);
> +	else
> +		tst_res(TFAIL, "fstat() didn't work as expected (%d)", n);
> +
> +	SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +	.bufs = (struct tst_buffers []) {
> +		{&how, .size = sizeof(*how)},
> +		{&phow, .size = sizeof(*phow)},
> +		{},
> +	},
> +};
> diff --git a/testcases/kernel/syscalls/openat2/openat202.c b/testcases/kernel/syscalls/openat2/openat202.c
> new file mode 100644
> index 000000000000..504878277f7e
> --- /dev/null
> +++ b/testcases/kernel/syscalls/openat2/openat202.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * openat2() tests with various resolve flags.
> + */
> +#include "tst_test.h"
> +#include "lapi/openat2.h"
> +
> +#define FOO_SYMLINK "foo_symlink"
> +
> +static struct open_how *how;
> +
> +static struct tcase {
> +	const char *name;
> +	const char *pathname;
> +	uint64_t resolve;
> +	int exp_errno;
> +} tcases[] = {
> +	/* Success cases */
> +	{"open /proc/version", "/proc/version", 0, 0},
> +	{"open magiclinks", "/proc/self/exe", 0, 0},
> +	{"open symlinks", FOO_SYMLINK, 0, 0},

Wouldn't it be easier if we added these to the first test and keep this
one failures only?

> +	/* Failure cases */
> +	{"resolve-no-xdev", "/proc/version", RESOLVE_NO_XDEV, EXDEV},
> +	{"resolve-no-magiclinks", "/proc/self/exe", RESOLVE_NO_MAGICLINKS, ELOOP},
> +	{"resolve-no-symlinks", FOO_SYMLINK, RESOLVE_NO_SYMLINKS, ELOOP},
> +	{"resolve-beneath", "/proc/version", RESOLVE_BENEATH, EXDEV},
> +	{"resolve-no-in-root", "/proc/version", RESOLVE_IN_ROOT, ENOENT},

I guess that given that we can also add "..", RESOLVE_BENEATH case as
well, since .. would escape the AT_FDCWD, right?

> +};
> +
> +static void setup(void)
> +{
> +	openat2_supported_by_kernel();
> +	SAFE_SYMLINK("/proc/version", FOO_SYMLINK);
> +}
> +
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	how->flags = O_RDONLY | O_CREAT;
> +	how->mode = S_IRUSR;
> +	how->resolve = tc->resolve;
> +
> +	TEST(openat2(AT_FDCWD, tc->pathname, how, sizeof(*how)));
> +
> +	if (!tc->exp_errno) {
> +		if (TST_RET < 0) {
> +			tst_res(TFAIL | TTERRNO, "%s: openat2() failed",
> +				tc->name);
> +			return;
> +		}
> +
> +		SAFE_CLOSE(TST_RET);
> +		tst_res(TPASS, "%s: openat2() passed", tc->name);
> +	} else {
> +		if (TST_RET >= 0) {
> +			SAFE_CLOSE(TST_RET);
> +			tst_res(TFAIL, "%s: openat2() passed unexpectedly",
> +				tc->name);
> +			return;
> +		}
> +
> +		if (tc->exp_errno != TST_ERR) {
> +			tst_res(TFAIL | TTERRNO, "%s: openat2() should fail with %s",
> +				tc->name, tst_strerrno(tc->exp_errno));
> +			return;
> +		}
> +
> +		tst_res(TPASS | TTERRNO, "%s: openat2() failed as expected",
> +			tc->name);
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +	.needs_tmpdir = 1,
> +	.bufs = (struct tst_buffers []) {
> +		{&how, .size = sizeof(*how)},
> +		{},
> +	}
> +};
> diff --git a/testcases/kernel/syscalls/openat2/openat203.c b/testcases/kernel/syscalls/openat2/openat203.c
> new file mode 100644
> index 000000000000..64a109644352
> --- /dev/null
> +++ b/testcases/kernel/syscalls/openat2/openat203.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Basic openat2() test to check various failures.
> + */
> +#include "tst_test.h"
> +#include "lapi/openat2.h"
> +
> +#define TEST_FILE "test_file"
> +
> +static struct open_how *how;
> +static struct open_how_pad *phow;
> +
> +static struct tcase {
> +	const char *name;
> +	int dfd;
> +	const char *pathname;
> +	uint64_t flags;
> +	uint64_t mode;
> +	uint64_t resolve;
> +	struct open_how **how;
> +	size_t size;
> +	int exp_errno;
> +} tcases[] = {
> +	{"invalid-dfd", -1, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how), EBADF},
> +	{"invalid-pathname", AT_FDCWD, NULL, O_RDONLY | O_CREAT, S_IRUSR, 0, &how, sizeof(*how), EFAULT},
> +	{"invalid-flags", AT_FDCWD, TEST_FILE, O_RDONLY, S_IWUSR, 0, &how, sizeof(*how), EINVAL},
> +	{"invalid-mode", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, -1, 0, &how, sizeof(*how), EINVAL},
> +	{"invalid-resolve", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, -1, &how, sizeof(*how), EINVAL},
> +	{"invalid-size-zero", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, 0, EINVAL},
> +	{"invalid-size-small", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how) - 1, EINVAL},
> +	{"invalid-size-big", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how) + 1, EFAULT},
> +	{"invalid-size-big-with-pad", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, (struct open_how **)&phow, sizeof(*how) + 1, E2BIG},

Here as well +8.

> +};
> +
> +static void setup(void)
> +{
> +	openat2_supported_by_kernel();
> +	phow->pad = 0xDEAD;
> +}
> +
> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +	struct open_how *myhow = *tc->how;
> +
> +	myhow->flags = tc->flags;
> +	myhow->mode = tc->mode;
> +	myhow->resolve = tc->resolve;
> +
> +	TEST(openat2(tc->dfd, tc->pathname, myhow, tc->size));
> +
> +	if (TST_RET >= 0) {
> +		SAFE_CLOSE(TST_RET);
> +		tst_res(TFAIL, "%s: openat2() passed unexpectedly",
> +			tc->name);
> +		return;
> +	}
> +
> +	if (tc->exp_errno != TST_ERR) {
> +		tst_res(TFAIL | TTERRNO, "%s: openat2() should fail with %s",
> +			tc->name, tst_strerrno(tc->exp_errno));
> +		return;
> +	}
> +
> +	tst_res(TPASS | TTERRNO, "%s: openat2() failed as expected", tc->name);
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +	.needs_tmpdir = 1,
> +	.bufs = (struct tst_buffers []) {
> +		{&how, .size = sizeof(*how)},
> +		{&phow, .size = sizeof(*phow)},
> +		{},
> +	}
> +};

Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
