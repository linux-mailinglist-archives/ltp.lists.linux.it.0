Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B61F10FD74
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 13:15:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D6603C2591
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Dec 2019 13:15:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8C3B63C239B
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 13:15:25 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 68B956002E6
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 13:15:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B3159B027
 for <ltp@lists.linux.it>; Tue,  3 Dec 2019 12:15:23 +0000 (UTC)
Date: Tue, 3 Dec 2019 13:15:22 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jorik Cronenberg <jcronenberg@suse.de>
Message-ID: <20191203121522.GB2844@rei>
References: <20191126135434.3196-1-jcronenberg@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126135434.3196-1-jcronenberg@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add vmsplice03 test
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
> diff --git a/testcases/kernel/syscalls/vmsplice/vmsplice03.c b/testcases/kernel/syscalls/vmsplice/vmsplice03.c
> new file mode 100644
> index 000000000..54dace1b6
> --- /dev/null
> +++ b/testcases/kernel/syscalls/vmsplice/vmsplice03.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 SUSE LLC
> + * Author: Jorik Cronenberg <jcronenberg@suse.de>
> + *
> + * Test vmsplice() from a pipe into user memory
> + */
> +
> +#define _GNU_SOURCE
> +
> +#include "tst_test.h"
> +#include "lapi/fcntl.h"
> +#include "lapi/vmsplice.h"
> +
> +
> +#define TEST_BLOCK_SIZE (64*1024)	/* 64K */
> +
> +static char buffer[TEST_BLOCK_SIZE];
> +static off64_t offset;
> +
> +static void vmsplice_test(void)
> +{
> +	int written, i;
> +	int pipes[2];
> +	struct iovec iov;
> +	char arr_write[TEST_BLOCK_SIZE];
> +	char *arr_read;
> +
> +	iov.iov_base = arr_write;
> +	iov.iov_len = TEST_BLOCK_SIZE;
> +	offset = sizeof(struct iovec);

It may be a good idea to memset the arr_write[] array with well defined
data, e.g. 0 just to be sure that kernel really filled it.

> +	SAFE_PIPE(pipes);
> +	SAFE_WRITE(1, pipes[1], buffer, TEST_BLOCK_SIZE);
> +	written = vmsplice(pipes[0], &iov, 1, 0);
> +	arr_read = (char *)&iov;

This only works by accident because the arr_write is put on the stack
after the iovec structure and there is no padding in between them.

What you really should do is to use the arr_write pointer in the
comparsion instead. The struc iovec is just a description of an buffer
that starts in memory at arr_write address and is iov_len long because
the kernel has to know its lenght.

> +	if (written < 0)
> +		tst_brk(TBROK | TERRNO, "vmsplice() failed");
> +	else if (written == 0)

There is no need for an else branch after tst_brk() because tst_brk()
will exit the test immediately.

> +		tst_res(TFAIL, "vmsplice() didn't write anything");
> +	else {
> +		for (i = 0; i < written; i++) {
> +			if (arr_read[i+offset] != buffer[i]) {
> +				tst_res(TFAIL,
> +					"Wrong data in user memory at %i", i);
> +				break;
> +			}
> +		}
> +		if (i == written)
> +			tst_res(TPASS, "Spliced correctly into user memory");
> +	}
> +
> +	SAFE_CLOSE(pipes[1]);
> +	SAFE_CLOSE(pipes[0]);
> +}
> +
> +static void setup(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < TEST_BLOCK_SIZE; i++)
> +		buffer[i] = i & 0xff;
> +}
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.test_all = vmsplice_test,
> +	.min_kver = "2.6.23",
> +};

Otherwise it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
