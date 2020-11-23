Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 977252C0C8F
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 15:05:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E707E3C5EBD
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Nov 2020 15:05:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 675F13C2912
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 15:05:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AA7B21000444
 for <ltp@lists.linux.it>; Mon, 23 Nov 2020 15:05:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E320BABCE;
 Mon, 23 Nov 2020 14:05:39 +0000 (UTC)
Date: Mon, 23 Nov 2020 15:06:30 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20201123140630.GA17077@yuki.lan>
References: <b758999c1bd02a52a68cbb6449bb3d82dd2a4e69.1606120441.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b758999c1bd02a52a68cbb6449bb3d82dd2a4e69.1606120441.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 1/2] syscalls: Add tests for name_to_handle_at()
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
> diff --git a/include/lapi/name_to_handle_at.h b/include/lapi/name_to_handle_at.h
> new file mode 100644
> index 000000000000..19c08545802a
> --- /dev/null
> +++ b/include/lapi/name_to_handle_at.h
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Linaro Limited. All rights reserved.
> + * Author: Viresh Kumar <viresh.kumar@linaro.org>
> + */
> +
> +#ifndef NAME_TO_HANDLE_AT_H__
> +#define NAME_TO_HANDLE_AT_H__
> +
> +#include <sys/syscall.h>
> +#include "config.h"
> +#include "tst_buffers.h"
> +#include "tst_test.h"
> +
> +#ifndef HAVE_NAME_TO_HANDLE_AT
> +struct file_handle {
> +	unsigned int handle_bytes;
> +	int handle_type;
> +	/* File identifier.  */
> +	unsigned char f_handle[0];
> +};
> +
> +int name_to_handle_at(int dfd, const char *pathname, struct file_handle *handle,
> +		      int *mount_id, int flags);
> +int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags);

This still is not complete solution. As far as I can tell this will fail
to link on machine where libc does not implement these, so we have to
make them static inline functions that actually call the tst_syscall().

Eitherway these functions were added to glibc 2.14 which is 2011 which
seems to be old enough, but I'm not sure about musl libc support. Does
anyone have an idea?

> +#endif
> +
> +/* Returns a valid pointer on success, NULL on errors */
> +static inline struct file_handle *
> +allocate_file_handle(int dfd, const char *pathname)
> +{
> +	struct file_handle fh = {}, *fhp;
> +	int mount_id;
> +
> +	/*
> +	 * Make an initial call to name_to_handle_at() to discover the size
> +	 * required for the file handle.
> +	 */
> +	TEST(name_to_handle_at(dfd, pathname, &fh, &mount_id, 0));
> +	if (TST_RET != -1 || TST_ERR != EOVERFLOW) {
> +		tst_res(TFAIL | TTERRNO,
> +			"name_to_handle_at() should fail with EOVERFLOW");
> +		return NULL;
> +	}
> +
> +	/* Valid file handle */
> +	fhp = tst_alloc(sizeof(*fhp) + fh.handle_bytes);
> +	fhp->handle_type = fh.handle_type;
> +	fhp->handle_bytes = fh.handle_bytes;
> +
> +	return fhp;
> +}
> +
> +#endif /* NAME_TO_HANDLE_AT_H__ */
> diff --git a/runtest/syscalls b/runtest/syscalls
> index a5363277f478..65f2e58a87e4 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -846,6 +846,9 @@ nanosleep01 nanosleep01
>  nanosleep02 nanosleep02
>  nanosleep04 nanosleep04
>  
> +name_to_handle_at01 name_to_handle_at01
> +name_to_handle_at02 name_to_handle_at02
> +
>  nftw01 nftw01
>  nftw6401 nftw6401
>  
> diff --git a/testcases/kernel/syscalls/name_to_handle_at/.gitignore b/testcases/kernel/syscalls/name_to_handle_at/.gitignore
> new file mode 100644
> index 000000000000..268a8a34f85e
> --- /dev/null
> +++ b/testcases/kernel/syscalls/name_to_handle_at/.gitignore
> @@ -0,0 +1,2 @@
> +name_to_handle_at01
> +name_to_handle_at02
> diff --git a/testcases/kernel/syscalls/name_to_handle_at/Makefile b/testcases/kernel/syscalls/name_to_handle_at/Makefile
> new file mode 100644
> index 000000000000..18896b6f28c0
> --- /dev/null
> +++ b/testcases/kernel/syscalls/name_to_handle_at/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
> new file mode 100644
> index 000000000000..1213654d108f
> --- /dev/null
> +++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Basic name_to_handle_at() tests.
> + *
> + * [ALGORITHM]
> + *  - Check that EOVERFLOW is returned as expected by name_to_handle_at().
> + *  - Check that we were able to access a file's stat with name_to_handle_at()
> + *    and open_by_handle_at().
> +\*/
> +#define _GNU_SOURCE
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +#include "lapi/name_to_handle_at.h"
> +
> +#define TEST_FILE "test_file"
> +#define TEST_DIR "test_dir"
> +
> +static int dir_fd, fd_atcwd = AT_FDCWD;
> +static struct file_handle *fhp;
> +
> +static struct tcase {
> +	int *dfd;
> +	const char *pathname;
> +	int name_flags;
> +	int flags;
> +} tcases[] = {
> +	{&dir_fd, TEST_FILE, 0, O_RDWR},
> +	{&dir_fd, TEST_FILE, 0, O_RDONLY},
> +	{&dir_fd, TEST_FILE, 0, O_WRONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&dir_fd, "", AT_EMPTY_PATH, O_RDONLY},
> +
> +	{&fd_atcwd, TEST_FILE, 0, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, 0, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, 0, O_WRONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&fd_atcwd, "", AT_EMPTY_PATH, O_RDONLY},

Reading manual we can supposedly pass a dirfd reffering to a file with
AT_EMPTY_PATH, so we may as well add that test here as well.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
