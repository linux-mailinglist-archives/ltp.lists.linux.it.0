Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AED00622FFD
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Nov 2022 17:17:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32BE53CD768
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Nov 2022 17:17:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BB1203C8F97
 for <ltp@lists.linux.it>; Wed,  9 Nov 2022 17:17:00 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 592CD1A001BB
 for <ltp@lists.linux.it>; Wed,  9 Nov 2022 17:16:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3652922AE6;
 Wed,  9 Nov 2022 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1668010617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PcaLcUEOICv5KbYbIODLyr6+VrveGKUPouY9FEP/P8=;
 b=OPzRi2fpJxliNxMwR5FN996lKpqnNLw2+mR0cL/Mh6or45ftGw0FX09DXWxByNfKYCaXCx
 1sQserD7JEGNHjPAD75Ej8Dy+WvDXydQftNFaADBe/rnenyecxrxsIEh+C+fvnz6kv89PX
 Z4afi946y3WTooOi9MkEHwp26zMycTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1668010617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7PcaLcUEOICv5KbYbIODLyr6+VrveGKUPouY9FEP/P8=;
 b=IAbmw47dt1RfZV7QwxJ/ZgZUIn5rXVEEClZmjgS34n7csOdpZ8GI4/tTbRbWINwRPI+IXz
 vAGCl2DXhXewuwBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 12CA71331F;
 Wed,  9 Nov 2022 16:16:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TD6YBXnSa2P8aQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 09 Nov 2022 16:16:57 +0000
Date: Wed, 9 Nov 2022 17:18:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Tarun Sahu <tsahu@linux.ibm.com>
Message-ID: <Y2vS0slepYtvWQBx@yuki>
References: <20221108195207.232115-1-tsahu@linux.ibm.com>
 <20221108195207.232115-4-tsahu@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221108195207.232115-4-tsahu@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/5] Hugetlb: Migrating libhugetlbfs
 fadvise_reserve
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
Cc: sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com, geetika@linux.ibm.com,
 vaibhav@linux.ibm.com, ltp@lists.linux.it, mike.kravetz@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +/*\
> + * [Description]
> + *
> + * fadvise() on some kernels can cause the reservation counter to get
> + * corrupted. The problem is that the patches are allocated for the
> + * reservation but not faulted in at the time of allocation. The counters
> + * do not get updated and effectively "leak". This test identifies whether
> + * the kernel is vulnerable to the problem or not. It's fixed in kernel
> + * by commit f2deae9d4e70793568ef9e85d227abb7bef5b622.
> + */
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <sys/mount.h>
> +#include <limits.h>
> +#include <sys/param.h>
> +#include <sys/types.h>
> +
> +#include "hugetlb.h"
> +
> +#define MNTPOINT "hugetlbfs/"
> +static long hpage_size;
> +static int  fd = -1;
> +
> +static void run_test(void)
> +{
> +	void *p;
> +	unsigned long initial_rsvd, map_rsvd, fadvise_rsvd, end_rsvd;
> +
> +	fd = tst_creat_unlinked(MNTPOINT);
> +
> +	initial_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count before map: %lu", initial_rsvd);
> +
> +	p = SAFE_MMAP(NULL, hpage_size, PROT_READ|PROT_WRITE, MAP_SHARED,
> +		 fd, 0);
> +	map_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after map: %lu", map_rsvd);
> +
> +	if (posix_fadvise(fd, 0, hpage_size, POSIX_FADV_WILLNEED) == -1) {
> +		tst_res(TFAIL|TERRNO, "fadvise()");
> +		goto cleanup;
> +	}

If we follow how SAFE_MACROS() works this should rather be:

	if (posix_fadvise(...)
		tst_brk(TBROK|TERRNO, "fadvise()");

> +	fadvise_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after fadvise: %lu", fadvise_rsvd);
> +
> +	memset(p, 1, hpage_size);
> +
> +	SAFE_MUNMAP(p, hpage_size);
> +	p = NULL;
> +	SAFE_CLOSE(fd);
> +	end_rsvd = SAFE_READ_MEMINFO(MEMINFO_HPAGE_RSVD);
> +	tst_res(TINFO, "Reserve count after close: %lu", end_rsvd);
> +
> +	TST_EXP_EQ_LU(end_rsvd, initial_rsvd);
> +cleanup:
> +	if (p)
> +		SAFE_MUNMAP(p, hpage_size);
> +	if (fd > 0)
> +		SAFE_CLOSE(fd);
> +}
> +
> +static void setup(void)
> +{
> +	hpage_size = SAFE_READ_MEMINFO(MEMINFO_HPAGE_SIZE)*1024;
> +}
> +
> +static void cleanup(void)
> +{
> +	if (fd > 0)
> +		SAFE_CLOSE(fd);
> +}
> +
> +static struct tst_test test = {
> +	.tags = (struct tst_tag[]) {
> +		{"linux-git", "f2deae9d4e70793568ef9e85d227abb7bef5b622"},

We usually shorten the hash to first 12 characters however things should
work fine either way.

> +		{}
> +	},
> +	.needs_root = 1,
> +	.mntpoint = MNTPOINT,
> +	.needs_hugetlbfs = 1,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.test_all = run_test,
> +	.hugepages = {1, TST_NEEDS},
> +};
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
