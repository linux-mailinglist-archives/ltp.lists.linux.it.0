Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3798A5FC205
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 10:31:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D2FE3CAEA8
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 10:31:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 566DC3CAEA3
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 10:31:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BFBC36008F6
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 10:31:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ABD6E1F381;
 Wed, 12 Oct 2022 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665563495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MBs4qMHuKh7TpXmDn7LFbDp9LBxL6ZCHb/hdAU58JoQ=;
 b=P1mTlbG5vdwnwzA8Mu6e1tdZcy/XgG3Mm/FZYX0y+xIVV48BedleQAmS0/O/IKPdFboxpG
 R+vWbldYTMtWMvxZmNTFK8v996SRrGVQzMdUCmWitENHSLWd2KpSThbFU1zS50GGx+JG3p
 Pusk5jYjddjMEga7/FmYCyLe/tx/Kn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665563495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MBs4qMHuKh7TpXmDn7LFbDp9LBxL6ZCHb/hdAU58JoQ=;
 b=kqdQ5HYveqLyisSgbpOFthOl7zTXmCcsTG16/9wnOKLLAi5KyAb07tmq7/BidtUqloGJWf
 q9WEfRGFYVdd6jAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 89C0613ACD;
 Wed, 12 Oct 2022 08:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id brv0IGd7RmP5WwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 12 Oct 2022 08:31:35 +0000
Date: Wed, 12 Oct 2022 10:33:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <Y0Z70XMZ6fp3/J94@yuki>
References: <20221012021356.189479-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012021356.189479-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/madvise04: new test for
 madvise(MADV_DONTNEED)
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
> Test cases for madvise(2) system call, verify that MADV_DONTNEED
> can be applied to Huge TLB pages after kernel version 5.18.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  runtest/syscalls                              |  1 +
>  testcases/kernel/syscalls/madvise/.gitignore  |  1 +
>  testcases/kernel/syscalls/madvise/madvise04.c | 49 +++++++++++++++++++
>  3 files changed, 51 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/madvise/madvise04.c
> 
> diff --git a/runtest/syscalls b/runtest/syscalls
> index c81764df4..eb1910cec 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -941,6 +941,7 @@ mincore04 mincore04
>  madvise01 madvise01
>  madvise02 madvise02
>  madvise03 madvise03
> +madvise04 madvise04
>  madvise05 madvise05
>  madvise06 madvise06
>  madvise07 madvise07
> diff --git a/testcases/kernel/syscalls/madvise/.gitignore b/testcases/kernel/syscalls/madvise/.gitignore
> index f4bfdfefe..db8ce47c1 100644
> --- a/testcases/kernel/syscalls/madvise/.gitignore
> +++ b/testcases/kernel/syscalls/madvise/.gitignore
> @@ -1,6 +1,7 @@
>  /madvise01
>  /madvise02
>  /madvise03
> +/madvise04
>  /madvise05
>  /madvise06
>  /madvise07
> diff --git a/testcases/kernel/syscalls/madvise/madvise04.c b/testcases/kernel/syscalls/madvise/madvise04.c
> new file mode 100644
> index 000000000..ba15de092
> --- /dev/null
> +++ b/testcases/kernel/syscalls/madvise/madvise04.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) Huawei Technologies Co., Ltd. 2022. All rights reserved.
> + * Author: Zhao Gongyi <zhaogongyi@huawei.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Test cases for madvise(2) system call, advise value as "MADV_MADV_DONTNEED":
> + *   MADV_DONTNEED can be applied to Huge TLB pages after kernel version 5.18.
> + */
> +
> +#include "tst_test.h"
> +
> +#define MAP_SIZE (8 * 1024)
> +
> +static char *addr;
> +static int mapsz;
> +
> +static void run(void)
> +{
> +	TST_EXP_PASS(madvise(addr, mapsz, MADV_DONTNEED));
>

Should we check that the pages have been zero filled like in the
previous case?

+}
> +
> +static void setup(void)
> +{
> +	mapsz = tst_get_hugepage_size();
> +	addr = SAFE_MMAP(NULL, mapsz,
> +			PROT_READ | PROT_WRITE,
> +			MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB,
> +			-1, 0);
> +}
> +
> +static void cleanup(void)
> +{
> +	if (addr)
> +		SAFE_MUNMAP(addr, mapsz);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.min_kver = "5.18",
> +	.needs_root = 1,
> +	.hugepages = {1, TST_NEEDS},
> +};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
