Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E1C2A09E5
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 16:31:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEF793C5564
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Oct 2020 16:31:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E74BD3C23B8
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 16:31:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4AA871400BE2
 for <ltp@lists.linux.it>; Fri, 30 Oct 2020 16:31:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7161FAE2C;
 Fri, 30 Oct 2020 15:31:51 +0000 (UTC)
Date: Fri, 30 Oct 2020 16:32:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201030153223.GA2962@yuki.lan>
References: <20201030145350.23829-1-radoslav.kolev@suse.com>
 <20201030145350.23829-2-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030145350.23829-2-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Convert dup01 to new API and clean up
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
> + * Copyright (c) 2020 SUSE LLC
> + * 
> + * 03/30/1992 AUTHOR: William Roske CO-PILOT: Dave Fenner
> + * 30/10/2020 Convert to new api Radoslav Kolev <radoslav.kolev@suse.com>

While I tend to keep the historical changelog in the tests I do not add
new entries since that information is being kept in git metadata now.

> -#include <sys/types.h>
> -#include <fcntl.h>
> -#include <errno.h>
> -#include <string.h>
> -#include <signal.h>
> -#include "test.h"
> -#include "safe_macros.h"
> +#include "tst_test.h"
>  
> -void setup();
> -void cleanup();
> +static int fd;
> +static int dup_fd;
>  
> -char *TCID = "dup01";
> -int TST_TOTAL = 1;
> -
> -char filename[255];
> -int fd;
> -
> -int main(int ac, char **av)
> +static void verify_dup(void)
>  {
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		/*
> -		 * Call dup(2)
> -		 */
> -		TEST(dup(fd));
> -
> -		/* check return code */
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL, "dup(%s) Failed, errno=%d : %s",
> -				 filename, TEST_ERRNO, strerror(TEST_ERRNO));
> -		} else {
> -			tst_resm(TPASS, "dup(%s) returned %ld",
> -				 filename, TEST_RETURN);
> -
> -			/* close the new file so loops do not open too many files */
> -			SAFE_CLOSE(cleanup, TEST_RETURN);
> -		}
> -
> +	TEST(dup_fd = dup(fd));
> +
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TERRNO, "dup(%d) Failed, %s",
> +			fd);

This line does not seem to be over 80 characters, why it's broken before
the fd?

Also the format string does not match parameters.

And maybe we should be more pedantic with the check here, since any
negative value != -1 will be caught at the SAFE_CLOSE() which less than
optimal.

> +	} else {
> +		tst_res(TPASS, "dup(%d) returned %ld",
> +			fd, TST_RET);

Here as well, the line does not need to be broken.

> +		SAFE_CLOSE(dup_fd);

What's wrong with SAFE_CLOSE(TST_RET) ?

>  	}
> -
> -	cleanup();
> -	tst_exit();
>  }
>  
> -void setup(void)
> +static void setup(void)
>  {
> -	fd = -1;
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	sprintf(filename, "dupfile");
> -	if ((fd = open(filename, O_RDWR | O_CREAT, 0700)) == -1)
> -		tst_brkm(TBROK | TERRNO, cleanup, "open failed");
> +	fd = SAFE_OPEN("dupfile", O_RDWR | O_CREAT, 0700);
>  }
>  
> -void cleanup(void)
> +static void cleanup(void)
>  {
> -	if (fd != -1)
> -		if (close(fd) == -1)
> -			tst_resm(TWARN | TERRNO, "closing %s failed", filename);
> -
> -	tst_rmdir();
> -
> +	if (fd > 0)
> +		SAFE_CLOSE(fd);
>  }
> +
> +static struct tst_test test = {
> +	.test_all = verify_dup,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_tmpdir = 1,
> +};

Other than these the rest looks fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
