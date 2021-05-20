Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA938B8F2
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 23:28:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3AE183C6C63
	for <lists+linux-ltp@lfdr.de>; Thu, 20 May 2021 23:28:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 91A573C3026
 for <ltp@lists.linux.it>; Thu, 20 May 2021 23:28:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D59971A0147B
 for <ltp@lists.linux.it>; Thu, 20 May 2021 23:28:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 154D8ACAD;
 Thu, 20 May 2021 21:28:12 +0000 (UTC)
Date: Thu, 20 May 2021 23:28:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YKbUah2GaIHb6f19@pevik>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519084655.52780-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/sendfile: Convert sendfile08 to the
 new API
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

Hi Xio,

> +++ b/testcases/kernel/syscalls/sendfile/sendfile08.c
I'd put your or LTP copyright (as your wish) because test was significantly
changed. (We had some copyright issues in the past thus it's better to state it.)
...
> +/*\
> + * [Description]
> + *
>   * Bug in the splice code has caused the file position on the write side
>   * of the sendfile system call to be incorrectly set to the read side file
>   * position. This can result in the data being written to an incorrect offset.
>   *
> - * This is a regression test for kernel commit
> - * 2cb4b05e7647891b46b91c07c9a60304803d1688
> + * This is a regression test for kernel commit 2cb4b05e7647.

nit: I wonder if we want to repeat what we already declare in .min_kver.
This is not specific to this patch, we keep doing it, but IMHO necessary
and we should stop that.
>   */

> -#include <sys/sendfile.h>
> -#include <sys/stat.h>
> -#include <sys/types.h>
> -#include <errno.h>
> -#include <fcntl.h>
>  #include <stdio.h>
> +#include <fcntl.h>
>  #include <string.h>
>  #include <unistd.h>
> -#include "test.h"
> -#include "safe_macros.h"
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <sys/sendfile.h>

nit: it looks to me that only <stdio.h> <string.h> <sys/sendfile.h> are needed.
But maybe others are needed and included in other headers.

Also only these were needed in legacy API:
#include <sys/sendfile.h>
#include <errno.h>
#include "test.h"
#include "safe_macros.h"
But <errno.h> is needed only for legacy API => use just these 3 mentioned above.

...
> +	char buf[BUFSIZ];
> +	SAFE_LSEEK(out_fd, 0, SEEK_SET);
nit: sendfile08.c:43: WARNING: Missing a blank line after declarations
It's actually more readable to have blank line after char buf[BUFSIZ];

> +	SAFE_READ(0, out_fd, buf, BUFSIZ);
> +
> +	if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL)))
> +		tst_res(TPASS, "sendfile(2) copies data correctly");
> +	else
> +		tst_res(TFAIL, "sendfile(2) copies data incorrectly. "
> +			       "Expect \"%s%s\", got \"%s\"",
> +			TEST_MSG_OUT, TEST_MSG_IN, buf);

sendfile08.c:50: WARNING: quoted string split across lines

	if (!strncmp(buf, TEST_MSG_ALL, strlen(TEST_MSG_ALL))) {
		tst_res(TPASS, "sendfile() copied data correctly");
		return;
	}

	tst_res(TFAIL, "sendfile() copied data incorrectly: '%s', expected '%s%s'",
			buf, TEST_MSG_OUT, TEST_MSG_IN);

i.e. not splitting string, get some space by return instead else,
we don't mind using single quote (code is more readable),
removing also 2 in sendfile(2) (2 is man section, but that's just confusing).

Changes are minor, if we agre on that it can be done during merge.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
