Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC40FE206
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 16:51:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0353F3C23AB
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2019 16:51:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0B51F3C2347
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 16:51:26 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F1BCE1BCB034
 for <ltp@lists.linux.it>; Fri, 15 Nov 2019 16:51:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17247BECA;
 Fri, 15 Nov 2019 15:51:25 +0000 (UTC)
Date: Fri, 15 Nov 2019 16:51:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191115155123.GA658@x230>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572612959-20577-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/5] syscalls/quotactl01.c: Add Q_GETNEXQUOTA
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

> Q_GETNEXTQUOTA was introduced since linux 4.6, this operation is the
> same as Q_GETQUOTA, but it returns quota information for the next ID
> greater than or equal to id that has a quota set.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
LGTM, minor note below.

> diff --git a/include/lapi/quotactl.h b/include/lapi/quotactl.h
...
>  #ifndef LAPI_QUOTACTL_H__
>  # define LAPI_QUOTACTL_H__

> +#ifdef HAVE_STRUCT_IF_NEXTDQBLK
> +# include <linux/quota.h>
You test <linux/quota.h> in LTP_CHECK_SYSCALL_QUOTACTL (indirectly via AC_CHECK_TYPES, but that should be ok)
> +#endif
> +#include <sys/quota.h>
> +

...
> @@ -155,8 +177,15 @@ static void verify_quota(unsigned int n)
>  	res_dq.dqb_bsoftlimit = 0;
>  	res_qf.dqi_igrace = 0;
>  	fmt_buf = 0;
> +#if defined(HAVE_STRUCT_IF_NEXTDQBLK)
> +	res_ndq.dqb_id = -1;
> +#endif

>  	TEST(quotactl(tc->cmd, tst_device->dev, *tc->id, tc->addr));
> +	if (TST_ERR == EINVAL) {
> +		tst_res(TCONF, "Current system doesn't support this cmd");
nit: cmd? Maybe something like "quotactl() syscall does not support this command"
or "quotactl() syscall does not support to %s", tc->des
to follow other messages. I'd actually prefer to have some macro, which prints
QCMD flags, but that's a detail which we can ignore.

> +		return;
> +	}
>  	if (TST_RET == -1) {
>  		tst_res(TFAIL | TTERRNO, "quotactl failed to %s", tc->des);
>  		return;

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
