Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 063B1366ACD
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 14:29:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6355A3C6C13
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 14:29:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 127A13C2B59
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 14:29:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 085CA1401137
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 14:29:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78A1DAF52;
 Wed, 21 Apr 2021 12:29:03 +0000 (UTC)
Date: Wed, 21 Apr 2021 14:14:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YIAXGpM5Ys2fxIGg@yuki>
References: <20210421021742.32562-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421021742.32562-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setgid: Update to new API
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
> --- a/testcases/kernel/syscalls/setgid/setgid01.c
> +++ b/testcases/kernel/syscalls/setgid/setgid01.c
...
> -/*
> - *    AUTHOR		: William Roske
> - *    CO-PILOT		: Dave Fenner
>   */

Can we please have the documentation comment added here?

Just a single line with something as "Calls setgid() with current gid
and expects success." would suffice.

> +	TEST(SETGID(gid));
> 
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	if (TST_RET == -1)
> +		tst_res(TFAIL | TTERRNO, "setgid(%d) Failed", gid);
> +	else
> +		tst_res(TPASS, "setgid(%d) returned %ld", gid, TST_RET);

This should be just TST_EXP_PASS()

>  }
> 
>  static void setup(void)
>  {
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
>  	gid = getgid();
> -	GID16_CHECK(gid, setgid, cleanup);
> +	GID16_CHECK(gid, setgid);
>  }
> 
> -static void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +};
> diff --git a/testcases/kernel/syscalls/setgid/setgid02.c b/testcases/kernel/syscalls/setgid/setgid02.c
> index b3f4fd646..92e79eb86 100644
> --- a/testcases/kernel/syscalls/setgid/setgid02.c
> +++ b/testcases/kernel/syscalls/setgid/setgid02.c
> @@ -1,111 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) International Business Machines  Corp., 2001
>   *  Ported by Wayne Boyer
> - *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - * the GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program;  if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */
> 
> -/*
> - * Testcase to ensure that the setgid() system call sets errno to EPERM
> +/*\
> + * [Description]
> + * Testcase to ensure that the setgid() system call sets errno to EPERM.
>   *
> - * ALGORITHM
> - *	Call setgid() to set the gid to that of root. Run this test as
> - *	ltpuser1, and expect to get EPERM
> + * [Algorithm]
> + * Call setgid() to set the gid to that of root. Run this test as
> + * ltpuser1, and expect to get EPERM.
        ^
	nobody?

>   */
> -#include <pwd.h>
> -#include <errno.h>
> 
> -#include "test.h"
> -#include "compat_16.h"
> +#include <pwd.h>
> +#include "tst_test.h"
> +#include "compat_tst_16.h"
> 
> -TCID_DEFINE(setgid02);
> -int TST_TOTAL = 1;
> 
>  static char root[] = "root";
>  static char nobody_uid[] = "nobody";
> -static char nobody_gid[] = "nobody";
>  static struct passwd *ltpuser;
> 
> -static void setup(void);
> -static void cleanup(void);
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
> -	struct passwd *getpwnam(), *rootpwent;
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> +	struct passwd *rootpwent;
> 
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> +	rootpwent = SAFE_GETPWNAM(root);
> 
> -		if ((rootpwent = getpwnam(root)) == NULL) {
> -			tst_brkm(TBROK, cleanup, "getpwnam failed for user id "
> -				 "%s", root);
> -		}
> +	GID16_CHECK(rootpwent->pw_gid, setgid);
> 
> -		GID16_CHECK(rootpwent->pw_gid, setgid, cleanup);
> +	TEST(SETGID(rootpwent->pw_gid));
> 
> -		TEST(SETGID(cleanup, rootpwent->pw_gid));
> +	if (TST_RET != -1)
> +		tst_brk(TBROK, "call succeeded unexpectedly");
> 
> -		if (TEST_RETURN != -1) {
> -			tst_resm(TFAIL, "call succeeded unexpectedly");
> -			continue;
> -		}
> -
> -		if (TEST_ERRNO != EPERM) {
> -			tst_resm(TFAIL, "setgid set invalid errno, expected: "
> -				 "EPERM, got: %d\n", TEST_ERRNO);
> -		} else {
> -			tst_resm(TPASS, "setgid returned EPERM");
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	if (TST_ERR != EPERM)
> +		tst_res(TFAIL | TTERRNO, "setgid set invalid errno");
> +	else
> +		tst_res(TPASS, "setgid returned EPERM");

And this should be just TST_EXP_FAIL()

>  }
> 
>  static void setup(void)
>  {
> -	tst_require_root();
> -
>  	/* Switch to nobody user for correct error code collection */
> -	ltpuser = getpwnam(nobody_uid);
> -	if (ltpuser == NULL)
> -		tst_brkm(TBROK, cleanup, "getpwnam failed for user id %s",
> -			nobody_uid);
> -
> -	if (setgid(ltpuser->pw_gid) == -1) {
> -		tst_resm(TINFO, "setgid failed to "
> -			 "to set the effective gid to %d", ltpuser->pw_gid);
> -		perror("setgid");
> -	}
> +	ltpuser = SAFE_GETPWNAM(nobody_uid);
> 
> -	if (setuid(ltpuser->pw_uid) == -1) {
> -		tst_resm(TINFO, "setuid failed to "
> -			 "to set the effective uid to %d", ltpuser->pw_uid);
> -		perror("setuid");
> -	}
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	SAFE_SETGID(ltpuser->pw_gid);
> +	SAFE_SETUID(ltpuser->pw_uid);
>  }
> 
> -static void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.needs_root = 1,
> +	.setup = setup,
> +	.test_all = run,
> +};
> diff --git a/testcases/kernel/syscalls/setgid/setgid03.c b/testcases/kernel/syscalls/setgid/setgid03.c
> index f29347a13..9e4b3b736 100644
> --- a/testcases/kernel/syscalls/setgid/setgid03.c
> +++ b/testcases/kernel/syscalls/setgid/setgid03.c
> @@ -1,100 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) International Business Machines  Corp., 2001
>   *  Ported by Wayne Boyer
> - *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - * the GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program;  if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>   */
> 
> -/*
> - * ALGORITHM
> - *	As root sets the current group id to ltpuser1, verify the results
> +/*\
> + * [Algorithm]
> + * As root sets the current group id to ltpuser1, verify the results.
                                           ^              ^
					   nobody         |
					             This is very
						     generic and
						     useless.

This should rather be something as:

"As a root sets current group id to nobody and expects success."


>   */
> -#include <pwd.h>
> -#include <errno.h>
> -
> -#include "test.h"
> -#include <compat_16.h>
> 
> -TCID_DEFINE(setgid03);
> -int TST_TOTAL = 1;
> +#include <pwd.h>
> +#include "tst_test.h"
> +#include <compat_tst_16.h>
> 
>  static char ltpuser1[] = "nobody";
>  static char root[] = "root";
>  static struct passwd *ltpuser1pwent, *rootpwent;
>  static gid_t mygid;
> 
> -static void setup(void);
> -static void cleanup(void);
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
> -	int lc;
> +	TEST(SETGID(ltpuser1pwent->pw_gid));
> 
> -	tst_parse_opts(ac, av, NULL, NULL);
> +	if (TST_RET == -1)
> +		tst_brk(TBROK | TTERRNO, "setgid failed unexpectedly");

