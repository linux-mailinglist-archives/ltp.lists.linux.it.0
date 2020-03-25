Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B2A192A3F
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 14:40:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B9663C4BF7
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 14:40:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1BC053C4BA8
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 14:40:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1611F1401251
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 14:40:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0A1F2AD0B;
 Wed, 25 Mar 2020 13:40:03 +0000 (UTC)
Date: Wed, 25 Mar 2020 14:40:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200325134001.GF5404@yuki.lan>
References: <1585127864-1341-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585127864-1341-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] aio_return: Remove cases and refactor 4-1.c
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
Cc: liug.fnst@cn.fujitsu.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> From aio_return(3) manpage, the aio_return() function returns the
> final return status for the asynchronous I/O request with control
> block pointed to by aiocbp. It should be called only once for any
> given request. If we want to call twice for same aiocbp, it only
> returns the last value. It doesn't make sense. So remove 2-1.c and
> 3-2.c.

For the open posix test you have to read the POSIX specification, not
the manuals that describe how the interface is implemented in Linux.

See: https://pubs.opengroup.org/onlinepubs/9699919799/

There it says that it may return error in case that it's called twice.
Linux the test returns UNTESTED because we got the last value stored in
the structure.

The 3-2.c seems to be bogus, the description says that if the aiocb is
reused for a subsequent AIO operation the aio_return() should work fine
to retrieve it's status, but it's nearly identicall to 2-1.c.

> For 4-1.c, it failed with the same reason. But we can refactor this
> , firstly call aio_return(&aiocb2) and then call aio_return(&aiocb).
> It tests whether value override.

Looking at the assertions.xml the assertion 2 and 4 are nearly
identical. The assertion 2 is a subset of assertion 4 so it makes sense
to remove 2-1.c at least.

I guess that the 3-2.c may be rewritten to submit two operations so that
we actually test what is in the description.

