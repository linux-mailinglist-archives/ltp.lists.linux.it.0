Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 842823F75DE
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 15:28:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A2C943C8DCD
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 15:28:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 717BA3C2FB4
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 15:28:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5EDEF2009B0
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 15:28:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B08FF221E1;
 Wed, 25 Aug 2021 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629898103; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bPFzjlalOD+lqsFw7OcNOdFt359PDZV9mRMRzFtclQ0=;
 b=KbFL9yrmQDLOfTdczAFXUjRY9qRgh0OV1R+Gr6dI3cd2mgVx1xOfcqmpE+qn5RsOiK/RI7
 022Z+GOhzw35UsNPjwnYaQeEKWnTdo1REK4E2GKzrK3gXVDsej5vE/I/m3bDmJbP9mwWaK
 az7qTbUtzePWcW2ENVB+A4uy9bRABrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629898103;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bPFzjlalOD+lqsFw7OcNOdFt359PDZV9mRMRzFtclQ0=;
 b=2BlLSjAZtU5MWdWFoHbHl09VZ7jj9vwbUQqwpNlRf+s91THnNyAfZOkNTuOjNqptweW+S+
 060U2R59mQFr5IAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9D15713AD7;
 Wed, 25 Aug 2021 13:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8VAxJXdFJmFtWQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 25 Aug 2021 13:28:23 +0000
Date: Wed, 25 Aug 2021 15:28:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YSZFevqbUYbpvPNl@yuki>
References: <20210813072625.21404-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813072625.21404-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/clone02: Convert to new API
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
> +#define TESTFILE "testfile"
> +#define TESTDIR "testdir"
>  #define FLAG_ALL (CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|SIGCHLD)
>  #define FLAG_NONE SIGCHLD
>  #define PARENT_VALUE 1
> @@ -72,239 +39,28 @@
>  #define TRUE 1
>  #define FALSE 0

Please no defines like this, just use 0 and 1 in the code instead.

> -#include "clone_platform.h"
> -
> -static void setup(void);
> -static int test_setup(void);
> -static void cleanup(void);
> -static void test_cleanup(void);
> -static int child_fn();
> -static int parent_test1(void);
> -static int parent_test2(void);
> -static int test_VM(void);
> -static int test_FS(void);
> -static int test_FILES(void);
> -static int test_SIG(void);
> -static int modified_VM(void);
> -static int modified_FS(void);
> -static int modified_FILES(void);
> -static int modified_SIG(void);
> -static void sig_child_defined_handler(int);
> -static void sig_default_handler();
> -
>  static int fd_parent;
> -static char file_name[25];
>  static int parent_variable;
> -static char cwd_parent[FILENAME_MAX];
> +static char *cwd_parent;
>  static int parent_got_signal, child_pid;
> +static void *child_stack;
> +static char cwd_child[FILENAME_MAX];

...

