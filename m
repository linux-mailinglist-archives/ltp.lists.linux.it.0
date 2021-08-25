Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A7C3F753E
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 14:43:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 13AB63C9DAC
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 14:43:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EDB823C2F5C
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 14:43:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 11B35140074A
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 14:43:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5AE3420103;
 Wed, 25 Aug 2021 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629895409; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHB49ZL6gT7EVUYh2QWOGvH7UXJZBNOFlMh4Drby2FA=;
 b=zHevWJvCpa7DtWhdd21pjqMLHVsExU6pgs3CQyGbgj755an9aPIG7w0DRO++hGtAgnH03X
 yhth0cLS8NWuOQSU1jZNiuvNu3dPh/oauOefF5jhw7pDUy0vygIM3hm3NNrMDA0HaHn+d2
 876xTWDxCPFVBkJakKXEK28WvxC2LGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629895409;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHB49ZL6gT7EVUYh2QWOGvH7UXJZBNOFlMh4Drby2FA=;
 b=5Njq7Ix9Ud8QC7SMBxYnNUhBvU/Nf6fFs2CP6PocZEFbfaJlds4tsX3twkvHOT8Y2dCDfS
 M+uUJ+1L2LtXwFBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34FE213C21;
 Wed, 25 Aug 2021 12:43:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IUf+C/E6JmHkTQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 25 Aug 2021 12:43:29 +0000
Date: Wed, 25 Aug 2021 14:43:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YSY6+J/TXho4wTHF@yuki>
References: <20210813072505.20207-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813072505.20207-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/7] syscalls/clone01: Convert to new API
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
> + * [Description]
> + * This is a test for the clone(2) system call.
> + * It is intended to provide a limited exposure of the system call.

We should write a better description than this, ideally outline what the
test really does with something as:

/*\
 * [Description]
 *
 * Basic clone() test.
 *
 * Starts a child with clone() syscalls, child does exit(0) and parent waits on it.
 */

>   */
> 
> -#if defined UCLINUX && !__THROW
> -/* workaround for libc bug */
> -#define __THROW
> -#endif
> -
> -#include <errno.h>
> -#include <sched.h>
> -#include <sys/wait.h>
> -#include "test.h"
> -#include "safe_macros.h"
> +#include <stdlib.h>
> +#include "tst_test.h"
>  #include "clone_platform.h"
> 
> -static void setup(void);
> -static void cleanup(void);
> -static int do_child();
> +static void *child_stack;
> 
> -char *TCID = "clone01";
> -int TST_TOTAL = 1;
> +static int do_child(void *arg LTP_ATTRIBUTE_UNUSED)
> +{
> +	exit(0);
> +}
> 
> -int main(int ac, char **av)
> +static void verify_clone(void)
>  {
> -	void *child_stack;
>  	int status, child_pid;
> 
> -	tst_parse_opts(ac, av, NULL, NULL);
> +	TST_EXP_POSITIVE(ltp_clone(SIGCHLD, do_child, NULL,
> +		CHILD_STACK_SIZE, child_stack), "clone()");
> 
> -	setup();
> +	child_pid = SAFE_WAIT(&status);
> 
> -	child_stack = malloc(CHILD_STACK_SIZE);
> -	if (child_stack == NULL)
> -		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
> -
> -	tst_count = 0;
> -
> -	TEST(ltp_clone(SIGCHLD, do_child, NULL, CHILD_STACK_SIZE, child_stack));
> -	if (TEST_RETURN == -1)
> -		tst_resm(TFAIL | TTERRNO, "clone failed");
> -
> -	child_pid = SAFE_WAIT(cleanup, &status);
> -
> -	if (TEST_RETURN == child_pid)
> -		tst_resm(TPASS, "clone returned %ld", TEST_RETURN);
> +	if (TST_RET == child_pid)
> +		tst_res(TPASS, "clone returned %ld", TST_RET);
>  	else
> -		tst_resm(TFAIL, "clone returned %ld, wait returned %d",
> -			 TEST_RETURN, child_pid);
> -
> -	free(child_stack);
> -
> -	cleanup();
> -
> -	tst_exit();
> +		tst_res(TFAIL, "clone returned %ld, wait returned %d",
> +			 TST_RET, child_pid);


I guess that we should as well check that the test did exit with zero as
well with something as:

	if (WIFEXITTED(status) && WEXITSTATUS(status) == 0)
		tst_res(TPASS, "Child exitted with 0");
	else
		tst_res(TFAIL, "Child %s", tst_strstatus(status));

>  }
> 
> -static void setup(void)
> -{
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -	TEST_PAUSE;
> +static void setup(void) {
> +	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
>  }
> 
> -static void cleanup(void)
> -{
> +static void cleanup(void) {
> +	free(child_stack);
>  }

These two functions violate LKML coding style, the opening brace have to
be on a seprate line.

You can easily check for these with the checkpatch.pl script as
described in:

https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#6-test-contribution-checklist

> -static int do_child(void)
> -{
> -	exit(0);
> -}
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = verify_clone,
> +	.forks_child = 1,
> +//	.needs_tmpdir = 1,

If it's not needed just delete the line, no commented code please.

> +};
> \ No newline at end of file
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
