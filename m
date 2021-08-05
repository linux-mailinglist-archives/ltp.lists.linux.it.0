Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED03E11A6
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:52:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA36F3C7F54
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 11:52:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E11863C7D85
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:52:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3C81C1A011F4
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 11:52:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F40B222E7;
 Thu,  5 Aug 2021 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628157148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YgEyTGfncustVFyp/1iTsteXXYaBDS4OeYDZXzJ/KoI=;
 b=DGb0JEyTlE+NYQTKwcFwduoQN+AoEiWN7zDS1jHgOirThXSOxJSBCrGQpRH4oPwk6chSNv
 UUb9urOYdF49Gwah2u98Lc8LwHWO/xS0rWiz7HiVkAPhwJP8TFso1VHbf64mrLnmNlamOD
 8TY7ucnnNVoB331OzB6O8eULPEY0vhI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628157148;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YgEyTGfncustVFyp/1iTsteXXYaBDS4OeYDZXzJ/KoI=;
 b=udyvypH3DS6W4ebbagX1CuFOJc8x6T+wML8QtT4p1xRa/WGNrEx81drpu6O4ACn/1568v3
 MlV5gV/iBTkpUMDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 77CFA13D52;
 Thu,  5 Aug 2021 09:52:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b8HVHNu0C2ENFgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 05 Aug 2021 09:52:27 +0000
Date: Thu, 5 Aug 2021 11:52:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YQu05CxhjG8f5EJT@yuki>
References: <20210805073405.15310-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805073405.15310-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [2/4] syscalls/chroot02: Convert to new API
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
> + * [DESCRIPTION]
>   *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *	04/2003 Modified by Manoj Iyer - manjo@mail.utexas.edu

We usually move this part just after the IBM copyright.

> - *	Change testcase to chroot into a temporary directory
> - *	and stat() a known file.
> - *
> - * RESTRICTIONS
> - *	NONE
> + * Change root directory and then stat a file.
>   */
> -
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <sys/wait.h>
> +#include <stdio.h>
> +#include <stdlib.h>
>  #include <errno.h>
> -#include "test.h"
> +#include <sys/stat.h>
>  #include <fcntl.h>
> -
> -char *TCID = "chroot02";
> -int TST_TOTAL = 1;
> -int fileHandle = 0;
> +#include "tst_test.h"
> 
>  #define TMP_FILENAME	"chroot02_testfile"
> +int fileHandle = 0;

Uff, just use fd as we do everywhere else, also it should be static and
moreover global variables are already initialized to 0 so this really
should be just:

static int fd;

>  struct stat buf;

static as well.

> -void setup(void);
> -void cleanup(void);
> -
> -int main(int ac, char **av)
> +static void verify_chroot(void)
>  {
> -	int lc;
>  	int pid, status, retval;
> 
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	/* Check for looping state if -i option is given */
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		/* reset tst_count in case we are looping */
> -		tst_count = 0;
> -
> -		if ((pid = FORK_OR_VFORK()) == -1) {
> -			tst_brkm(TBROK, cleanup, "Could not fork");
> -		}
> +	if ((pid = SAFE_FORK()) == -1) {
> +		tst_brk(TBROK, "Could not fork");
> +	}

Again SAFE_ macros cannot fail.

> -		if (pid == 0) {
> -			retval = 0;
> +	if (pid == 0) {
> +		retval = 0;
> 
> -			if (chroot(tst_get_tmpdir()) == -1) {
> -				perror("chroot failed");
> +		if (chroot(tst_get_tmpdir()) == -1) {
> +			perror("chroot failed");
> +			retval = 1;

This should be TST_EXP_PASS().

> +		} else {
> +			if (stat("/" TMP_FILENAME, &buf) == -1) {
>  				retval = 1;
> -			} else {
> -				if (stat("/" TMP_FILENAME, &buf) == -1) {
> -					retval = 1;
> -					perror("stat failed");
> -				}
> +				perror("stat failed");
>  			}
> -
> -			exit(retval);
>  		}
> 
> -		/* parent */
> -		wait(&status);
> -		/* make sure the child returned a good exit status */
> -		if (WIFSIGNALED(status) ||
> -		    (WIFEXITED(status) && WEXITSTATUS(status) != 0))
> -			tst_resm(TFAIL, "chroot functionality incorrect");
> -		else
> -			tst_resm(TPASS, "chroot functionality correct");
> +		exit(retval);
>  	}
> 
> -	cleanup();
> -	tst_exit();
> +	/* parent */
> +	SAFE_WAIT(&status);
> +	/* make sure the child returned a good exit status */
> +	if (WIFSIGNALED(status) ||
> +			(WIFEXITED(status) && WEXITSTATUS(status) != 0))
> +		tst_res(TFAIL, "chroot functionality incorrect");
> +	else
> +		tst_res(TPASS, "chroot functionality correct");

New library testcases can call tst_res() from a child processes so there
is no reason to propagate the test result via process exit value. The
child should use tst_res() instead of the perror() calls and the parent
should just call tst_reap_children().

>  }
> 
> -/*
> - * setup() - performs all ONE TIME setup for this test.
> - */
> -void setup(void)
> +static void setup(void)
>  {
> -	tst_require_root();
> -
> -	tst_tmpdir();
>  	if ((fileHandle = creat(TMP_FILENAME, 0777)) == -1)
> -		tst_brkm(TBROK, cleanup, "failed to create temporary file "
> -			 TMP_FILENAME);
> +		tst_brk(TBROK, "failed to create temporary file "
> +				TMP_FILENAME);
>  	if (stat(TMP_FILENAME, &buf) != 0)
> -		tst_brkm(TBROK, cleanup, TMP_FILENAME " does not exist");
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +		tst_brk(TBROK, TMP_FILENAME " does not exist");

We do have SAFE_CREAT() and SAFE_STAT() please use them here as well.

>  }
> 
> -/*
> - * cleanup() - performs all ONE TIME cleanup for this test at
> - *	       completion or premature exit.
> - */
> -void cleanup(void)
> +static void cleanup(void)
>  {
> -	/*
> -	 * print timing stats if that option was specified.
> -	 * print errno log if that option was specified.
> -	 */
>  	close(fileHandle);

You should use SAFE_CLOSE() here as well.

> -
> -	tst_rmdir();
> -
>  }
> +
> +static struct tst_test test = {
> +	.cleanup = cleanup,
> +	.setup = setup,
> +	.test_all = verify_chroot,
> +	.needs_root = 1,
> +	.forks_child = 1,
> +	.needs_tmpdir = 1,
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
