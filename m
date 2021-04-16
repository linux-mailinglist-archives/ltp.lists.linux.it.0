Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 18434361CD9
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 11:40:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D72253C1C9A
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 11:40:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55BB83C1A9C
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 11:40:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 649222010B0
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 11:40:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF991AFCD;
 Fri, 16 Apr 2021 09:40:43 +0000 (UTC)
Date: Fri, 16 Apr 2021 11:30:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YHlZGRf5KnpEg8F/@yuki>
References: <20210415063518.174631-1-xieziyao@huawei.com>
 <20210415063518.174631-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415063518.174631-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/chown: rewrite chown/chown03.c
 with the new api
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
> + * [Algorithm]
>   *
> + * - Execute system call
> + * - Check return code, if system call failed (return=-1)
> + * -   Log the errno and Issue a FAIL message
> + * - Otherwise
> + * -   Verify the Functionality of system call
> + * -   if successful
> + * -     Issue Functionality-Pass message
> + * -   Otherwise
> + * -     Issue Functionality-Fail message
>   */

Here as well, the [Algorithm] part is completely useless.

>  #include <stdio.h>
> @@ -80,123 +39,72 @@
>  #include <grp.h>
>  #include <pwd.h>
> 
> -#include "test.h"
> -#include "safe_macros.h"
> -#include "compat_16.h"
> +#include "tst_test.h"
> +#include "compat_tst_16.h"
> 
>  #define FILE_MODE	(S_IFREG|S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)
>  #define NEW_PERMS	(S_IFREG|S_IRWXU|S_IRWXG|S_ISUID|S_ISGID)
> -#define TESTFILE	"testfile"
> +#define FILENAME "chown03_testfile"
> 
> -TCID_DEFINE(chown03);
> -int TST_TOTAL = 1;		/* Total number of test conditions */
> -char nobody_uid[] = "nobody";
> -struct passwd *ltpuser;
> -
> -void setup();			/* setup function for the test */
> -void cleanup();			/* cleanup function for the test */
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
> -	struct stat stat_buf;	/* stat(2) struct contents */
> -	int lc;
> -	uid_t user_id;		/* Owner id of the test file. */
> -	gid_t group_id;		/* Group id of the test file. */
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		UID16_CHECK((user_id = geteuid()), "chown", cleanup)
> -		GID16_CHECK((group_id = getegid()), "chown", cleanup)
> -
> -		TEST(CHOWN(cleanup, TESTFILE, -1, group_id));
> -
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL | TTERRNO, "chown(%s, ..) failed",
> -				 TESTFILE);
> -			continue;
> -		}
> -
> -		if (stat(TESTFILE, &stat_buf) == -1)
> -			tst_brkm(TFAIL | TERRNO, cleanup,
> -				 "stat failed");
> -
> -		if (stat_buf.st_uid != user_id ||
> -		    stat_buf.st_gid != group_id)
> -			tst_resm(TFAIL, "%s: Incorrect ownership"
> -				 "set to %d %d, Expected %d %d",
> -				 TESTFILE, stat_buf.st_uid,
> -				 stat_buf.st_gid, user_id, group_id);
> -
> -		if (stat_buf.st_mode !=
> -		    (NEW_PERMS & ~(S_ISUID | S_ISGID)))
> -			tst_resm(TFAIL, "%s: incorrect mode permissions"
> -				 " %#o, Expected %#o", TESTFILE,
> -				 stat_buf.st_mode,
> -				 NEW_PERMS & ~(S_ISUID | S_ISGID));
> -		else
> -			tst_resm(TPASS, "chown(%s, ..) was successful",
> -				 TESTFILE);
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	struct stat stat_buf;
> +	uid_t uid;
> +	gid_t gid;
> +
> +	UID16_CHECK((uid = geteuid()), "chown");
> +	GID16_CHECK((gid = getegid()), "chown");
> +
> +	TST_EXP_PASS(CHOWN(FILENAME, -1, gid), "chown(%s,%d,%d)",
> +		     FILENAME, uid, gid);
                                ^
				This should be -1

