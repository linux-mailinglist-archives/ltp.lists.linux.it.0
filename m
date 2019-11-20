Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E9103E0D
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 16:12:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E5353C20B6
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 16:12:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1EE163C13DE
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 16:12:49 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E426461F773
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 16:12:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BDF52B36C;
 Wed, 20 Nov 2019 15:12:46 +0000 (UTC)
Date: Wed, 20 Nov 2019 16:12:44 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191120151244.GA28197@dell5510>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan, Cyril, Xu,

> Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
> same as Q_GETQUOTA, but it returns quota information for the next ID
> greater than or equal to id that has a quota set.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM, with 2 questions.

>  #ifndef LAPI_QUOTACTL_H__
>  # define LAPI_QUOTACTL_H__

> +#include <sys/quota.h>
> +
> +#ifdef HAVE_STRUCT_IF_NEXTDQBLK
> +# include <linux/quota.h>
> +#else
> +# ifdef HAVE_LINUX_TYPES_H
> +# include <linux/types.h>
@Jan, @Cyril: Do we want to generally avoid loading <linux/types.h> if not really needed?
__u64 can be uint64_t etc (as it's also visible in struct dqblk in <sys/quota.h>
in various libc headers).
We used this approach for /usr/include/linux/bpf.h and for fanotify fixes for
musl (testcases/kernel/syscalls/fanotify/fanotify.h).

So unless you're against this approach here I'll change it before merge
(and add this info to next version of library API writing guidelines patch
https://patchwork.ozlabs.org/patch/1166786/).

> +struct if_nextdqblk {
> +	__u64 dqb_bhardlimit;
> +	__u64 dqb_bsoftlimit;
> +	__u64 dqb_curspace;
> +	__u64 dqb_ihardlimit;
> +	__u64 dqb_isoftlimit;
> +	__u64 dqb_curinodes;
> +	__u64 dqb_btime;
> +	__u64 dqb_itime;
> +	__u32 dqb_valid;
> +	__u32 dqb_id;
> +};

...
> +++ b/testcases/kernel/syscalls/quotactl/quotactl01.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>  * Copyright (c) Crackerjack Project., 2007
> -* Copyright (c) 2016 Fujitsu Ltd.
> +* Copyright (c) 2016-2019 FUJITSU LIMITED. All rights reserved
BTW correct formatting is
/*
 *
 */
Not
/*
*
*/
I'll change it during merge (nit, the code is what matters, not formatting, of course).

...
> +static int getnextquota_nsup;
...
>  static void setup(void)
>  {
>  	const char *const cmd[] = {"quotacheck", "-ugF", "vfsv0", MNTPOINT, NULL};
>  	int ret;
> +	getnextquota_nsup = 0;
This is not needed (getnextquota_nsup is static and it's called just once, I'll
remove it before merge).

>  	ret = tst_run_cmd(cmd, NULL, NULL, 1);
>  	switch (ret) {
> @@ -146,6 +183,11 @@ static void setup(void)

>  	if (access(GRPPATH, F_OK) == -1)
>  		tst_brk(TFAIL | TERRNO, "group quotafile didn't exist");
> +
> +	TEST(quotactl(QCMD(Q_GETNEXTQUOTA, USRQUOTA), tst_device->dev,
> +		test_id, (void *) &res_ndq));
> +	if (TST_ERR == EINVAL || TST_ERR == ENOSYS)
Does EINVAL really mans not supported? Shouldn't be just for ENOSYS
> +		getnextquota_nsup = 1;
>  }

Looking at kernel sources - this does not look as not supported, but rather a
failure (we might want to add some test for EINVAL):
	if (!qid_has_mapping(sb->s_user_ns, qid))
		return -EINVAL;

kernel fs/quota/quota.c
/*
 * Return quota for next active quota >= this id, if any exists,
 * otherwise return -ENOENT via ->get_nextdqblk
 */
static int quota_getnextquota(struct super_block *sb, int type, qid_t id,
			  void __user *addr)
{
	struct kqid qid;
	struct qc_dqblk fdq;
	struct if_nextdqblk idq;
	int ret;

	if (!sb->s_qcop->get_nextdqblk)
		return -ENOSYS;
	qid = make_kqid(current_user_ns(), type, id);
	if (!qid_has_mapping(sb->s_user_ns, qid))
		return -EINVAL;
	ret = sb->s_qcop->get_nextdqblk(sb, &qid, &fdq);
	if (ret)
		return ret;
	/* struct if_nextdqblk is a superset of struct if_dqblk */
	copy_to_if_dqblk((struct if_dqblk *)&idq, &fdq);
	idq.dqb_id = from_kqid(current_user_ns(), qid);
	if (copy_to_user(addr, &idq, sizeof(idq)))
		return -EFAULT;
	return 0;
}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
