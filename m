Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA3475C30
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 16:48:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D823E3C8E7A
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Dec 2021 16:48:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3E7F93C1821
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 16:48:51 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0C0D6140055C
 for <ltp@lists.linux.it>; Wed, 15 Dec 2021 16:48:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 278BA212B6;
 Wed, 15 Dec 2021 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1639583329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myVIkBj2vzbwCOSDlPSb2UUKMoTntKIKbamQyzkvLuY=;
 b=B+iCY5pNLJSjHYD048GAgM2FdOO6qreAo1R+fZRRwcB+ZnrH+LTCihg634K75OqAMlo0sR
 2h3I/0OBxVNzKrvtRxxHFdxAcFYhulkF8hjcangVSC+GfR+80q+p+MoVUGigOYYUcNab8v
 xz2bjMIB/bafWZXFI1T1Y3mCjH0cpGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1639583329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myVIkBj2vzbwCOSDlPSb2UUKMoTntKIKbamQyzkvLuY=;
 b=H4OZ9P+wELcM3kBZun2ncGkeJ2eGnx2sQoYU6X5LiMZs6YEGVTI+nwZ0Re91axiEFZoLCi
 uFskcz5cakp+YsBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 087DB13B45;
 Wed, 15 Dec 2021 15:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2cflAWEOumHUDwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 15 Dec 2021 15:48:49 +0000
Date: Wed, 15 Dec 2021 16:50:14 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YboOtg0XorMEaOZi@yuki>
References: <20211213163802.8830-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213163802.8830-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Refactoring aiodio_append.c using LTP API
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
> diff --git a/runtest/ltp-aiodio.part4 b/runtest/ltp-aiodio.part4
> index bb8abfdf1..ef1cfdac6 100644
> --- a/runtest/ltp-aiodio.part4
> +++ b/runtest/ltp-aiodio.part4
> @@ -34,16 +34,16 @@ DIO07 dio_sparse
>  DIO08 dio_sparse
>  DIO09 dio_sparse
>  #Running aiodio_append
> -AD000 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD001 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD002 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD003 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD004 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD005 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD006 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD007 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD008 aiodio_append $TMPDIR/aiodio.$$/file2
> -AD009 aiodio_append $TMPDIR/aiodio.$$/file2
> +AD000 aiodio_append
> +AD001 aiodio_append
> +AD002 aiodio_append
> +AD003 aiodio_append
> +AD004 aiodio_append
> +AD005 aiodio_append
> +AD006 aiodio_append
> +AD007 aiodio_append
> +AD008 aiodio_append
> +AD009 aiodio_append

I suppose that we will add some parameters to these tests later on,
right?

