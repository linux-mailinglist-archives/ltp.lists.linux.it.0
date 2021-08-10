Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDE3E5911
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 13:28:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 126B73C70B4
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 13:28:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9D2543C0352
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 13:27:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0C45F1000776
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 13:27:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 611782009E;
 Tue, 10 Aug 2021 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628594876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nC1OUlm//xniihVKpNE+AHVyGbwWzdM38vH+/a/3aT0=;
 b=QGEn0AUrUbtPEz8gBaX3ol6kRc3yxaOt4cA3BjkEMY09pBw0UVZpG1KMKX9k/Lc0cSqoMf
 mZwQZwBy4uW0+8VVYl+EAjnl09iy/TfvbsSI84GX7+sRoTxp5Box5lssOguL/Ra+BZOcLD
 LUYU+8kOrVP7Z8TIJCPakwCW8fkGOSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628594876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nC1OUlm//xniihVKpNE+AHVyGbwWzdM38vH+/a/3aT0=;
 b=LGR1QTqUWnNsSi1foOg6s+GbsU4OfBWUwgOHT1XTWqE1gbmE3DPav0uV2MtR5cNvfshr/B
 1ds0YhQBJyK3cGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 447FC13AFE;
 Tue, 10 Aug 2021 11:27:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DL3mDrxiEmGCRAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Aug 2021 11:27:56 +0000
Date: Tue, 10 Aug 2021 13:28:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YRJix5xULruF+kz2@yuki>
References: <20210806113044.8688-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806113044.8688-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [4/6] syscalls/sysfs: Convert sysfs04 to the new
 API
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
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.

THis is another case of GPL-2.0 so please fix the SPDX identifier.

> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - *
>   */
> -/**************************************************************************
> - *
> - *    TEST IDENTIFIER	: sysfs04
> - *
> - *
> - *    EXECUTED BY	: anyone
> - *
> - *    TEST TITLE	: Test checking for basic error conditions
> - *				 for sysfs(2)
> - *
> - *    TEST CASE TOTAL	: 1
> - *
> - *    AUTHOR		: Aniruddha Marathe <aniruddha.marathe@wipro.com>
> - *
> - *    SIGNALS
> - *	Uses SIGUSR1 to pause before test if option set.
> - *	(See the parse_opts(3) man page).
> - *
> - *    DESCRIPTION
> - *	This test case checks whether sysfs(2) system call  returns
> - *	appropriate error number for invalid
> - *	option.
> - *
> - *	Setup:
> - *	  Setup signal handling.
> - *	  Pause for SIGUSR1 if option specified.
> - *
> - *	Test:
> - *	  Loop if the proper options are given.
> - *	  Execute system call with invaid  option parameter
> - *
> - *	  Check return code, if system call fails with errno == expected errno
> - *		Issue syscall passed with expected errno
> - *	  Otherwise,
> - *	  Issue syscall failed to produce expected errno
> - *
> - *	Cleanup:
> - *	  Do cleanup for the test.
> - *
> - * USAGE:  <for command-line>
> - * sysfs04  [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
> - * where:
> - *	-c n : run n copies simultaneously
> - *	-e   : Turn on errno logging.
> - *	-i n : Execute test n times.
> - *	-I x : Execute test for x seconds.
> - *	-p   : Pause for SIGUSR1 before starting
> - *	-P x : Pause for x seconds between iterations.
> - *	-t   : Turn on syscall timing.
> - *
> - *RESTRICTIONS:
> - *No libc or glibc support
> - *****************************************************************************/
> +
> +/*
> + * [DESCRIPTION]

Should be [Description] and also the special documentation comment has
to start with /*\

> + * This test case checks whether sysfs(2) system call returns
> + * appropriate error number for invalid option.
> + */
> 
>  #include <errno.h>
> -#include  <sys/syscall.h>
> -#include "test.h"
> +#include <sys/syscall.h>
> +#include "tst_test.h"
>  #include "lapi/syscalls.h"
> 
>  #define INVALID_OPTION 100
> -static void setup();
> -static void cleanup();
> -
> -char *TCID = "sysfs04";
> -int TST_TOTAL = 1;
> -
> -int main(int ac, char **av)
> -{
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> 
> -		tst_count = 0;
> -		TEST(ltp_syscall(__NR_sysfs, INVALID_OPTION));
> -
> -		/* check return code */
> -		if ((TEST_RETURN == -1) && (TEST_ERRNO == EINVAL)) {
> -			tst_resm(TPASS, "sysfs(2) expected failure;"
> -				 " Got errno - EINVAL :" " Invalid option");
> -		} else {
> -			tst_resm(TFAIL, "sysfs(2) failed to produce"
> -				 " expected error; %d, errno"
> -				 " : EINVAL and got %d", EINVAL, TEST_ERRNO);
> -		}
> -	}
> -
> -	/*Clean up and exit */
> -	cleanup();
> -	tst_exit();
> -
> -}				/*End of main */
> -
> -/* setup() - performs all ONE TIME setup for this test */
> -void setup(void)
> +static void verify_sysfs04(void)
>  {
> 
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +    TST_EXP_FAIL(tst_syscall(__NR_sysfs, INVALID_OPTION),
> +				EINVAL,"sysfs(INVALID_OPTION)");
> +
> +    if (TST_PASS) {
> +        tst_res(TPASS, "sysfs(2) expected failure;"
> +             " Got errno - EINVAL :" " Invalid option");
> +    } else {
> +         tst_res(TFAIL, "sysfs(2) failed to produce"
> +              " expected error; %d, errno"
> +              " : EINVAL and got %d", EINVAL, TST_ERR);
> +    }

The TST_EXP_FAIL() _does_ print the pass/fail messages for you, there is
absolutelly no reason to print them manually.

>  }
> 
> -/*
> -* cleanup() - Performs one time cleanup for this test at
> -* completion or premature exit
> -*/
> -void cleanup(void)
> -{
> -
> -}
> +static struct tst_test test = {
> +    .test_all = verify_sysfs04
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
