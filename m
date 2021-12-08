Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DBC46D7AF
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Dec 2021 17:05:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87BDD3C6520
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Dec 2021 17:05:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C4B553C31DA
 for <ltp@lists.linux.it>; Wed,  8 Dec 2021 17:05:04 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9B78F1A01197
 for <ltp@lists.linux.it>; Wed,  8 Dec 2021 17:05:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78BB41FD5B;
 Wed,  8 Dec 2021 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1638979502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3FrRw/0SI2uTv0EkOZ+hyVgHEVJP8lVsWkmE0f0j6M=;
 b=s3wgu8OpsjsA080VMG3+OqaMmwhTODDTWGxGyu1zw51gwBYBKVxKbMViZwqGazPVU6Q13C
 NS4RT6e0/XCeB7wLvtMfZqGq3zN/gthwWwyoKUr6T5hl3CB+Xq/PTt6tE37fCUnf8zkArD
 0EXkmFDjrgR4RfDaIHqSPjWye3T6skE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1638979502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3FrRw/0SI2uTv0EkOZ+hyVgHEVJP8lVsWkmE0f0j6M=;
 b=wdjqcyTtI1gKBUPIxNLaoyzYo0vt0fAoDM4U7D0pE8wL9B0lHtW24BEvIKwzI0Vi0rySlf
 bV2ULPQSAhVxImDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 556AB13C8E;
 Wed,  8 Dec 2021 16:05:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2u+AE67XsGEDZAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 08 Dec 2021 16:05:02 +0000
Date: Wed, 8 Dec 2021 17:06:20 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: tangmeng <tangmeng@uniontech.com>
Message-ID: <YbDX/K2vMnAcGprB@yuki>
References: <20211117033951.16352-1-tangmeng@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211117033951.16352-1-tangmeng@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] fchownat/fchownat01: Convert to new API
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
First of all the patch has whitespace issues, please make sure to run
make check-fchownat01 and fix all the warnings before commiting the
changes.

> ---
>  testcases/kernel/syscalls/fchownat/fchownat.h |  15 +-
>  .../kernel/syscalls/fchownat/fchownat01.c     | 131 +++++-------------
>  2 files changed, 39 insertions(+), 107 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fchownat/fchownat.h b/testcases/kernel/syscalls/fchownat/fchownat.h
> index a95c26f93..75c435dab 100644
> --- a/testcases/kernel/syscalls/fchownat/fchownat.h
> +++ b/testcases/kernel/syscalls/fchownat/fchownat.h
> @@ -1,20 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2014 Fujitsu Ltd.
>   *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU Library General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> - *
>   */

This header has to be fixed as well, the new API uses tst_syscall()
instead of ltp_syscall().

