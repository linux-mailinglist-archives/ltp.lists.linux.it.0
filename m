Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D71456CB4
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 10:47:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 52A653C8A0F
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 10:47:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E2ED3C0930
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 10:47:49 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5231560214A
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 10:47:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CEF3A1FD38;
 Fri, 19 Nov 2021 09:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1637315266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQH1BZ2G/hGiOsIKD/YjoGqI9ijjqHnqOpAm3/1o+Yo=;
 b=mRdZu/gjh9M6xaOy9cCrlGxK/lotXRrmOk9liC+CmKQ0X8kKODtg8Ll085rNCSJdsGfzpb
 oaheKlWHhwFBp3T0fNz2zYuibB3Z1CQLjM6YGKrtytlo/J31zq01eJmVxBfv9cMaJGgsIp
 gC1fxhVQoGAtpgh1VW9+3cyrebIb7lo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1637315266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQH1BZ2G/hGiOsIKD/YjoGqI9ijjqHnqOpAm3/1o+Yo=;
 b=hKR2xlSUXjZmShB07hjBX/3cgE59tUj71xPzfZz7GeTj5NDQUeVZ/q6C9ZZA8yV86jp7Sc
 8GutXTo3aDE0+ECg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B761813DD5;
 Fri, 19 Nov 2021 09:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JXh0K8Jyl2EifAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 19 Nov 2021 09:47:46 +0000
Date: Fri, 19 Nov 2021 10:48:52 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <acervesato@suse.de>
Message-ID: <YZdzBGCnCXN8XDRA@yuki>
References: <20211118151631.17893-1-acervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211118151631.17893-1-acervesato@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] dio_truncate.c test refactory with LTP API
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
Nearly finished, a few comments below.

> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/io/ltp-aiodio/dio_truncate.c | 194 ++++++++----------
>  1 file changed, 85 insertions(+), 109 deletions(-)
> 
> diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
> index 27cf01525..28e229d59 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
> @@ -1,177 +1,153 @@
> -
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2004 Daniel McNeil <daniel@osdl.org>
> - *               2004 Open Source Development Lab
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
> + *				 2004 Open Source Development Lab
> + * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
>   */
>  
> -/*
> - * Change History:
> +/*\
> + * [Description]
>   *
> - * 2/2004  Marty Ridgeway (mridge@us.ibm.com) Changes to adapt to LTP
> + * This test is mixing DIO and truncate operations checking if they can be used
> + * together at the same time. Multiple children are spawned to read a file that
> + * is edited using DIO write/read operations. Algorithm:
> + * 
     ^
     Trailing whitespace, please make sure not to add these.

Also I would write the DIO as 'direct I/O' to make things more clear.

> + * - Spawn multiple children which start to read on 'file'
> + * - Parent start to fill and truncate 'file' many times with zero char when
> + *   children are reading
> + * - Parent start to fill and truncate a junk file many times with non-zero char
>   *
> + * If no issues occures on DIO/truncate operations and the file always contains
> + * non-zero characters, test PASS. Otherwise, test will FAIL.
>   */
> +
>  #define _GNU_SOURCE
>  
>  #include <stdlib.h>
> +#include <stdio.h>
> +#include <sys/stat.h>
>  #include <sys/types.h>
> -#include <signal.h>
> -#include <errno.h>
>  #include <fcntl.h>
> -#include <stdio.h>
> -#include <unistd.h>
> -#include <memory.h>
> -#include <string.h>
> -#include <limits.h>
> +#include "tst_test.h"
>  
> -#include "test.h"
> +#define NUM_CHILDREN 16
> +#define FILE_SIZE (64 * 1024)
>  
> -#define NUM_CHILDREN 8
> +static int *run_child;
>  
> -char *check_zero(unsigned char *buf, int size)
> +static char *check_zero(char *buf, int size)
>  {
> -	unsigned char *p;
> +	char *p;
>  
>  	p = buf;
>  
>  	while (size > 0) {
>  		if (*buf != 0) {
> -			fprintf(stderr,
> -				"non zero buffer at buf[%d] => 0x%02x,%02x,%02x,%02x\n",
> -				buf - p, (unsigned int)buf[0],
> -				size > 1 ? (unsigned int)buf[1] : 0,
> -				size > 2 ? (unsigned int)buf[2] : 0,
> -				size > 3 ? (unsigned int)buf[3] : 0);
> -			fprintf(stderr, "buf %p, p %p\n", buf, p);
> +			tst_res(TINFO,
> +					"non zero buffer at buf[%lu] => 0x%02x,%02x,%02x,%02x",
> +					buf - p, (unsigned int)buf[0],
> +					size > 1 ? (unsigned int)buf[1] : 0,
> +					size > 2 ? (unsigned int)buf[2] : 0,
> +					size > 3 ? (unsigned int)buf[3] : 0);

These parameters would be better aligned with the start of the TINFO

> +			tst_res(TINFO, "buf %p, p %p", buf, p);
>  			return buf;
>  		}
>  		buf++;
>  		size--;
>  	}
> -	return 0;		/* all zeros */
> +	return 0; /* all zeros */
>  }
>  
> -int dio_read(char *filename)
> +static void dio_read(const char *filename, size_t bs)
>  {
>  	int fd;
>  	int r;
> -	void *bufptr = NULL;
> +	char *bufptr;
>  
> -	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
> -	if (TEST_RETURN) {
> -		tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
> -		return -1;
> -	}
> +	bufptr = SAFE_MEMALIGN(getpagesize(), bs);
>  
> -	while ((fd = open(filename, O_DIRECT | O_RDONLY)) < 0) {
> -	}
> -	fprintf(stderr, "dio_truncate: child reading file\n");
> -	while (1) {
> +	while ((fd = open(filename, O_RDONLY | O_DIRECT, 0666)) < 0)
> +		usleep(100);
> +
> +	tst_res(TINFO, "child reading file");
> +	while (*run_child) {
>  		off_t offset;
>  		char *bufoff;
>  
>  		/* read the file, checking for zeros */
> -		offset = lseek(fd, SEEK_SET, 0);
> +		offset = SAFE_LSEEK(fd, SEEK_SET, 0);
>  		do {
>  			r = read(fd, bufptr, 64 * 1024);
>  			if (r > 0) {
> -				if ((bufoff = check_zero(bufptr, r))) {
> -					fprintf(stderr,
> -						"non-zero read at offset %p\n",
> -						offset + bufoff);
> -					exit(1);
> +				bufoff = check_zero(bufptr, r);
> +				if (bufoff) {
> +					tst_res(TINFO, "non-zero read at offset %p", offset + bufoff);
> +					SAFE_CLOSE(fd);
> +					return;
>  				}
>  				offset += r;
>  			}
>  		} while (r > 0);
>  	}
> -	return 0;
> +
> +	SAFE_CLOSE(fd);
> +
> +	tst_res(TPASS, "zero buffer only after truncate");
>  }
>  
> -void dio_append(char *filename, int fill)
> +static void dio_append(const char *path, char pattern, size_t bs, size_t bcount)
>  {
>  	int fd;
> -	void *bufptr = NULL;
> -	int i;
> -	int w;
> -
> -	fd = open(filename, O_DIRECT | O_WRONLY | O_CREAT, 0666);
> +	size_t i;
> +	char *bufptr;
>  
> -	if (fd < 0) {
> -		perror("cannot create file");
> -		return;
> -	}
> +	bufptr = SAFE_MEMALIGN(getpagesize(), bs);
> +	memset(bufptr, pattern, bs);
>  
> -	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
> -	if (TEST_RETURN) {
> -		tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
> -		close(fd);
> -		return;
> -	}
> +	fd = SAFE_OPEN(path, O_CREAT | O_WRONLY | O_DIRECT, 0666);
>  
> -	memset(bufptr, fill, 64 * 1024);
> +	for (i = 0; i < bcount; i++)
> +		SAFE_WRITE(1, fd, bufptr, bs);
>  
> -	for (i = 0; i < 1000; i++) {
> -		if ((w = write(fd, bufptr, 64 * 1024)) != 64 * 1024) {
> -			fprintf(stderr, "write %d returned %d\n", i, w);
> -		}
> -	}
> -	close(fd);
> +	SAFE_CLOSE(fd);

This function is called repeatedly, so we should either free the buffer
at the end.


>  }
>  
> -int main(void)
> +static void run(void)
>  {
> -	char filename[PATH_MAX];
> +	char *filename = "file";
> +	int filesize = FILE_SIZE;
> +	int num_children = NUM_CHILDREN;
>  	int pid[NUM_CHILDREN];
> -	int num_children = 1;
> +	int status;
>  	int i;
>  
> -	snprintf(filename, sizeof(filename), "%s/aiodio/file",
> -		 getenv("TMP") ? getenv("TMP") : "/tmp");
> +	run_child = SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);

This should be mapped in the test setup() function and unmapped in the
cleanup(). The run() function itself can be executed serveral times with
-i parameter and there is no point to map this over and over.

> +	*run_child = 1;
>  
>  	for (i = 0; i < num_children; i++) {
> -		if ((pid[i] = fork()) == 0) {
> -			/* child */
> -			return dio_read(filename);
> -		} else if (pid[i] < 0) {
> -			/* error */
> -			perror("fork error");
> -			break;
> -		} else {
> -			/* Parent */
> -			continue;
> +		pid[i] = SAFE_FORK();
> +		if (pid[i] == 0) {
> +			dio_read(filename, filesize);
> +			return;
>  		}
>  	}
>  
> -	/*
> -	 * Parent creates a zero file using DIO.
> -	 * Truncates it to zero
> -	 * Create another file with '0xaa'
> -	 */
> -	for (i = 0; i < 100; i++) {
> -		dio_append(filename, 0);
> -		truncate(filename, 0);
> -		dio_append("junkfile", 0xaa);
> -		truncate("junkfile", 0);
> -	}
> -
>  	for (i = 0; i < num_children; i++) {
> -		kill(pid[i], SIGTERM);
> +		dio_append(filename, 0, filesize, 200);
> +		SAFE_TRUNCATE(filename, 0);
> +		dio_append("junkfile", 0xaa, filesize, 200);
> +		SAFE_TRUNCATE("junkfile", 0);
>  	}
>  
> -	return 0;

Actually as it is the test does not produce failures at all.

What is missing here is SAFE_WAITPID(-1, &status, WNOHANG); at the end
of the loop that appends and trucantes the file, if we find any child
did exit before we set run_child to 0 we have a failure.

Also I would move the TPASS here as well so that we have.

	int fail = 0;

	for (...) {
		append(foo);
		truncate(foo);
		append(foo);
		truncate(foo);

		if (SAFE_WAITPID(-1, &status, WNOHANG)) {
			fail = 1;
			break;
		}
	}

	if (fail)
		tst_res(TFAIL, "Non zero bytes read");
	else
		tst_res(TPASS, "All bytes read were zeroed");


Or we can do even better, since we have the shared memory set up anyways
we can put a structure with a failure counter in there as well.

struct ipc {
	int run_child;
	int fails;
} *ipc;


Then the child would increment the counter with atomic operation on a
falure.

	if (bufoff) {
		tst_atomic_inc(&ipc->fails);
		...
	}


And the main process would simply do:


	for (...) {
	        append(foo);
                truncate(foo);
                append(foo);
                truncate(foo);

                if (SAFE_WAITPID(-1, &status, WNOHANG))
			break;
	}

	*run_child = 0;

	for (i = 0; i < num_children; i++)
		SAFE_WAITPID(pid[i], &status, 0);


	if (ipc->fails)
		tst_res(TFAIL, "...");
	else
		tst_res(TPASS, "...");



> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.test_all = run,
> +	.forks_child = 1,
> +};
> -- 
> 2.33.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