> Reported-by: Gang Liu <liug.fnst@cn.fujitsu.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  .../conformance/interfaces/aio_return/2-1.c   | 108 -----------------
>  .../conformance/interfaces/aio_return/3-2.c   | 111 ------------------
>  .../conformance/interfaces/aio_return/4-1.c   |  23 +++-
>  3 files changed, 18 insertions(+), 224 deletions(-)
>  delete mode 100644 testcases/open_posix_testsuite/conformance/interfaces/aio_return/2-1.c
>  delete mode 100644 testcases/open_posix_testsuite/conformance/interfaces/aio_return/3-2.c
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/2-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/2-1.c
> deleted file mode 100644
> index ac9873200..000000000
> --- a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/2-1.c
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -/*
> - * Copyright (c) 2004, Bull SA. All rights reserved.
> - * Created by:  Laurent.Vivier@bull.net
> - * This file is licensed under the GPL license.  For the full content
> - * of this license, see the COPYING file at the top level of this
> - * source tree.
> - */
> -
> -/*
> - * assertion:
> - *
> - *	aio_return() may be called exactly once to retrieve the return status.
> - *
> - * method:
> - *
> - *	- open a file
> - *	- fill in an aiocb for writing
> - *	- call aio_write using this aiocb
> - *	- call aio_return to get the aiocb status (number of bytes written)
> - *	- call aio_return again, return status should be -1
> - */
> -
> -#include <sys/stat.h>
> -#include <aio.h>
> -#include <errno.h>
> -#include <fcntl.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
> -#include <unistd.h>
> -#include "posixtest.h"
> -#include <time.h>
> -
> -#define TNAME "aio_return/2-1.c"
> -#define BUF_SIZE 111
> -
> -int main(void)
> -{
> -	char tmpfname[256];
> -	char buf[BUF_SIZE];
> -	struct aiocb aiocb;
> -	int fd, retval;
> -	struct timespec completion_wait_ts = {0, 10000000};
> -
> -	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
> -		return PTS_UNSUPPORTED;
> -
> -	snprintf(tmpfname, sizeof(tmpfname), "/tmp/pts_aio_return_2_1_%d",
> -		 getpid());
> -	unlink(tmpfname);
> -	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
> -
> -	if (fd == -1) {
> -		printf(TNAME " Error at open(): %s\n", strerror(errno));
> -		return PTS_UNRESOLVED;
> -	}
> -
> -	unlink(tmpfname);
> -
> -	memset(buf, 0xaa, BUF_SIZE);
> -	memset(&aiocb, 0, sizeof(struct aiocb));
> -	aiocb.aio_fildes = fd;
> -	aiocb.aio_buf = buf;
> -	aiocb.aio_nbytes = BUF_SIZE;
> -
> -	if (aio_write(&aiocb) == -1) {
> -		close(fd);
> -		printf(TNAME " Error at aio_write(): %s\n",
> -		       strerror(aio_error(&aiocb)));
> -		return PTS_FAIL;
> -	}
> -
> -	do {
> -		nanosleep(&completion_wait_ts, NULL);
> -		retval = aio_error(&aiocb);
> -	} while (retval == EINPROGRESS);
> -
> -	retval = aio_return(&aiocb);
> -
> -	if (0 < retval) {
> -
> -		if (retval != BUF_SIZE) {
> -			close(fd);
> -			printf(TNAME " aio_return didn't return expected size: "
> -			       "%d\n", retval);
> -			return PTS_FAIL;
> -		}
> -
> -		retval = aio_return(&aiocb);
> -
> -		if (retval != -1) {
> -			close(fd);
> -			printf(TNAME " Second call to aio_return() may "
> -			       "return -1; aio_return() returned %d\n", retval);
> -			return PTS_UNTESTED;
> -		}
> -
> -	} else {
> -		close(fd);
> -		printf(TNAME " Error at aio_error(): %s\n",
> -		       strerror(aio_error(&aiocb)));
> -		return PTS_UNRESOLVED;
> -	}
> -
> -	close(fd);
> -	printf("Test PASSED\n");
> -	return PTS_PASS;
> -}
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/3-2.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/3-2.c
> deleted file mode 100644
> index 883823bac..000000000
> --- a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/3-2.c
> +++ /dev/null
> @@ -1,111 +0,0 @@
> -/*
> - * Copyright (c) 2004, Bull SA. All rights reserved.
> - * Created by:  Laurent.Vivier@bull.net
> - * This file is licensed under the GPL license.  For the full content
> - * of this license, see the COPYING file at the top level of this
> - * source tree.
> - */
> -
> -/*
> - * assertion:
> - *
> - *	If the aiocbp is used to submit another asynchronous operation,
> - *	then aio_return may be successfully used to retrieve the return status.
> - *
> - * method:
> - *
> - *	- open a file
> - *	- fill in an aiocb for writing
> - *	- call aio_write using this aiocb
> - *	- call aio_return to get the aiocb status (number of bytes written)
> - *	- call aio_return again, return status should be -1
> - */
> -
> -#include <stdio.h>
> -#include <sys/types.h>
> -#include <unistd.h>
> -#include <sys/stat.h>
> -#include <fcntl.h>
> -#include <string.h>
> -#include <errno.h>
> -#include <stdlib.h>
> -#include <aio.h>
> -#include <time.h>
> -
> -#include "posixtest.h"
> -
> -#define TNAME "aio_return/3-2.c"
> -#define BUF_SIZE 4096
> -
> -int main(void)
> -{
> -	char tmpfname[256];
> -	char buf[BUF_SIZE];
> -	struct aiocb aiocb;
> -	int fd, retval;
> -	struct timespec completion_wait_ts = {0, 10000000};
> -
> -	if (sysconf(_SC_ASYNCHRONOUS_IO) < 200112L)
> -		return PTS_UNSUPPORTED;
> -
> -	snprintf(tmpfname, sizeof(tmpfname), "/tmp/pts_aio_return_3_2_%d",
> -		 getpid());
> -	unlink(tmpfname);
> -	fd = open(tmpfname, O_CREAT | O_RDWR | O_EXCL, S_IRUSR | S_IWUSR);
> -
> -	if (fd == -1) {
> -		printf(TNAME " Error at open(): %s\n", strerror(errno));
> -		return PTS_UNRESOLVED;
> -	}
> -
> -	unlink(tmpfname);
> -
> -	memset(buf, 0xaa, BUF_SIZE);
> -	memset(&aiocb, 0, sizeof(struct aiocb));
> -	aiocb.aio_fildes = fd;
> -	aiocb.aio_buf = buf;
> -	aiocb.aio_nbytes = BUF_SIZE;
> -
> -	if (aio_write(&aiocb) == -1) {
> -		close(fd);
> -		printf(TNAME " Error at aio_write(): %s\n",
> -		       strerror(aio_error(&aiocb)));
> -		return PTS_FAIL;
> -	}
> -
> -	do {
> -		nanosleep(&completion_wait_ts, NULL);
> -		retval = aio_error(&aiocb);
> -	} while (retval == EINPROGRESS);
> -
> -	retval = aio_return(&aiocb);
> -
> -	if (retval == -1) {
> -		printf(TNAME " Error at aio_error(): %s\n",
> -		       strerror(aio_error(&aiocb)));
> -		return PTS_UNRESOLVED;
> -	} else {
> -
> -		if (retval != BUF_SIZE) {
> -			close(fd);
> -			printf(TNAME " Error at aio_return(): %d, %s\n", retval,
> -			       strerror(aio_error(&aiocb)));
> -			return PTS_FAIL;
> -		}
> -
> -		retval = aio_return(&aiocb);
> -
> -		if (retval != -1 && aio_error(&aiocb) != EINVAL) {
> -			close(fd);
> -			printf(TNAME " aio_return() may fail with (-1, %d); "
> -			       "failed with (%d, %d) instead\n",
> -			       EINVAL, retval, aio_error(&aiocb));
> -			return PTS_UNTESTED;
> -		}
> -
> -	}
> -
> -	close(fd);
> -	printf("Test PASSED\n");
> -	return PTS_PASS;
> -}
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
> index 7a039b13f..770699b54 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
> @@ -17,8 +17,10 @@
>   *
>   *	- Open a file
>   *	- fill in an aiocb for writing
> - *	- call aio_write usign this aiocb
> + *	- call aio_write using this aiocb
>   *	- fill in a new aiocb
> + *	- call aio_write using this aiocb
> + *	- call aio_return with aiocb
>   *	- call aio_return with this last aiocb
>   */
>  
> @@ -86,20 +88,31 @@ int main(void)
>  		aiocb2.aio_fildes = fd;
>  		aiocb2.aio_buf = buf;
>  		aiocb2.aio_nbytes = BUF_SIZE;
> +		if (aio_write(&aiocb2) == -1) {
> +			close(fd);
> +			printf(TNAME " Error at aio_write(): %s\n", strerror(errno));
> +			return PTS_FAIL;
> +		}
> +
> +		do {
> +			nanosleep(&completion_wait_ts, NULL);
> +			retval = aio_error(&aiocb);
> +		} while (retval == EINPROGRESS);
>  
>  		retval = aio_return(&aiocb2);
>  
> -		if (retval != -1 || aio_error(&aiocb) != EINVAL) {
> +		if (retval != BUF_SIZE) {
>  			close(fd);
> -			printf(TNAME "aio_return() have not failed\n");
> -			return PTS_UNTESTED;
> +			printf(TNAME " Error at aio_return(&aiocb2): %d, %s\n", retval,
> +				strerror(aio_error(&aiocb)));
> +			return PTS_UNRESOLVED;
>  		}
>  
>  		retval = aio_return(&aiocb);
>  
>  		if (retval != BUF_SIZE) {
>  			close(fd);
> -			printf(TNAME " Error at aio_return(): %d, %s\n", retval,
> +			printf(TNAME " Error at aio_return(&aiocb): %d, %s\n", retval,
>  			       strerror(aio_error(&aiocb)));
>  			return PTS_UNRESOLVED;
>  		}
> -- 
> 2.23.0
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