>  #Running dio_append
>  ADI000 dio_append
>  ADI001 dio_append
> diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_append.c b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
> index 5d97ed941..9fbf70b25 100644
> --- a/testcases/kernel/io/ltp-aiodio/aiodio_append.c
> +++ b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
> @@ -1,128 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2004 Daniel McNeil <daniel@osdl.org>
>   *               2004 Open Source Development Lab
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
> - *
> - * Module: .c
> - * Change History:
> - *
> - * 2/2004  Marty Ridgeway (mridge@us.ibm.com) Changes to adapt to LTP
> + *               2004  Marty Ridgeway <mridge@us.ibm.com>
> + * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*\
> + * [Description]
>   *
> -*/
> + * Append zeroed data to a file using libaio while other processes are doing
> + * buffered reads and check if the buffer reads always see zero.
> + */
>  
>  #define _GNU_SOURCE
>  
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <sys/types.h>
> -#include <signal.h>
> -#include <errno.h>
> -#include <fcntl.h>
> -#include <unistd.h>
> -
> -#include "config.h"
> -#include "test.h"
> -
> -char *TCID = "aiodio_append";
> +#include "tst_test.h"
>  
>  #ifdef HAVE_LIBAIO
> +#include <stdlib.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
>  #include <libaio.h>
> +#include "common.h"
>  
> -#define NUM_CHILDREN 8
> +static int *run_child;
>  
> -#include "common_checkzero.h"
> +static char *str_numchildren;
> +static char *str_writesize;
> +static char *str_numaio;
> +static char *str_appends;
>  
> -int read_eof(char *filename)
> -{
> -	int fd;
> -	int i;
> -	int r;
> -	char buf[4096];
> -
> -	while ((fd = open(filename, O_RDONLY)) < 0) {
> -		sleep(1);	/* wait for file to be created */
> -	}
> -
> -	for (i = 0; i < 1000000; i++) {
> -		off_t offset;
> -		char *bufoff;
> -
> -		offset = lseek(fd, SEEK_END, 0);
> -		r = read(fd, buf, 4096);
> -		if (r > 0) {
> -			if ((bufoff = check_zero(buf, r))) {
> -				fprintf(stderr, "non-zero read at offset %p\n",
> -					offset + bufoff);
> -				exit(1);
> -			}
> -		}
> -	}
> -	return 0;
> -}
> -
> -#define NUM_AIO 16
> -#define AIO_SIZE 64*1024
> +static int numchildren;
> +static long long writesize;
> +static int numaio;
> +static int appends;
> +static long long alignment;
>  
>  /*
>   * append to the end of a file using AIO DIRECT.
>   */
> -void aiodio_append(char *filename)
> +static void aiodio_append(char *filename, int bcount, long long align, long long ws, int naio)
>  {
>  	int fd;
>  	void *bufptr;
>  	int i;
>  	int w;
> -	struct iocb iocb_array[NUM_AIO];
> -	struct iocb *iocbs[NUM_AIO];
> +	struct iocb iocb_array[naio];
> +	struct iocb *iocbs[naio];
>  	off_t offset = 0;
>  	io_context_t myctx;
>  	struct io_event event;
>  	struct timespec timeout;
>  
> -	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
> -	if (fd < 0) {
> -		perror("cannot create file");
> -		return;
> -	}
> +	fd = SAFE_OPEN(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
>  
> +	/*
> +	 * Prepare AIO write context.
> +	 */
>  	memset(&myctx, 0, sizeof(myctx));
> -	io_queue_init(NUM_AIO, &myctx);
> -
> -	for (i = 0; i < NUM_AIO; i++) {
> -		TEST(posix_memalign(&bufptr, 4096, AIO_SIZE));
> -		if (TEST_RETURN) {
> -			tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
> -			return;
> -		}
> -		memset(bufptr, 0, AIO_SIZE);
> -		io_prep_pwrite(&iocb_array[i], fd, bufptr, AIO_SIZE, offset);
> +	w = io_queue_init(naio, &myctx);
> +	if (w < 0)
> +		tst_brk(TBROK, "io_queue_init: %s", tst_strerrno(-w));
> +
> +	for (i = 0; i < naio; i++) {
> +		bufptr = SAFE_MEMALIGN(align, ws);
> +		memset(bufptr, 0, ws);
> +		io_prep_pwrite(&iocb_array[i], fd, bufptr, ws, offset);
>  		iocbs[i] = &iocb_array[i];
> -		offset += AIO_SIZE;
> +		offset += ws;
>  	}
>  
>  	/*
> -	 * Start the 1st NUM_AIO requests
> +	 * Start the 1st AIO requests.
>  	 */
> -	if ((w = io_submit(myctx, NUM_AIO, iocbs)) < 0) {
> -		fprintf(stderr, "io_submit write returned %d\n", w);
> +	w = io_submit(myctx, naio, iocbs);
> +	if (w < 0) {
> +		io_destroy(myctx);
> +		tst_brk(TBROK, "io_submit (multiple): %s", tst_strerrno(-w));
>  	}
>  
>  	/*
>  	 * As AIO requests finish, keep issuing more AIOs.
>  	 */
> -	for (; i < 1000; i++) {
> +	for (; i < bcount; i++) {
>  		int n = 0;
>  		struct iocb *iocbp;
>  
> @@ -131,56 +92,97 @@ void aiodio_append(char *filename)
>  			iocbp = (struct iocb *)event.obj;
>  
>  			if (n > 0) {

It's not visible in this patch but there is another if (n > 0) right
above this one which makes this one redundant.

> -				io_prep_pwrite(iocbp, fd, iocbp->u.c.buf,
> -					       AIO_SIZE, offset);
> -				offset += AIO_SIZE;
> -				if ((w = io_submit(myctx, 1, &iocbp)) < 0) {
> -					fprintf(stderr,
> -						"write %d returned %d\n", i, w);
> +				io_prep_pwrite(iocbp, fd, iocbp->u.c.buf, ws, offset);
> +				offset += ws;
> +				w = io_submit(myctx, 1, &iocbp);
> +				if (w < 0) {
> +					io_destroy(myctx);
> +					tst_brk(TBROK, "io_submit (single): %s", tst_strerrno(-w));
>  				}
>  			}
>  		}
>  	}
>  }

>  
> -int main(int argc, char **argv)
> +static void setup(void)
> +{
> +	struct stat sb;
> +	int maxaio;
> +
> +	numchildren = 8;
> +	writesize = 64 * 1024;
> +	numaio = 16;
> +	appends = 1000;
> +	alignment = 0;
> +
> +	SAFE_FILE_SCANF("/proc/sys/fs/aio-max-nr", "%d", &maxaio);
> +	tst_res(TINFO, "Maximum AIO blocks: %d", maxaio);
> +
> +	if (tst_parse_int(str_numchildren, &numchildren, 1, INT_MAX))
> +		tst_brk(TBROK, "Invalid number of children '%s'", str_numchildren);
> +
> +	if (tst_parse_filesize(str_writesize, &writesize, 1, LLONG_MAX))
> +		tst_brk(TBROK, "Size of the file to write '%s'", str_writesize);
> +
> +	if (tst_parse_int(str_numaio, &numaio, 1, maxaio))
> +		tst_brk(TBROK, "Number of async IO blocks '%s'", str_numaio);

I do not think that we want to TBROK if numaio is greater than maxaio.
Ideally we will parse the numaio without any upper limit then check it
againts maxaio and produce TCONF if maxaio < numaio.

> +	if (tst_parse_int(str_appends, &appends, 1, INT_MAX))
> +		tst_brk(TBROK, "Invalid number of appends '%s'", str_appends);
> +
> +	SAFE_STAT(".", &sb);
> +	alignment = sb.st_blksize;
> +
> +	run_child = SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> +}
> +
> +static void cleanup(void)
> +{
> +	*run_child = 0;
> +	SAFE_MUNMAP(run_child, sizeof(int));
> +}
> +
> +static void run(void)
>  {
> -	int pid[NUM_CHILDREN];
> -	int num_children = 1;
> +	char *filename = "aiodio_append";
> +	int status;
>  	int i;
> -	char *filename = argv[1];
> -
> -	printf("Starting aio/dio append test...\n");
> -
> -	for (i = 0; i < num_children; i++) {
> -		if ((pid[i] = fork()) == 0) {
> -			/* child */
> -			return read_eof(filename);
> -		} else if (pid[i] < 0) {
> -			/* error */
> -			perror("fork error");
> -			break;
> -		} else {
> -			/* Parent */
> -			continue;
> +
> +	*run_child = 1;
> +
> +	for (i = 0; i < numchildren; i++) {
> +		if (!SAFE_FORK()) {
> +			io_read_eof(filename, run_child);
> +			return;
>  		}
>  	}
>  
> -	/*
> -	 * Parent appends to end of file using direct i/o
> -	 */
> +	tst_res(TINFO, "Parent append to file");
>  
> -	aiodio_append(filename);
> +	aiodio_append(filename, appends, alignment, writesize, numaio);
>  
> -	for (i = 0; i < num_children; i++) {
> -		kill(pid[i], SIGTERM);
> -	}
> +	if (SAFE_WAITPID(-1, &status, WNOHANG))
> +		tst_res(TFAIL, "Non zero bytes read");
> +	else
> +		tst_res(TPASS, "All bytes read were zeroed");
>  
> -	return 0;
> +	*run_child = 0;
>  }
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +	.forks_child = 1,
> +	.options = (struct tst_option[]) {
> +		{"n:", &str_numchildren, "Number of threads (default 16)"},
                                                     ^
						     processes

> +		{"s:", &str_writesize, "Size of the file to write (default 64K)"},
> +		{"c:", &str_appends, "Number of appends (default 1000)"},
> +		{"b:", &str_numaio, "Number of async IO blocks (default 16)"},
> +		{}

And the options needs the same treatement as in the dio_append (unless
you want to fix the library first :-).

> +	},
> +};
>  #else
> -int main(void)
> -{
> -	tst_brkm(TCONF, NULL, "test requires libaio and it's development packages");
> -}
> +TST_TEST_TCONF("test requires libaio and its development packages");
>  #endif
> -- 
> 2.34.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
