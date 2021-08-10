Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B06623E578F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 11:54:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 431A13C70A9
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 11:54:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7F873C5DCC
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 11:54:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0EC161000B25
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 11:54:49 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5046B21FEB;
 Tue, 10 Aug 2021 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628589289; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0TQFO4pm3fyb9oGAm0Gtv+s6HheM6TnmJDQ65dLZRmg=;
 b=lA76LWNmzr7uRUlbnD0NFpZrzOVAQ6jmuH7fyFP1CHm1tPD5D7A3mATfSbr6nFKCPoQw2m
 kSuP7RukPR9Z08JfR5JoMsUgjAqh3S6aNfiOjDGN+XXxVD6lF/OzofhSMFriSJF7aQA08q
 35miDEkA3oR4hmSrq0Z1HPbBxeX34os=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628589289;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0TQFO4pm3fyb9oGAm0Gtv+s6HheM6TnmJDQ65dLZRmg=;
 b=ctnv/z7ciG+X0M+FhbsKR7q7ChhsnXIKhVv1wfH1DkhmlDruLScYKgTbrLIcCgSQRDvACx
 WoFYlysINyCqeQDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3332E13ABA;
 Tue, 10 Aug 2021 09:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Rux5DOlMEmERKAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 Aug 2021 09:54:49 +0000
Date: Tue, 10 Aug 2021 11:55:00 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YRJM9PffB27VBngU@yuki>
References: <20210806062456.11678-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806062456.11678-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,
 1/6] syscalls/sysfs: Convert sysfs01 to the new API
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
> diff --git a/testcases/kernel/syscalls/sysfs/sysfs01.c b/testcases/kernel/syscalls/sysfs/sysfs01.c
> index 85052dc2b..35195e95f 100644
> --- a/testcases/kernel/syscalls/sysfs/sysfs01.c
> +++ b/testcases/kernel/syscalls/sysfs/sysfs01.c
> @@ -1,129 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.

Note that the original is GPL-2.0 not GPL-2.0-or-later. Please stick to
the original licence when replacing the old text with SPDX identifier.

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
> - *    TEST IDENTIFIER	: sysfs01
> - *
> - *    EXECUTED BY	: anyone
> - *
> - *    TEST TITLE	: Basic test for sysfs(2)
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
> - *    This is a Phase I test for the sysfs(2) system call.
> - *    This test is carried out for option 1 for sysfs(2).
> - *    It is intended to provide a limited exposure of the system call.
> - *
> - *
> - *	Setup:
> - *	  Setup signal handling.
> - *	  Pause for SIGUSR1 if option specified.
> - *
> - *	Test:
> - *	 Loop if the proper options are given.
> - *	  Execute system call
> - *	  Check return code, if system call failed (return=-1)
> - *		Log the errno and Issue a FAIL message.
> - *	  Otherwise, Issue a PASS message.
> - *
> - *	Cleanup:
> - *	  Print errno log and/or timing stats if options given
> - *
> - * USAGE:  <for command-line>
> - * sysfs01 [-c n]  [-e] [-i n] [-I x] [-p x] [-t] [-h] [-f] [-p]
> - *  where:
> - *	-c n : run n copies simultaneously.
> - *	-e   : Turn on errno logging.
> - *	-i n : Execute test n times.
> - *	-I x : Execute test for x seconds.
> - *	-p   : Pause for SIGUSR1 before starting
> - *	-P x : Pause for x seconds between iterations.
> - *	-t   : Turn on syscall timing.
> - *
> - *RESTRICTIONS:
> - *There is no glibc or libc support
> - *Kernel should be compiled with proc filesystem support
> - ******************************************************************************/
> +
> +/*
> + * [DESCRIPTION]

This should be [Description]

> + * This test is run for option 1 for sysfs(2).
> + * Translate the filesystem identifier string fsname into a filesystem type index.
> + */
> 
>  #include <errno.h>
>  #include <unistd.h>
>  #include <sys/syscall.h>
> -#include "test.h"
> +#include "tst_test.h"
>  #include "lapi/syscalls.h"
> 
> -static void setup();
> -static void cleanup();
> -
> -char *TCID = "sysfs01";
> -int TST_TOTAL = 1;
> -
> -int main(int ac, char **av)
> +static void verify_sysfs01(void)
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
> -		/* option 1, buf holds fs name */
> -		TEST(ltp_syscall(__NR_sysfs, 1, "proc"));
> -
> -		/* check return code */
> -		if (TEST_RETURN == -1) {
> -			tst_resm(TFAIL, "sysfs(2) Failed for "
> -				 "option 1 and set errno to %d", TEST_ERRNO);
> -		} else {
> -			tst_resm(TPASS, "sysfs(2) Passed for " "option 1");
> -		}
> -	}			/*End of TEST_LOOPING */
> -
> -	/*Clean up and exit */
> -	cleanup();
> -	tst_exit();
> +        /* option 1, buf holds fs name */
> +        TST_EXP_POSITIVE(tst_syscall(__NR_sysfs, 1, "proc"),
> +                        "sysfs(1,'proc')");
> 
> +        if (TST_PASS == 1)
> +            tst_res(TPASS, "sysfs(2) Passed for " "option 1");
>  }
> 
> -/* setup() - performs all ONE TIME setup for this test */
> -void setup(void)
> -{
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +static struct tst_test test = {
> +    .test_all = verify_sysfs01,
> +};

There whitespaces are wrong here, you really should use checkpatch.pl
to check for common problems before sending a patchset.

It's a good idea to go over contribution checklist as well:

https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#6-test-contribution-checklist

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
