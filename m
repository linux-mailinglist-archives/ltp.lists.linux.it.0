Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AED1648C4
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 16:37:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFF213C24C9
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 16:37:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A8AC83C1F2A
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 16:37:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D8DB320144C
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 16:37:04 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 24DF4ABF4
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 15:37:04 +0000 (UTC)
Date: Wed, 19 Feb 2020 16:37:03 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200219153703.GA13439@rei>
References: <20200124125537.17714-1-mdoucha@suse.cz>
 <20200124125537.17714-3-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124125537.17714-3-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/3] Add test for misaligned fallocate()
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
> diff --git a/testcases/kernel/syscalls/fallocate/fallocate06.c b/testcases/kernel/syscalls/fallocate/fallocate06.c
> new file mode 100644
> index 000000000..406249740
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fallocate/fallocate06.c
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 SUSE LLC <mdoucha@suse.cz>
> + */
> +
> +/*
> + * Tests misaligned fallocate()
> + * Test scenario:
> + * 1. write() several blocks worth of data
> + * 2. fallocate() some more space (not aligned to FS blocks)
> + * 3. try to write() into the allocated space
> + * 4. deallocate misaligned part of file range written in step 1
> + * 5. read() the deallocated range and check that it was zeroed
> + *
> + * Subtests:
> + * - fill file system between step 2 and 3
> + * - disable copy-on-write on test file
> + * - combinations of above subtests
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <fcntl.h>
> +#include <sys/ioctl.h>
> +#include <linux/fs.h>
> +#include "tst_test.h"
> +#include "lapi/fallocate.h"
> +
> +#define MNTPOINT "mntpoint"
> +#define TEMPFILE MNTPOINT "/test_file"
> +#define WRITE_BLOCKS 8
> +#define FALLOCATE_BLOCKS 2
> +#define DEALLOCATE_BLOCKS 3
> +#define TESTED_FLAGS "fallocate(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE)"
> +
> +const struct test_case {
> +	int no_cow, fill_fs;
> +} testcase_list[] = {
> +	{1, 0},
> +	{1, 1},
> +	{0, 0},
> +	{0, 1}
> +};
> +
> +static int cow_support;
> +static char *wbuf, *rbuf;
> +static blksize_t blocksize;
> +static long wbuf_size, rbuf_size, block_offset;
> +
> +static int toggle_cow(int fd, int enable)
> +{
> +	int ret, attr;
> +
> +	ret = ioctl(fd, FS_IOC_GETFLAGS, &attr);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (enable)
> +		attr &= ~FS_NOCOW_FL;
> +	else
> +		attr |= FS_NOCOW_FL;
> +
> +	return ioctl(fd, FS_IOC_SETFLAGS, &attr);
> +}
> +
> +static void setup(void) {
                           ^
		This belongs to new line.
> +	unsigned char ch;
> +	long i;
> +	int fd;
> +	struct stat statbuf;
> +
> +	fd = SAFE_OPEN(TEMPFILE, O_WRONLY | O_CREAT | O_TRUNC);
> +
> +	/*
> +	 * Set FS_NOCOW_FL flag on the temp file. Non-CoW filesystems will
> +	 * return error.
> +	 */
> +	TEST(toggle_cow(fd, 0));
> +	SAFE_FSTAT(fd, &statbuf);
> +	blocksize = statbuf.st_blksize;
> +	block_offset = MIN(blocksize / 2, 512);
> +	wbuf_size = MAX(WRITE_BLOCKS, FALLOCATE_BLOCKS) * blocksize;
> +	rbuf_size = (DEALLOCATE_BLOCKS + 1) * blocksize;
> +	SAFE_CLOSE(fd);
> +	SAFE_UNLINK(TEMPFILE);
> +
> +	if (blocksize < 2)
> +		tst_brk(TCONF, "Block size %ld too small for test", blocksize);

I pretty much doubt that this will ever trigger, nobody sane would set
the blocksize to 1 never ever.

> +	if (!TST_RET)
> +		cow_support = 1;
> +	else switch (TST_ERR) {
> +	case ENOTSUP:
> +	case ENOTTY:
> +	case EINVAL:
> +	case ENOSYS:
> +		cow_support = 0;
> +		break;
> +
> +	default:
> +		tst_brk(TBROK|TTERRNO, "Error checking copy-on-write support");
> +	}

I find this piece of code quite misleading, can we plese indent the
switch block correctly?

Also generally the LKML coding style prefers curly braces over multiline
blocks even if they are logically one block.

> +	tst_res(TINFO, "Copy-on-write is%s supported",
> +		cow_support ? "" : " not");
> +	wbuf = SAFE_MALLOC(wbuf_size);
> +	rbuf = SAFE_MALLOC(rbuf_size);
> +
> +	/* Fill the buffer with known values */
> +	for (i = 0, ch = 1; i < wbuf_size; i++, ch++) {
> +		wbuf[i] = ch;
> +	}

Drop the curly braces here.

