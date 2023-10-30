Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1C7DBCE5
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Oct 2023 16:49:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1AAB3CF40D
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Oct 2023 16:49:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7B653CF3DE
 for <ltp@lists.linux.it>; Mon, 30 Oct 2023 16:49:26 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id F32AC201110
 for <ltp@lists.linux.it>; Mon, 30 Oct 2023 16:49:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6DECB211E1;
 Mon, 30 Oct 2023 15:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1698680964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5pjwaT5XmNFTUTqdNlDSjArPwL1DMY56AZKQb+lWuDw=;
 b=s/WuFuhYIkyWcJFcoNHb5FdJ9Mev8udjttrnMwx9zlJBgR1D1nHEc9dR9y2kL6TetpFUP6
 TWbg3PRiWUhl3zG+c3zSXbOveqaUPqAvSloeDN/OD5r6yBjMeL30BESu/IC25KX62n6OTh
 RPCGn2SvWdWkdLd4f8hCkuV7aZNiNbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1698680964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5pjwaT5XmNFTUTqdNlDSjArPwL1DMY56AZKQb+lWuDw=;
 b=tTycofXB8RZvfRLfQlm/pT6hLXmFcijrcv9QxOzXY+wD9ie3+ghbB9FjHToOHvrlxm8po/
 wi/5Hjj0acuEo/Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C653138EF;
 Mon, 30 Oct 2023 15:49:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4y4RFoTQP2WBdgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 30 Oct 2023 15:49:24 +0000
Date: Mon, 30 Oct 2023 16:49:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Message-ID: <ZT_Qo3onjmd2v1BF@yuki>
References: <20230912110412.425309-1-sachinpb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912110412.425309-1-sachinpb@linux.vnet.ibm.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Migrating the
 libhugetlbfs/testcases/shm-gettest.c test
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
> v2:
>  -Fixed coding style errors as per 'make check'
>  -Reporting TPASS moved inside do_shmtest() function
>  -Moved testcase file from folder hugemmap to hugeshmget
>  -Renamed testcase 'hugepage35.c' to hugeshmget06.c 
>  -Updated 'kernel/mem/.gitignore'
>  -Updated 'runtest/hugetlb' for number of iterations with -i 10

This version looks much better, a few comments below.

> diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget06.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget06.c
> new file mode 100644
> index 000000000..5b0c2ec23
> --- /dev/null
> +++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget06.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2005-2006, IBM Corporation.
> + * Author: David Gibson & Adam Litke
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Test Name: shm-gettest.c
                ^
		This is no longer true and should be removed
> + * This testcase creates shared memory segments backed by hugepages,
> + * writes specific patterns to each segment, verifies pattern,
> + * and detaches a shared memory segments in a loop.
> + * It ensures that the hugepage backed shared memory functionalities
> + * works correctly by validating the data written to segment.
> + */
> +
> +#include "hugetlb.h"
> +#include "tst_safe_sysv_ipc.h"
> +
> +#define MNTPOINT "hugetlbfs/"
> +#define NR_HUGEPAGES 4
> +
> +static long hpage_size;
> +static int shmid = -1, key = -1;
> +
> +static void do_shmtest(size_t size)
> +{
> +	size_t i, j;
> +	char pattern;
> +	char *shmaddr;
> +
> +	shmid = SAFE_SHMGET(key, size, SHM_HUGETLB|IPC_CREAT|SHM_R|SHM_W);
> +	tst_res(TINFO, "shmid: 0x%x\n", shmid);

THis should be moved into setup, since otherwise we would create one id
per iteration (run test with -i 2) and the test will leak shm ids.

> +	shmaddr = SAFE_SHMAT(shmid, 0, SHM_RND);
> +	tst_res(TINFO, "shmaddr: %p\n", shmaddr);
> +
> +	for (i = 0; i < NR_HUGEPAGES; i++) {
> +		pattern = 65 + (i % 26);
> +		tst_res(TINFO, "Touching %p with %c\n",
> +				shmaddr + (i * hpage_size), pattern);
> +		memset(shmaddr + (i * hpage_size), pattern, hpage_size);
> +	}
> +
> +	for (i = 0; i < NR_HUGEPAGES; i++) {
> +		pattern = 65 + (i % 26);
> +		tst_res(TINFO, "Verifying %p\n", (shmaddr + (i * hpage_size)));
> +		for (j = 0; j < (size_t)hpage_size; j++)
> +			if (*(shmaddr + (i * hpage_size) + j) != pattern)
> +				tst_res(TFAIL, "Verifying the segment failed."
> +						"Got %c, expected %c",
> +						*(shmaddr + (i * hpage_size) + j),
> +						pattern);

If we print fail here we will still continue and print the TPASS at the
end of the function. Should we instead do shmdt() and return here?

Also the message can be shorter while keeping the information in there
and there is no guarantee that the corrupted byte would be printable, so
I would print hex instead, something as:

	tst_res(TFAIL, "Got wrong byte 0x%02x expected 0x%02x", ...

> +	}
> +	SAFE_SHMDT((const void *)shmaddr);
> +	tst_res(TPASS, "Successfully tested shared memory segment operations "
> +			"backed by hugepages");

Can we be shorter and to the point? Something as:

tst_res(TPASS, "shm hugepages works correctly");

> +}
> +
> +static void run_test(void)
> +{
> +	size_t size;
> +
> +	size = NR_HUGEPAGES * hpage_size;
> +
> +	do_shmtest(size);

Is there a reason why this isn't simply do_shmtest(NR_HUGEPAGES * hpage_size); ?

> +}
> +
> +static void setup(void)
> +{
> +

This newline shouldn't be here.

> +	hpage_size = tst_get_hugepage_size();
> +	tst_res(TINFO, "hugepage size is  %ld", hpage_size);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (shmid >= 0)
> +		// Remove the shared memory segment

Please do not comment the obvious.

> +		SAFE_SHMCTL(shmid, IPC_RMID, NULL);
> +}
> +
> +static struct tst_test test = {
> +	.needs_root = 1,
> +	.mntpoint = MNTPOINT,
> +	.needs_hugetlbfs = 1,

Do we actually need to mount the hugetlbfs?

> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run_test,
> +	.hugepages = {NR_HUGEPAGES, TST_NEEDS},
> +};
> -- 
> 2.39.3
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
