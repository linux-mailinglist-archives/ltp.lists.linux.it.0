Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4262555329F
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 14:57:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDC7D3C93D0
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 14:57:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9467D3C8CC0
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 14:57:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C2065600906
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 14:57:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E537D1F8A3;
 Tue, 21 Jun 2022 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655816248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bSAdn+0ktTFyt2YxZKmE4IFG1mjBdlzvAdY0hf26yI=;
 b=aypYZzMm5G/wSmVzO1tmu0xyFt+1VISN6ExerqmT0p+jxFEikSReIB8hnMu7I5T7ybxv4N
 zjJ6ujqBXNClhgQuTdEbRIuSTdUL9PzG1XcbvN26aEmddYI/gPtofLLQeKSDMIlHugpu+X
 tuZpXhY7DhtT72Yt1p97OqeZpX/9IOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655816248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1bSAdn+0ktTFyt2YxZKmE4IFG1mjBdlzvAdY0hf26yI=;
 b=nV+R2K0Yra5kq5W9m8Ve8yJpgpYB+dDJeAOkE1KtIl3Q/wxabTbp0pxiY8G15/QK3ai+KZ
 CW44TnudKcKoe2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFF9213A88;
 Tue, 21 Jun 2022 12:57:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zaEZMDjAsWL3GwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 21 Jun 2022 12:57:28 +0000
