Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B236DEA4
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 19:48:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 544573C6A8F
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 19:48:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E2D6E3C19C3
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 19:48:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2A3911000F29
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 19:48:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D51AB13B;
 Wed, 28 Apr 2021 17:48:25 +0000 (UTC)
Date: Wed, 28 Apr 2021 19:48:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YImf5zpy71k1sKqM@pevik>
References: <20210428142719.8065-1-rpalethorpe@suse.com>
 <20210428142719.8065-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428142719.8065-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/6] API: Add safe openat, printfat,
 readat and unlinkat
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

> Add 'at' variants for a number of system calls and LTP SAFE API
> functions. This avoids using sprintf everywhere to build paths.

> diff --git a/lib/tst_safe_file_at.c b/lib/tst_safe_file_at.c
> new file mode 100644
> index 000000000..a92a48fb2
> --- /dev/null
> +++ b/lib/tst_safe_file_at.c
> @@ -0,0 +1,170 @@
> +#define _GNU_SOURCE
> +#include "lapi/fcntl.h"
> +#include "tst_safe_file_at.h"
This requires <stdio.h> (sprintf).

Also file should have SPDX license + copyright.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +
> +char fd_path[PATH_MAX];
> +
> +char *tst_decode_fd(int fd)
> +{
> +	ssize_t ret;
> +	char proc_path[32];
> +
> +	if (fd < 0)
> +		return "!";
> +
> +	sprintf(proc_path, "/proc/self/fd/%d", fd);
> +	ret = readlink(proc_path, fd_path, sizeof(fd_path));
...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
