Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35575319C9F
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 11:27:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D84D33C6B8C
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Feb 2021 11:27:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A05B03C5ACE
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 11:27:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 410E320098C
 for <ltp@lists.linux.it>; Fri, 12 Feb 2021 11:27:21 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF793AD62;
 Fri, 12 Feb 2021 10:27:20 +0000 (UTC)
Date: Fri, 12 Feb 2021 11:27:19 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Liam Howlett <liam.howlett@oracle.com>
Message-ID: <YCZYB2w+Il5F0TlI@pevik>
References: <20210209143702.2003038-1-Liam.Howlett@Oracle.com>
 <20210209143702.2003038-2-Liam.Howlett@Oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210209143702.2003038-2-Liam.Howlett@Oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] brk02: Add test for removing more than one VMA
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Liam,

thanks for your patch. Minor notes below.

> When brk expands, it attempts to expand a VMA.  This expansion will
> succeed depending on the anonymous VMA chain and if the vma flags are
> compatible.  This test expands brk() then calls mprotect to ensure the
> next brk call will create a new VMA, then it calls brk a final time to
> restore the first brk address.  The test is the final brk call which
> will remove more than an entire VMA from the vm area.

> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> ---
>  testcases/kernel/syscalls/brk/brk02.c | 49 +++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/brk/brk02.c

> diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
> new file mode 100644
> index 000000000..834fe9f2f
> --- /dev/null
> +++ b/testcases/kernel/syscalls/brk/brk02.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
> + *
> + *  
nit: blank line
> + *  Expand the brk by 2 pages to ensure there is a newly created VMA and not
> + *  expanding the original due to multiple anon pages.  mprotect that new VMA
> + *  then brk back to the original address therefore causing a munmap of at
> + *  least one full VMA.
> + */
> +
> +#include <unistd.h>
> +#include <stdint.h>
nit: Not sure if <stdint.h> is needed.

> +#include <sys/mman.h>
> +
> +#include "tst_test.h"
> +
> +void brk_down_vmas(void)
> +{
> +	void *brk_addr = sbrk(0);
> +	unsigned long page_size = getpagesize();
> +	void *addr = brk_addr + page_size;
> +
> +	if (brk(addr))
> +		return;
> +
> +	addr += page_size;
> +	if (brk(addr))
> +		return;
You need to add tst_ret(TFAIL, "failed due ..."); before each return otherwise
you get error:
tst_test.c:1080: TBROK: Test haven't reported results!

> +
> +	if (mprotect(addr - page_size, page_size,
> +			PROT_READ|PROT_WRITE|PROT_EXEC))
> +		return;
> +
> +	addr += page_size;
> +	if (brk(addr))
> +		return;
> +
> +	if (brk(brk_addr))
> +		return;
> +
> +
> +
Please remove these blank lines.
> +	tst_res(TPASS, "munmap two VMAs of brk() passed.");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = brk_down_vmas,
> +};

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
