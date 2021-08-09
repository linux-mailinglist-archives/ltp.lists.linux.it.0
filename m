Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 652243E474A
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 16:15:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9D553C71C7
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 16:15:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2B44D3C03FE
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 16:15:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 88347600A2E
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 16:15:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E12AD21F7F;
 Mon,  9 Aug 2021 14:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628518510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T7rvDYsiNShdogTxeifXufFuThbxotijbvBxoN3K+4w=;
 b=uP+mHK6cpEGGnKwsG/U/Bc44RsLpXRWD9u2u4W0GjnfyXEvSNgIAbLvdALBPNPO8rM+JWo
 uvbI+67VdZmZ8kHpcexVqAX0sOqXZc6anQA9u21e5+OdsNKLRwHvRNesW6L2r+Oyy8Gwy3
 ZzauL+jZ9Sph+9ep/n6T4s3ErjFc3N4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628518510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T7rvDYsiNShdogTxeifXufFuThbxotijbvBxoN3K+4w=;
 b=E0ifC8bX5FeH5+EvfFvco5uvBq3lHejz+BTj2nsV3N1ipibg+AeQ0v7ixSe8FemQPiVgN6
 AUSbA+cMkSc6fYAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD24213BB0;
 Mon,  9 Aug 2021 14:15:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zm3mMW44EWHtKwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 14:15:10 +0000
