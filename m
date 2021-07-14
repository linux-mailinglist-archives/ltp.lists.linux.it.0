Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 114213C7EC8
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 08:53:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7A793C675C
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 08:53:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 184E53C65FF
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 08:53:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B82DE200C29
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 08:53:33 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E1DEC20269;
 Wed, 14 Jul 2021 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626245612;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WuLqYUlUTpGXrNkQftOt54D8ZbALgTEnGvKRbTAoEhE=;
 b=YW10yhA3dx0RBa0KXb5pLBRTQ/O9MCJBCWRI+pc/tucFO++LQnq1CgXfJSPu0d8crYLBwI
 hj3iWnU7P2zMbxLy97sqjBdLueal7Cs9QXU2BT5Q37izH0ddHq5dtzTiMPI5Ktlr+5vuLI
 nhsqo7pd7FbZxY9AyoCAReTX7RhpjJc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626245612;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WuLqYUlUTpGXrNkQftOt54D8ZbALgTEnGvKRbTAoEhE=;
 b=YlcKaGsDs8rASeFJOSzpVztHOGeZLhQnm66e8P4d9NgTm0ONFcwlgC5BHcNQ8QPM76g9oO
 U6o3EmW+E92wpADg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5583FA3B8B;
 Wed, 14 Jul 2021 06:53:32 +0000 (UTC)
References: <20210714055253.1668374-1-lkml@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20210714055253.1668374-1-lkml@jv-coder.de>
Date: Wed, 14 Jul 2021 07:53:31 +0100
Message-ID: <871r81pes4.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] squashfs: Add regression test for sanity check
 bug
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it, Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Joerg,

Joerg Vehlow <lkml@jv-coder.de> writes:

> From: Joerg Vehlow <joerg.vehlow@aox-tech.de>
>
> Adds a regression test for the fixes
> c1b2028315 ("squashfs: fix inode lookup sanity checks")
> and
> 8b44ca2b62 ("squashfs: fix xattr id and id lookup sanity checks")
>
> Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
> ---
>
> Changes to v1:
>  - Implement whole test in c
>  - Fixed whitespaces...
>
>  runtest/fs                                    |  2 +
>  testcases/kernel/fs/squashfs/.gitignore       |  1 +
>  testcases/kernel/fs/squashfs/Makefile         |  9 ++
>  .../kernel/fs/squashfs/squashfs_regression.c  | 99 +++++++++++++++++++
>  4 files changed, 111 insertions(+)
>  create mode 100644 testcases/kernel/fs/squashfs/.gitignore
>  create mode 100644 testcases/kernel/fs/squashfs/Makefile
>  create mode 100644 testcases/kernel/fs/squashfs/squashfs_regression.c
>
> diff --git a/runtest/fs b/runtest/fs
> index 17b1415eb..2091b00f8 100644
> --- a/runtest/fs
> +++ b/runtest/fs
> @@ -85,3 +85,5 @@ fs_fill fs_fill
>  
>  binfmt_misc01 binfmt_misc01.sh
>  binfmt_misc02 binfmt_misc02.sh
> +
> +squashfs_regression squashfs_regression
> diff --git a/testcases/kernel/fs/squashfs/.gitignore b/testcases/kernel/fs/squashfs/.gitignore
> new file mode 100644
> index 000000000..45c908fff
> --- /dev/null
> +++ b/testcases/kernel/fs/squashfs/.gitignore
> @@ -0,0 +1 @@
> +squashfs_regression
> diff --git a/testcases/kernel/fs/squashfs/Makefile b/testcases/kernel/fs/squashfs/Makefile
> new file mode 100644
> index 000000000..67021139c
> --- /dev/null
> +++ b/testcases/kernel/fs/squashfs/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (C) 2009, Cisco Systems Inc.
> +# Ngie Cooper, July 2009
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/fs/squashfs/squashfs_regression.c b/testcases/kernel/fs/squashfs/squashfs_regression.c
> new file mode 100644
> index 000000000..23f681367
> --- /dev/null
> +++ b/testcases/kernel/fs/squashfs/squashfs_regression.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
> + */
> +
> +/*\
> + * [DESCRIPTION]

I think it is [Description] now.

> + *
> + * Kernel commits
> + *
> + * - f37aa4c7366 (squashfs: add more sanity checks in id lookup)
> + * - eabac19e40c (squashfs: add more sanity checks in inode lookup)
> + * - 506220d2ba2 (squashfs: add more sanity checks in xattr id lookup)
> + *
> + * added some sanity checks, that verify the size of
> + * inode lookup, id (uid/gid) and xattr blocks in the squashfs,
> + * but broke mounting filesystems with completely filled blocks.
> + * A block has a max size of 8192.
> + * An inode lookup entry has an uncompressed size of 8 bytes,
> + * an id block 4 bytes and an xattr block 16 bytes.
> + *
> + *
> + * To fill up at least one block for each of the three tables,
> + * 2048 files with unique uid/gid and xattr are created.
> + *
> + *
> + * The bugs are fixed in kernel commits
> + *
> + * - c1b2028315c (squashfs: fix inode lookup sanity checks)
> + * - 8b44ca2b634 (squashfs: fix xattr id and id lookup sanity checks)
> + */
> +
> +#include <stdio.h>
> +#include <sys/mount.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_macros.h"
> +
> +static void cleanup(void)
> +{
> +	umount("mnt");
> +}
> +
> +static void run(void)
> +{
> +	int i;
> +
> +	tst_res(TINFO, "Test squashfs sanity check regressions");
> +
> +	SAFE_MKDIR("data", 0777);
> +
> +	for (i = 0; i < 2048; ++i) {
> +		int fd;
> +		char name[20];
> +
> +		sprintf(name, "data/%d", i);
> +		fd = SAFE_OPEN(name, O_CREAT | O_EXCL, 0666);
> +		SAFE_FCHOWN(fd, i, i);
> +
> +		/* This must be either "security", "user" or "trusted" namespace,
> +		 * because squashfs cannot store other namespaces.
> +		 * Since the files are most likely created on a tmpfs,
> +		 * "user" namespace is not possible, because it is not allowed.
> +		 */
> +		SAFE_FSETXATTR(fd, "security.x", &i, sizeof(i), 0);
> +		close(fd);
> +	}
> +
> +	/* Create squashfs without any comporession.
> +	 * This allows reasoning about block sizes
> +	 */
> +	TST_EXP_PASS(tst_system(
> +		"mksquashfs data image.raw -noI -noD -noX -noF >/dev/null 2>&1"

I guess the existing API functions to create an image will not work with
squashfs?

At any rate, mksquashfs should be added to .needs_cmds.

> +	), "Create squashfs");
> +
> +	SAFE_MKDIR("mnt", 0777);
> +	TST_EXP_PASS(tst_system("mount -tsquashfs -oloop image.raw
> mnt"));

Also why not use safe_mount? I think we have some infra to find a spare
loop device (.needs_device).

> +
> +	SAFE_UMOUNT("mnt");
> +
> +	tst_res(TPASS, "Test passed");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +	.needs_drivers = (const char *const []) {
> +		"squashfs",
> +		"loop",
> +		NULL
> +	},
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "c1b2028315c"},
> +		{"linux-git", "8b44ca2b634"},
> +		{}
> +	},
> +	.needs_tmpdir = 1,
> +};
> -- 
> 2.25.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
