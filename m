Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75834388B4E
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:03:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A8423C3057
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 12:03:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DE4833C1B0F
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:03:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E6D101401184
 for <ltp@lists.linux.it>; Wed, 19 May 2021 12:03:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49A41ABCD;
 Wed, 19 May 2021 10:03:42 +0000 (UTC)
Date: Wed, 19 May 2021 11:37:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YKTcWhMGotujEYLK@yuki>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519084655.52780-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile09 to the
 new API
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
> +/*\
> + * [Description]
>   *
> - * DESCRIPTION
> - *        Testcase copied from sendfile02.c to test the basic functionality of
> - *        the sendfile(2) system call on large file. There is a kernel bug which
> - *        introduced by commit 8f9c0119d7ba and fixed by commit 5d73320a96fcc.
> + * Testcase copied from sendfile02.c to test the basic functionality of
> + * the sendfile(2) system call on large file. There is a kernel bug which
> + * introduced by commit 8f9c0119d7ba and fixed by commit 5d73320a96fcc.
                            ^
	Here as well the commit that introduced the bug should go to
	.tags.
>   *
> - * ALGORITHM
> - *        1. call sendfile(2) with offset at 0
> - *        2. call sendfile(2) with offset at 3GB
> + * [Algorithm]
>   *
> - * USAGE:  <for command-line>
> - *  sendfile09 [-c n] [-i n] [-I x] [-P x] [-t]
> - *     where,
> - *             -i n : Execute test n times.
> - *             -I x : Execute test for x seconds.
> - *             -P x : Pause for x seconds between iterations.
> - *             -t   : Turn on syscall timing.
> + * 1. Call sendfile(2) with offset at 0;
> + * 2. Call sendfile(2) with offset at 3GB.
>   *
> + * [Restrictions]

So far we had only [Description] and [Algorithm] but adding
[Restrictions] sounds reasonable.

>   *
> - * RESTRICTIONS
> - *        Only supports 64bit systems and kernel 2.6.33 or above
> + * Only supports 64bit systems and kernel 2.6.33 or above.

I guess that there is no point in mentioning the kernel version here, we
have it in the tst_test structure and it's exported from that structure
into the metadata as well.

>   */
> -#include <stdio.h>
> -#include <errno.h>
> +
>  #include <fcntl.h>
>  #include <sys/stat.h>
>  #include <sys/sendfile.h>
>  #include <sys/types.h>
>  #include <unistd.h>
>  #include <inttypes.h>
> -#include "test.h"
> -#include "safe_macros.h"
> -#include "lapi/abisize.h"
> 
> -#ifndef OFF_T
> -#define OFF_T off_t
> -#endif /* Not def: OFF_T */
> +#include "tst_test.h"
> 
> -TCID_DEFINE(sendfile09);
> -
> -static char *in_file = "in";
> -static char *out_file = "out";
> -static int fd;
> -static int in_fd;
> -static int out_fd;
> +#ifdef TST_ABI32
> +tst_brkm(TCONF, "This test is only for 64bit");
> +#endif

Does this even compile on 32bit?

HINT: You can compile LTP for 32bit with ./configure CFLAGS=-m32 LDFLAGS=-m32


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