> +	SAFE_STAT(FILENAME, &stat_buf);
> +
> +	if (stat_buf.st_uid != uid || stat_buf.st_gid != gid)
> +		tst_res(TFAIL, "%s: Incorrect ownership"
> +			       "set to %d %d, Expected %d %d",
> +			FILENAME, stat_buf.st_uid,
> +			stat_buf.st_gid, uid, gid);
> +
> +	if (stat_buf.st_mode != (NEW_PERMS & ~(S_ISUID | S_ISGID)))
> +		tst_res(TFAIL, "%s: incorrect mode permissions"
> +			       " %#o, Expected %#o", FILENAME,
> +			stat_buf.st_mode,
> +			NEW_PERMS & ~(S_ISUID | S_ISGID));
> +	else
> +		tst_res(TPASS, "chown(%s, ..) was successful",
                                               ^
					       No need to add was
					       succcessfull here the
					       library will print PASSED
					       since the tst_res() has
					       the TPASS parameter.
> +			FILENAME);
>  }
> 
> -/*
> - * void
> - * setup() - performs all ONE TIME setup for this test.
> - *  Create a temporary directory and change directory to it.
> - *  Create a test file under temporary directory and close it
> - *  Change the group ownership on testfile.
> - */
> -void setup(void)
> +static void setup(void)
>  {
> -	int fd;			/* file handler for testfile */
> -
> -	TEST_PAUSE;
> -
> -	tst_require_root();
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	tst_tmpdir();
> -
> -	ltpuser = getpwnam(nobody_uid);
> -	if (ltpuser == NULL)
> -		tst_brkm(TBROK | TERRNO, NULL, "getpwnam(\"nobody\") failed");
> -	SAFE_SETEGID(NULL, ltpuser->pw_gid);
> -	SAFE_SETEUID(NULL, ltpuser->pw_uid);
> +	int fd;
> +	struct passwd *ltpuser;
> 
> -	/* Create a test file under temporary directory */
> -	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1)
> -		tst_brkm(TBROK | TERRNO, cleanup,
> -			 "open(%s, O_RDWR|O_CREAT, %o) failed", TESTFILE,
> -			 FILE_MODE);
> +	ltpuser = SAFE_GETPWNAM("nobody");
> +	SAFE_SETEGID(ltpuser->pw_gid);
> +	SAFE_SETEUID(ltpuser->pw_uid);
> 
> -	SAFE_SETEUID(cleanup, 0);
> +	fd = SAFE_OPEN(FILENAME, O_RDWR | O_CREAT, FILE_MODE);
> 
> -	SAFE_FCHOWN(cleanup, fd, -1, 0);
> -
> -	SAFE_FCHMOD(cleanup, fd, NEW_PERMS);
> -
> -	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
> -
> -	SAFE_CLOSE(cleanup, fd);
> +	SAFE_SETEUID(0);
> +	SAFE_FCHOWN(fd, -1, 0);
> +	SAFE_FCHMOD(fd, NEW_PERMS);
> +	SAFE_SETEUID(ltpuser->pw_uid);
> +	SAFE_CLOSE(fd);

There are a couple of problems here:

- we set the gid and suid/sgid only once (the test does not check
  this assertion in subsequent runs when executed with -i 10)

- we do not check that they were set correctly either

So I think that it would be better if we moved this part to the run()
function.

we should probably do something as:

void run(void)
{
	SAFE_SETUID(0);
	SAFE_CHOWN(FILENAME, -1, 0);
	SAFE_CHMOD(FILENAME, NEW_PERMS);
	SAFE_SETUID(ltpuser->pw_uid);

	SAFE_STAT(FILENAME, &stbuf);

	//check that gid and suid/sgid are set correctly

	GID16_CHECK((gid = getegid()), "chown");

	TST_EXP_PASS(CHOWN(FILENAME, -1, gid), "chown(%s,%d,%d)",
+		     FILENAME, -1, gid);

>  }
> 
> -void cleanup(void)
> +static void cleanup(void)
>  {
> -	if (setegid(0) == -1)
> -		tst_resm(TWARN | TERRNO, "setegid(0) failed");
> -	if (seteuid(0) == -1)
> -		tst_resm(TWARN | TERRNO, "seteuid(0) failed");
> +	SAFE_SETEGID(0);
> +	SAFE_SETEUID(0);
> +}
> 
> -	tst_rmdir();
> +static struct tst_test test = {
> +	.needs_root = 1,
> +	.needs_tmpdir = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run,
> +};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