Date: Mon, 9 Aug 2021 16:15:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YRE4eYQf5Rr5L0+7@yuki>
References: <20210806040033.18653-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806040033.18653-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [3/4] syscalls/chroot03: Convert to new API
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
> - *	4.	Test for EFAULT:
> - *		The pathname parameter to chroot() points to an invalid address,
> - *		chroot(2) fails with EPERM.
> - *
> - *	5.	Test for ELOOP:
> - *		Too many symbolic links were encountered When resolving the
> - *		pathname parameter.
> - *
> - *	07/2001 Ported by Wayne Boyer
> + *	Testcase to test whether chroot(2) sets errno correctly.
>   */
> 
>  #include <stdio.h>
> -#include <errno.h>
> -#include <sys/stat.h>
> -#include <sys/mman.h>
> -#include "test.h"
> -#include <fcntl.h>
> -#include "safe_macros.h"
> -
> -char *TCID = "chroot03";
> +#include "tst_test.h"
> 
>  static int fd;
>  static char fname[255];
>  static char nonexistent_dir[100] = "testdir";
>  static char bad_dir[] = "abcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyzabcdefghijklmnopqrstmnopqrstuvwxyz";
>  static char symbolic_dir[] = "sym_dir1";
> +static char *bad_addr;
> 
> -struct test_case_t {
> +static struct tcase {
>  	char *dir;
>  	int error;
> -} TC[] = {
> -	/*
> -	 * to test whether chroot() is setting ENAMETOOLONG if the
> -	 * pathname is more than VFS_MAXNAMELEN
> -	 */
> -	{
> -	bad_dir, ENAMETOOLONG},
> +} tcases[] = {
> +		/*
> +		* to test whether chroot() is setting ENAMETOOLONG if the
> +		* pathname is more than VFS_MAXNAMELEN
> +		*/

These comments are useless, it would make much more sense to have these
in the [Description] formatted as an asciidoc list.

> +	{bad_dir, ENAMETOOLONG},
>  	    /*
>  	     * to test whether chroot() is setting ENOTDIR if the argument
>  	     * is not a directory.
>  	     */
> -	{
> -	fname, ENOTDIR},
> +	{fname, ENOTDIR},
>  	    /*
>  	     * to test whether chroot() is setting ENOENT if the directory
>  	     * does not exist.
>  	     */
> -	{
> -	nonexistent_dir, ENOENT},
> -#if !defined(UCLINUX)
> +	{nonexistent_dir, ENOENT},
>  	    /*
>  	     * attempt to chroot to a path pointing to an invalid address
>  	     * and expect EFAULT as errno
>  	     */
> -	{
> -	(char *)-1, EFAULT},
> -#endif
> +	{(char *)-1, EFAULT},
>  	{symbolic_dir, ELOOP}
>  };
> 
> -int TST_TOTAL = ARRAY_SIZE(TC);
> -
> -static char *bad_addr;
> -
> -static void setup(void);
> -static void cleanup(void);
> -
> -int main(int ac, char **av)
> +static void verify_chroot(unsigned int n)
>  {
> -	int lc;
> -	int i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> +	struct tcase *tc = &tcases[n];
> 
> -		for (i = 0; i < TST_TOTAL; i++) {
> -			TEST(chroot(TC[i].dir));
> +	TST_EXP_FAIL(chroot(tc->dir), tc->error,
> +			"didn't fail as expected (expected errno "
> +			"= %d : %s)", tc->error, strerror(tc->error));

This is completely wrong, the TST_EXP_FAIL() will build the PASS/FAIL
messages, all that should be passed to it is a message that describes
what is being tested.

In this case it would be probably for the best to include a description
in the tcase structure and do just "%s", tc->desc here. And the
descriptions should look like:

	...
	{not_dir, ENOTDIR, "chroot(not-a-directory)"},
	{nonexistent, ENOENT, "chroot(does-not-exists)"},
	...

> -			if (TEST_RETURN != -1) {
> -				tst_resm(TFAIL, "call succeeded unexpectedly");
> -				continue;
> -			}
> -
> -			if (TEST_ERRNO == TC[i].error) {
> -				tst_resm(TPASS | TTERRNO, "failed as expected");
> -			} else {
> -				tst_resm(TFAIL | TTERRNO,
> -					 "didn't fail as expected (expected errno "
> -					 "= %d : %s)",
> -					 TC[i].error, strerror(TC[i].error));
> -			}
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
>  }
> 
>  static void setup(void)
>  {
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -	TEST_PAUSE;
> -	tst_tmpdir();
> -
>  	/*
>  	 * create a file and use it to test whether chroot() is setting
>  	 * ENOTDIR if the argument is not a directory.
>  	 */
>  	(void)sprintf(fname, "tfile_%d", getpid());
> -	fd = SAFE_CREAT(cleanup, fname, 0777);
> +	fd = SAFE_CREAT(fname, 0777);

Again there is no reason to keep the fd open during the testrun, we can
as well use SAFE_TOUCH() here instead.

> -#if !defined(UCLINUX)
> -	bad_addr = mmap(0, 1, PROT_NONE,
> -			MAP_PRIVATE_EXCEPT_UCLINUX | MAP_ANONYMOUS, 0, 0);
> -	if (bad_addr == MAP_FAILED)
> -		tst_brkm(TBROK, cleanup, "mmap failed");
> -
> -	TC[3].dir = bad_addr;
> -#endif
> +	bad_addr = tst_get_bad_addr(NULL);
> +	tcases[3].dir = bad_addr;

Why do we need to store the bad_addr to a global variable here?

Also in order to avoid hardcoded indexes we usually use for loop to
initialize bad address with

	for (i = 0; i < ARRAY_SIZE(tcases); i++) {
		if (tcases[i].error == EFAULT)
			tcases[i].dir = tst_get_bad_addr(NULL);
	}

>  	/*
>  	 * create two symbolic directory who point to each other to
>  	 * test ELOOP.
>  	 */
> -	SAFE_SYMLINK(cleanup, "sym_dir1/", "sym_dir2");
> -	SAFE_SYMLINK(cleanup, "sym_dir2/", "sym_dir1");
> +	SAFE_SYMLINK("sym_dir1/", "sym_dir2");
> +	SAFE_SYMLINK("sym_dir2/", "sym_dir1");
>  }
> 
>  static void cleanup(void)
>  {
> -	close(fd);
> -	tst_rmdir();
> +	SAFE_CLOSE(fd);
>  }
> +
> +static struct tst_test test = {
> +	.cleanup = cleanup,
> +	.setup = setup,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = verify_chroot,
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
