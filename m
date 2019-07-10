Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9818637DD
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 16:24:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D7943C1CF8
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jul 2019 16:24:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 64AB23C07AD
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 16:24:33 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 738661A009A3
 for <ltp@lists.linux.it>; Tue,  9 Jul 2019 16:24:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F90AACA7;
 Tue,  9 Jul 2019 14:24:28 +0000 (UTC)
Date: Tue, 9 Jul 2019 16:24:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190709142426.GA6920@rei.lan>
References: <20190701081917.32051-1-liwang@redhat.com>
 <20190701081917.32051-2-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701081917.32051-2-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/2] pkey: add test for memory protection keys
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
Looks good, some minor comments below.

> Memory Protection Keys for Userspace (PKU aka PKEYs) is a Skylake-SP
> server feature that provides a mechanism for enforcing page-based
> protections, but without requiring modification of the page tables
> when an application changes protection domains. It works by dedicating
> 4 previously ignored bits in each page table entry to a "protection key",
> giving 16 possible keys.
> 
> Basic method for PKEYs test:
>   1. test allocates a pkey(e.g. PKEY_DISABLE_ACCESS) via pkey_alloc()
>   2. pkey_mprotect() apply this pkey to a piece of memory buffer
>   3. check if the access right of buffer has been changed and take effect
>   4. remove the access right(pkey) from this buffer via pkey_mprotect()
>   5. check if buffer area can be read or write after removing pkey
>   6. pkey_free() releases the pkey after using it
> 
> Looping around this basic test on diffenrent types of memory.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
> 
> Notes:
>     v4 --> v5
>       * use "/sys/kernel/mm/hugepages/" for huge page detection
> 
>  configure.ac                               |   1 +
>  runtest/syscalls                           |   2 +
>  testcases/kernel/syscalls/pkeys/.gitignore |   1 +
>  testcases/kernel/syscalls/pkeys/Makefile   |   8 +
>  testcases/kernel/syscalls/pkeys/pkey.h     |  50 ++++
>  testcases/kernel/syscalls/pkeys/pkey01.c   | 263 +++++++++++++++++++++
>  6 files changed, 325 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/pkeys/.gitignore
>  create mode 100644 testcases/kernel/syscalls/pkeys/Makefile
>  create mode 100644 testcases/kernel/syscalls/pkeys/pkey.h
>  create mode 100644 testcases/kernel/syscalls/pkeys/pkey01.c
> 
> diff --git a/configure.ac b/configure.ac
> index 65fc2a232..5a9b74b0a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -74,6 +74,7 @@ AC_CHECK_FUNCS([ \
>      pidfd_send_signal \
>      preadv \
>      preadv2 \
> +    pkey_mprotect \
>      profil \
>      pwritev \
>      pwritev2 \
> diff --git a/runtest/syscalls b/runtest/syscalls
> index c6a064481..6ea991f12 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -721,6 +721,8 @@ mprotect02 mprotect02
>  mprotect03 mprotect03
>  mprotect04 mprotect04
>  
> +pkey01 pkey01
> +
>  mq_notify01 mq_notify01
>  mq_notify02 mq_notify02
>  mq_open01 mq_open01
> diff --git a/testcases/kernel/syscalls/pkeys/.gitignore b/testcases/kernel/syscalls/pkeys/.gitignore
> new file mode 100644
> index 000000000..6fd5addb8
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pkeys/.gitignore
> @@ -0,0 +1 @@
> +/pkey01
> diff --git a/testcases/kernel/syscalls/pkeys/Makefile b/testcases/kernel/syscalls/pkeys/Makefile
> new file mode 100644
> index 000000000..9ee2c2ea5
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pkeys/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2019 Red Hat, Inc.
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/syscalls/pkeys/pkey.h b/testcases/kernel/syscalls/pkeys/pkey.h
> new file mode 100644
> index 000000000..d623244eb
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pkeys/pkey.h
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Red Hat, Inc.
> + */
> +
> +#ifndef PKEYS_H
> +#define PKEYS_H
> +
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
> +
> +#ifndef PKEY_DISABLE_ACCESS
> +# define PKEY_DISABLE_ACCESS 0x1
> +# define PKEY_DISABLE_WRITE  0x2
> +#endif
> +
> +#ifndef HAVE_PKEY_MPROTECT
> +static inline int pkey_mprotect(void *addr, size_t len, int prot, int pkey)
> +{
> +	return tst_syscall(__NR_pkey_mprotect, addr, len, prot, pkey);
> +}
> +
> +static inline int pkey_alloc(unsigned int flags, unsigned int access_rights)
> +{
> +	return tst_syscall(__NR_pkey_alloc, flags, access_rights);
> +}
> +
> +static inline int pkey_free(int pkey)
> +{
> +	return tst_syscall(__NR_pkey_free, pkey);
> +}
> +#endif /* HAVE_PKEY_MPROTECT */
> +
> +static inline void check_pkey_support(void)
> +{
> +	int pkey = pkey_alloc(0, 0);
> +
> +	if (pkey == -1) {
> +		if (errno == ENOSYS)
> +			tst_brk(TCONF, "pkey_alloc is not implemented");
> +		if (errno == EINVAL)
> +			tst_brk(TCONF, "pku is not supported on this CPU");
> +		if (errno == ENOSPC)
> +			tst_brk(TCONF, "pkeys are not available for test");
> +	}
> +
> +	pkey_free(pkey);
> +}
> +
> +#endif /* PKEYS_H */
> diff --git a/testcases/kernel/syscalls/pkeys/pkey01.c b/testcases/kernel/syscalls/pkeys/pkey01.c
> new file mode 100644
> index 000000000..3b1e60ce6
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pkeys/pkey01.c
> @@ -0,0 +1,263 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 Red Hat, Inc.
> + *
> + * Memory Protection Keys for Userspace (PKU aka PKEYs) is a Skylake-SP
> + * server feature that provides a mechanism for enforcing page-based
> + * protections, but without requiring modification of the page tables
> + * when an application changes protection domains. It works by dedicating
> + * 4 previously ignored bits in each page table entry to a "protection key",
> + * giving 16 possible keys.
> + *
> + * Basic method for PKEYs testing:
> + *    1. test allocates a pkey(e.g. PKEY_DISABLE_ACCESS) via pkey_alloc()
> + *    2. pkey_mprotect() apply this pkey to a piece of memory(buffer)
> + *    3. check if access right of the buffer has been changed and take effect
> + *    4. remove the access right(pkey) from this buffer via pkey_mprotect()
> + *    5. check if buffer area can be read or write after removing pkey
> + *    6. pkey_free() releases the pkey after using it
> + *
> + * Looping around this basic test on diffenrent types of memory.
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <stdlib.h>
> +#include <sys/syscall.h>
> +#include <sys/mman.h>
> +#include <sys/wait.h>
> +
> +#include "pkey.h"
> +
> +#define TMP_DIR "tmp_pkey"
> +#define TEST_FILE TMP_DIR"/testfile"
> +#define STR "abcdefghijklmnopqrstuvwxyz12345\n"
> +#define PATH_VM_NRHPS "/proc/sys/vm/nr_hugepages"
> +
> +static int size;
> +static int no_hugepage;
> +
> +static const char * const save_restore[] = {
> +	"?/proc/sys/vm/nr_hugepages",
> +	NULL,
> +};
> +
> +static struct tcase {
> +	unsigned long flags;
> +	unsigned long access_rights;
> +	char *name;
> +} tcases[] = {
> +	{0, PKEY_DISABLE_ACCESS, "PKEY_DISABLE_ACCESS"},
> +	{0, PKEY_DISABLE_WRITE, "PKEY_DISABLE_WRITE"},
> +};
> +
> +static void setup(void)
> +{
> +	int i, fd;
> +
> +	if (access("/sys/kernel/mm/hugepages/", F_OK)) {
> +		tst_res(TINFO, "Huge page is not supported");
> +		size = getpagesize();
> +		no_hugepage = 1;
> +	} else {
> +		int val;
> +		SAFE_FILE_PRINTF(PATH_VM_NRHPS, "%d", 1);
> +		SAFE_FILE_SCANF(PATH_VM_NRHPS, "%d", &val);
> +		if (val != 1)
> +			tst_brk(TBROK, "nr_hugepages = %d, but expect %d",
> +					val, 1);
> +		size = SAFE_READ_MEMINFO("Hugepagesize:") * 1024;
> +	}
> +
> +	SAFE_MKDIR(TMP_DIR, 0664);
> +	SAFE_MOUNT(TMP_DIR, TMP_DIR, "tmpfs", 0, NULL);
> +
> +	check_pkey_support();
> +
> +	fd = SAFE_OPEN(TEST_FILE, O_RDWR | O_CREAT, 0664);
> +	for (i = 0; i < 128; i++)
> +		SAFE_WRITE(1, fd, STR, strlen(STR));
> +
> +	SAFE_CLOSE(fd);
> +}
> +
> +static void cleanup(void)
> +{
> +	SAFE_UMOUNT(TMP_DIR);
> +	SAFE_RMDIR(TMP_DIR);

No need for the RMDIR here.

> +}
> +
> +static struct mmap_param {
> +	int prot;
> +	int flags;
> +	int fd;
> +} mmap_params[] = {
> +	{PROT_READ,  MAP_ANONYMOUS | MAP_PRIVATE, -1},
> +	{PROT_READ,  MAP_ANONYMOUS | MAP_SHARED, -1},
> +	{PROT_READ,  MAP_ANONYMOUS | MAP_PRIVATE | MAP_HUGETLB, -1},
> +	{PROT_READ,  MAP_ANONYMOUS | MAP_SHARED  | MAP_HUGETLB, -1},
> +	{PROT_READ,  MAP_PRIVATE, 0},
> +	{PROT_READ,  MAP_SHARED, 0},
> +
> +	{PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, -1},
> +	{PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED, -1},
> +	{PROT_WRITE, MAP_PRIVATE, 0},
> +	{PROT_WRITE, MAP_SHARED, 0},
> +	{PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE | MAP_HUGETLB, -1},
> +	{PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED  | MAP_HUGETLB, -1},
> +
> +	{PROT_EXEC,  MAP_ANONYMOUS | MAP_PRIVATE, -1},
> +	{PROT_EXEC,  MAP_ANONYMOUS | MAP_SHARED, -1},
> +	{PROT_EXEC,  MAP_ANONYMOUS | MAP_PRIVATE | MAP_HUGETLB, -1},
> +	{PROT_EXEC,  MAP_ANONYMOUS | MAP_SHARED  | MAP_HUGETLB, -1},
> +	{PROT_EXEC,  MAP_PRIVATE, 0},
> +	{PROT_EXEC,  MAP_SHARED, 0},
> +
> +	{PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE, -1},
> +	{PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED, -1},
> +	{PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_PRIVATE | MAP_HUGETLB, -1},
> +	{PROT_READ | PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED  | MAP_HUGETLB, -1},
> +	{PROT_READ | PROT_WRITE, MAP_PRIVATE, 0},
> +	{PROT_READ | PROT_WRITE, MAP_SHARED, 0},
> +
> +	{PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1},
> +	{PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANONYMOUS | MAP_SHARED, -1},
> +	{PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE | MAP_HUGETLB, -1},
> +	{PROT_READ | PROT_WRITE | PROT_EXEC, MAP_ANONYMOUS | MAP_SHARED  | MAP_HUGETLB, -1},
> +	{PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE, 0},
> +	{PROT_READ | PROT_WRITE | PROT_EXEC, MAP_SHARED, 0},
> +};
> +
> +static char *flag_to_str(int flags)
> +{
> +	switch (flags) {
> +	case MAP_PRIVATE:
> +		return "MAP_PRIVATE";
> +	case MAP_SHARED:
> +		return "MAP_SHARED";
> +	case MAP_ANONYMOUS | MAP_PRIVATE:
> +		return "MAP_ANONYMOUS|MAP_PRIVATE";
> +	case MAP_ANONYMOUS | MAP_SHARED:
> +		return "MAP_ANONYMOUS|MAP_SHARED";
> +	case MAP_ANONYMOUS | MAP_PRIVATE | MAP_HUGETLB:
> +		return "MAP_ANONYMOUS|MAP_PRIVATE|MAP_HUGETLB";
> +	case MAP_ANONYMOUS | MAP_SHARED  | MAP_HUGETLB:
> +		return "MAP_ANONYMOUS|MAP_SHARED|MAP_HUGETLB";
> +	default:
> +		return "UNKNOWN FLAGS";
> +	}
> +}
> +
> +static void pkey_test(struct tcase *tc, struct mmap_param *mpa)
> +{
> +	pid_t pid;
> +	char *buffer;
> +	int pkey, status;
> +	int fd = mpa->fd;
> +
> +	if (no_hugepage && (mpa->flags & MAP_HUGETLB)) {
> +		tst_res(TINFO, "Skip test on (%s) buffer", flag_to_str(mpa->flags));
> +		return;
> +	}
> +
> +	if (fd == 0)
> +		fd = SAFE_OPEN(TEST_FILE, O_RDWR | O_CREAT, 0664);
> +
> +	buffer = SAFE_MMAP(NULL, size, mpa->prot, mpa->flags, fd, 0);
> +
> +	pkey = pkey_alloc(tc->flags, tc->access_rights);
> +	if (pkey == -1)
> +		tst_brk(TBROK | TERRNO, "pkey_alloc failed");
> +
> +	tst_res(TINFO, "Set %s on (%s) buffer", tc->name, flag_to_str(mpa->flags));
> +	if (pkey_mprotect(buffer, size, mpa->prot, pkey) == -1)
> +		tst_brk(TBROK | TERRNO, "pkey_mprotect failed");
> +
> +	pid = SAFE_FORK();
> +	if (pid == 0) {
> +		struct rlimit r;
> +
> +		r.rlim_cur = 1;
> +		r.rlim_max = 1;
> +		/* Children crash are expected, avoid dumping corefile */
> +		SAFE_SETRLIMIT(RLIMIT_CORE, &r);

So this should be merged after the tst_no_corefile() and rebased to make
use of that.

> +		switch (tc->access_rights) {
> +			case PKEY_DISABLE_ACCESS:
> +			tst_res(TFAIL | TERRNO,
> +				"Read buffer success, buffer[0] = %d", *buffer);
> +		break;
> +			case PKEY_DISABLE_WRITE:
> +			*buffer = 'a';
> +		break;
> +		}
> +		exit(0);
> +	}
> +
> +	SAFE_WAITPID(pid, &status, 0);
> +	if (WIFSIGNALED(status)) {
> +		if (WTERMSIG(status) == SIGSEGV) {
> +			tst_res(TPASS, "Child ended by %s as expected",
> +				tst_strsig(SIGSEGV));
> +		} else {
> +			tst_res(TFAIL | TERRNO, "Child ended by %s unexpected" ,
> +				tst_strsig(WTERMSIG(status)));
> +		}
> +	} else {
> +		tst_res(TFAIL | TERRNO,
> +			"Child unexpectedly ended with %d",
> +			WEXITSTATUS(status));
> +	}

We do have a helper function for printing the status content so this
could be simplified to:

	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
		tst_res(TPASS, ...);
	else
		tst_res(TFAIL, "Child: %s", tst_strstatus(status));

Also there is no point in printing the errno (TERRNO flag) here.

> +	tst_res(TINFO, "Remove %s from the buffer", tc->name);
> +	if (pkey_mprotect(buffer, size, mpa->prot, 0x0) == -1)
> +		tst_brk(TBROK | TERRNO, "pkey_mprotect failed");
> +
> +	switch (mpa->prot) {
> +		case PROT_READ:

Indenting the case statements and not indeting the break looks really
strange. At least the LKML coding style does not indent the case
statements within the swith() statement.

> +		tst_res(TPASS, "Read buffer success, buffer[0] = %d", *buffer);
> +	break;
> +		case PROT_WRITE:
> +		*buffer = 'a';
> +	break;
> +		case PROT_READ | PROT_WRITE:
> +		case PROT_READ | PROT_WRITE | PROT_EXEC:
> +		*buffer = 'a';
> +		tst_res(TPASS, "Read & Write buffer success, buffer[0] = %d", *buffer);
> +	break;
> +	}
> +
> +	if (fd >= 0)
> +		SAFE_CLOSE(fd);
> +
> +	SAFE_MUNMAP(buffer, size);
> +
> +	if (pkey_free(pkey) == -1)
> +		tst_brk(TBROK | TERRNO, "pkey_free failed");
> +}
> +
> +static void verify_pkey(unsigned int i)
> +{
> +	long unsigned int j;
> +	struct mmap_param *mpa;
> +
> +	struct tcase *tc = &tcases[i];
> +
> +	for (j = 0; j < ARRAY_SIZE(mmap_params); j++) {
> +		mpa = &mmap_params[j];
> +
> +		pkey_test(tc, mpa);
> +	}
> +}
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.needs_root = 1,
> +	.forks_child = 1,
> +	.test = verify_pkey,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.save_restore = save_restore,
> +};
> -- 
> 2.20.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
