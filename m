Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CD27E786
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:19:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 042993C2A12
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:19:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A4F4E3C297E
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:19:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B6D101A00A24
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:19:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21F68ABC1;
 Wed, 30 Sep 2020 11:19:03 +0000 (UTC)
Date: Wed, 30 Sep 2020 13:19:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200930111930.GD6611@yuki.lan>
References: <20200930110913.28436-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930110913.28436-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] utimensat01: Use common FS (ext4) with
 timestamps and attributes
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> If tmpdir is mounted on tmpfs then the test will fail with ENOTTY as
> this FS apparently does not support file attributes (inode
> flags). Instead we can test on ext4 where setting attributes and high
> precision timestamps is known to work.
> 
> We can not set all_filesystems because utimensat will fail to reset
> the timestamp to zero on at least exFAT and NTFS (FUSE and kernel
> versions). It is not clear yet what the expected behavior is or how
> the test could fail gracefully and requires investigation.
> 
> Also if we now get ENOTTY then it is assumed the file system does not
> support attributes and the test fails with TCONF. However the
> underlying FS could return some other errno (e.g. EINVAL on FUSE
> NTFS), but it is not clear what to expect, if anything and also
> requires further investigation.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
> 
> V2: Instead of trying to use all filesystems, just use one we know
>     works and is on most distros.
> 
> Obviously this is not ideal as this also expected to work on BTRFS,
> XFS etc. However the library doesn't allow us to specify this and
> modifying it would be quite intrusive. After the release this needs to
> be looked into.
> 
>  .../kernel/syscalls/utimensat/utimensat01.c   | 22 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
> index fe490f441..42299eda8 100644
> --- a/testcases/kernel/syscalls/utimensat/utimensat01.c
> +++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
> @@ -21,8 +21,9 @@
>  #include "time64_variants.h"
>  #include "tst_timer.h"
>  
> -#define TEST_FILE	"test_file"
> -#define TEST_DIR	"test_dir"
> +#define MNTPOINT 	"mntpoint"
> +#define TEST_FILE	MNTPOINT"/test_file"
> +#define TEST_DIR	MNTPOINT"/test_dir"
>  
>  static void *bad_addr;
>  
> @@ -182,7 +183,12 @@ static void change_attr(struct test_case *tc, int fd, int set)
>  	if (!tc->attr)
>  		return;
>  
> -	SAFE_IOCTL(fd, FS_IOC_GETFLAGS, &attr);
> +	if (ioctl(fd, FS_IOC_GETFLAGS, &attr)) {
> +		if (errno == ENOTTY)
> +			tst_brk(TCONF | TERRNO, "Attributes not supported by FS");
> +		else
> +			tst_brk(TBROK | TERRNO, "ioctl(fd, FS_IOC_GETFLAGS, &attr) failed");
> +	}
>  
>  	if (set)
>  		attr |= tc->attr;
> @@ -198,7 +204,11 @@ static void reset_time(char *pathname, int dfd, int flags, int i)
>  	struct stat sb;
>  
>  	memset(&ts, 0, sizeof(ts));
> -	tv->utimensat(dfd, pathname, &ts, flags);
> +	TEST(tv->utimensat(dfd, pathname, &ts, flags));
> +	if (TST_RET) {
> +		tst_res(TINFO | TTERRNO, "%2d: utimensat(%d, %s, {0, 0}, %d) failed",
> +			i, dfd, pathname, flags);
> +	}
>  
>  	TEST(stat(pathname, &sb));
>  	if (TST_RET) {
> @@ -305,5 +315,7 @@ static struct tst_test test = {
>  	.test_variants = ARRAY_SIZE(variants),
>  	.setup = setup,
>  	.needs_root = 1,
> -	.needs_tmpdir = 1,
> +	.mount_device = 1,
> +	.mntpoint = MNTPOINT,
> +	.dev_fs_type = "ext4",

Do we have to specify ext4 here? Shouldn't that work with a default FS
for loop devices i.e. ext2?

I do worry that this would disable the test on small embedded devices
without ext4 driver, not sure if there are still some around.

But I think that defaulting to whatever have been choosen as a default
filesystem (may be passed in LTP_DEV_FS_TYPE env variable) would be
better band aid for now.

>  };
> -- 
> 2.28.0
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