> -static int parent_test2(void)
> -{
> -
> -	/*
> -	 * For second test case (with no resouce shared), all of the
> -	 * modified_*() functions should return 0 for parent_test2()
> -	 * to return 1
> -	 */
> -	if (modified_VM() || modified_FILES() || modified_FS() ||
> -	    modified_SIG())
> -		return 0;
> -
> -	return -1;
> +	TEST(tst_syscall(__NR_gettid));
> +	if (TST_RET == child_pid)
> +		tst_res(TWARN, "Child got SIGUSR2 signal");
> +	else
> +		parent_got_signal = TRUE;
>  }
> 
>  /*
> - * test_VM() - function to change parent_variable from child's
> - *	       address space. If CLONE_VM flag is set, child shares
> - *	       the memory space with parent so this will be visible
> - *	       to parent also.
> + * function to change parent_variable from child's
> + * address space. If CLONE_VM flag is set, child shares
> + * the memory space with parent so this will be visible
> + * to parent also.
>   */
> -
>  static int test_VM(void)
>  {
>  	parent_variable = CHILD_VALUE;
> @@ -312,157 +68,207 @@ static int test_VM(void)
>  }
> 
>  /*
> - * test_FILES() - This function closes a file descriptor opened by
> - *		  parent. If CLONE_FILES flag is set, the parent and
> - *		  the child process share the same file descriptor
> - *		  table. so this affects the parent also
> + * This function closes a file descriptor opened by
> + * parent. If CLONE_FILES flag is set, the parent and
> + * the child process share the same file descriptor
> + * table. so this affects the parent also
>   */
>  static int test_FILES(void)
>  {
> -	if (close(fd_parent) == -1) {
> -		tst_resm(TWARN | TERRNO, "close failed in test_FILES");
> -		return -1;
> -	}
> -	return 0;
> +	return close(fd_parent);;
>  }
> 
>  /*
> - * test_FS() -  This function changes the current working directory
> - *		of the child process. If CLONE_FS flag is set, this
> - *		will be visible to parent also.
> + * This function changes the current working directory
> + * of the child process. If CLONE_FS flag is set, this
> + * will be visible to parent also.
>   */
>  static int test_FS(void)
>  {
> -	char *test_tmpdir;
>  	int rval;
> 
> -	test_tmpdir = tst_get_tmpdir();
> -	if (test_tmpdir == NULL) {
> -		tst_resm(TWARN | TERRNO, "tst_get_tmpdir failed");
> -		rval = -1;
> -	} else if (chdir(test_tmpdir) == -1) {
> -		tst_resm(TWARN | TERRNO, "chdir failed in test_FS");
> -		rval = -1;
> -	} else {
> -		rval = 0;
> -	}
> -
> -	free(test_tmpdir);
> +	rval = SAFE_CHDIR(cwd_child);
>  	return rval;
>  }
> 
>  /*
> - * test_SIG() - This function changes the signal handler for SIGUSR2
> - *		signal for child. If CLONE_SIGHAND flag is set, this
> - *		affects parent also.
> + * This function changes the signal handler for SIGUSR2
> + * signal for child. If CLONE_SIGHAND flag is set, this
> + * affects parent also.
>   */
>  static int test_SIG(void)
>  {
> -
>  	struct sigaction new_act;
> 
>  	new_act.sa_handler = sig_child_defined_handler;
>  	new_act.sa_flags = SA_RESTART;
> -	sigemptyset(&new_act.sa_mask);
> +	SAFE_SIGEMPTYSET(&new_act.sa_mask);
> 
> -	/* Set signal handler to sig_child_defined_handler */
> -	if (sigaction(SIGUSR2, &new_act, NULL) == -1) {
> -		tst_resm(TWARN | TERRNO, "signal failed in test_SIG");
> +	if (SAFE_SIGACTION(SIGUSR2, &new_act, NULL)) {
>  		return -1;
>  	}
> 
> -	/* Send SIGUSR2 signal to parent */
> -	if (kill(getppid(), SIGUSR2) == -1) {
> -		tst_resm(TWARN | TERRNO, "kill failed in test_SIG");
> -		return -1;
> -	}
> -
> -	return 0;
> +	return SAFE_KILL(getppid(), SIGUSR2);
>  }
> 
>  /*
> - * modified_VM() - This function is called by parent process to check
> - *		   whether child's modification to parent_variable
> - *		   is visible to parent
> + * This function is called by parent process to check
> + * whether child's modification to parent_variable
> + * is visible to parent
>   */
> -
>  static int modified_VM(void)
>  {
> -
> -	if (parent_variable == CHILD_VALUE)
> -		/* child has modified parent_variable */
> -		return 1;
> -
> -	return 0;
> +	return parent_variable == CHILD_VALUE;
>  }
> 
>  /*
> - * modified_FILES() - This function checks for file descriptor table
> - *		      modifications done by child
> + * This function checks for file descriptor table
> + * modifications done by child
>   */
>  static int modified_FILES(void)
>  {
>  	char buff[20];
> -
>  	if (((read(fd_parent, buff, sizeof(buff))) == -1) && (errno == EBADF))
> -		/* Child has closed this file descriptor */
>  		return 1;
> -
> -	/* close fd_parent */
> -	if ((close(fd_parent)) == -1)
> -		tst_resm(TWARN | TERRNO, "close() failed in modified_FILES()");
> -
> +
> +	SAFE_CLOSE(fd_parent);
>  	return 0;
>  }
> 
>  /*
> - * modified_FS() - This function checks parent's current working directory
> - *		   to see whether its modified by child or not.
> + * This function checks parent's current working directory
> + * to see whether its modified by child or not.
>   */
>  static int modified_FS(void)
>  {
>  	char cwd[FILENAME_MAX];
> -
> -	if ((getcwd(cwd, sizeof(cwd))) == NULL)
> -		tst_resm(TWARN | TERRNO, "getcwd() failed");
> -
> -	if (!(strcmp(cwd, cwd_parent)))
> -		/* cwd hasn't changed */
> -		return 0;
> -
> -	return 1;
> +
> +	SAFE_GETCWD(cwd, sizeof(cwd));
> +	return strcmp(cwd, cwd_parent);
>  }
> 
>  /*
> - * modified_SIG() - This function checks whether child has changed
> - *		    parent's signal handler for signal, SIGUSR2
> + * This function checks whether child has changed
> + * parent's signal handler for signal, SIGUSR2
>   */
>  static int modified_SIG(void)
>  {
> +	return parent_got_signal;
> +}
> 
> -	if (parent_got_signal)
> -		/*
> -		 * parent came through sig_child_defined_handler()
> -		 * this means child has changed parent's handler
> -		 */
> -		return 1;
> +static void sig_parent_default_handler(int pid LTP_ATTRIBUTE_UNUSED)
> +{
> +
> +}
> +
> +static int child_fn(void *arg LTP_ATTRIBUTE_UNUSED)
> +{
> +	TEST(tst_syscall(__NR_gettid));
> +	child_pid = TST_RET;
> +
> +	if (test_VM() == 0 && test_FILES() == 0 && test_FS() == 0 &&
> +	    test_SIG() == 0)
> +		_exit(0);
> +	_exit(1);

There is no reason for the separate test_FOO() functions, it would
actually easier to read if all the code that attempt to modify
VM/FDS/FS/SIG would be directly in this function.

> +}
> +
> +static int parent_test1(void)
> +{
> +
> +	/*
> +	 * Verify that the parent process resource has changed
> +	 */
> +	if (modified_VM() && modified_FILES() && modified_FS() &&
> +	    modified_SIG())
> +		return 0;
> +	return -1;
> +}
> +
> +static int parent_test2(void)
> +{
> +	/*
> +	 * Verify that the parent process resource has not changed
> +	 */
> +	if (modified_VM() || modified_FILES() || modified_FS() ||
> +	    modified_SIG())
> +		return -1;
> 
>  	return 0;
>  }
> 
> -/*
> - * sig_child_defined_handler()  - Signal handler installed by child
> - */
> -static void sig_child_defined_handler(int pid)
> +struct tcase {
> +	unsigned long flags;
> +	int (*parent_fn) ();
> +	char *desc;
> +} tcases[] = {
> +	{FLAG_ALL, parent_test1, "clone() with all resources shared"},
> +	{FLAG_NONE, parent_test2, "clone() with all no resources shared"}
> +};
> +
> +static void verify_clone(void)
>  {
> -	if ((syscall(__NR_gettid)) == child_pid)
> -		/* Child got signal, give warning */
> -		tst_resm(TWARN, "Child got SIGUSR2 signal");
> -	else
> -		parent_got_signal = TRUE;
> +	TST_EXP_POSITIVE(ltp_clone(tcases[tst_variant].flags, child_fn, NULL,
> +				CHILD_STACK_SIZE, child_stack),
> +				"%s", tcases[tst_variant].desc);
> +
> +	if (!TST_PASS)
> +		return;
> +
> +	tst_reap_children();
> +
> +	TST_EXP_PASS(tcases[tst_variant].parent_fn(), "%s", tcases[tst_variant].desc);

Please do not do this. We really want to see a PASS/FAIL per assertion
instead.

> +}
> +
> +
> +static void cleanup(void)
> +{
> +	SAFE_CHDIR(cwd_parent);
> +	SAFE_UNLINK(TESTFILE);
> +	SAFE_RMDIR(cwd_child);

There is no need to cleanup files in the test temporary directory, the
test library will do that once the test is finished.

> +	free(cwd_parent);
> +	free(child_stack);
>  }
> 
> -/* sig_default_handler() - Default handler for parent */
> -static void sig_default_handler(void)
> +static void setup(void)
>  {
> +	struct sigaction def_act;
> +
> +	/* Save current working directory of parent */
> +	cwd_parent = tst_get_tmpdir();
> +
> +	/*
> +	 * Set value for parent_variable in parent, which will be
> +	 * changed by child in test_VM(), for testing CLONE_VM flag
> +	 */
> +	parent_variable = PARENT_VALUE;
> +
> +	/*
> +	 * Open file from parent, which will be closed by
> +	 * child in test_FILES(), used for testing CLONE_FILES flag
> +	 */
> +	fd_parent = SAFE_OPEN(TESTFILE, O_CREAT | O_RDWR, 0777);
> +
> +	/*
> +	 * set parent_got_signal to FALSE, used for testing
> +	 * CLONE_SIGHAND flag
> +	 */
> +	parent_got_signal = FALSE;
> +
> +	def_act.sa_handler = sig_parent_default_handler;
> +	def_act.sa_flags = SA_RESTART;
> +	SAFE_SIGEMPTYSET(&def_act.sa_mask);
> +	SAFE_SIGACTION(SIGUSR2, &def_act, NULL);
> +
> +	SAFE_MKDIR(TESTDIR, 0777);
> +	sprintf(cwd_child, "%s/%s", cwd_parent, TESTDIR);
> +	child_stack = SAFE_MALLOC(CHILD_STACK_SIZE);
>  }
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_variants = ARRAY_SIZE(tcases),
> +	.test_all = verify_clone,
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
