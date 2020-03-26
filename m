Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80764193C0C
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 10:38:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2496B3C4AD8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 10:38:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 788A43C3362
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 10:38:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EFC1A1A00CAB
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 10:38:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C6B8AC5F
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 09:38:17 +0000 (UTC)
To: Jozef Pupava <jpupava@suse.cz>, ltp@lists.linux.it
References: <20200324143837.51d2df15@daedruan>
From: Martin Doucha <mdoucha@suse.cz>
Autocrypt: addr=mdoucha@suse.cz; keydata=
 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
Message-ID: <4be42fd5-51e1-3716-2646-07cd06602262@suse.cz>
Date: Thu, 26 Mar 2020 10:38:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200324143837.51d2df15@daedruan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Update syscalls/fsync02 to new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

On 24. 03. 20 14:38, Jozef Pupava wrote:
> Acked-by: Martin Doucha <mdoucha@suse.cz>
> Signed-off-by: Jozef Pupava <jpupava@suse.com>
> ---
>  testcases/kernel/syscalls/fsync/fsync02.c | 235 ++++++++++--------------------
>  1 file changed, 77 insertions(+), 158 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fsync/fsync02.c b/testcases/kernel/syscalls/fsync/fsync02.c
> index 1e5f9ee00..9506b4868 100644
> --- a/testcases/kernel/syscalls/fsync/fsync02.c
> +++ b/testcases/kernel/syscalls/fsync/fsync02.c
> @@ -1,195 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - *
> - *   Copyright (c) International Business Machines  Corp., 2001
> - *
> - *   This program is free software;  you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; either version 2 of the License, or
> - *   (at your option) any later version.
> - *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - *   the GNU General Public License for more details.
> - *
> - *   You should have received a copy of the GNU General Public License
> - *   along with this program;  if not, write to the Free Software
> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + * Copyright (c) Wayne Boyer, International Business Machines  Corp., 2001
> + * Copyright (c) 2019 SUSE LLC, Jozef Pupava <jpupava@suse.com>
>   */
>  
>  /*
> - * NAME
> - *	fsync02.c
> - *
> - * DESCRIPTION
> - *	Create a sparse file, fsync it, and time the fsync
> - *
> - * ALGORITHM
> - *	1. Create a file.
> - *	2. Write to the file at equally spaced intervals up to a max block
> - *	3. Check if the time limit was exceeded.
> - *
> - * USAGE:  <for command-line>
> - *  fsync02 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -f   : Turn off functionality Testing.
> - *             -i n : Execute test n times.
> - *             -I x : Execute test for x seconds.
> - *             -P x : Pause for x seconds between iterations.
> - *             -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *
> - * RESTRICTIONS
> - *	None
> + * Test Description:
> + *  Test fsync() return value on test file
> + *  fsync() has to finish within TIME_LIMIT.
>   */
>  
>  #include <stdio.h>
> -#include <unistd.h>
> +#include <stdlib.h>
>  #include <sys/types.h>
>  #include <sys/statvfs.h>
>  #include <fcntl.h>
> -#include <errno.h>
>  #include <sys/resource.h>
> -#include "test.h"
> -#include "safe_macros.h"
>  #include <time.h>
> +#include "tst_test.h"
>  
>  #define BLOCKSIZE 8192
>  #define MAXBLKS 262144
>  #define TIME_LIMIT 120
>  
> -char *TCID = "fsync02";
> -int TST_TOTAL = 1;
> -
> -void setup(void);
> -void cleanup(void);
> -
>  char tempfile[40] = "";
> -int fd, pid;
> +char pbuf[BUFSIZ];
> +int fd;
>  off_t max_blks = MAXBLKS;
>  
>  struct statvfs stat_buf;
>  
> -int main(int ac, char **av)
> -{
> -	int lc;
> -
> -	off_t offsetret, offset;
> -	char pbuf[BUFSIZ];
> -	int ret, max_block = 0;
> -	int i;
> -	time_t time_start, time_end;
> -	double time_delta;
> -	int data_blocks = 0;
> -	long int random_number;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		while (max_block <= data_blocks) {
> -			random_number = random();
> -			max_block = random_number % max_blks;
> -			data_blocks = random_number % 1000 + 1;
> -		}
> -
> -		for (i = 1; i <= data_blocks; i++) {
> -			offset = i * ((BLOCKSIZE * max_block) / data_blocks);
> -			offset -= BUFSIZ;
> -			if ((offsetret = lseek(fd, offset, SEEK_SET)) != offset)
> -				tst_brkm(TBROK | TERRNO, cleanup,
> -					 "lseek failed: %ld, %ld", offsetret,
> -					 offset);
> -			if ((ret = write(fd, pbuf, BUFSIZ)) != BUFSIZ)
> -				tst_brkm(TBROK, cleanup, "write failed");
> -		}
> -		if (time(&time_start) == -1)
> -			tst_brkm(TBROK | TERRNO, cleanup,
> -				 "getting start time failed");
> -
> -		TEST(fsync(fd));
> -
> -		if (time(&time_end) == -1)
> -			tst_brkm(TBROK | TERRNO, cleanup,
> -				 "getting end time failed");
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "fsync failed");
> -			continue;
> -		}
> -
> -		if (time_end < time_start)
> -			tst_resm(TBROK,
> -				 "timer broken end %ld < start %ld",
> -				 time_end, time_start);
> -
> -		if ((time_delta =
> -		     difftime(time_end, time_start)) > TIME_LIMIT)
> -			tst_resm(TFAIL,
> -				 "fsync took too long: %lf seconds; "
> -				 "max_block: %d; data_blocks: %d",
> -				 time_delta, max_block, data_blocks);
> -		else
> -			tst_resm(TPASS, "fsync succeeded in an "
> -				 "acceptable amount of time");
> -
> -		SAFE_FTRUNCATE(cleanup, fd, 0);
> -	}
> -
> -	sync();
> -	cleanup();
> -	tst_exit();
> -}
> -
> -/*
> - * setup() - performs all ONE TIME setup for this test.
> - */
> -void setup(void)
> -{
> +static void setup(void) {
>  	/* free blocks avail to non-superuser */
>  	unsigned long f_bavail;
>  
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	/* make a temporary directory and cd to it */
> -	tst_tmpdir();
> +	fd = SAFE_OPEN("tempfile", O_RDWR | O_CREAT | O_TRUNC, 0777);
>  
> -	sprintf(tempfile, "%s.%d", TCID, pid = getpid());
> -	srand48(pid);
> -
> -	if ((fd = open(tempfile, O_RDWR | O_CREAT | O_TRUNC, 0777)) == -1)
> -		tst_brkm(TBROK, cleanup, "open failed");
> -
> -	if (fstatvfs(fd, &stat_buf) != 0)
> -		tst_brkm(TBROK, cleanup, "fstatvfs failed");
> +	if (fstatvfs(fd, &stat_buf) != 0) {
> +		tst_brk(TBROK, "fstatvfs failed");
> +	}
>  
>  	f_bavail = (stat_buf.f_bavail * stat_buf.f_frsize) / BLOCKSIZE;

Looks like the original test has another bug here. The correct
calculation is:
f_bavail = (stat_buf.f_bavail * stat_buf.f_bsize) / BLOCKSIZE;

f_frsize is the fragment size, a fraction of a real block used for
features like tail packing (stuffing multiple small files into the same
physical block). But file systems which don't support tail packing
generally have f_frsize == f_bsize.

Sorry for not noticing this earlier. Could you include a fix for this in
the second patch?

> -	if (f_bavail && (f_bavail < MAXBLKS))
> +	if (f_bavail && (f_bavail < MAXBLKS)) {
>  		max_blks = f_bavail;
> +	}
>  
>  #ifdef LARGEFILE
> -	if ((fcntl(fd, F_SETFL, O_LARGEFILE)) == -1)
> -		tst_brkm(TBROK | TERRNO, cleanup,
> -			 "fcntl(.., O_LARGEFILE) failed");
> -
> -	if (write(fd, pbuf, BUFSIZ) != BUFSIZ)
> -		tst_brkm(TBROK | TERRNO, cleanup, "write(fd, pbuf, ..) failed");
> +	SAFE_FCNTL(fd, F_SETFL, O_LARGEFILE);
> +	SAFE_WRITE(1, fd, pbuf, BUFSIZ);
>  #endif
>  }
>  
> -void cleanup(void)
> -{
> -	if (close(fd) == -1)
> -		tst_resm(TWARN | TERRNO, "close failed");
> +static void run(void) {
> +	off_t offset;
> +	int i;
> +	int max_block = 0;
> +	int data_blocks = 0;
> +	time_t time_start, time_end;
> +	double time_delta;
> +	long int random_number;
> +
> +	while (max_block <= data_blocks) {
> +		random_number = rand();
> +		max_block = random_number % max_blks;
> +		data_blocks = random_number % 1000 + 1;
> +	}
>  
> -	tst_rmdir();
> +	for (i = 1; i <= data_blocks; i++) {
> +		offset = i * ((BLOCKSIZE * max_block) / data_blocks);
> +		offset -= BUFSIZ;
> +		SAFE_LSEEK(fd, offset, SEEK_SET);
> +		SAFE_WRITE(1, fd, pbuf, BUFSIZ);
> +	}
> +	time_start = time(0);
> +
> +	TEST(fsync(fd));
> +
> +	time_end = time(0);
> +
> +	if (time_end == -1) {
> +		tst_res(TFAIL | TTERRNO, "getting end time failed");
> +	} else if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "fsync failed");
> +	} else if (TST_RET != 0) {
> +		tst_res(TFAIL | TTERRNO,
> +		"fsync failed with unexpected return value");
> +	} else if (time_end < time_start) {
> +		tst_res(TFAIL,
> +		"timer broken end %ld < start %ld",
> +		time_end, time_start);
> +	} else if ((time_delta =
> +		difftime(time_end, time_start)) > TIME_LIMIT) {
> +		tst_res(TFAIL,
> +		"fsync took too long: %lf seconds; "
> +		"max_block: %d; data_blocks: %d",
> +		time_delta, max_block, data_blocks);
> +	} else {
> +		tst_res(TPASS,
> +		"fsync succeeded in an acceptable amount of time");
> +	}
> +	SAFE_FTRUNCATE(fd, 0);
> +}
>  
> +static void cleanup(void) {
> +	SAFE_CLOSE(fd);
>  }
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1
> +};
> 


-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
