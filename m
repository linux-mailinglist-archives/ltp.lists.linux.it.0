Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A9B429412
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Oct 2021 17:59:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74A753C0BC0
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Oct 2021 17:59:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E62043C0957
 for <ltp@lists.linux.it>; Mon, 11 Oct 2021 17:59:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CF647200DED
 for <ltp@lists.linux.it>; Mon, 11 Oct 2021 17:59:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0ADB71FED2;
 Mon, 11 Oct 2021 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1633967954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7p1/xFObmnjc6MzmQJqK/ZfrHBUBlAoOVtmKSBH9jjs=;
 b=oo7v4wGOjLrvvFIVxA37pWwa6Pgd0K45M8W5ksmxdRHbOxRIexajiBA9JKHmiXmnfAWT/G
 zlspr8Rh6b0Apwaul7UN3pwgrl1fI0pL8My8pAGA+WmGu5yz/2a7dh1akbmAlYUzsB/T1/
 QPC22Us+yeA4FZmz2Mr+OvToFPCxB5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1633967954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7p1/xFObmnjc6MzmQJqK/ZfrHBUBlAoOVtmKSBH9jjs=;
 b=cBxuIZkiWuAi2dvsW1R/K7PdYAsdrZpglb2j9EHUkUn+Hr5oGP2zlce7C3d25YZxrOlTPX
 AH8evG+7Q+Nr19Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E38DF13BC0;
 Mon, 11 Oct 2021 15:59:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZZUGN1FfZGGwYAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 11 Oct 2021 15:59:13 +0000
Date: Mon, 11 Oct 2021 17:59:52 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YWRfeIfOExBjpety@yuki>
References: <20210923085224.868-1-zhanglianjie@uniontech.com>
 <20210923085224.868-3-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923085224.868-3-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/5] syscalls/clone05: Convert to new API
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
>   * Call clone() with CLONE_VFORK flag set. verify that
>   * execution of parent is suspended until child finishes
>   */
> 
>  #define _GNU_SOURCE
> 
> -#include <errno.h>
> +#include <stdlib.h>
>  #include <sched.h>
> -#include <sys/wait.h>
> -#include "test.h"
> +#include "tst_test.h"
>  #include "clone_platform.h"
> 
> -char *TCID = "clone05";
> -int TST_TOTAL = 1;
> -
> -static void setup(void);
> -static void cleanup(void);
> -static int child_fn(void *);
> -
> -static int child_exited = 0;
> +static int child_exited;
              ^
This should be volatile as well in order to avoid compiler
mis-optimizations.

> +static void *child_stack;
> 
> -int main(int ac, char **av)
> +static int child_fn(void *unused LTP_ATTRIBUTE_UNUSED)
>  {
> +	int i;
> 
> -	int lc, status;
> -	void *child_stack;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	child_stack = malloc(CHILD_STACK_SIZE);
> -	if (child_stack == NULL)
> -		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		TEST(ltp_clone(CLONE_VM | CLONE_VFORK | SIGCHLD, child_fn, NULL,
> -		               CHILD_STACK_SIZE, child_stack));
> -
> -		if ((TEST_RETURN != -1) && (child_exited))
> -			tst_resm(TPASS, "Test Passed");
> -		else
> -			tst_resm(TFAIL, "Test Failed");
> +	for (i = 0; i < 100; i++) {
> +		sched_yield();
> +		usleep(1000);
> +	}
> 
> -		if ((wait(&status)) == -1)
> -			tst_brkm(TBROK | TERRNO, cleanup,
> -				 "wait failed, status: %d", status);
> +	child_exited = 1;
> +	_exit(0);
> +}
> 
> -		child_exited = 0;
> -	}
> +static void verify_clone(void)
> +{
> +	TST_EXP_PID_SILENT(ltp_clone(CLONE_VM | CLONE_VFORK | SIGCHLD, child_fn, NULL,
> +					CHILD_STACK_SIZE, child_stack), "clone with vfork");
> 
> -	free(child_stack);
> +	if (!TST_PASS)
> +		return;
> 
> -	cleanup();
> -	tst_exit();
> +	TST_EXP_VAL(child_exited, 1);
>  }
> 
>  static void setup(void)
>  {
> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> +	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
> +	child_exited = 0;

Here again this has to be cleared in the test function because
oftherwise the test will fail with -i 2.

>  }
> 
>  static void cleanup(void)
>  {
> +	free(child_stack);
>  }

Please use the guarded buffer in this test as well.

> -static int child_fn(void *unused __attribute__((unused)))
> -{
> -	int i;
> -
> -	/* give the kernel scheduler chance to run the parent */
> -	for (i = 0; i < 100; i++) {
> -		sched_yield();
> -		usleep(1000);
> -	}
> -
> -	child_exited = 1;
> -	_exit(1);
> -}
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test_all = verify_clone,
> +	.cleanup = cleanup,
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
