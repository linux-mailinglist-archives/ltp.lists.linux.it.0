Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A3410C47
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Sep 2021 17:55:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C2963C2274
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Sep 2021 17:55:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD82A3C2170
 for <ltp@lists.linux.it>; Sun, 19 Sep 2021 17:55:01 +0200 (CEST)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 9DC931400200
 for <ltp@lists.linux.it>; Sun, 19 Sep 2021 17:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=MKdpU
 9TcACjKqWerYfmQrMbvKWpOTyvChdY1ApygILY=; b=ZH5hT1tUJG3BUaPjwaWGi
 4TCD/W9x1qjEXdiIL4H5yc7gHZZLGE14oeCNXBj+3HJajBT2wdy2Th/WHoH0Vysl
 kDnMi1wPqGK3lQpcfH0V6jr/e3MgnkQ9tq1Rr2JGtcTA0M+SNP7djiRw/ShazaPO
 rLaPN2EHSGgqAwZkistzpQ=
Received: from [192.168.0.11] (unknown [183.210.46.254])
 by smtp11 (Coremail) with SMTP id D8CowACnvZk8XUdhD2E1Bg--.97S2;
 Sun, 19 Sep 2021 23:54:45 +0800 (CST)
To: QI Fuli <fukuri.sai@gmail.com>, ltp@lists.linux.it
References: <20210918121114.10694-1-qi.fuli@fujitsu.com>
 <20210918121114.10694-3-qi.fuli@fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <1c895681-f5db-6c43-fa07-e82e08b133c7@163.com>
Date: Sun, 19 Sep 2021 23:54:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210918121114.10694-3-qi.fuli@fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: D8CowACnvZk8XUdhD2E1Bg--.97S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3tFykWrWUWw45Gw4kuF48Zwb_yoWDXF4DpF
 9rXry8GF4kJFy0kFZ2qw43Xa1rC39xWF1UKw4UZanYgF4fXryrtr4SgF43Xa4kGrZ3Wa4r
 Way5ur93Ja1qqF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jPgAwUUUUU=
X-Originating-IP: [183.210.46.254]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiqAgTXlc7V+5YxAAAsk
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/5] syscalls/dup2/dup202: Convert to new API
 and merge dup204 into dup202
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 9/18/21 8:11 PM, QI Fuli wrote:
> From: QI Fuli <qi.fuli@fujitsu.com>
>
>   - merge dup204 (check whether the inode number are the same) into dup202

I am fine to check both inode number and mode for regular file.

But why did you remove the subtests for pipe? I think dup204 is designed 
to test pipe.

