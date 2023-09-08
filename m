Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D65487984E8
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Sep 2023 11:38:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B62E3CB564
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Sep 2023 11:38:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 422723CB4F9
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 11:38:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3C5C71400071
 for <ltp@lists.linux.it>; Fri,  8 Sep 2023 11:38:33 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 635A11F892;
 Fri,  8 Sep 2023 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694165913;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sMFmboAh/ZAxHMY6Hsnv/XAyOuFSMvj2+l8sSBHQ4T8=;
 b=EfiYivQUsFbKRGBrxYovO/ThQpLHzRbLxM07mWOOJKwJvgy9RvFirHN9FylaC9gvwIiMMp
 eEoRNewYPD7AkcDtwJ32GSK9CEpxUOmOkbeochTunVEMT1ZJC41F8nLdpObFBd96OA8kEK
 CdyvVHHsZ2IT2yOlHLkT3J/J8QtvTlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694165913;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sMFmboAh/ZAxHMY6Hsnv/XAyOuFSMvj2+l8sSBHQ4T8=;
 b=aRk8cWT5/fMeXHlSGeJrjfB94TN/ZqDCMDj5XFPb9XKgHbmdSrCXAxBoI8cVaZmOvSXC69
 fHKgUKhIwTB7jiBA==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B2D932C143;
 Fri,  8 Sep 2023 09:38:32 +0000 (UTC)
References: <20230831104242.27156-1-andrea.cervesato@suse.de>
 <20230831104242.27156-3-andrea.cervesato@suse.de>
User-agent: mu4e 1.10.7; emacs 29.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Fri, 08 Sep 2023 10:37:23 +0100
Organization: Linux Private Site
In-reply-to: <20230831104242.27156-3-andrea.cervesato@suse.de>
Message-ID: <87zg1xgg2y.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/2] Refactor getegid02 using new LTP API
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Looks good, I guess you will make changes to the first one and resend?

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

Andrea Cervesato <andrea.cervesato@suse.de> writes:

> From: Andrea Cervesato <andrea.cervesato@suse.com>
>
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/syscalls/getegid/getegid02.c | 93 +++++--------------
>  1 file changed, 21 insertions(+), 72 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/getegid/getegid02.c b/testcases/kernel/syscalls/getegid/getegid02.c
> index 60f09501e..2f64bd869 100644
> --- a/testcases/kernel/syscalls/getegid/getegid02.c
> +++ b/testcases/kernel/syscalls/getegid/getegid02.c
> @@ -1,90 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Copyright (c) International Business Machines  Corp., 2001
> - *  Ported by Wayne Boyer
> - *
> - * This program is free software;  you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - * the GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program;  if not, write to the Free Software
> - * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
> + *   William Roske, Dave Fenner
> + * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
>   */
>  
> -/*
> - * Testcase to check the basic functionality of getegid().
> +/*\
> + * [Description]
>   *
> - * For functionality test the return value from getegid() is compared to passwd
> - * entry.
> + * This test checks if getegid() returns the same effective group given by
> + * passwd entry via getpwuid().
>   */
>  
>  #include <pwd.h>
> -#include <errno.h>
> -
> -#include "test.h"
> -#include "compat_16.h"
>  
> -static void cleanup(void);
> -static void setup(void);
> +#include "tst_test.h"
> +#include "compat_tst_16.h"
>  
> -TCID_DEFINE(getegid02);
> -int TST_TOTAL = 1;
> -
> -int main(int ac, char **av)
> +static void run(void)
>  {
> -	int lc;
>  	uid_t euid;
> +	gid_t egid;
>  	struct passwd *pwent;
>  
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		TEST(GETEGID(cleanup));
> +	UID16_CHECK((euid = geteuid()), "geteuid");
>  
> -		if (TEST_RETURN < 0) {
> -			tst_brkm(TBROK, cleanup, "This should never happen");
> -		}
> +	pwent = getpwuid(euid);
> +	if (!pwent)
> +		tst_brk(TBROK | TERRNO, "getpwuid() error");
>  
> -		euid = geteuid();
> -		pwent = getpwuid(euid);
> +	GID16_CHECK((egid = getegid()), "getegid");
>  
> -		if (pwent == NULL)
> -			tst_brkm(TBROK, cleanup, "geteuid() returned "
> -				 "unexpected value %d", euid);
> -
> -		GID16_CHECK(pwent->pw_gid, getegid, cleanup);
> -
> -		if (pwent->pw_gid != TEST_RETURN) {
> -			tst_resm(TFAIL, "getegid() return value"
> -				 " %ld unexpected - expected %d",
> -				 TEST_RETURN, pwent->pw_gid);
> -		} else {
> -			tst_resm(TPASS,
> -				 "effective group id %ld "
> -				 "is correct", TEST_RETURN);
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -static void setup(void)
> -{
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -	TEST_PAUSE;
> +	TST_EXP_EQ_LI(pwent->pw_gid, egid);
>  }
>  
> -static void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.test_all = run,
> +};
> -- 
> 2.35.3


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
