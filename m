Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F0325600
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 20:02:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54CCB3C596E
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 20:02:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4E2883C0F06
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 20:02:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8EDDF1A006F9
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 20:02:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB9A3AC6F;
 Thu, 25 Feb 2021 19:02:09 +0000 (UTC)
Date: Thu, 25 Feb 2021 20:02:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Liam Howlett <liam.howlett@oracle.com>
Message-ID: <YDf0MHBoZRildsna@pevik>
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
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

> When brk expands, it attempts to expand a VMA.  This expansion will
> succeed depending on the anonymous VMA chain and if the vma flags are
> compatible.  This test expands brk() then calls mprotect to ensure the
> next brk call will create a new VMA, then it calls brk a final time to
> restore the first brk address.  The test is the final brk call which
> will remove more than an entire VMA from the vm area.

> Signed-off-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
> ---
>  testcases/kernel/syscalls/brk/brk02.c | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/brk/brk02.c

> diff --git a/testcases/kernel/syscalls/brk/brk02.c b/testcases/kernel/syscalls/brk/brk02.c
> new file mode 100644
> index 000000000..ef84fb440
> --- /dev/null
> +++ b/testcases/kernel/syscalls/brk/brk02.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
> + *
> + *  Expand the brk by at least 2 pages to ensure there is a newly created VMA
> + *  and not expanding the original due to multiple anon pages.  mprotect that
> + *  new VMA then brk back to the original address therefore causing a munmap of
> + *  at least one full VMA.
I'll put this as a docparse formatting (will show in our documentation):

/*\
 * [DESCRIPTION]
 * Expand brk() by at least 2 pages to ensure there is a newly created VMA
 * and not expanding the original due to multiple anon pages.  mprotect() that
 * new VMA then brk() back to the original address therefore causing a munmap of
 * at least one full VMA.
\*/

> + */
> +
> +#include <unistd.h>
> +#include <sys/mman.h>
> +#include "tst_test.h"
> +
> +void brk_down_vmas(void)
> +{
> +	void *brk_addr = sbrk(0);

Shouldn't there be a check?

	if (brk_addr == (void *) -1)
		tst_brk(TBROK, "sbrk() failed");

> +	unsigned long page_size = getpagesize();
> +	void *addr = brk_addr + page_size;
> +
> +	if (brk(addr)) {
> +		tst_res(TFAIL, "Cannot expand brk by page size.");
nit: remove dot at the end.
> +		return;
> +	}
> +
> +	addr += page_size;
> +	if (brk(addr)) {
> +		tst_res(TFAIL, "Cannot expand brk by 2x page size.");
> +		return;
> +	}
> +
> +	if (mprotect(addr - page_size, page_size,
> +		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
> +		tst_res(TFAIL, "Cannot mprotect new VMA.");
> +		return;
> +	}
> +
> +	addr += page_size;
> +	if (brk(addr)) {
> +		tst_res(TFAIL, "Cannot expand brk after mprotect.");
> +		return;
> +	}
> +
> +	if (brk(brk_addr)) {
> +		tst_res(TFAIL, "Cannot restore brk to start address.");
> +		return;
> +	}
> +
> +	tst_res(TPASS, "munmap at least two VMAs of brk() passed.");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = brk_down_vmas,
> +};

No need to repost if you agree with these changes below.

Kind regards,
Petr

diff --git testcases/kernel/syscalls/brk/brk02.c testcases/kernel/syscalls/brk/brk02.c
index ef84fb440..2e604eb5d 100644
--- testcases/kernel/syscalls/brk/brk02.c
+++ testcases/kernel/syscalls/brk/brk02.c
@@ -1,13 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2021 Liam R. Howlett <liam.howlett@oracle.com>
- *
- *  Expand the brk by at least 2 pages to ensure there is a newly created VMA
- *  and not expanding the original due to multiple anon pages.  mprotect that
- *  new VMA then brk back to the original address therefore causing a munmap of
- *  at least one full VMA.
  */
 
+/*\
+ * [DESCRIPTION]
+ * Expand brk() by at least 2 pages to ensure there is a newly created VMA
+ * and not expanding the original due to multiple anon pages.  mprotect() that
+ * new VMA then brk() back to the original address therefore causing a munmap of
+ * at least one full VMA.
+\*/
+
 #include <unistd.h>
 #include <sys/mman.h>
 #include "tst_test.h"
@@ -15,38 +18,42 @@
 void brk_down_vmas(void)
 {
 	void *brk_addr = sbrk(0);
+
+	if (brk_addr == (void *) -1)
+		tst_brk(TBROK, "sbrk() failed");
+
 	unsigned long page_size = getpagesize();
 	void *addr = brk_addr + page_size;
 
 	if (brk(addr)) {
-		tst_res(TFAIL, "Cannot expand brk by page size.");
+		tst_res(TFAIL, "Cannot expand brk() by page size");
 		return;
 	}
 
 	addr += page_size;
 	if (brk(addr)) {
-		tst_res(TFAIL, "Cannot expand brk by 2x page size.");
+		tst_res(TFAIL, "Cannot expand brk() by 2x page size");
 		return;
 	}
 
 	if (mprotect(addr - page_size, page_size,
 		     PROT_READ|PROT_WRITE|PROT_EXEC)) {
-		tst_res(TFAIL, "Cannot mprotect new VMA.");
+		tst_res(TFAIL, "Cannot mprotect new VMA");
 		return;
 	}
 
 	addr += page_size;
 	if (brk(addr)) {
-		tst_res(TFAIL, "Cannot expand brk after mprotect.");
+		tst_res(TFAIL, "Cannot expand brk() after mprotect");
 		return;
 	}
 
 	if (brk(brk_addr)) {
-		tst_res(TFAIL, "Cannot restore brk to start address.");
+		tst_res(TFAIL, "Cannot restore brk() to start address");
 		return;
 	}
 
-	tst_res(TPASS, "munmap at least two VMAs of brk() passed.");
+	tst_res(TPASS, "munmap at least two VMAs of brk() passed");
 }
 
 static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