>
> Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
> ---
>   testcases/kernel/syscalls/dup2/dup202.c | 210 ++++++++----------------
>   testcases/kernel/syscalls/dup2/dup204.c | 128 ---------------
>   2 files changed, 71 insertions(+), 267 deletions(-)
>   delete mode 100644 testcases/kernel/syscalls/dup2/dup204.c
>
> diff --git a/testcases/kernel/syscalls/dup2/dup202.c b/testcases/kernel/syscalls/dup2/dup202.c
> index c87769fa9..cae945c0e 100644
> --- a/testcases/kernel/syscalls/dup2/dup202.c
> +++ b/testcases/kernel/syscalls/dup2/dup202.c
> @@ -1,167 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
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
> + * Copyright (c) International Business Machines  Corp., 2001
> + * 07/2001 Ported by Wayne Boyer
>    */
>   
> -/*
> - * NAME
> - *	dup202.c
> +/*\
> + * [Description]
>    *
> - * DESCRIPTION
> - *	Is the access mode the same for both file descriptors?
> - *		0: read only ?	"0444"
> - *		1: write only ? "0222"
> - *		2: read/write ? "0666"
> + * Test whether the access mode and inode number are the same for both file
> + * descriptors.
>    *
> - * ALGORITHM
> - *	Creat a file with each access mode; dup each file descriptor;
> - *	stat each file descriptor and compare modes of each pair
> - *
> - * USAGE:  <for command-line>
> - *  dup202 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
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
> + * - 0: read only ? "0444"
> + * - 1: write only ? "0222"
> + * - 2: read/write ? "0666"
>    */
>   
> -#include <sys/types.h>
> -#include <sys/stat.h>
>   #include <errno.h>
> -#include <fcntl.h>
>   #include <stdio.h>
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -char *TCID = "dup202";
> -int TST_TOTAL = 3;
> -
> -void setup(void);
> -void cleanup(void);
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
>   
> -char testfile[40];
> -int fail;
> -int newfd;
> +static char testfile[40];
> +static int ofd, nfd;
>   
>   /* set these to a known index into our local file descriptor table */
> -int duprdo = 10, dupwro = 20, duprdwr = 30;
> +static int duprdo = 10, dupwro = 20, duprdwr = 30;
>   
> -struct test_case_t {
> +static struct tcase {
>   	int *nfd;
>   	mode_t mode;
> -} TC[] = {
> -	/* The first test creat(es) a file with mode 0444 */
> -	{
> -	&duprdo, (S_IRUSR | S_IRGRP | S_IROTH)},
> -	    /* The second test creat(es) a file with mode 0222 */
> -	{
> -	&dupwro, (S_IWUSR | S_IWGRP | S_IWOTH)},
> -	    /* The third test creat(es) a file with mode 0666 */
> -	{
> -	&duprdwr,
> -		    (S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IWGRP | S_IWOTH)}
> +} tcases[]= {
> +	{&duprdo, (S_IRUSR | S_IRGRP | S_IROTH)},
> +	{&dupwro, (S_IWUSR | S_IWGRP | S_IWOTH)},
> +	{&duprdwr, (S_IRUSR | S_IRGRP | S_IROTH | S_IWUSR | S_IWGRP | S_IWOTH)},
>   };
>   
> -int main(int ac, char **av)
> +static void setup(void)
>   {
> -	int lc;
> -	int i, ofd;
> -	struct stat oldbuf, newbuf;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		/* loop through the test cases */
> -		for (i = 0; i < TST_TOTAL; i++) {
> -
> -			if ((ofd = creat(testfile, TC[i].mode)) == -1)
> -				tst_brkm(TBROK | TERRNO, cleanup,
> -					 "creat failed");
> -
> -			TEST(dup2(ofd, *TC[i].nfd));
> -
> -			if (TEST_RETURN == -1) {
> -				tst_resm(TFAIL | TTERRNO,
> -					 "call failed unexpectedly");
> -				continue;
> -			}
> -
> -			/* stat the original file */
> -			SAFE_FSTAT(cleanup, ofd, &oldbuf);
> -
> -			/* stat the duped file */
> -			SAFE_FSTAT(cleanup, *TC[i].nfd, &newbuf);
> -
> -			if (oldbuf.st_mode != newbuf.st_mode)
> -				tst_resm(TFAIL, "original and dup "
> -					 "modes do not match");
> -			else
> -				tst_resm(TPASS, "fstat shows new and "
> -					 "old modes are the same");
> -
> -			/* remove the file so that we can use it again */
> -			if (close(*TC[i].nfd) == -1)
> -				perror("close failed");
> -			if (close(ofd) == -1)
> -				perror("close failed");
> -			if (unlink(testfile) == -1)
> -				perror("unlink failed");
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	umask(0);
> +	sprintf(testfile, "dup202.%d", getpid());
>   }
>   
> -/*
> - * setup() - performs all ONE TIME setup for this test.
> - */
> -void setup(void)
> +static void cleanup(void)
>   {
> +	if (ofd > 0)
> +		SAFE_CLOSE(ofd);
> +	if (nfd > 0)
> +		SAFE_CLOSE(nfd);
> +}
>   
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> +static void run(unsigned int i)
> +{
> +	struct stat oldbuf, newbuf;
> +	struct tcase *tc = tcases + i;
>   
> -	TEST_PAUSE;
> +	ofd = SAFE_CREAT(testfile, tc->mode);
> +	nfd = *tc->nfd;
>   
> -	tst_tmpdir();
> +	TEST(dup2(ofd, nfd));
>   
> -	(void)umask(0);
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "call failed unexpectedly");
> +		goto free;
> +	}
>   
> -	sprintf(testfile, "dup202.%d", getpid());
> +	/* stat the original file */
> +	SAFE_FSTAT(ofd, &oldbuf);
> +
> +	/* stat the duped file */
> +	SAFE_FSTAT(nfd, &newbuf);
> +
> +	if (oldbuf.st_mode != newbuf.st_mode)
> +		tst_res(TFAIL, "original(%o) and duped(%o) are not same mode",
> +					oldbuf.st_mode, newbuf.st_mode);
> +	else
> +		tst_res(TPASS, "original(%o) and duped(%o) are the same mode",
> +					oldbuf.st_mode, newbuf.st_mode);
> +
> +	if (oldbuf.st_ino != newbuf.st_ino)
> +		tst_res(TFAIL, "original(%ld) and duped(%ld) are not same inode",
> +					oldbuf.st_ino, newbuf.st_ino);
> +	else
> +		tst_res(TPASS, "original(%ld) and duped(%ld) are not same inode",
> +					oldbuf.st_ino, newbuf.st_ino);
> +
> +	SAFE_CLOSE(nfd);
> +free:
> +	SAFE_CLOSE(ofd);
> +	SAFE_UNLINK(testfile);
>   }
>   
> -/*
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *	       completion or premature exit.
> - */
> -void cleanup(void)
> -{
> -	tst_rmdir();
> -}
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +};
> diff --git a/testcases/kernel/syscalls/dup2/dup204.c b/testcases/kernel/syscalls/dup2/dup204.c
> deleted file mode 100644
> index a357bc17e..000000000
> --- a/testcases/kernel/syscalls/dup2/dup204.c
> +++ /dev/null
> @@ -1,128 +0,0 @@
> -/*
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
> - */
> -
> -/*
> - * NAME
> - *	dup204.c
> - *
> - * DESCRIPTION
> - *	Testcase to check the basic functionality of dup2(2).
> - *
> - * ALGORITHM
> - *	attempt to call dup2() on read/write ends of a pipe
> - *
> - * USAGE:  <for command-line>
> - *  dup204 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -f   : Turn off functionality Testing.
> - *             -i n : Execute test n times.
> - *             -I x : Execute test for x seconds.
> - *             -P x : Pause for x seconds between iterations.
> - *             -t   : Turn on syscall timing.
> - *
> - * RESTRICTION
> - *	NONE
> - */
> -
> -#ifndef _GNU_SOURCE
> -#define _GNU_SOURCE
> -#endif
> -#include <sys/types.h>
> -#include <fcntl.h>
> -#include <sys/stat.h>
> -#include <errno.h>
> -#include <signal.h>
> -#include <string.h>
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -void setup();
> -void cleanup();
> -
> -char *TCID = "dup204";
> -int TST_TOTAL = 2;
> -
> -int fd[2];
> -int nfd[2];
> -
> -int main(int ac, char **av)
> -{
> -	int lc;
> -	int i;
> -	struct stat oldbuf, newbuf;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		/* loop through the test cases */
> -		for (i = 0; i < TST_TOTAL; i++) {
> -			TEST(dup2(fd[i], nfd[i]));
> -
> -			if (TEST_RETURN == -1) {
> -				tst_resm(TFAIL, "call failed unexpectedly");
> -				continue;
> -			}
> -
> -			SAFE_FSTAT(cleanup, fd[i], &oldbuf);
> -			SAFE_FSTAT(cleanup, nfd[i], &newbuf);
> -
> -			if (oldbuf.st_ino != newbuf.st_ino)
> -				tst_resm(TFAIL, "original and duped "
> -					 "inodes do not match");
> -			else
> -				tst_resm(TPASS, "original and duped "
> -					 "inodes are the same");
> -
> -			SAFE_CLOSE(cleanup, TEST_RETURN);
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -void setup(void)
> -{
> -	fd[0] = -1;
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	SAFE_PIPE(cleanup, fd);
> -}
> -
> -void cleanup(void)
> -{
> -	int i;
> -
> -	for (i = 0; i < (int)ARRAY_SIZE(fd); i++) {
> -		close(fd[i]);
> -		close(nfd[i]);
> -	}
> -
> -	tst_rmdir();
> -}


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