This should be TST_EXP_PASS() as well.

> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		TEST(SETGID(cleanup, ltpuser1pwent->pw_gid));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL, "call failed unexpectedly");
> -			continue;
> -		}
> -
> -		if (getgid() != ltpuser1pwent->pw_gid) {
> -			tst_resm(TFAIL, "setgid failed to set gid to "
> -				 "ltpuser1's gid");
> -		} else {
> -			tst_resm(TPASS, "functionality of getgid() is correct");
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	if (getgid() != ltpuser1pwent->pw_gid)
> +		tst_res(TFAIL, "setgid failed to set gid to ltpuser1's gid");
> +	else
> +		tst_res(TPASS, "functionality of getgid() is correct");
>  }
> 
>  static void setup(void)
>  {
> -	tst_require_root();
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	if ((rootpwent = getpwnam(root)) == NULL) {
> -		tst_brkm(TBROK, cleanup, "getpwnam failed for "
> -			 "user id %s", root);
> -	}
> +	rootpwent = SAFE_GETPWNAM(root);
> 
>  	mygid = getgid();
> -
>  	if (mygid != rootpwent->pw_gid) {
> -		tst_brkm(TBROK, cleanup, "real group id is not root");
> +		tst_brk(TBROK, "real group id is not root");
>  	}

I do not think that we need this check since we have .needs_root flag
set in the tst_test structure.

> -	if ((ltpuser1pwent = getpwnam(ltpuser1)) == NULL) {
> -		tst_brkm(TBROK, cleanup, "getpwnam failed for user "
> -			 "id %s", ltpuser1);
> -	}
> +	ltpuser1pwent = SAFE_GETPWNAM(ltpuser1);
> 
> -	GID16_CHECK(ltpuser1pwent->pw_gid, setgid, cleanup);
> +	GID16_CHECK(ltpuser1pwent->pw_gid, setgid);
>  }
> 
> -static void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.needs_root = 1,
> +	.setup = setup,
> +	.test_all = run,
> +};
> --
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