> +}
> +
> +static int check_result(const struct test_case *tc, const char *func, long exp)
> +{
> +	if (tc->fill_fs && !tc->no_cow && TST_RET < 0) {
> +		if (TST_RET != -1) {
> +			tst_res(TFAIL, "%s returned unexpected value %ld",
> +				func, TST_RET);
> +			return 0;
> +		}
> +
> +		if (TST_ERR != ENOSPC) {
> +			tst_res(TFAIL | TTERRNO, "%s should fail with ENOSPC",
> +				func);
> +			return 0;
> +		}
> +
> +		tst_res(TPASS | TTERRNO, "%s on full FS with CoW", func);
> +	} else if (TST_RET < 0) {
> +		tst_res(TFAIL | TTERRNO, "%s failed unexpectedly", func);
> +		return 0;
> +	} else if (TST_RET != exp) {
> +		tst_res(TFAIL,
> +			"Unexpected return value from %s: %ld (expected %ld)",
> +			func, TST_RET, exp);
> +		return 0;
> +	} else
> +		tst_res(TPASS, "%s successful", func);

Huh, you do return in 99% of the blocks here but leave only the return 1
case fall though?

Why can't we get rid of all the else branches then to make it more
readable? If you add return 1 to the first if block then all the else
branches can be removed.

> +	return 1;
> +}
> +
> +static void run(unsigned int n)
> +{
> +	int fd;
> +	long offset, size;
> +	const struct test_case *tc = testcase_list + n;
> +
> +	tst_res(TINFO, "Case %u. Fill FS: %s; Use copy on write: %s", n+1,
> +		tc->fill_fs ? "yes" : "no", tc->no_cow ? "no" : "yes");
> +	fd = SAFE_OPEN(TEMPFILE, O_RDWR | O_CREAT | O_TRUNC);
> +
> +	if (cow_support)
> +		toggle_cow(fd, !tc->no_cow);
> +	else if (!tc->no_cow)
> +		tst_brk(TCONF, "File system does not support copy-on-write");
> +
> +	/* Prepare test data for deallocation test */
> +	size = WRITE_BLOCKS * blocksize;
> +	TEST(write(fd, wbuf, size));
> +
> +	if (TST_RET < 0)
> +		tst_res(TFAIL | TTERRNO, "write() failed unexpectedly");
> +	else if (TST_RET != size)
> +		tst_res(TFAIL, "Short write(): %ld bytes (expected %ld)",
> +			TST_RET, size);
> +	else
> +		tst_res(TPASS, "write() wrote %ld bytes", TST_RET);

Does it make sense to continue here if we write less?

In the worst case the the offset below may be rounded to blocksize...

I would just use SAFE_WRITE() here and be done with it.

> +	/* Allocation test */
> +	offset = size + block_offset;
> +	size = FALLOCATE_BLOCKS * blocksize;
> +	TEST(fallocate(fd, 0, offset, size));
> +
> +	if (TST_RET) {
> +		if (TST_ERR == ENOTSUP) {
> +			SAFE_CLOSE(fd);
> +			tst_brk(TCONF | TTERRNO, "fallocate() not supported");
> +		}

The SAFE_CLOSE() should be before the if here, right?

> +		tst_brk(TBROK | TTERRNO, "fallocate(fd, 0, %ld, %ld)", offset,
> +			size);
> +	}
> +
> +	if (tc->fill_fs)
> +		tst_fill_fs(MNTPOINT, 1);
> +
> +	SAFE_LSEEK(fd, offset, SEEK_SET);
> +	TEST(write(fd, wbuf, size));
> +	if (check_result(tc, "write()", size))
> +		tst_res(TPASS, "Misaligned allocation works as expected");
> +
> +	/* Deallocation test */
> +	size = DEALLOCATE_BLOCKS * blocksize;
> +	offset = block_offset;
> +	TEST(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, offset,
> +		size));
> +
> +	if (TST_RET == -1 && TST_ERR == ENOTSUP) {
> +		tst_res(TCONF | TTERRNO, TESTED_FLAGS);
> +	} else if (check_result(tc, TESTED_FLAGS, 0) && !TST_RET) {

The more usuall pattern here would be to do goto cleanup after the
tst_res(TCONF, ...) message with the cleanup label just before the
SAFE_CLOSE().

i.e.
	if (TST_RET == -1 && TST_ERR == ENOTSUP) {
		tst_res(TCONF...);
		goto cleanup;
	}

	if (!check_result(tc, TESTED_FLAGS, 0) || TST_RET)
		goto cleanup;

	int i, err = 0;
	...

> +		int i, err = 0;
> +
> +		SAFE_LSEEK(fd, 0, SEEK_SET);
> +		SAFE_READ(1, fd, rbuf, rbuf_size);
> +
> +		for (i = offset; i < offset + size; i++) {
> +			if (rbuf[i]) {
> +				err = 1;
> +				break;
> +			}
> +		}
> +
> +		err = err || memcmp(rbuf, wbuf, offset);
> +		offset += size;
> +		size = rbuf_size - offset;
> +		err = err || memcmp(rbuf + offset, wbuf + offset, size);
> +
> +		if (err)
> +			tst_res(TFAIL, TESTED_FLAGS
> +				" did not clear the correct file range.");
> +		else
> +			tst_res(TPASS, TESTED_FLAGS
> +				" cleared the correct file range");
> +	}
> +
> +	SAFE_CLOSE(fd);
> +	tst_purge_dir(MNTPOINT);
> +}
> +
> +static void cleanup(void)
> +{
> +	free(wbuf);
> +	free(rbuf);
> +}
> +
> +static struct tst_test test = {
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(testcase_list),
> +	.needs_root = 1,
> +	.mount_device = 1,
> +	.dev_min_size = 512,
> +	.mntpoint = MNTPOINT,
> +	.all_filesystems = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};

The rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
