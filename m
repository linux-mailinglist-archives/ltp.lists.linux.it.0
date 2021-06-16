Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 120043A9326
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:51:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C7BF3C71C4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 08:51:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5286F3C2DDA
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:51:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D5B081000D53
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 08:51:32 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C5451FD49;
 Wed, 16 Jun 2021 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623826292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qjyzG0TLRYVMSgfgbWFkc+RMREEt2HVCppMk6aO3TIg=;
 b=pa9wT1bXD8kbydLhg6cC/asUz/nLdssK2rvgh8X4MVt82Tn/d2WVE4aK3R6dp0h1r6k+J2
 fuCHgVF7i5aQx2Q3qba5vIWmXWvLOatncI9bGOqeX6bsmUUbLpcr3EzyuTeNWNiulZHy32
 4PM0BRd567Pe5G5j+1AjmBbT/zZrT4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623826292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qjyzG0TLRYVMSgfgbWFkc+RMREEt2HVCppMk6aO3TIg=;
 b=rQpHz0zi/Mx+gz5m4xpsw9kVLVrAWV9bCW0RYPsxbJ17bJS0rtX4c68VimhWFB0dfk+aN9
 rfTr/QTpUtL5TBAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 12D48118DD;
 Wed, 16 Jun 2021 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623826292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qjyzG0TLRYVMSgfgbWFkc+RMREEt2HVCppMk6aO3TIg=;
 b=pa9wT1bXD8kbydLhg6cC/asUz/nLdssK2rvgh8X4MVt82Tn/d2WVE4aK3R6dp0h1r6k+J2
 fuCHgVF7i5aQx2Q3qba5vIWmXWvLOatncI9bGOqeX6bsmUUbLpcr3EzyuTeNWNiulZHy32
 4PM0BRd567Pe5G5j+1AjmBbT/zZrT4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623826292;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qjyzG0TLRYVMSgfgbWFkc+RMREEt2HVCppMk6aO3TIg=;
 b=rQpHz0zi/Mx+gz5m4xpsw9kVLVrAWV9bCW0RYPsxbJ17bJS0rtX4c68VimhWFB0dfk+aN9
 rfTr/QTpUtL5TBAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vALTAnSfyWBSUQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 06:51:32 +0000
Date: Wed, 16 Jun 2021 08:51:30 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YMmfcvWc+d6wkfX9@pevik>
References: <YKzX7FPWGGROn6kR@pevik>
 <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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

...
> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> + * Copyright (C) 2020 Free Software Foundation, Inc.
>   * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>   * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>   */
> @@ -28,4 +29,22 @@ static inline void print_mallinfo(const char *msg, struct mallinfo *m)
>  }
>  #endif

> +#ifdef HAVE_MALLINFO2
> +static inline void print_mallinfo2(const char *msg, struct mallinfo2 *m)
> +{
> +	tst_res(TINFO, "%s...", msg);
nit: I'd remove "..." and add extra space before #define (readability)
And also change it on previously added print_mallinfo().

> +#define P2(f) tst_res(TINFO, "%s: %ld", #f, m->f)
> +	P2(arena);
> +	P2(ordblks);
> +	P2(smblks);
> +	P2(hblks);
> +	P2(hblkhd);
> +	P2(usmblks);
> +	P2(fsmblks);
> +	P2(uordblks);
> +	P2(fordblks);
> +	P2(keepcost);
> +}
> +#endif

...
> +++ b/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
> + */
> +
> +/*\
> + * [DESCRIPTION]
> + *
> + * Basic mallinfo2() test.
> + *
> + * Test members of struct mallinfo2() whether overflow when setting 2G size.
* Test hblkhd member of struct mallinfo2 whether overflow when setting 2G size.

> + */
> +
> +#include "mallinfo_common.h"
> +#include "tst_safe_macros.h"
> +
> +#ifdef HAVE_MALLINFO2
> +
> +void test_mallinfo2(void)
> +{
> +	struct mallinfo2 info;
> +	char *buf;
> +	size_t size = 2UL * 1024UL * 1024UL * 1024UL;
> +
> +	buf = malloc(size);
> +	if (!buf) {
> +		tst_res(TCONF, "Current system can not malloc 2G space, skip it");
> +		return;
> +	}
Here could be just:
	if (!buf)
		tst_brk(TCONF, "Current system can not malloc 2G space, skip it");

> +	info = mallinfo2();
> +	if (info.hblkhd < size) {
> +		print_mallinfo2("Test malloc 2G", &info);
> +		tst_brk(TFAIL, "The member of struct mallinfo2 overflow?");
You don't free buf here.

Maybe something like:

	if (info.hblkhd < size) {
		print_mallinfo2("Test malloc 2G", &info);
		tst_res(TFAIL, "hblkhd member of struct mallinfo2 overflow?");
	} else {
		tst_res(TPASS, "hblkhd member of struct mallinfo2 doesn't overflow");
	}

	free(buf);

If you're ok with it, no need to repost, I'll change it before merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