>  #ifndef FCHOWNAT_H
> diff --git a/testcases/kernel/syscalls/fchownat/fchownat01.c b/testcases/kernel/syscalls/fchownat/fchownat01.c
> index 9f4ecded7..b18af54f4 100644
> --- a/testcases/kernel/syscalls/fchownat/fchownat01.c
> +++ b/testcases/kernel/syscalls/fchownat/fchownat01.c
> @@ -1,60 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *   Copyright (c) International Business Machines  Corp., 2006
>   *   AUTHOR: Yi Yang <yyangcdl@cn.ibm.com>
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
> - *   along with this program;  if not, write to the Free Software Foundation,
> - *   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */
> -/*
> - * DESCRIPTION
> - *	This test case will verify basic function of fchownat
> - *	added by kernel 2.6.16 or up.
> +
> +/*\
> + * [Description]
> + *
> + * This test case will verify basic function of fchownat
> + * added by kernel 2.6.16 or up.
>   */
> 
>  #define _GNU_SOURCE
> 
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <fcntl.h>
> -#include <unistd.h>
> -#include <stdlib.h>
> -#include <errno.h>
> -#include <string.h>
> -#include <signal.h>
> -
> -#include "test.h"
> -#include "safe_macros.h"
> +#include "tst_test.h"
>  #include "fchownat.h"
>  #include "lapi/fcntl.h"
> 
>  #define TESTFILE	"testfile"
> 
> -static void setup(void);
> -static void cleanup(void);
> -
>  static int dir_fd;
>  static int fd;
>  static int no_fd = -1;
>  static int cu_fd = AT_FDCWD;
> 
> -static struct test_case_t {
> +static struct tcase {
>  	int exp_ret;
>  	int exp_errno;
>  	int flag;
>  	int *fds;
>  	char *filenames;

These two should really be just fd and filename, since they are single
quantities they shouldn't be plural.

> -} test_cases[] = {
> +} tcases[] = {
>  	{0, 0, 0, &dir_fd, TESTFILE},
>  	{-1, ENOTDIR, 0, &fd, TESTFILE},
>  	{-1, EBADF, 0, &no_fd, TESTFILE},
> @@ -62,77 +38,46 @@ static struct test_case_t {
>  	{0, 0, 0, &cu_fd, TESTFILE},
>  };
> 
> -char *TCID = "fchownat01";
> -int TST_TOTAL = ARRAY_SIZE(test_cases);
> -static void fchownat_verify(const struct test_case_t *);
> -
> -int main(int ac, char **av)
> +static void verify_fchownat(unsigned int i)
>  {
> -	int lc;
> -	int i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> +	struct tcase *tc = &tcases[i];
> 
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -		for (i = 0; i < TST_TOTAL; i++)
> -			fchownat_verify(&test_cases[i]);
> +	if (tc->exp_ret == 0) {
> +		TST_EXP_PASS(fchownat(*(tc->fds), tc->filenames, geteuid(),
> +			getegid(), tc->flag),
> +		 	"fchownat() returned %ld, expected %d, errno=%d",
> +			 TST_RET, tc->exp_ret, tc->exp_errno);
                          ^
			  Here we should describe _what_ is being done,
			  the pass/fail messages are generated by the
			  macro itself. Printing return value or errno
			  here is wrong.

It should really be something as:

		"fchownat(%i, '%s', ..., %i)", *(tc->fds), tc->filename, tc->flag


> +	} else {
> +		TST_EXP_FAIL(fchownat(*(tc->fds), tc->filenames, geteuid(),
> +			getegid(), tc->flag), tc->exp_errno,
> +			 "fchownat() expected errno %d: %s",
> +			 tc->exp_ret, strerror(tc->exp_errno));
                          ^
			  Here as well.
>  	}
> -
> -	cleanup();
> -	tst_exit();
>  }
> 
>  static void setup(void)
>  {
> -	if ((tst_kvercmp(2, 6, 16)) < 0)
> -		tst_brkm(TCONF, NULL, "This test needs kernel 2.6.16 or newer");
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	dir_fd = SAFE_OPEN(cleanup, "./", O_DIRECTORY);
> -
> -	SAFE_TOUCH(cleanup, TESTFILE, 0600, NULL);
> -
> -	fd = SAFE_OPEN(cleanup, "testfile2", O_CREAT | O_RDWR, 0600);
> -}
> -
> -static void fchownat_verify(const struct test_case_t *test)
> -{
> -	TEST(fchownat(*(test->fds), test->filenames, geteuid(),
> -		      getegid(), test->flag));
> +	dir_fd = SAFE_OPEN("./", O_DIRECTORY);
> 
> -	if (TEST_RETURN != test->exp_ret) {
> -		tst_resm(TFAIL | TTERRNO,
> -			 "fchownat() returned %ld, expected %d, errno=%d",
> -			 TEST_RETURN, test->exp_ret, test->exp_errno);
> -		return;
> -	}
> +	SAFE_TOUCH(TESTFILE, 0600, NULL);
> 
> -	if (TEST_ERRNO == test->exp_errno) {
> -		tst_resm(TPASS | TTERRNO,
> -			 "fchownat() returned the expected errno %d: %s",
> -			 test->exp_ret, strerror(test->exp_errno));
> -	} else {
> -		tst_resm(TFAIL | TTERRNO,
> -			 "fchownat() failed unexpectedly; expected: %d - %s",
> -			 test->exp_errno, strerror(test->exp_errno));
> -	}
> +	fd = SAFE_OPEN("testfile2", O_CREAT | O_RDWR, 0600);
>  }
> 
>  static void cleanup(void)
>  {
> -	if (fd > 0)
> -		close(fd);
> +       if (fd > 0)
> +               close(fd);
> 
> -	if (dir_fd > 0)
> -		close(dir_fd);
> -
> -	tst_rmdir();
> +       if (dir_fd > 0)
> +               close(dir_fd);

These two should use SAFE_CLOSE()

>  }
> +
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.min_kver = "2.6.16",
> +	.test = verify_fchownat,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +};
> --
> 2.20.1
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
