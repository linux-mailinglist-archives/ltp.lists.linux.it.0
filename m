Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EC18B245
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 12:23:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E01AE3C5462
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 12:23:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2755D3C5453
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 12:23:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B0B06601637
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 12:23:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1445AD57;
 Thu, 19 Mar 2020 11:23:33 +0000 (UTC)
Date: Thu, 19 Mar 2020 12:23:32 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200319112332.GB440@dell5510>
References: <20200317123203.GA21921@dell5510>
 <1584527574-28177-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584527574-28177-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/add_key05: add maxbytes/maxkeys test
 under unprivileged user
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

Hi Xu,

> This case is designed to test whether we can reach maxbytes/maxkeys
> quota exactly under unprivileged users. It is a regression test for
> commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly").
> But this kenrel commit is a incomplete fix, it still fails on lastest
nit: typos: kenrel, lastest (will be fixed during merge).
> upstream kernel. Fix patch[1] is on linux-next branch.

> [1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e356101e72a
I guess this commit get's preserved when merged in mainline, so we don't have to
wait for it.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
LGTM except one concern about ltpuser setup.

> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
...
> + * Test unprivileged user can support the number of keys and the
> + * number of bytes consumed in payloads of the keys. The defalut
> + * value is 200 and 20000.
> + * This is also a regresstion test for
nit: typos: defalut, regresstion (will be fixed during merge).

> + * commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
> + * commit 2e356101e72a ("KEYS: reaching the keys quotas correctly")
> + */

> +struct passwd *ltpuser;
...
> +static void add_user(void)
> +{
> +	if (user_added)
> +		return;
> +
> +	const char *const cmd_useradd[] = {"useradd", username, NULL};
> +	int rc;
> +
> +	switch ((rc = tst_run_cmd(cmd_useradd, NULL, NULL, 1))) {
> +	case 0:
> +		user_added = 1;
> +		ltpuser = SAFE_GETPWNAM(username);
> +		break;
> +	case 1:
> +	case 255:
> +		break;
> +	default:
> +		tst_brk(TBROK, "Useradd failed (%d)", rc);
> +	}
> +	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
> +}
ltpuser is undefined for 1 and 255, therefore it gets SIGSEGV. It should either
require tst_run_cmd to exit 0 or use 0 as UID (root UID).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
