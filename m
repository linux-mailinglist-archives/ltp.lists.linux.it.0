Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E726937152D
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 14:21:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D10B3C5A04
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 14:21:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C44603C58D5
 for <ltp@lists.linux.it>; Mon,  3 May 2021 14:21:32 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 89BF560079F
 for <ltp@lists.linux.it>; Mon,  3 May 2021 14:21:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD831AF31;
 Mon,  3 May 2021 12:21:29 +0000 (UTC)
Date: Mon, 3 May 2021 14:21:28 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YI/qyMxzj2QuPQqD@pevik>
References: <20210428035558.13894-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428035558.13894-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/unlinkat01: Bugfix and update to new API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zhao,

> 1) When run the test with option "-i 2", test will fail, and fixed
Good catch!

> 2) Update to new API
Great! Yes it's working, but it deserves more improvements.

...
> diff --git a/testcases/kernel/syscalls/unlinkat/unlinkat01.c b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
...
> - * Author
> - *	Yi Yang <yyangcdl@cn.ibm.com>
> + * AUTHOR: Yi Yang <yyangcdl@cn.ibm.com>
nit: * Author: Yi Yang <yyangcdl@cn.ibm.com>

> + */
> +
> +/*\
> + * [Description]
> + * This test case will verify basic function of unlinkat
> + * added by kernel 2.6.16 or up.
nit: * Basic unlinkat() tests.

>   */

>  #define _GNU_SOURCE
IMHO you can remove this one.

> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <sys/time.h>
> -#include <fcntl.h>
> -#include <stdlib.h>
> -#include <errno.h>
> -#include <string.h>
> -#include <signal.h>
> -#include "test.h"
> -#include "safe_macros.h"

> +#include <linux/limits.h>
Why this kernel header? I guess for PATH_MAX, but for that please use
<limits.h> (We try to avoid using kernel headers for basic things not related to
testing. There is also glibc vs. kernel header clash:
https://sourceware.org/glibc/wiki/Synchronizing_Headers)

> +#include "tst_test.h"
>  #include "lapi/syscalls.h"
> +#include "tst_safe_stdio.h"

>  #define TEST_CASES 7
> +
>  #ifndef AT_FDCWD
>  #define AT_FDCWD -100
>  #endif
> @@ -45,12 +27,6 @@
>  #define AT_REMOVEDIR 0x200
>  #endif
AT_FDCWD and AT_REMOVEDIR has been added to <fcntl.h> 10+ years ago,
we could safely remove it. But we have them in lapi/fcntl.h, let's use this
header please.

> -void setup();
> -void cleanup();
> -
> -char *TCID = "unlinkat01";
> -int TST_TOTAL = TEST_CASES;
> -
>  static const char pathname[] = "unlinkattestdir",
>  		  subpathname[] = "unlinkatsubtestdir",
>  		  subpathdir[] = "unlinkattestdir/unlinkatsubtestdir",
> @@ -65,82 +41,79 @@ static const int flags[] = { 0, 0, 0, 0, 9999, 0, AT_REMOVEDIR };

Could you please use static struct for testcases data which is the usual way in
LTP instead of using arrays? (e.g. in testcases/kernel/syscalls/access/access02.c).
It helps to the readability of the code as we'll be able to remove lines like:
	fds[1] = fds[4] = fds[6] = fds[0];

and most of the setup.

Than you can then drop also TEST_CASES.

>  int myunlinkat(int dirfd, const char *filename, int flags)
>  {
> -	return ltp_syscall(__NR_unlinkat, dirfd, filename, flags);
> +	return tst_syscall(__NR_unlinkat, dirfd, filename, flags);
>  }
Could you please use unlinkat() libc implementation? It was added to glibc in
2.4, musl has it also for 10+ years. Or you can use both raw syscall and libc
variant via .test_variants (not needed, we added more variants for some tests,
but most of syscall tests does not cover it).

> -int main(int ac, char **av)
> +static void run(int i)
i needs to be unsigned int. Compiler warned you (it's good to pay attention to
the warnings and don't introduce new ones).

>  {
> -	int lc;
> -	int i;
> -
> -	if ((tst_kvercmp(2, 6, 16)) < 0)
> -		tst_brkm(TCONF, NULL, "Test must be run with kernel 2.6.16+");
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		for (i = 0; i < TST_TOTAL; i++) {
> -			TEST(myunlinkat(fds[i], filenames[i], flags[i]));
> -
> -			if (TEST_ERRNO == expected_errno[i]) {
> -				tst_resm(TPASS | TTERRNO,
> -					 "unlinkat() returned expected errno");
> -			} else {
> -				tst_resm(TFAIL | TTERRNO, "unlinkat() failed");
> -			}
> -		}
> -
> +	if (!expected_errno[i]) {
> +		fds[0] = SAFE_OPEN(pathname, O_DIRECTORY);
> +		fds[1] = fds[4] = fds[6] = fds[0];
> +
> +		/* tesfile2 will be unlinked by test0. */
> +		if (access(testfile2, F_OK))
> +			SAFE_FILE_PRINTF(testfile2, testfile2);
> +
> +		/* testfile3 will be unlined by test1. */
> +		if (access(testfile3, F_OK))
> +			SAFE_OPEN(testfile3, O_CREAT | O_RDWR, 0600);
> +
> +		/* subpathdir will be unlinked by test6. */
> +		if (access(subpathdir, F_OK))
> +			SAFE_MKDIR(subpathdir, 0700);
> +	} else
> +		fds[2] = SAFE_OPEN(testfile3, O_CREAT | O_RDWR, 0600);
> +
> +	/* testfile must exist except test1 and test6. */
> +	if (access(testfile, F_OK))
> +		SAFE_FILE_PRINTF(testfile, testfile);
> +
> +	TEST(myunlinkat(fds[i], filenames[i], flags[i]));
> +	if (TST_ERR == expected_errno[i])
> +		tst_res(TPASS | TTERRNO, "unlinkat() returned expected errno");
> +	else
> +		tst_res(TFAIL | TTERRNO, "unlinkat() failed");
> +
> +	if (!expected_errno[i]) {
> +		SAFE_CLOSE(fds[0]);
> +	} else {
> +		SAFE_CLOSE(fds[2]);
>  	}
You can remove { } for consistency with previous.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
