Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6E37A1A7
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 10:23:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7B933C5758
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 10:23:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C9FF3C4E1C
 for <ltp@lists.linux.it>; Tue, 11 May 2021 10:23:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 97AEE200ACA
 for <ltp@lists.linux.it>; Tue, 11 May 2021 10:23:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE4E6AF83;
 Tue, 11 May 2021 08:23:02 +0000 (UTC)
Date: Tue, 11 May 2021 10:23:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YJo+5e59dSQm2vjP@pevik>
References: <20210508064351.10737-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210508064351.10737-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/setfsgid02: Rewrite setfsgid02
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

Thank you for rewriting the test.

> 1)update to new API
> 2)rewrite setfsgid02 according man 2
I'd actually specify, what exactly you changed.

Cyril asked for:
- unprivileged process cannot change the value i.e. value that is
  different from return from ret=setfsgid(-1) is passed as
  setfsgid(ret+1) followed by setfsgid(-1) and all of these returns the
  same value and the value also matches process effective group ID

- privileged process can change the value i.e. the same as
  unprivileged but we expect the last setfsgid(-1) return
  the new value. We either have to reset the setfsgid() at the end of
  the test or run it in a fork()-ed process so that we start with a
  clean plate for each iteration

Your code expects root has euid 0 and nobody does not have euid 1,
which of course works, but wouldn't be better to run setfsgid(-1) before testing
to verify it, as Cyril suggests?

...
> diff --git a/testcases/kernel/syscalls/setfsgid/setfsgid02.c b/testcases/kernel/syscalls/setfsgid/setfsgid02.c

> -/*
> - *     Testcase to check the basic functionality of setfsgid(2) system
> - *     call failures.
> +/*\
> + * [Description]
> + * Testcase to check the basic functionality of setfsgid(2) system
> + * call failures with priviledged or unpriviledged user.
typo: (un)priviledged => (un)privileged

And here be more verbose as well (IMHO "basic functionality" does not say much),
e.g. something like (in case you update the code):
* Testcase for setfsgid() syscall to check that
* - privileged user can change a filesystem group ID different from saved
*  value of previous setfsgid() call
* - unprivileged user cannot change it
>   */

> -#include <stdio.h>
> -#include <unistd.h>
> -#include <grp.h>
>  #include <pwd.h>
> -#include <sys/types.h>
> -#include <errno.h>
> -
> -#include "test.h"
> -#include "compat_16.h"
> +#include "tst_test.h"
> +#include "compat_tst_16.h"

> -TCID_DEFINE(setfsgid02);
> -int TST_TOTAL = 1;
> +static gid_t gid;
> +static gid_t pre_gid;
> +static const char nobody_uid[] = "nobody";
> +static struct passwd *ltpuser;

> -static void setup(void);
> -static void cleanup(void);
> -
> -int main(int ac, char **av)
> +static void run(unsigned int i)
>  {
> -	int lc;
> -
> -	gid_t gid;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		gid = 1;
> -		while (getgrgid(gid))
> -			gid++;
> +	int cnt;

> -		GID16_CHECK(gid, setfsgid, cleanup);
> +	GID16_CHECK(gid, setfsgid);

> -		TEST(SETFSGID(cleanup, gid));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO,
> -				"setfsgid() failed unexpectedly");
> -			continue;
> -		}
> +	if (i == 0) {
> +		ltpuser = SAFE_GETPWNAM(nobody_uid);
> +		SAFE_SETEUID(ltpuser->pw_uid);
> +	}

> -		if (TEST_RETURN == gid) {
> -			tst_resm(TFAIL, "setfsgid() returned %ld, expected %d",
> -				 TEST_RETURN, gid);
> -		} else {
> -			tst_resm(TPASS, "setfsgid() returned expected value : "
> -				 "%ld", TEST_RETURN);
> +	/*
> +	 * Run SETFSGID() twice to check the second running have changed
> +	 * the gid for priviledged user, and have not changed the gid
> +	 * for unpriviledged user.
And here typos.

> +	 */
> +	for (cnt = 0; cnt < 2; cnt++) {
> +		TEST(SETFSGID(gid));
> +		if (TST_RET != pre_gid)
Cast to long is needed to prevent introducing warnings for 32bit compilation:
if ((long)pre_gid != TST_RET).
And move pre_gid to be first (WARNING: Comparisons should place the constant on
the right side of the test).

> +			tst_res(TFAIL, "setfsgid() returned %ld", TST_RET);
> +		else {
> +			tst_res(TPASS,
> +				"setfsgid() returned expected value : %ld",
> +				TST_RET);
> +			if (i == 1) {
> +				pre_gid = gid;
> +				gid++;
> +			}
>  		}
>  	}

> +	if (i == 0) {
> +		SAFE_SETEUID(0);
> +	}
nit: no brackets needed here.
scripts/checkpatch.pl from kernel is your friend
>  }

IMHO improvements are good enough for test to be merged before release.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
