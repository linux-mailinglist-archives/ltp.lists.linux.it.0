Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A3A136E2D
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 14:37:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF36E3C2555
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 14:37:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 877183C24B1
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 14:37:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 952B41A00694
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 14:37:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BFC6AB018;
 Fri, 10 Jan 2020 13:37:47 +0000 (UTC)
Date: Fri, 10 Jan 2020 14:37:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200110133746.GB14140@rei.lan>
References: <1577269768-30118-1-git-send-mail-xuyang2018.jy@cn.fujitsu.com>
 <1578365634-19825-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578365634-19825-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/pipe12: add new test for pipe when
 write bytes > PIPE_BUF
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
> --- /dev/null
> +++ b/testcases/kernel/syscalls/pipe/pipe12.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * Test Description:
> + * A pipe has a limited capacity. If the pipe with non block mode is full,
> + * then a write(2) will fail and get EAGAIN error. Otherwise, from 1 to
> + * PIPE_BUF bytes may be written.
> + */
> +#define _GNU_SOURCE
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <fcntl.h>
> +#include "tst_test.h"
> +#include "lapi/fcntl.h"
> +
> +static int fds[2];
> +static char *wrbuf;
> +static char *rdbuf;
> +static ssize_t max_size, invalid_size;
> +
> +static struct tcase {
> +	int full_flag;
> +	int need_offset;

This could be called just offset, it does not have to be boolean either,
we just need to write offset bytes from a buffer before we attempt to
write to the pipe.

> +	char *message;
> +} tcases[] = {
> +	{1, 0, "Test on full pipe"},
                 "Write to full pipe"
> +	{0, 1, "Test on non full pipe from 1 offset"},
		 "Write to non-empty pipe"
> +	{0, 0, "Test on non full pipe from 0 offset"},
                      "Write to empty pipe"
> +};
> +
> +static void verify_pipe(unsigned int n)
> +{
> +	struct tcase *tc = &tcases[n];
> +
> +	memset(rdbuf, 0, max_size);
> +
> +	tst_res(TINFO, "%s", tc->message);
> +	if (tc->full_flag) {
> +		SAFE_WRITE(1, fds[1], wrbuf, max_size);
> +		TEST(write(fds[1], "x", 1));
> +		if (TST_RET == 0) {
			write is required to return -1 here which is
			what we have to check against i.e, TST_RET != -1
			means fail
> +			tst_res(TFAIL, "write succeeded unexpectedly");
> +			goto clean_pipe_buf;
> +		}
> +		if (TST_ERR == EAGAIN)
> +			tst_res(TPASS | TTERRNO, "write failed as expected");
> +		else
> +			tst_res(TFAIL | TTERRNO, "write failed, expected EAGAIN but got");
> +	} else {
> +		if (tc->need_offset)
> +			SAFE_WRITE(1, fds[1], "x", 1);
> +		TEST(write(fds[1], wrbuf, invalid_size));
> +		if (TST_RET == -1) {
> +			tst_res(TFAIL, "write failed unexpectedly");
> +			goto clean_pipe_buf;
> +		}
> +		if (TST_RET == invalid_size)
> +			tst_res(TFAIL, "write size %ld larger than PIPE_BUF %ld", TST_RET, max_size);
> +		else
> +			tst_res(TPASS, "write size %ld between [1, %ld]", TST_RET, max_size);

		Here as well, write is supposed to return the number of
		bytes written so in this case the TST_RET must be
		max_size - tcase->offset which is all we have to check
		for, anything else than that means failure.

> +	}
> +
> +clean_pipe_buf:
> +	SAFE_READ(0, fds[0], rdbuf, max_size);
> +}
> +
> +
> +static void cleanup(void)
> +{
> +	if (fds[0] > 0)
> +		SAFE_CLOSE(fds[0]);
> +	if (fds[1] > 0)
> +		SAFE_CLOSE(fds[1]);
> +	if (wrbuf)
> +		free(wrbuf);
> +	if (rdbuf)
> +		free(rdbuf);
> +}
> +
> +static void setup(void)
> +{
> +
> +	TEST(pipe(fds));
> +	if (TST_RET == -1) {
> +		tst_brk(TBROK | TTERRNO, "pipe");
> +		return;
> +	}

This is exactly what SAFE_PIPE() does.

> +	max_size = SAFE_FCNTL(fds[1], F_GETPIPE_SZ);
> +	invalid_size = max_size + 4096;
> +	wrbuf = SAFE_MALLOC(invalid_size);
> +	rdbuf = SAFE_MALLOC(max_size);
> +	memset(wrbuf, 'x', invalid_size);
> +
> +	SAFE_FCNTL(fds[1], F_SETFL, O_NONBLOCK);
> +	SAFE_FCNTL(fds[0], F_SETFL, O_NONBLOCK);
> +}
> +
> +static struct tst_test test = {
> +	.test = verify_pipe,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.tcnt = ARRAY_SIZE(tcases),
> +};
> -- 
> 2.18.0
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
