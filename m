Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00122148A1
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:57:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C39C93EAE79
	for <lists+linux-ltp@lfdr.de>; Mon,  6 May 2019 12:57:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E98B73EA659
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:57:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4AE401001443
 for <ltp@lists.linux.it>; Mon,  6 May 2019 12:57:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CD7D0AE8D
 for <ltp@lists.linux.it>; Mon,  6 May 2019 10:57:11 +0000 (UTC)
To: ltp@lists.linux.it
References: <20190506105457.22350-1-camann@suse.com>
From: Christian Amann <camann@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=camann@suse.com; keydata=
 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
 du2mz1Q=
Message-ID: <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
Date: Mon, 6 May 2019 12:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506105457.22350-1-camann@suse.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1088321878=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1088321878==
Content-Type: multipart/alternative;
 boundary="------------1C5938FAC8AA0971FFFA3D74"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1C5938FAC8AA0971FFFA3D74
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

@ Li Wang Thanks again for your review. I implemented your suggestions:
- changed failure report type from TINFO to TFAIL (01.c) - added 2 new
error handling tests (02.c): This still leaves out some errors described
on the manpage but most of them are very difficult to test (out of
memory, low level io error, etc). If anyone knows a way how to test
this, I'm open for suggestions. - slight restructuring of error handling
logic (02.c) - renamed getTimestamp to get_timestamp (03.c) - minor
changes in reporting failures (03.c) Kind regards, Christian

