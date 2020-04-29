Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA41BDB5F
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 14:05:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64D393C2822
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 14:05:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 168E13C27F2
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 14:05:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CE057100173E
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 14:05:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55929ACCC;
 Wed, 29 Apr 2020 12:05:49 +0000 (UTC)
Date: Wed, 29 Apr 2020 14:06:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200429120609.GA668@yuki.lan>
References: <1587450108-31100-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587450108-31100-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587450108-31100-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib: Add TST_ASSERT_FILE_INT and
 TST_ASSERT_FILE_STR
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
>  #endif /* TST_ASSERT_H__ */
> diff --git a/lib/tst_assert.c b/lib/tst_assert.c
> index 8ef3cd72e..65ee76473 100644
> --- a/lib/tst_assert.c
> +++ b/lib/tst_assert.c
> @@ -4,6 +4,7 @@
>   * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>   * Copyright (c) 2020 Cyril Hrubis <chrubis@suse.cz>
>   */
> +#include <stdio.h>
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_assert.h"
>  #include "tst_test.h"
> @@ -22,6 +23,22 @@ void tst_assert_int(const char *file, const int lineno, const char *path, int va
>  	tst_res_(file, lineno, TFAIL, "%s != %d got %d", path, val, sys_val);
>  }
>  
> +void tst_assert_file_int(const char *file, const int lineno, const char *path, const char *buf, int val)
> +{
> +	int sys_val;
> +	char fmt[1024];
> +
> +	sprintf(fmt, "%s: %%d", buf);

If we want to keep the function as generic as possible we shouldn't add
the colon and space after the %s here.

There is no standard on proc files, for instance it wouldn't be possible
to parse /proc/vmstat if we hardcode the format string like that.

So I would just change this to "%s%%d" instead and pass "Foo: " instead
just "Foo" in the testcases.

Also I guess that we should call it prefix rather than buf, but that's
minor.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
