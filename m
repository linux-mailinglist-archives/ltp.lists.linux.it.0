Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC6E3E46F2
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 15:53:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9C4583C7151
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 15:53:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DFCE43C5E75
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 15:53:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5874560046A
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 15:53:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 90EB921F6D;
 Mon,  9 Aug 2021 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628517225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Y11c4UYGQMC/ZMNWzvLAxld4tlOc5ghLhuGh2yFW1s=;
 b=hcO9xP2Mxyn6j7oB/HUF7jEDjVj62KW4ri/1yEpDMFiAgG/b8fR9dSPrifm8cO2S8ubcT4
 DhgHXpu3ROs0LGyM3CVe9mhE89y/FZ2XhCfb8Wfe5ua/vql70z8TQJXcxCmvrSbDKv2ywP
 1Wlw89iR9+X4IFlmjTgy9+fVMXEBwGc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628517225;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Y11c4UYGQMC/ZMNWzvLAxld4tlOc5ghLhuGh2yFW1s=;
 b=ndDzgA+90h/AKMEpSAb7H8Yza1pvOQhfRqkt4i8v4clwXvGH5G4EVEJIvotTsaBLTAzsI9
 yJym60xSHDAaasAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DD7913BAD;
 Mon,  9 Aug 2021 13:53:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JhYrHmkzEWFbJgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 13:53:45 +0000
Date: Mon, 9 Aug 2021 15:53:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YREzdGriU/g4H9L3@yuki>
References: <20210806040011.18375-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806040011.18375-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [v2,2/4] syscalls/chroot02: Convert to new API
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

[Description]

>   *
> - * RESTRICTIONS
> - *	NONE
> + * Change root directory and then stat a file.

This may be better as well with something as:

    * Basic test for a chroot()
    *
    * - Create a file in a temporary directory
    * - Change root to the teporary directory
    * - Check that the file can be accessed
    *   in the new root directory

>   */
> 
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
> -struct stat buf;
> -
> -void setup(void);
> -void cleanup(void);
> +static int fd;
> +static struct stat buf;
> 
> -int main(int ac, char **av)
> +static void verify_chroot(void)
>  {
> -	int lc;
> -	int pid, status, retval;
> -
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
> -
> -		if (pid == 0) {
> -			retval = 0;
> -
> -			if (chroot(tst_get_tmpdir()) == -1) {
> -				perror("chroot failed");
> -				retval = 1;
> +	if (!SAFE_FORK()) {
> +		TST_EXP_PASS_SILENT(chroot(tst_get_tmpdir()), "chroot functionality correct");

Can we please store the pointer to tst_get_tmpdir() in the test setup?

As this will allocate buffer for each test iteration.

Also why PASS_SILENT, we are testing chroot here, it should show
PASS/FAIL for the chroot call.

Also the message passed to the TST_EXP_PASS is misleading, as it will be
printed when the call fails as well, it should be something as: "chroot(tmpdir)"

> +		if (TST_PASS) {
> +			if (stat("/" TMP_FILENAME, &buf) == -1) {
> +				tst_res(TFAIL, "chroot functionality incorrect");
>  			} else {
> -				if (stat("/" TMP_FILENAME, &buf) == -1) {
> -					retval = 1;
> -					perror("stat failed");
> -				}
> +				tst_res(TPASS, "chroot functionality correct");

And this should be just TST_EXP_PASS() as well.

Also the code can be written better so that we do not end up several
blocks deep as:

	if (!SAFE_FORK()) {
		TST_EXP_PASS(chroot(... );

		if (!TST_PASS)
			return;

		TST_EXP_PASS(stat("/" TMP_FILENAME, &buf));
	}
}
> -
> -			exit(retval);
>  		}
> -
> -		/* parent */
> -		wait(&status);
> -		/* make sure the child returned a good exit status */
> -		if (WIFSIGNALED(status) ||
> -		    (WIFEXITED(status) && WEXITSTATUS(status) != 0))
> -			tst_resm(TFAIL, "chroot functionality incorrect");
> -		else
> -			tst_resm(TPASS, "chroot functionality correct");
>  	}
> -
> -	cleanup();
> -	tst_exit();
> -
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
> -	if ((fileHandle = creat(TMP_FILENAME, 0777)) == -1)
> -		tst_brkm(TBROK, cleanup, "failed to create temporary file "
> -			 TMP_FILENAME);
> -	if (stat(TMP_FILENAME, &buf) != 0)
> -		tst_brkm(TBROK, cleanup, TMP_FILENAME " does not exist");
> -
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	fd = SAFE_CREAT(TMP_FILENAME, 0777);
> +	SAFE_STAT(TMP_FILENAME, &buf);

Why do we keep the fd open during the testrun?

Why do we stat the file in the setup?

All that has to be done here is:

	SAFE_TOUCH(TMP_FILENAME, 0666, NULL);

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
> -	close(fileHandle);
> +	SAFE_CLOSE(fd);
> +}
> 
> -	tst_rmdir();
> +static struct tst_test test = {
> +	.cleanup = cleanup,
> +	.setup = setup,
> +	.test_all = verify_chroot,
> +	.needs_root = 1,
> +	.forks_child = 1,
> +	.needs_tmpdir = 1,
> +};
> 
> -}
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
