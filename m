Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 768CD166419
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 18:15:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9DB93C25CA
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 18:15:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 625D93C2231
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 18:15:20 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D8C681A01D22
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 18:15:19 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C1CE9AAC7;
 Thu, 20 Feb 2020 17:15:18 +0000 (UTC)
Date: Thu, 20 Feb 2020 18:04:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200220170425.GB15699@gacrux.arch.suse.de>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 04/10] syscalls/fsopen: New tests
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

...
> +static struct tcase {
> +	char *name;
> +	unsigned int flags;
> +} tcases[] = {
> +	{"Flag 0", 0},
> +	{"Flag FSOPEN_CLOEXEC", FSOPEN_CLOEXEC},
> +};
Note about removing text from flags apply also for this test.

> +static void setup(void)
> +{
> +	fsopen_supported_by_kernel();
> +}
How about removing this and use as setup function directly
fsopen_supported_by_kernel()?
.setup = fsopen_supported_by_kernel,

Other than that it's OK.
However I have problem on fsopen01 and fsmount02.
mkfs.vfat: Partitions or virtual mappings on device '/dev/loop0', not making
filesystem (use -I to override)
tst_mkfs.c:100: BROK: tst_test.c:830: mkfs.vfat failed with 1

.dev_fs_flags = TST_FS_SKIP_FUSE helps with exfat and ntfs, but this also fails
on vfat.

This is tested on system with CONFIG_VFAT_FS=m and CONFIG_FAT_FS=m, vfat and fat
are loaded by mkfs.vfat. IMHO we need something like TST_FS_SKIP_EXFAT | TST_FS_SKIP_FAT | TST_FS_SKIP_NTFS | TST_FS_SKIP_FUSE
i.e. explicitly say what FS is not wanted no matter whether it's fuse or not.

Or maybe just TST_FS_SKIP_FAT | TST_FS_SKIP_FUSE would be enough.

NOTE: flags TST_FS_SKIP_EXFAT, TST_FS_SKIP_FAT, TST_FS_SKIP_NTFS do not exists yet.

...
> diff --git a/testcases/kernel/syscalls/fsopen/fsopen02.c b/testcases/kernel/syscalls/fsopen/fsopen02.c
> new file mode 100644
> index 000000000000..72cb940c5468
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fsopen/fsopen02.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * Description:
Nit: I'd avoid "Description:".
> + * Basic fsopen() failure tests.
> + */
...

> +static void run(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	TEST(fsopen(*tc->fs, tc->flags));
> +
> +	if (TST_RET != -1) {
> +		SAFE_CLOSE(TST_RET);
> +		tst_brk(TFAIL, "%s: fsopen() succeeded unexpectedly (index: %d)",
> +			tc->name, n);
This also need tst_res() and return, or second test get skipped if first fails.
See http://lists.linux.it/pipermail/ltp/2020-February/015505.html

> +	}
> +
> +	if (tc->exp_errno != TST_ERR) {
> +		tst_brk(TFAIL | TTERRNO, "%s: fsopen() should fail with %s",
> +			tc->name, tst_strerrno(tc->exp_errno));
And here too.
> +	}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
