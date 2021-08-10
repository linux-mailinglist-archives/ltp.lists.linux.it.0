Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FE53E580A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 12:13:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 920913C70CD
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 12:13:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55DEB3C0CFD
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 12:13:12 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3F7D26234A3
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 12:13:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6955F1FE46;
 Tue, 10 Aug 2021 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628590391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q868nUy7ACFfmF5N8VqJnZGAvpTJQxHFXbzVJEKgNSc=;
 b=e7+c/7xsyQY+frARXEaKIJXlxTt4hq5FT8u125mDHQP4WxfckFTwHMnOSk7k93awyss5sd
 PRq2xTPAZXWHr1opInQSGj6hAhJZzQgYd4NinIwdzjYWBcNZHefhpoyHS/0IrYnHcw6EFg
 6XaOLE8CUPnbLMFQjH9VnTCNbO/emZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628590391;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q868nUy7ACFfmF5N8VqJnZGAvpTJQxHFXbzVJEKgNSc=;
 b=jW/wHVqN9Xd6EU4zF2aIHrQTr04mSbuoJw1Y1WF/QK5abMT4EMDunKQGpJ4O3OURDWY2c4
 cIb6zgMppzG3QEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A707113ABA;
 Tue, 10 Aug 2021 10:13:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vz6LJzVREmFkLQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Aug 2021 10:13:09 +0000
Date: Tue, 10 Aug 2021 12:13:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YRJRQUSJJHjwNNZy@yuki>
References: <20210806072338.8240-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806072338.8240-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/chmod01: Convert to new API
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

> +/*\
> + * [Description

Missing ] at the end

>   *
>   * Test Description:
>   *  Verify that, chmod(2) succeeds when used to change the mode permissions
> @@ -28,132 +17,50 @@
>   *  chmod(2) should return 0 and the mode permissions set on file should match
>   *  the specified mode.
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
> - *  chmod01 [-c n] [-e] [-f] [-i n] [-I x] [-P x] [-t]
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
> - *  None.
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
> -
> -#include "test.h"
> -#include "safe_macros.h"
> +#include "tst_test.h"
> 
>  #define FILE_MODE	S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
>  #define TESTFILE	"testfile"
> 
> -char *TCID = "chmod01";
> -int TST_TOTAL = 8;
> -
> -int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
> +static int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
> 
> -void setup();
> -void cleanup();
> -
> -int main(int ac, char **av)
> +static void verify_chmod(unsigned int n)
>  {
>  	struct stat stat_buf;
> -	int lc;
> -	int i;
> -	int mode;
> -
> -	TST_TOTAL = sizeof(modes) / sizeof(int);
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		for (i = 0; i < TST_TOTAL; i++) {
> -			mode = modes[i];
> -
> -			TEST(chmod(TESTFILE, mode));
> -
> -			if (TEST_RETURN == -1) {
> -				tst_resm(TFAIL | TTERRNO,
> -					 "chmod(%s, %#o) failed", TESTFILE,
> -					 mode);
> -				continue;
> -			}
> -			if (stat(TESTFILE, &stat_buf) < 0)
> -				tst_brkm(TFAIL | TERRNO, cleanup,
> -					 "stat(%s) failed", TESTFILE);
> -			stat_buf.st_mode &= ~S_IFREG;
> -
> -			if (stat_buf.st_mode == (unsigned int)mode)
> -				tst_resm(TPASS, "Functionality of "
> -					 "chmod(%s, %#o) successful",
> -					 TESTFILE, mode);
> -			else
> -				tst_resm(TFAIL, "%s: Incorrect "
> -					 "modes 0%03o, Expected 0%03o",
> -					 TESTFILE, stat_buf.st_mode,
> -					 mode);
> -		}
> +	int mode = modes[n];
> +
> +	TST_EXP_PASS_SILENT(chmod(TESTFILE, mode), "chmod(%s, %#o) failed",
> +	TESTFILE, mode);

This shouldn't really be the _SILENT() variant since we are testing
chmod here. Also the message should no have the "failed" in it, it
should just describe what is being tested, so this really should just
be:

	TST_EXP_PASS(chmod(TESTFILE, mode),
	             "chmod(%s, %04o)", TESTFILE, mode);


> +	if (TST_PASS) {

This should be:

	if (!TST_PASS)
		return;

So that we don't have to have the rest of the test inside an if ()
block.

> +		SAFE_STAT(TESTFILE, &stat_buf);
> +		stat_buf.st_mode &= ~S_IFREG;
> +
> +		if (stat_buf.st_mode == (unsigned int)mode)
> +			tst_res(TPASS, "Functionality of "
> +					"chmod(%s, %#o) successful",
> +					TESTFILE, mode);
> +		else
> +			tst_res(TFAIL, "%s: Incorrect "
> +					"modes 0%03o, Expected 0%03o",
> +					TESTFILE, stat_buf.st_mode,
> +					mode);
>  	}

And these messages could be shorter and to the point. If we do not
silence the output of the TST_EXP_PASS() above we can just change these
to:

        if (stat_buf.st_mode == (unsigned int)mode) {
                tst_res(TPASS, "stat(%s) mode=%04o",
                        TESTFILE, stat_buf.st_mode);
        } else {
                tst_res(TFAIL, "stat(%s) mode=%04o",
                       TESTFILE, stat_buf.st_mode);
        }

And the rest output would look like:

chmod01.c:32: TPASS: chmod(testfile, 0000) passed
chmod01.c:42: TPASS: stat(testfile) mode=0000
chmod01.c:32: TPASS: chmod(testfile, 0007) passed
chmod01.c:42: TPASS: stat(testfile) mode=0007
...


> -	cleanup();
> -	tst_exit();
>  }
> 
> -void setup(void)
> +static void setup(void)
>  {
>  	int fd;
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	fd = SAFE_OPEN(cleanup, TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
> -	SAFE_CLOSE(cleanup, fd);
> -
> +	fd = SAFE_OPEN(TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
> +	SAFE_CLOSE(fd);

We can just do:

        SAFE_TOUCH(TESTFILE, FILE_MODE, NULL);


>  }
> 
> -void cleanup(void)
> -{
> -	tst_rmdir();
> -}
> +static struct tst_test test = {
> +	.setup = setup,
> +	.tcnt = ARRAY_SIZE(modes),
> +	.test = verify_chmod,
> +	.needs_root = 1,

As far as I can tell there is no reason why this test couldn't be
executed as a normal user, so we shouldn't set the needs_root here.

> +	.needs_tmpdir = 1,
> +};
> +
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
