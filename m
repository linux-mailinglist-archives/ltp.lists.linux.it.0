Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A63E58F2
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 13:20:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E9B93C70BA
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 13:20:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0120D3C0CFD
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 13:20:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4ADAF200BC8
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 13:20:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 979E622036;
 Tue, 10 Aug 2021 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628594425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZXplbvSKWQLCQxeR7OYDp8j4SK06if6CERbsCqPpG/c=;
 b=BULxOVhoopN06HJhWTNU2P6qeBoUHg5FpiZzwEFauEcnR9c5Lzx1igNf1ZHdibClLEBII6
 nuiMhIctc5ku0bBjGOt1er6LT11K/9xk/a2+KqQUSJ1izqPNq4GtObq1nkUP71UF/yYKwV
 ksLN57L2OrP2wpu/RyCR5Xxkl7m47Hg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628594425;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZXplbvSKWQLCQxeR7OYDp8j4SK06if6CERbsCqPpG/c=;
 b=Z9oY339TpYyu8Hci6WJ6puMI5VpS5MbbBWHSR7gAkrRUXh+DiejVlu9KToJRLxwLU/ylSO
 UIU8vsKMl9tDqxDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BFB913AFE;
 Tue, 10 Aug 2021 11:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9iqLHPlgEmH3QQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Aug 2021 11:20:25 +0000
Date: Tue, 10 Aug 2021 13:20:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YRJhBYJP1yAzuY8+@yuki>
References: <20210806072421.8892-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806072421.8892-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/4] syscalls/chmod03: Convert to new API
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
First of all, the chmod03 and chmod04 are nearly identical, the only
difference seems to be that one of them works with directory and the
second one with a file. We should merge these two tests into a one.

> diff --git a/testcases/kernel/syscalls/chmod/chmod03.c b/testcases/kernel/syscalls/chmod/chmod03.c
> index f53e437e4..1e1d829da 100644
> --- a/testcases/kernel/syscalls/chmod/chmod03.c
> +++ b/testcases/kernel/syscalls/chmod/chmod03.c
> @@ -1,23 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   *   Copyright (c) International Business Machines  Corp., 2001
>   *
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
> + *   07/2001 Ported by Wayne Boyer
>   */
> 
> -/*
> - * Test Name: chmod03
> +/*\
> + * [Description]
>   *
>   * Test Description:
>   *  Verify that, chmod(2) will succeed to change the mode of a file
> @@ -31,56 +20,10 @@
>   *  chmod() should return value 0 on success and succeeds to change
>   *  the mode of specified file with sticky bit set on it.
>   *
> - * Algorithm:
> - *  Setup:
> - *   Setup signal handling.
> - *   Create temporary directory.
> - *   Pause for SIGUSR1 if option specified.
> - *
> - *  Test:
> - *   Loop if the proper options are given.
> - *   Execute system call
> - *   Check return code, if system call failed (return=-1)
> - *   	Log the errno and Issue a FAIL message.
> - *   Otherwise,
> - *   	Verify the Functionality of system call
> - *      if successful,
> - *      	Issue Functionality-Pass message.
> - *      Otherwise,
> - *		Issue Functionality-Fail message.
> - *  Cleanup:
> - *   Print errno log and/or timing stats if options given
> - *   Delete the temporary directory created.
> - *
> - * Usage:  <for command-line>
> - *  chmod03 [-c n] [-e] [-f] [-i n] [-I x] [-p x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -e   : Turn on errno logging.
> - *             -f   : Turn off functionality Testing.
> - *	       -i n : Execute test n times.
> - *	       -I x : Execute test for x seconds.
> - *	       -P x : Pause for x seconds between iterations.
> - *	       -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *
> - * RESTRICTIONS:
> - *  This test should be run by 'non-super-user' only.
> - *
>   */
> 
> -#include <stdio.h>
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <fcntl.h>
> -#include <errno.h>
> -#include <string.h>
> -#include <signal.h>
>  #include <pwd.h>
> -
> -#include "test.h"
> -#include "safe_macros.h"
> +#include "tst_test.h"
> 
>  #define FILE_MODE       S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
>  #define PERMS		01777	/*
> @@ -89,95 +32,53 @@
>  				 */
>  #define TESTFILE	"testfile"
> 
> -char *TCID = "chmod03";
> -int TST_TOTAL = 1;
> -char nobody_uid[] = "nobody";
> -struct passwd *ltpuser;
> +static char nobody_uid[] = "nobody";
> +static struct passwd *ltpuser;

There is no need to keep these as global variables if they are used only
in the setup.

> -void setup();			/* Main setup function for the test */
> -void cleanup();			/* Main cleanup function for the test */
> -
> -int main(int ac, char **av)
> +static void verify_chmod(void)
>  {
>  	struct stat stat_buf;
> -	int lc;
>  	mode_t file_mode;
> 
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		TEST(chmod(TESTFILE, PERMS));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "chmod(%s, %#o) failed",
> -				 TESTFILE, PERMS);
> -			continue;
> -		}
> -		if (stat(TESTFILE, &stat_buf) < 0) {
> -			tst_brkm(TFAIL | TERRNO, cleanup,
> -				 "stat(%s) failed", TESTFILE);
> -		}
> +	TST_EXP_PASS_SILENT(chmod(TESTFILE, PERMS), "chmod(%s, %#o) failed",
> +		TESTFILE, PERMS);
> +	if (TST_PASS) {
> +		SAFE_STAT(TESTFILE, &stat_buf);
>  		file_mode = stat_buf.st_mode;
> 
>  		/* Verify STICKY BIT set on testfile */
>  		if ((file_mode & PERMS) != PERMS) {
> -			tst_resm(TFAIL, "%s: Incorrect modes 0%3o, "
> -				 "Expected 0777", TESTFILE, file_mode);
> +			tst_res(TFAIL, "%s: Incorrect modes 0%3o, "
> +					"Expected 0777", TESTFILE, file_mode);
>  		} else {
> -			tst_resm(TPASS, "Functionality of "
> -				 "chmod(%s, %#o) successful",
> -				 TESTFILE, PERMS);
> +			tst_res(TPASS, "Functionality of "
> +					"chmod(%s, %#o) successful",
> +					TESTFILE, PERMS);
>  		}
>  	}

Most of the comments for chmod01 apply here as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
