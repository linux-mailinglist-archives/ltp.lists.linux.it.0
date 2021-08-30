Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF93FBCE0
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 21:26:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED1693C9B5B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 21:26:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8A4A13C2B34
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 21:26:38 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2DAF220033D
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 21:26:37 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 67A4C1FE40;
 Mon, 30 Aug 2021 19:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630351597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EaxwyhvpQEPUigpUexFoX/IA4kgaZpT1VwoDZ4nNXAk=;
 b=v112OUVMw7ZqWdPcU8QRe4ZUTSS+Aqvmrweq7gV1HkZKgJJrg1na569kx5MMcq31FoahnN
 x2HhOAFUQ78CnZFYSzTAWBrO6ngGUMf9K/vAYWGQ0RDPufash9E/yilAobjOZRG1Pxm57G
 AgmQXV1qFKu6bbDHZTcBmwAWK4Ab6Cw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630351597;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EaxwyhvpQEPUigpUexFoX/IA4kgaZpT1VwoDZ4nNXAk=;
 b=2atW54oJg4jhpxW3EsBIy/uBsqmfc6dmINKKqJUkAhf7MMNjI+QC9jzxYnam4h62GfAiVC
 PvwIDD7xC0O3rGBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 29C8513A1F;
 Mon, 30 Aug 2021 19:26:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id fkbjBu0wLWFESQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 30 Aug 2021 19:26:37 +0000
Date: Mon, 30 Aug 2021 21:26:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YS0w6y6wxn6CjLur@pevik>
References: <20210824101042.11772-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210824101042.11772-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kernel/irq: Add irqbalance01
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

Hi Richie,

LGTM, only few nits found bellow (easily fixed before merge)

...
> +++ b/testcases/kernel/irq/.gitignore
> @@ -0,0 +1 @@
> +irqbalance01
/irqbalance01

> diff --git a/testcases/kernel/irq/Makefile b/testcases/kernel/irq/Makefile
> new file mode 100644
> index 000000000..085e06fac
> --- /dev/null
> +++ b/testcases/kernel/irq/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir		?= ../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +INSTALL_TARGETS		:= *.sh
This should be removed (probably copy paste error
> +
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/irq/irqbalance01.c b/testcases/kernel/irq/irqbalance01.c
> new file mode 100644
> index 000000000..0a476839c
> --- /dev/null
> +++ b/testcases/kernel/irq/irqbalance01.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com> */
> +/*\
> + * [Description]
> + *
> + * Check that something (e.g. irqbalance daemon) is performing IRQ
> + * load balancing.
> + *
> + * On most systems userland needs to set /proc/irq/$IRQ/smp_affinity
> + * to prevent many IRQs being delivered to the same CPU.
> + *
> + * Note some drivers and IRQ controllers will distribute IRQs
> + * evenly. Some systems will have housekeeping CPUs configured. Some
> + * IRQs can not be masked etc. So this test is not appropriate for all
> + * scenarios.
> + *
> + * Furthermore, exactly how IRQs should be distributed is a
> + * performance and/or security issue. This is only a generic smoke
> + * test. It will hopefully detect misconfigured systems and total
> + * balancing failures which are often silent errors.
> + *
> + * Heuristic: Evidence of Change
Add blank new line here to get better docparse formatting:

> + * 1. Find IRQs with a non-zero count
> + * 2. Check if they are now disallowed
LGTM. It'd be interesting to hear opinion of IRQ subsystem maintainer Thomas Gleixner.

> + *
> + * There are two sources of information we need to parse:
Also here.

> + * 1. /proc/interrupts
> + * 2. /proc/irq/$IRQ/smp_affinity
> + *
> + * We get the active IRQs and CPUs from /proc/interrupts. It also
> + * contains the per-CPU IRQ counts and info we do not care about.
> + *
> + * We get the IRQ masks from each active IRQ's smp_affinity file. This
> + * is a bitmask written out in hexidecimal format. It shows which CPUs
                                  ^ hexadecimal
> + * an IRQ may be recieved by.
                    ^ received
> + */
> +
> +#include <stdlib.h>
> +
> +#include "tst_test.h"
> +#include "tst_safe_stdio.h"
> +#include "tst_safe_file_at.h"
> +
> +enum affinity {
> +	ALLOW,
> +	DENY,
> +};
> +
> +static unsigned int *irq_stats;
> +static enum affinity *irq_affinity;
> +
> +static unsigned int nr_cpus;
> +static unsigned int nr_irqs;
> +static unsigned int *irq_ids;
> +
> +static void collect_irq_info(void)
> +{
> +	char *buf = NULL, *c, *first_row;
> +	char path[PATH_MAX];
> +	size_t size = 1024;
> +	size_t ret, row, col;
> +	long acc;
> +	unsigned int cpu_total, mask_pos;
> +	int fd = SAFE_OPEN("/proc/interrupts", O_RDONLY);
> +
> +	nr_cpus = 0;
> +	nr_irqs = 0;
> +
> +	do {
> +		size *= 2;
> +		buf = SAFE_REALLOC(buf, size);
> +		SAFE_LSEEK(fd, SEEK_SET, 0);
		SAFE_LSEEK(fd, 0, SEEK_SET);
(it works only because SEEK_SET is also 0)

> +		ret = SAFE_READ(0, fd, buf, size - 1);
> +	} while (ret >= size - 1);
...

The rest LGTM.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