Date: Tue, 21 Jun 2022 14:59:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <YrHAuGuLo502sZS+@yuki>
References: <20220617172025.23975-1-akumar@suse.de>
 <20220617172025.23975-7-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220617172025.23975-7-akumar@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/6] Rewrite utime06.c using new LTP API
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
> -/*
> - * Test Description:
> - * 1. Verify that the system call utime() fails to set the modification
> - *    and access times of a file to the current time, under the following
> - *    constraints,
> - *	 - The times argument is null.
> +/*\
> + * [Description]
> + * 1. Verify that the system call utime() fails to change the last access
> + *    and modification times of a file to the current time, and errno is
> + *    set to EACCES, when
> + *	 - The times argument is NULL.
> + *   - The user ID of the process does not match the owner of the file.
>   *	 - The user ID of the process is not "root".

This does not render particulary well in the asciidoc docparser also the
text is way more verbose than it should be. Let's keept it short and to
to point with something as:

 /*\
  * [Description]
  *
  * Verify that utime() fails with:
  * - EACCESS when user does not have rights to modify the file.
  * - ENOENT when specified file does not exists.
  * - ...
  *

> - * 2. Verify that the system call utime() fails to set the modification
> - *    and access times of a file if the specified file doesn't exist.
> - * 3. Verify that the system call utime() fails to set the modification
> - *    and access times of a file to the current time, under the following
> - *    constraints,
> - *	 - The times argument is not null.
> + * 2. Verify that the system call utime() fails to change the last access
> + *    and modification times of a file, and the errno is set to ENOENT,
> + *    when
> + *    - The specified file does not exist.
> + * 3. Verify that the system call utime() fails to change the last access
> + *    and modification times of a file to the current time, and errno is
> + *    set to EPERM, when
> + *	 - The times argument is not NULL.
> + *   - The user ID of the process does not match the owner of the file.
>   *	 - The user ID of the process is not "root".
> - * 4. Verify that the system call utime() fails to set the modification
> - *    and access times of a file that resides on a read-only file system.
> + * 4. Verify that the system call utime() fails to change the last access
> + *    and modification times of a file, and errno is set to EROFS, when
> + *   - The path resides on a read-only filesystem.
>   */
>  
> -#include <errno.h>
> -#include <fcntl.h>
>  #include <pwd.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <signal.h>
> -#include <string.h>
> -#include <unistd.h>
>  #include <utime.h>
> -#include <sys/wait.h>
> -#include <sys/stat.h>
> -#include <sys/types.h>
> -#include <sys/mount.h>
>  
> -#include "test.h"
> -#include "safe_macros.h"
> +#include "tst_test.h"
>  
>  #define TEMP_FILE	"tmp_file"
>  #define MNT_POINT	"mntpoint"
> +#define FILE_MODE	0644
> +#define TEST_USERNAME "nobody"
>  
> -char *TCID = "utime06";
> -static struct passwd *ltpuser;
>  static const struct utimbuf times;
> -static const char *dev;
> -static int mount_flag;
> -static void setup_nobody(void);
> -static void cleanup_nobody(void);
>  
> -struct test_case_t {
> +static struct tcase {
>  	char *pathname;
>  	int exp_errno;
> -	const struct utimbuf *times;
> -	void (*setup_func)(void);
> -	void (*cleanup_func)(void);
> -} Test_cases[] = {
> -	{TEMP_FILE, EACCES, NULL, setup_nobody, cleanup_nobody},
> -	{"", ENOENT, NULL, NULL, NULL},
> -	{TEMP_FILE, EPERM, &times, setup_nobody, cleanup_nobody},
> -	{MNT_POINT, EROFS, NULL, NULL, NULL},
> +	const struct utimbuf *utimbuf;
> +	char *err_desc;
> +} tcases[] = {
> +	{TEMP_FILE, EACCES, NULL, "No write access"},
> +	{"", ENOENT, NULL, "File not exist"},
> +	{TEMP_FILE, EPERM, &times, "Not file owner"},
> +	{MNT_POINT, EROFS, NULL, "Read-only filesystem"}
>  };
>  
> -int TST_TOTAL = ARRAY_SIZE(Test_cases);
> -static void setup(void);
> -static void utime_verify(const struct test_case_t *);
> -static void cleanup(void);
> -
> -int main(int ac, char **av)
> -{
> -	int lc;
> -	int i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -		for (i = 0; i < TST_TOTAL; i++)
> -			utime_verify(&Test_cases[i]);
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
>  
>  static void setup(void)
>  {
> -	const char *fs_type;
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	tst_require_root();
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	SAFE_TOUCH(cleanup, TEMP_FILE, 0644, NULL);
> -
> -	fs_type = tst_dev_fs_type();
> -	dev = tst_acquire_device(cleanup);
> -	if (!dev)
> -		tst_brkm(TCONF, cleanup, "Failed to acquire test device");
> -
> -	tst_mkfs(cleanup, dev, fs_type, NULL, NULL);
> +	struct passwd *pw;
>  
> -	SAFE_MKDIR(cleanup, MNT_POINT, 0644);
> -	SAFE_MOUNT(cleanup, dev, MNT_POINT, fs_type, MS_RDONLY, NULL);
> -	mount_flag = 1;
> +	SAFE_TOUCH(TEMP_FILE, FILE_MODE, NULL);
>  
> -	ltpuser = SAFE_GETPWNAM(cleanup, "nobody");
> +	pw = SAFE_GETPWNAM(TEST_USERNAME);
> +	tst_res(TINFO, "Switching effective user ID to user: %s", pw->pw_name);
> +	SAFE_SETEUID(pw->pw_uid);
>  }
>  
> -static void utime_verify(const struct test_case_t *test)
> +static void run(unsigned int i)
>  {
> -	if (test->setup_func != NULL)
> -		test->setup_func();
> +	struct tcase *tc = &tcases[i];
>  
> -	TEST(utime(test->pathname, test->times));
> -
> -	if (test->cleanup_func != NULL)
> -		test->cleanup_func();
> -
> -	if (TEST_RETURN != -1) {
> -		tst_resm(TFAIL, "utime succeeded unexpectedly");
> -		return;
> -	}
> -
> -	if (TEST_ERRNO == test->exp_errno) {
> -		tst_resm(TPASS | TTERRNO, "utime failed as expected");
> -	} else {
> -		tst_resm(TFAIL | TTERRNO,
> -			 "utime failed unexpectedly; expected: %d - %s",
> -			 test->exp_errno, strerror(test->exp_errno));
> -	}
> -}
> -
> -static void setup_nobody(void)
> -{
> -	SAFE_SETEUID(cleanup, ltpuser->pw_uid);
> -}
> -
> -static void cleanup_nobody(void)
> -{
> -	SAFE_SETEUID(cleanup, 0);
> +	tst_res(TINFO, "running %s test", tc->err_desc);

We print the tc->err_desc in the TST_EXP_FAIL() right? No need to print
it twice.

> +	TST_EXP_FAIL(utime(tc->pathname, tc->utimbuf),
> +				tc->exp_errno, "%s", tc->err_desc);
>  }
>  
> -static void cleanup(void)
> -{
> -	if (mount_flag && tst_umount(MNT_POINT) < 0)
> -		tst_resm(TWARN | TERRNO, "umount device:%s failed", dev);
> -
> -	if (dev)
> -		tst_release_device(dev);
> -
> -	tst_rmdir();
> -}
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test = run,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.needs_root = 1,
> +	.needs_tmpdir = 1,
> +	.mntpoint = MNT_POINT,
> +	.needs_rofs = 1
> +};

Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