On 06/05/2019 12:54, Christian Amann wrote:
> The following tests are run for the syscall itself,
> as well as the glibc implementation.
>
> copy_file_range01:
> 	restructured testcase, removed unnecessary code,
> 	improved readability and shortened output (only
> 	failures get printed now). This tests the basic
> 	functionality of the syscall.
>
> copy_file_range02:
> 	add testcases which test basic error handling
> 	of the syscall.
>
> copy_file_range03:
> 	add testcase to check if this operation updates
> 	timestamps accordingly.
>
> Signed-off-by: Christian Amann <camann@suse.com>
> ---
>  configure.ac                                       |   1 +
>  m4/ltp-copy_file_range.m4                          |   7 +
>  runtest/syscalls                                   |   2 +
>  .../kernel/syscalls/copy_file_range/.gitignore     |   2 +
>  .../syscalls/copy_file_range/copy_file_range.h     |  57 +++++
>  .../syscalls/copy_file_range/copy_file_range01.c   | 239 +++++++++++----------
>  .../syscalls/copy_file_range/copy_file_range02.c   | 118 ++++++++++
>  .../syscalls/copy_file_range/copy_file_range03.c   |  77 +++++++
>  8 files changed, 387 insertions(+), 116 deletions(-)
>  create mode 100644 m4/ltp-copy_file_range.m4
>  create mode 100644 testcases/kernel/syscalls/copy_file_range/copy_file_range.h
>  create mode 100644 testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
>  create mode 100644 testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
>
> diff --git a/configure.ac b/configure.ac
> index fad8f8396..3fec68ede 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -197,6 +197,7 @@ LTP_CHECK_BUILTIN_CLEAR_CACHE
>  LTP_CHECK_CAPABILITY_SUPPORT
>  LTP_CHECK_CC_WARN_OLDSTYLE
>  LTP_CHECK_CLONE_SUPPORTS_7_ARGS
> +LTP_CHECK_COPY_FILE_RANGE
>  LTP_CHECK_CRYPTO
>  LTP_CHECK_FIDEDUPE
>  LTP_CHECK_FORTIFY_SOURCE
> diff --git a/m4/ltp-copy_file_range.m4 b/m4/ltp-copy_file_range.m4
> new file mode 100644
> index 000000000..2d87e8900
> --- /dev/null
> +++ b/m4/ltp-copy_file_range.m4
> @@ -0,0 +1,7 @@
> +dnl SPDX-License-Identifier: GPL-2.0-or-later
> +dnl Copyright (c) 2019 SUSE LLC
> +dnl Author: Christian Amann <camann@suse.com>
> +
> +AC_DEFUN([LTP_CHECK_COPY_FILE_RANGE],[
> +AC_CHECK_FUNCS(copy_file_range,,)
> +])
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 2b8ca719b..33a70ee17 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1561,6 +1561,8 @@ memfd_create03 memfd_create03
>  memfd_create04 memfd_create04
>  
>  copy_file_range01 copy_file_range01
> +copy_file_range02 copy_file_range02
> +copy_file_range03 copy_file_range03
>  
>  statx01 statx01
>  statx02 statx02
> diff --git a/testcases/kernel/syscalls/copy_file_range/.gitignore b/testcases/kernel/syscalls/copy_file_range/.gitignore
> index 6807420ef..e9e35f60f 100644
> --- a/testcases/kernel/syscalls/copy_file_range/.gitignore
> +++ b/testcases/kernel/syscalls/copy_file_range/.gitignore
> @@ -1 +1,3 @@
>  /copy_file_range01
> +/copy_file_range02
> +/copy_file_range03
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> new file mode 100644
> index 000000000..d2ef1348b
> --- /dev/null
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 SUSE LLC
> + * Author: Christian Amann <camann@suse.com>
> + */
> +
> +#ifndef __COPY_FILE_RANGE_H__
> +#define __COPY_FILE_RANGE_H__
> +
> +#include <stdbool.h>
> +#include <unistd.h>
> +#include "lapi/syscalls.h"
> +
> +#define TEST_VARIANTS	2
> +
> +#define MNTPOINT	"mnt_point"
> +#define FILE_SRC_PATH   "file_src"
> +#define FILE_DEST_PATH  "file_dest"
> +#define FILE_RDONL_PATH "file_rdonl"
> +#define FILE_DIR_PATH	"file_dir"
> +#define FILE_MNTED_PATH	MNTPOINT"/file_mnted"
> +
> +#define CONTENT		"ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
> +#define CONTSIZE	(sizeof(CONTENT) - 1)
> +
> +static void syscall_info(void)
> +{
> +	switch (tst_variant) {
> +	case 0:
> +		tst_res(TINFO, "Testing libc copy_file_range()");
> +		break;
> +	case 1:
> +		tst_res(TINFO, "Testing tst copy_file_range()");
> +	}
> +}
> +
> +static int sys_copy_file_range(int fd_in, loff_t *off_in,
> +		int fd_out, loff_t *off_out, size_t len, unsigned int flags)
> +{
> +	switch (tst_variant) {
> +
> +	case 0:
> +#ifdef HAVE_COPY_FILE_RANGE
> +		return copy_file_range(fd_in, off_in,
> +				fd_out, off_out, len, flags);
> +#else
> +		tst_brk(TCONF, "libc copy_file_range() not supported!");
> +#endif
> +		break;
> +	case 1:
> +		return tst_syscall(__NR_copy_file_range, fd_in, off_in, fd_out,
> +				off_out, len, flags);
> +	}
> +	return -1;
> +}
> +
> +#endif /* __COPY_FILE_RANGE_H__ */
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> index 61a6042d9..a5bd5e7f7 100644
> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
> @@ -1,66 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Copyright (c) Linux Test Project, 2017
> - *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> + * Copyright (c) Linux Test Project, 2019
> + */
> +
> +/*
> + * This tests the fundamental functionalities of the copy_file_range
> + * syscall. It does so by copying the contents of one file into
> + * another using various different combinations for length and
> + * input/output offsets.
>   *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - * the GNU General Public License for more details.
> + * After a copy is done this test checks if the contents of both files
> + * are equal at the given offsets. It is also inspected if the offsets
> + * of the file descriptors are advanced correctly.
>   */
>  
>  #define _GNU_SOURCE
> +
>  #include <stdio.h>
> -#include <errno.h>
>  #include <stdlib.h>
>  #include "tst_test.h"
>  #include "tst_safe_stdio.h"
> -#include "lapi/syscalls.h"
> -
> -#define TEST_FILE_1 "copy_file_range_ltp01.txt"
> -#define TEST_FILE_2 "copy_file_range_ltp02.txt"
> -#define STR "abcdefghijklmnopqrstuvwxyz12345\n"
> -
> -#define verbose 0
> -
> -static size_t *len_arr;
> -static loff_t **off_arr;
> -static int len_sz, off_sz;
> +#include "copy_file_range.h"
>  
> -static void setup(void)
> -{
> -	int i, fd, page_size;
> -
> -	page_size = getpagesize();
> -
> -	fd = SAFE_OPEN(TEST_FILE_1, O_RDWR | O_CREAT, 0664);
> -	/* Writing page_size * 4 of data into test file */
> -	for (i = 0; i < (int)(page_size * 4); i++)
> -		SAFE_WRITE(1, fd, STR, strlen(STR));
> -	SAFE_CLOSE(fd);
> -
> -	len_sz = 4;
> -	len_arr = malloc(sizeof(size_t) * len_sz);
> -	len_arr[0] = 11;
> -	len_arr[1] = page_size - 1;
> -	len_arr[2] = page_size;
> -	len_arr[3] = page_size + 1;
> -
> -	off_sz = 6;
> -	off_arr = malloc(sizeof(loff_t *) * off_sz);
> -	for (i = 1; i < off_sz; i++)
> -		off_arr[i] = malloc(sizeof(loff_t));
> -
> -	off_arr[0] = NULL;
> -	*off_arr[1] = 0;
> -	*off_arr[2] = 17;
> -	*off_arr[3] = page_size - 1;
> -	*off_arr[4] = page_size;
> -	*off_arr[5] = page_size + 1;
> -}
> +static int page_size;
> +static int errcount, numcopies;
> +static int fd_in, fd_out;
>  
>  static int check_file_content(const char *fname1, const char *fname2,
>  	loff_t *off1, loff_t *off2, size_t len)
> @@ -90,52 +54,37 @@ static int check_file_content(const char *fname1, const char *fname2,
>  }
>  
>  static int check_file_offset(const char *m, int fd, loff_t len,
> -	loff_t *off_ori, loff_t *off_after)
> +		loff_t *off_before, loff_t *off_after)
>  {
> +	loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
>  	int ret = 0;
>  
> -	if (off_ori) {
> -		/* FD should stay untouched, and off_in/out is updated */
> -		loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
> -
> -		if (fd_off == 0) {
> -			if (verbose)
> -				tst_res(TPASS, "%s FD offset unchanged", m);
> -		} else {
> -			tst_res(TFAIL, "%s FD offset changed: %ld",
> +	if (off_before) {
> +		/*
> +		 * copy_file_range offset is given:
> +		 * - fd offset should stay 0,
> +		 * - copy_file_range offset is updated
> +		 */
> +		if (fd_off != 0) {
> +			tst_res(TFAIL,
> +				"%s fd offset unexpectedly changed: %ld",
>  				m, (long)fd_off);
>  			ret = 1;
> -		}
>  
> -		if (!off_after) {
> -			tst_res(TFAIL, "%s offset is NULL", m);
> -			ret = 1;
> -		}
> -
> -		if ((off_after) && (*off_ori + len == *off_after)) {
> -			if (verbose) {
> -				tst_res(TPASS, "%s offset advanced as"
> -					" expected: %ld", m, (long)*off_after);
> -			}
> -		} else {
> +		} else if (*off_before + len != *off_after) {
>  			tst_res(TFAIL, "%s offset unexpected value: %ld",
>  				m, (long)*off_after);
>  			ret = 1;
>  		}
> -	} else {
> -		/* FD offset is advanced by len */
> -		loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
> -
> -		if (fd_off == len) {
> -			if (verbose) {
> -				tst_res(TPASS, "%s FD offset changed as"
> -					" expected: %ld", m, (long)fd_off);
> -			}
> -		} else {
> -			tst_res(TFAIL, "%s FD offset unexpected value: %ld",
> +	}
> +	/*
> +	 * no copy_file_range offset given:
> +	 * - fd offset advanced by length
> +	 */
> +	else if (fd_off != len) {
> +		tst_res(TFAIL, "%s fd offset unexpected value: %ld",
>  				m, (long)fd_off);
> -			ret = 1;
> -		}
> +		ret = 1;
>  	}
>  
>  	return ret;
> @@ -143,77 +92,135 @@ static int check_file_offset(const char *m, int fd, loff_t len,
>  
>  static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
>  {
> +	int ret;
>  	size_t to_copy = len;
> -	int fd_in, fd_out, ret;
> -	loff_t *off_in_ori = off_in;
> -	loff_t *off_out_ori = off_out;
> -	loff_t off_in_copy;
> -	loff_t off_out_copy;
> +	loff_t off_in_value_copy, off_out_value_copy;
> +	loff_t *off_new_in  = &off_in_value_copy;
> +	loff_t *off_new_out = &off_out_value_copy;
>  	char str_off_in[32], str_off_out[32];
>  
>  	if (off_in) {
> -		off_in_copy = *off_in;
> -		off_in = &off_in_copy;
> +		off_in_value_copy = *off_in;
>  		sprintf(str_off_in, "%ld", (long)*off_in);
>  	} else {
> +		off_new_in = NULL;
>  		strcpy(str_off_in, "NULL");
>  	}
>  
>  	if (off_out) {
> -		off_out_copy = *off_out;
> -		off_out = &off_out_copy;
> +		off_out_value_copy = *off_out;
>  		sprintf(str_off_out, "%ld", (long)*off_out);
>  	} else {
> +		off_new_out = NULL;
>  		strcpy(str_off_out, "NULL");
>  	}
>  
> -	fd_in = SAFE_OPEN(TEST_FILE_1, O_RDONLY);
> -	fd_out = SAFE_OPEN(TEST_FILE_2, O_CREAT | O_WRONLY | O_TRUNC, 0644);
> -
>  	/*
>  	 * copy_file_range() will return the number of bytes copied between
>  	 * files. This could be less than the length originally requested.
>  	 */
>  	do {
> -		TEST(tst_syscall(__NR_copy_file_range, fd_in, off_in, fd_out,
> -			off_out, to_copy, 0));
> +		TEST(sys_copy_file_range(fd_in, off_new_in, fd_out,
> +				off_new_out, to_copy, 0));
>  		if (TST_RET == -1) {
>  			tst_res(TFAIL | TTERRNO, "copy_file_range() failed");
> -			SAFE_CLOSE(fd_in);
> -			SAFE_CLOSE(fd_out);
> +			errcount++;
>  			return;
>  		}
>  
>  		to_copy -= TST_RET;
>  	} while (to_copy > 0);
>  
> -	ret = check_file_content(TEST_FILE_1, TEST_FILE_2,
> -		off_in_ori, off_out_ori, len);
> -	if (ret)
> +	ret = check_file_content(FILE_SRC_PATH, FILE_DEST_PATH,
> +		off_in, off_out, len);
> +	if (ret) {
>  		tst_res(TFAIL, "file contents do not match");
> +		errcount++;
> +		return;
> +	}
>  
> -	ret |= check_file_offset("(in)", fd_in, len, off_in_ori, off_in);
> -	ret |= check_file_offset("(out)", fd_out, len, off_out_ori, off_out);
> +	ret |= check_file_offset("(in)", fd_in, len, off_in, off_new_in);
> +	ret |= check_file_offset("(out)", fd_out, len, off_out, off_new_out);
> +
> +	if (ret != 0) {
> +		tst_res(TFAIL, "off_in: %s, off_out: %s, len: %ld",
> +				str_off_in, str_off_out, (long)len);
> +		errcount++;
> +	}
> +}
>  
> -	tst_res(ret == 0 ? TPASS : TFAIL, "off_in: %s, off_out: %s, len: %ld",
> -			str_off_in, str_off_out, (long)len);
> +static void open_files(void)
> +{
> +	fd_in  = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
> +	fd_out = SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_WRONLY | O_TRUNC, 0644);
> +}
>  
> -	SAFE_CLOSE(fd_in);
> -	SAFE_CLOSE(fd_out);
> +static void close_files(void)
> +{
> +	if (fd_out > 0)
> +		SAFE_CLOSE(fd_out);
> +	if (fd_in  > 0)
> +		SAFE_CLOSE(fd_in);
>  }
>  
>  static void copy_file_range_verify(void)
>  {
>  	int i, j, k;
>  
> -	for (i = 0; i < len_sz; i++)
> -		for (j = 0; j < off_sz; j++)
> -			for (k = 0; k < off_sz; k++)
> +	errcount = numcopies = 0;
> +	size_t len_arr[]	= {11, page_size-1, page_size, page_size+1};
> +	loff_t off_arr_values[]	= {0, 17, page_size-1, page_size, page_size+1};
> +
> +	int num_offsets = ARRAY_SIZE(off_arr_values) + 1;
> +	loff_t *off_arr[num_offsets];
> +
> +	off_arr[0] = NULL;
> +	for (i = 1; i < num_offsets; i++)
> +		off_arr[i] = &off_arr_values[i-1];
> +
> +	/* Test all possible cobinations of given lengths and offsets */
> +	for (i = 0; i < (int)ARRAY_SIZE(len_arr); i++)
> +		for (j = 0; j < num_offsets; j++)
> +			for (k = 0; k < num_offsets; k++) {
> +				open_files();
>  				test_one(len_arr[i], off_arr[j], off_arr[k]);
> +				close_files();
> +				numcopies++;
> +			}
> +
> +	if (errcount == 0)
> +		tst_res(TPASS,
> +			"copy_file_range completed all %d copy jobs successfully!",
> +			numcopies);
> +	else
> +		tst_res(TFAIL, "copy_file_range failed %d of %d copy jobs.",
> +				errcount, numcopies);
> +}
> +
> +static void setup(void)
> +{
> +	int i, fd;
> +
> +	syscall_info();
> +
> +	page_size = getpagesize();
> +
> +	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
> +	/* Writing page_size * 4 of data into test file */
> +	for (i = 0; i < (int)(page_size * 4); i++)
> +		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
> +	SAFE_CLOSE(fd);
> +}
> +
> +static void cleanup(void)
> +{
> +	close_files();
>  }
>  
>  static struct tst_test test = {
>  	.setup = setup,
> +	.cleanup = cleanup,
>  	.needs_tmpdir = 1,
>  	.test_all = copy_file_range_verify,
> +	.test_variants = TEST_VARIANTS,
>  };
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> new file mode 100644
> index 000000000..07c0207c2
> --- /dev/null
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 SUSE LLC
> + * Author: Christian Amann <camann@suse.com>
> + */
> +
> +/*
> + * Tests basic error handling of the
> + * copy_file_range syscall
> + *
> + * 1) Try to copy contents to file open as readonly
> + *    -> EBADF
> + * 2) Try to copy contents to file on different mounted
> + *    filesystem -> EXDEV
> + * 3) Try to copy contents to directory -> EISDIR
> + * 4) Try to copy contents to a file opened with the
> + *    O_APPEND flag -> EBADF
> + * 5) Try to copy contents to closed filedescriptor
> + *    -> EBADF
> + * 6) Try to copy contents with invalid 'flags' value
> + *    -> EINVAL
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include "tst_test.h"
> +#include "copy_file_range.h"
> +
> +static int fd_src;
> +static int fd_dest;
> +static int fd_rdonly;
> +static int fd_mnted;
> +static int fd_dir;
> +static int fd_closed;
> +static int fd_append;
> +
> +static struct tcase {
> +	int	*copy_to_fd;
> +	int	flags;
> +	int	exp_err;
> +} tcases[] = {
> +	{&fd_rdonly,	0,	EBADF},
> +	{&fd_mnted,	0,	EXDEV},
> +	{&fd_dir,	0,	EISDIR},
> +	{&fd_append,	0,	EBADF},
> +	{&fd_closed,	0,	EBADF},
> +	{&fd_dest,	-1,	EINVAL},
> +};
> +
> +static void verify_copy_file_range(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
> +				0, CONTSIZE, tc->flags));
> +
> +	if (TST_RET == -1) {
> +		if (tc->exp_err == TST_ERR) {
> +			tst_res(TPASS | TTERRNO,
> +					"copy_file_range failed as expected");
> +		} else {
> +			tst_res(TFAIL | TTERRNO,
> +				"copy_file_range failed unexpectedly; expected %s, but got",
> +				tst_strerrno(tc->exp_err));
> +			return;
> +		}
> +	} else {
> +		tst_res(TFAIL,
> +			"copy_file_range returned wrong value: %ld", TST_RET);
> +	}
> +}
> +
> +static void cleanup(void)
> +{
> +	if (fd_append > 0)
> +		SAFE_CLOSE(fd_append);
> +	if (fd_dir > 0)
> +		SAFE_CLOSE(fd_dir);
> +	if (fd_mnted > 0)
> +		SAFE_CLOSE(fd_mnted);
> +	if (fd_rdonly > 0)
> +		SAFE_CLOSE(fd_rdonly);
> +	if (fd_dest > 0)
> +		SAFE_CLOSE(fd_dest);
> +	if (fd_src > 0)
> +		SAFE_CLOSE(fd_src);
> +}
> +
> +static void setup(void)
> +{
> +	syscall_info();
> +
> +	if (access(FILE_DIR_PATH, F_OK) == -1)
> +		SAFE_MKDIR(FILE_DIR_PATH, 0777);
> +
> +	fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
> +	fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
> +	fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
> +	fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
> +	fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
> +	fd_closed = -1;
> +	fd_append = SAFE_OPEN(FILE_DEST_PATH,
> +			O_RDWR | O_CREAT | O_APPEND, 0664);
> +
> +	SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
> +}
> +
> +static struct tst_test test = {
> +	.test = verify_copy_file_range,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +	.mount_device = 1,
> +	.mntpoint = MNTPOINT,
> +	.dev_fs_type = "ext4",
> +	.test_variants = TEST_VARIANTS,
> +};
> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> new file mode 100644
> index 000000000..18e411af2
> --- /dev/null
> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 SUSE LLC
> + * Author: Christian Amann <camann@suse.com>
> + */
> +
> +/*
> + * Copies the contents of one file into another and
> + * checks if the timestamp gets updated in the process.
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include "tst_test.h"
> +#include "copy_file_range.h"
> +
> +static int fd_src;
> +static int fd_dest;
> +
> +unsigned long get_timestamp(int fd)
> +{
> +	struct stat filestat;
> +
> +	fstat(fd, &filestat);
> +	return filestat.st_mtime;
> +}
> +
> +static void verify_copy_file_range_timestamp(void)
> +{
> +	loff_t offset;
> +	unsigned long timestamp, updated_timestamp;
> +
> +	timestamp = get_timestamp(fd_dest);
> +	usleep(1000000);
> +
> +	offset = 0;
> +	TEST(sys_copy_file_range(fd_src, &offset,
> +			fd_dest, 0, CONTSIZE, 0));
> +	if (TST_RET == -1)
> +		tst_brk(TBROK | TTERRNO,
> +				"copy_file_range unexpectedly failed");
> +
> +	updated_timestamp = get_timestamp(fd_dest);
> +
> +	if (timestamp == updated_timestamp)
> +		tst_brk(TFAIL, "copy_file_range did not update timestamp.");
> +
> +	tst_res(TPASS, "copy_file_range sucessfully updated the timestamp!");
> +}
> +
> +static void cleanup(void)
> +{
> +	if (fd_dest > 0)
> +		SAFE_CLOSE(fd_dest);
> +	if (fd_src  > 0)
> +		SAFE_CLOSE(fd_src);
> +}
> +
> +static void setup(void)
> +{
> +	syscall_info();
> +
> +	fd_dest = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
> +	fd_src  = SAFE_OPEN(FILE_SRC_PATH,  O_RDWR | O_CREAT, 0664);
> +	SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
> +	SAFE_CLOSE(fd_src);
> +	fd_src = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
> +}
> +
> +
> +static struct tst_test test = {
> +	.test_all = verify_copy_file_range_timestamp,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +	.test_variants = TEST_VARIANTS,
> +};

--------------1C5938FAC8AA0971FFFA3D74
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <pre class="content"><span class="quote">@ Li Wang

Thanks again for your review. I implemented your suggestions:

- changed failure report type from TINFO to TFAIL (01.c)
- added 2 new error handling tests (02.c):
	This still leaves out some errors described on the manpage
	but most of them are very difficult to test (out of memory,
	low level io error, etc). If anyone knows a way how to test this,
	I'm open for suggestions.
- slight restructuring of error handling logic (02.c)
- renamed getTimestamp to get_timestamp (03.c)
- minor changes in reporting failures (03.c)

Kind regards,
Christian
</span></pre>
    <div class="moz-cite-prefix">On 06/05/2019 12:54, Christian Amann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190506105457.22350-1-camann@suse.com">
      <pre class="moz-quote-pre" wrap="">The following tests are run for the syscall itself,
as well as the glibc implementation.

copy_file_range01:
	restructured testcase, removed unnecessary code,
	improved readability and shortened output (only
	failures get printed now). This tests the basic
	functionality of the syscall.

copy_file_range02:
	add testcases which test basic error handling
	of the syscall.

copy_file_range03:
	add testcase to check if this operation updates
	timestamps accordingly.

Signed-off-by: Christian Amann <a class="moz-txt-link-rfc2396E" href="mailto:camann@suse.com">&lt;camann@suse.com&gt;</a>
---
 configure.ac                                       |   1 +
 m4/ltp-copy_file_range.m4                          |   7 +
 runtest/syscalls                                   |   2 +
 .../kernel/syscalls/copy_file_range/.gitignore     |   2 +
 .../syscalls/copy_file_range/copy_file_range.h     |  57 +++++
 .../syscalls/copy_file_range/copy_file_range01.c   | 239 +++++++++++----------
 .../syscalls/copy_file_range/copy_file_range02.c   | 118 ++++++++++
 .../syscalls/copy_file_range/copy_file_range03.c   |  77 +++++++
 8 files changed, 387 insertions(+), 116 deletions(-)
 create mode 100644 m4/ltp-copy_file_range.m4
 create mode 100644 testcases/kernel/syscalls/copy_file_range/copy_file_range.h
 create mode 100644 testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
 create mode 100644 testcases/kernel/syscalls/copy_file_range/copy_file_range03.c

diff --git a/configure.ac b/configure.ac
index fad8f8396..3fec68ede 100644
--- a/configure.ac
+++ b/configure.ac
@@ -197,6 +197,7 @@ LTP_CHECK_BUILTIN_CLEAR_CACHE
 LTP_CHECK_CAPABILITY_SUPPORT
 LTP_CHECK_CC_WARN_OLDSTYLE
 LTP_CHECK_CLONE_SUPPORTS_7_ARGS
+LTP_CHECK_COPY_FILE_RANGE
 LTP_CHECK_CRYPTO
 LTP_CHECK_FIDEDUPE
 LTP_CHECK_FORTIFY_SOURCE
diff --git a/m4/ltp-copy_file_range.m4 b/m4/ltp-copy_file_range.m4
new file mode 100644
index 000000000..2d87e8900
--- /dev/null
+++ b/m4/ltp-copy_file_range.m4
@@ -0,0 +1,7 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (c) 2019 SUSE LLC
+dnl Author: Christian Amann <a class="moz-txt-link-rfc2396E" href="mailto:camann@suse.com">&lt;camann@suse.com&gt;</a>
+
+AC_DEFUN([LTP_CHECK_COPY_FILE_RANGE],[
+AC_CHECK_FUNCS(copy_file_range,,)
+])
diff --git a/runtest/syscalls b/runtest/syscalls
index 2b8ca719b..33a70ee17 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1561,6 +1561,8 @@ memfd_create03 memfd_create03
 memfd_create04 memfd_create04
 
 copy_file_range01 copy_file_range01
+copy_file_range02 copy_file_range02
+copy_file_range03 copy_file_range03
 
 statx01 statx01
 statx02 statx02
diff --git a/testcases/kernel/syscalls/copy_file_range/.gitignore b/testcases/kernel/syscalls/copy_file_range/.gitignore
index 6807420ef..e9e35f60f 100644
--- a/testcases/kernel/syscalls/copy_file_range/.gitignore
+++ b/testcases/kernel/syscalls/copy_file_range/.gitignore
@@ -1 +1,3 @@
 /copy_file_range01
+/copy_file_range02
+/copy_file_range03
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
new file mode 100644
index 000000000..d2ef1348b
--- /dev/null
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC
+ * Author: Christian Amann <a class="moz-txt-link-rfc2396E" href="mailto:camann@suse.com">&lt;camann@suse.com&gt;</a>
+ */
+
+#ifndef __COPY_FILE_RANGE_H__
+#define __COPY_FILE_RANGE_H__
+
+#include &lt;stdbool.h&gt;
+#include &lt;unistd.h&gt;
+#include "lapi/syscalls.h"
+
+#define TEST_VARIANTS	2
+
+#define MNTPOINT	"mnt_point"
+#define FILE_SRC_PATH   "file_src"
+#define FILE_DEST_PATH  "file_dest"
+#define FILE_RDONL_PATH "file_rdonl"
+#define FILE_DIR_PATH	"file_dir"
+#define FILE_MNTED_PATH	MNTPOINT"/file_mnted"
+
+#define CONTENT		"ABCDEFGHIJKLMNOPQRSTUVWXYZ12345\n"
+#define CONTSIZE	(sizeof(CONTENT) - 1)
+
+static void syscall_info(void)
+{
+	switch (tst_variant) {
+	case 0:
+		tst_res(TINFO, "Testing libc copy_file_range()");
+		break;
+	case 1:
+		tst_res(TINFO, "Testing tst copy_file_range()");
+	}
+}
+
+static int sys_copy_file_range(int fd_in, loff_t *off_in,
+		int fd_out, loff_t *off_out, size_t len, unsigned int flags)
+{
+	switch (tst_variant) {
+
+	case 0:
+#ifdef HAVE_COPY_FILE_RANGE
+		return copy_file_range(fd_in, off_in,
+				fd_out, off_out, len, flags);
+#else
+		tst_brk(TCONF, "libc copy_file_range() not supported!");
+#endif
+		break;
+	case 1:
+		return tst_syscall(__NR_copy_file_range, fd_in, off_in, fd_out,
+				off_out, len, flags);
+	}
+	return -1;
+}
+
+#endif /* __COPY_FILE_RANGE_H__ */
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
index 61a6042d9..a5bd5e7f7 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
@@ -1,66 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) Linux Test Project, 2017
- *
- * This program is free software;  you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
+ * Copyright (c) Linux Test Project, 2019
+ */
+
+/*
+ * This tests the fundamental functionalities of the copy_file_range
+ * syscall. It does so by copying the contents of one file into
+ * another using various different combinations for length and
+ * input/output offsets.
  *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY;  without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
- * the GNU General Public License for more details.
+ * After a copy is done this test checks if the contents of both files
+ * are equal at the given offsets. It is also inspected if the offsets
+ * of the file descriptors are advanced correctly.
  */
 
 #define _GNU_SOURCE
+
 #include &lt;stdio.h&gt;
-#include &lt;errno.h&gt;
 #include &lt;stdlib.h&gt;
 #include "tst_test.h"
 #include "tst_safe_stdio.h"
-#include "lapi/syscalls.h"
-
-#define TEST_FILE_1 "copy_file_range_ltp01.txt"
-#define TEST_FILE_2 "copy_file_range_ltp02.txt"
-#define STR "abcdefghijklmnopqrstuvwxyz12345\n"
-
-#define verbose 0
-
-static size_t *len_arr;
-static loff_t **off_arr;
-static int len_sz, off_sz;
+#include "copy_file_range.h"
 
-static void setup(void)
-{
-	int i, fd, page_size;
-
-	page_size = getpagesize();
-
-	fd = SAFE_OPEN(TEST_FILE_1, O_RDWR | O_CREAT, 0664);
-	/* Writing page_size * 4 of data into test file */
-	for (i = 0; i &lt; (int)(page_size * 4); i++)
-		SAFE_WRITE(1, fd, STR, strlen(STR));
-	SAFE_CLOSE(fd);
-
-	len_sz = 4;
-	len_arr = malloc(sizeof(size_t) * len_sz);
-	len_arr[0] = 11;
-	len_arr[1] = page_size - 1;
-	len_arr[2] = page_size;
-	len_arr[3] = page_size + 1;
-
-	off_sz = 6;
-	off_arr = malloc(sizeof(loff_t *) * off_sz);
-	for (i = 1; i &lt; off_sz; i++)
-		off_arr[i] = malloc(sizeof(loff_t));
-
-	off_arr[0] = NULL;
-	*off_arr[1] = 0;
-	*off_arr[2] = 17;
-	*off_arr[3] = page_size - 1;
-	*off_arr[4] = page_size;
-	*off_arr[5] = page_size + 1;
-}
+static int page_size;
+static int errcount, numcopies;
+static int fd_in, fd_out;
 
 static int check_file_content(const char *fname1, const char *fname2,
 	loff_t *off1, loff_t *off2, size_t len)
@@ -90,52 +54,37 @@ static int check_file_content(const char *fname1, const char *fname2,
 }
 
 static int check_file_offset(const char *m, int fd, loff_t len,
-	loff_t *off_ori, loff_t *off_after)
+		loff_t *off_before, loff_t *off_after)
 {
+	loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
 	int ret = 0;
 
-	if (off_ori) {
-		/* FD should stay untouched, and off_in/out is updated */
-		loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
-
-		if (fd_off == 0) {
-			if (verbose)
-				tst_res(TPASS, "%s FD offset unchanged", m);
-		} else {
-			tst_res(TFAIL, "%s FD offset changed: %ld",
+	if (off_before) {
+		/*
+		 * copy_file_range offset is given:
+		 * - fd offset should stay 0,
+		 * - copy_file_range offset is updated
+		 */
+		if (fd_off != 0) {
+			tst_res(TFAIL,
+				"%s fd offset unexpectedly changed: %ld",
 				m, (long)fd_off);
 			ret = 1;
-		}
 
-		if (!off_after) {
-			tst_res(TFAIL, "%s offset is NULL", m);
-			ret = 1;
-		}
-
-		if ((off_after) &amp;&amp; (*off_ori + len == *off_after)) {
-			if (verbose) {
-				tst_res(TPASS, "%s offset advanced as"
-					" expected: %ld", m, (long)*off_after);
-			}
-		} else {
+		} else if (*off_before + len != *off_after) {
 			tst_res(TFAIL, "%s offset unexpected value: %ld",
 				m, (long)*off_after);
 			ret = 1;
 		}
-	} else {
-		/* FD offset is advanced by len */
-		loff_t fd_off = SAFE_LSEEK(fd, 0, SEEK_CUR);
-
-		if (fd_off == len) {
-			if (verbose) {
-				tst_res(TPASS, "%s FD offset changed as"
-					" expected: %ld", m, (long)fd_off);
-			}
-		} else {
-			tst_res(TFAIL, "%s FD offset unexpected value: %ld",
+	}
+	/*
+	 * no copy_file_range offset given:
+	 * - fd offset advanced by length
+	 */
+	else if (fd_off != len) {
+		tst_res(TFAIL, "%s fd offset unexpected value: %ld",
 				m, (long)fd_off);
-			ret = 1;
-		}
+		ret = 1;
 	}
 
 	return ret;
@@ -143,77 +92,135 @@ static int check_file_offset(const char *m, int fd, loff_t len,
 
 static void test_one(size_t len, loff_t *off_in, loff_t *off_out)
 {
+	int ret;
 	size_t to_copy = len;
-	int fd_in, fd_out, ret;
-	loff_t *off_in_ori = off_in;
-	loff_t *off_out_ori = off_out;
-	loff_t off_in_copy;
-	loff_t off_out_copy;
+	loff_t off_in_value_copy, off_out_value_copy;
+	loff_t *off_new_in  = &amp;off_in_value_copy;
+	loff_t *off_new_out = &amp;off_out_value_copy;
 	char str_off_in[32], str_off_out[32];
 
 	if (off_in) {
-		off_in_copy = *off_in;
-		off_in = &amp;off_in_copy;
+		off_in_value_copy = *off_in;
 		sprintf(str_off_in, "%ld", (long)*off_in);
 	} else {
+		off_new_in = NULL;
 		strcpy(str_off_in, "NULL");
 	}
 
 	if (off_out) {
-		off_out_copy = *off_out;
-		off_out = &amp;off_out_copy;
+		off_out_value_copy = *off_out;
 		sprintf(str_off_out, "%ld", (long)*off_out);
 	} else {
+		off_new_out = NULL;
 		strcpy(str_off_out, "NULL");
 	}
 
-	fd_in = SAFE_OPEN(TEST_FILE_1, O_RDONLY);
-	fd_out = SAFE_OPEN(TEST_FILE_2, O_CREAT | O_WRONLY | O_TRUNC, 0644);
-
 	/*
 	 * copy_file_range() will return the number of bytes copied between
 	 * files. This could be less than the length originally requested.
 	 */
 	do {
-		TEST(tst_syscall(__NR_copy_file_range, fd_in, off_in, fd_out,
-			off_out, to_copy, 0));
+		TEST(sys_copy_file_range(fd_in, off_new_in, fd_out,
+				off_new_out, to_copy, 0));
 		if (TST_RET == -1) {
 			tst_res(TFAIL | TTERRNO, "copy_file_range() failed");
-			SAFE_CLOSE(fd_in);
-			SAFE_CLOSE(fd_out);
+			errcount++;
 			return;
 		}
 
 		to_copy -= TST_RET;
 	} while (to_copy &gt; 0);
 
-	ret = check_file_content(TEST_FILE_1, TEST_FILE_2,
-		off_in_ori, off_out_ori, len);
-	if (ret)
+	ret = check_file_content(FILE_SRC_PATH, FILE_DEST_PATH,
+		off_in, off_out, len);
+	if (ret) {
 		tst_res(TFAIL, "file contents do not match");
+		errcount++;
+		return;
+	}
 
-	ret |= check_file_offset("(in)", fd_in, len, off_in_ori, off_in);
-	ret |= check_file_offset("(out)", fd_out, len, off_out_ori, off_out);
+	ret |= check_file_offset("(in)", fd_in, len, off_in, off_new_in);
+	ret |= check_file_offset("(out)", fd_out, len, off_out, off_new_out);
+
+	if (ret != 0) {
+		tst_res(TFAIL, "off_in: %s, off_out: %s, len: %ld",
+				str_off_in, str_off_out, (long)len);
+		errcount++;
+	}
+}
 
-	tst_res(ret == 0 ? TPASS : TFAIL, "off_in: %s, off_out: %s, len: %ld",
-			str_off_in, str_off_out, (long)len);
+static void open_files(void)
+{
+	fd_in  = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
+	fd_out = SAFE_OPEN(FILE_DEST_PATH, O_CREAT | O_WRONLY | O_TRUNC, 0644);
+}
 
-	SAFE_CLOSE(fd_in);
-	SAFE_CLOSE(fd_out);
+static void close_files(void)
+{
+	if (fd_out &gt; 0)
+		SAFE_CLOSE(fd_out);
+	if (fd_in  &gt; 0)
+		SAFE_CLOSE(fd_in);
 }
 
 static void copy_file_range_verify(void)
 {
 	int i, j, k;
 
-	for (i = 0; i &lt; len_sz; i++)
-		for (j = 0; j &lt; off_sz; j++)
-			for (k = 0; k &lt; off_sz; k++)
+	errcount = numcopies = 0;
+	size_t len_arr[]	= {11, page_size-1, page_size, page_size+1};
+	loff_t off_arr_values[]	= {0, 17, page_size-1, page_size, page_size+1};
+
+	int num_offsets = ARRAY_SIZE(off_arr_values) + 1;
+	loff_t *off_arr[num_offsets];
+
+	off_arr[0] = NULL;
+	for (i = 1; i &lt; num_offsets; i++)
+		off_arr[i] = &amp;off_arr_values[i-1];
+
+	/* Test all possible cobinations of given lengths and offsets */
+	for (i = 0; i &lt; (int)ARRAY_SIZE(len_arr); i++)
+		for (j = 0; j &lt; num_offsets; j++)
+			for (k = 0; k &lt; num_offsets; k++) {
+				open_files();
 				test_one(len_arr[i], off_arr[j], off_arr[k]);
+				close_files();
+				numcopies++;
+			}
+
+	if (errcount == 0)
+		tst_res(TPASS,
+			"copy_file_range completed all %d copy jobs successfully!",
+			numcopies);
+	else
+		tst_res(TFAIL, "copy_file_range failed %d of %d copy jobs.",
+				errcount, numcopies);
+}
+
+static void setup(void)
+{
+	int i, fd;
+
+	syscall_info();
+
+	page_size = getpagesize();
+
+	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
+	/* Writing page_size * 4 of data into test file */
+	for (i = 0; i &lt; (int)(page_size * 4); i++)
+		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
+	SAFE_CLOSE(fd);
+}
+
+static void cleanup(void)
+{
+	close_files();
 }
 
 static struct tst_test test = {
 	.setup = setup,
+	.cleanup = cleanup,
 	.needs_tmpdir = 1,
 	.test_all = copy_file_range_verify,
+	.test_variants = TEST_VARIANTS,
 };
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
new file mode 100644
index 000000000..07c0207c2
--- /dev/null
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC
+ * Author: Christian Amann <a class="moz-txt-link-rfc2396E" href="mailto:camann@suse.com">&lt;camann@suse.com&gt;</a>
+ */
+
+/*
+ * Tests basic error handling of the
+ * copy_file_range syscall
+ *
+ * 1) Try to copy contents to file open as readonly
+ *    -&gt; EBADF
+ * 2) Try to copy contents to file on different mounted
+ *    filesystem -&gt; EXDEV
+ * 3) Try to copy contents to directory -&gt; EISDIR
+ * 4) Try to copy contents to a file opened with the
+ *    O_APPEND flag -&gt; EBADF
+ * 5) Try to copy contents to closed filedescriptor
+ *    -&gt; EBADF
+ * 6) Try to copy contents with invalid 'flags' value
+ *    -&gt; EINVAL
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "copy_file_range.h"
+
+static int fd_src;
+static int fd_dest;
+static int fd_rdonly;
+static int fd_mnted;
+static int fd_dir;
+static int fd_closed;
+static int fd_append;
+
+static struct tcase {
+	int	*copy_to_fd;
+	int	flags;
+	int	exp_err;
+} tcases[] = {
+	{&amp;fd_rdonly,	0,	EBADF},
+	{&amp;fd_mnted,	0,	EXDEV},
+	{&amp;fd_dir,	0,	EISDIR},
+	{&amp;fd_append,	0,	EBADF},
+	{&amp;fd_closed,	0,	EBADF},
+	{&amp;fd_dest,	-1,	EINVAL},
+};
+
+static void verify_copy_file_range(unsigned int n)
+{
+	struct tcase *tc = &amp;tcases[n];
+
+	TEST(sys_copy_file_range(fd_src, 0, *tc-&gt;copy_to_fd,
+				0, CONTSIZE, tc-&gt;flags));
+
+	if (TST_RET == -1) {
+		if (tc-&gt;exp_err == TST_ERR) {
+			tst_res(TPASS | TTERRNO,
+					"copy_file_range failed as expected");
+		} else {
+			tst_res(TFAIL | TTERRNO,
+				"copy_file_range failed unexpectedly; expected %s, but got",
+				tst_strerrno(tc-&gt;exp_err));
+			return;
+		}
+	} else {
+		tst_res(TFAIL,
+			"copy_file_range returned wrong value: %ld", TST_RET);
+	}
+}
+
+static void cleanup(void)
+{
+	if (fd_append &gt; 0)
+		SAFE_CLOSE(fd_append);
+	if (fd_dir &gt; 0)
+		SAFE_CLOSE(fd_dir);
+	if (fd_mnted &gt; 0)
+		SAFE_CLOSE(fd_mnted);
+	if (fd_rdonly &gt; 0)
+		SAFE_CLOSE(fd_rdonly);
+	if (fd_dest &gt; 0)
+		SAFE_CLOSE(fd_dest);
+	if (fd_src &gt; 0)
+		SAFE_CLOSE(fd_src);
+}
+
+static void setup(void)
+{
+	syscall_info();
+
+	if (access(FILE_DIR_PATH, F_OK) == -1)
+		SAFE_MKDIR(FILE_DIR_PATH, 0777);
+
+	fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
+	fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
+	fd_rdonly = SAFE_OPEN(FILE_RDONL_PATH, O_RDONLY | O_CREAT, 0664);
+	fd_mnted  = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
+	fd_dir    = SAFE_OPEN(FILE_DIR_PATH, O_DIRECTORY);
+	fd_closed = -1;
+	fd_append = SAFE_OPEN(FILE_DEST_PATH,
+			O_RDWR | O_CREAT | O_APPEND, 0664);
+
+	SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
+}
+
+static struct tst_test test = {
+	.test = verify_copy_file_range,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.dev_fs_type = "ext4",
+	.test_variants = TEST_VARIANTS,
+};
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
new file mode 100644
index 000000000..18e411af2
--- /dev/null
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range03.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 SUSE LLC
+ * Author: Christian Amann <a class="moz-txt-link-rfc2396E" href="mailto:camann@suse.com">&lt;camann@suse.com&gt;</a>
+ */
+
+/*
+ * Copies the contents of one file into another and
+ * checks if the timestamp gets updated in the process.
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "copy_file_range.h"
+
+static int fd_src;
+static int fd_dest;
+
+unsigned long get_timestamp(int fd)
+{
+	struct stat filestat;
+
+	fstat(fd, &amp;filestat);
+	return filestat.st_mtime;
+}
+
+static void verify_copy_file_range_timestamp(void)
+{
+	loff_t offset;
+	unsigned long timestamp, updated_timestamp;
+
+	timestamp = get_timestamp(fd_dest);
+	usleep(1000000);
+
+	offset = 0;
+	TEST(sys_copy_file_range(fd_src, &amp;offset,
+			fd_dest, 0, CONTSIZE, 0));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO,
+				"copy_file_range unexpectedly failed");
+
+	updated_timestamp = get_timestamp(fd_dest);
+
+	if (timestamp == updated_timestamp)
+		tst_brk(TFAIL, "copy_file_range did not update timestamp.");
+
+	tst_res(TPASS, "copy_file_range sucessfully updated the timestamp!");
+}
+
+static void cleanup(void)
+{
+	if (fd_dest &gt; 0)
+		SAFE_CLOSE(fd_dest);
+	if (fd_src  &gt; 0)
+		SAFE_CLOSE(fd_src);
+}
+
+static void setup(void)
+{
+	syscall_info();
+
+	fd_dest = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
+	fd_src  = SAFE_OPEN(FILE_SRC_PATH,  O_RDWR | O_CREAT, 0664);
+	SAFE_WRITE(1, fd_src,  CONTENT,  CONTSIZE);
+	SAFE_CLOSE(fd_src);
+	fd_src = SAFE_OPEN(FILE_SRC_PATH, O_RDONLY);
+}
+
+
+static struct tst_test test = {
+	.test_all = verify_copy_file_range_timestamp,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.test_variants = TEST_VARIANTS,
+};
</pre>
    </blockquote>
  </body>
</html>

--------------1C5938FAC8AA0971FFFA3D74--

--===============1088321878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1088321878==--
