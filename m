Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D14335FC970
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 18:47:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF1333CAEB7
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Oct 2022 18:47:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F3CB13C9590
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 18:47:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 324F214000B8
 for <ltp@lists.linux.it>; Wed, 12 Oct 2022 18:47:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52F9B1F385;
 Wed, 12 Oct 2022 16:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1665593249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ro5mYifBVwVo9k0juRY8gBAjmKeJETi+xa020MEpiw=;
 b=hPQZfpfqDaX2nrFV0PkRb8OCiAcywbbqeGrMn3HJGbTwmuiMC+O47OpBkreuA5KDU6G069
 js+DPnhmpO8xgLOq2h/5EcMR0LDdTd9+e31+dXYlkbeSAlirEaXXms14s1SX7sl1kqvXXF
 ODQHvGEIGq3ehD0mfq903kabYi2Mih4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1665593249;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ro5mYifBVwVo9k0juRY8gBAjmKeJETi+xa020MEpiw=;
 b=bBlX9aO6WtwjCXnk8ouGReb+XQ2m+E1m+fRBaNqfMzXm5xK55ZAi/rQSpWPPr6wsfwtejP
 evT/YdvK1GCzvBCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B0A213A5C;
 Wed, 12 Oct 2022 16:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RUOOCKHvRmPRbgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 12 Oct 2022 16:47:29 +0000
Date: Wed, 12 Oct 2022 18:49:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Y0bwCz3wCdo9dY2g@yuki>
References: <20221010145534.4857-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010145534.4857-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add epoll_wait06 test
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
> This test verifies EPOLLET functionality.
> 
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  .../kernel/syscalls/epoll_wait/.gitignore     |  1 +
>  .../kernel/syscalls/epoll_wait/epoll_wait06.c | 97 +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/epoll_wait/epoll_wait06.c
> 
> diff --git a/testcases/kernel/syscalls/epoll_wait/.gitignore b/testcases/kernel/syscalls/epoll_wait/.gitignore
> index ab5a9c010..8c5ed7c5c 100644
> --- a/testcases/kernel/syscalls/epoll_wait/.gitignore
> +++ b/testcases/kernel/syscalls/epoll_wait/.gitignore
> @@ -3,3 +3,4 @@ epoll_wait02
>  epoll_wait03
>  epoll_wait04
>  epoll_wait05
> +epoll_wait06
> diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait06.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait06.c
> new file mode 100644
> index 000000000..20f6233c9
> --- /dev/null
> +++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait06.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Verify that edge triggered behavior is correctly handled by epoll.
> + *
> + * [Algorithm]
> + *
> + * 1. The file descriptor that represents the read side of a pipe (rfd) is
> + *    registered on the epoll instance.
> + * 2. A pipe writer writes 2 kB of data on the write side of the pipe.
> + * 3. A call to epoll_wait(2) is done that will return rfd as a ready file
> + *    descriptor.
> + * 4. The pipe reader reads 1 kB of data from rfd.
> + * 5. A call to epoll_wait(2) should fail because there's data left to read.
> + */

I do not like this description that much. First of all the the flag we
are testing is not mentioned there at all, the EPOLLET should be
mentioned in the [Description].

The second call to epoll_wait() does not fail, failure for syscall means
that -1 is returned and errno is set. It does not report any data ready
on the file descriptor, that is not failure at all, that is how the
EPOLLET flag is supposed to work.

> +#include <poll.h>
> +#include <sys/epoll.h>
> +#include "tst_test.h"
> +
> +#define WRITE_SIZE 2048
> +#define READ_SIZE (WRITE_SIZE / 2)
> +
> +static int fds[2];
> +static int epfd;
> +
> +static void cleanup(void)
> +{
> +	if (epfd > 0)
> +		SAFE_CLOSE(epfd);
> +
> +	if (fds[0] > 0)
> +		SAFE_CLOSE(fds[0]);
> +
> +	if (fds[1] > 0)
> +		SAFE_CLOSE(fds[1]);
> +}
> +
> +static void run(void)
> +{
> +	int res;
> +	char buff[WRITE_SIZE];
> +	struct epoll_event evt_receive;
> +	struct epoll_event evt_request;
> +
> +	SAFE_PIPE(fds);
> +
> +	evt_request.events = EPOLLIN | EPOLLET;
> +	evt_request.data.fd = fds[0];
> +
> +	epfd = epoll_create(2);
> +	if (epfd == -1)
> +		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
> +
> +	tst_res(TINFO, "Polling channel with EPOLLET");
> +
> +	res = epoll_ctl(epfd, EPOLL_CTL_ADD, fds[0], &evt_request);
> +	if (res == -1)
> +		tst_brk(TBROK | TERRNO, "epoll_ctl failure");
> +
> +	tst_res(TINFO, "Write bytes on channel");
> +
> +	memset(buff, 'a', WRITE_SIZE);
> +	SAFE_WRITE(0, fds[1], buff, WRITE_SIZE);
> +
> +	res = epoll_wait(epfd, &evt_receive, 1, 2000);
> +	if (res <= 0) {
> +		tst_res(TFAIL | TERRNO, "epoll_wait() returned %i", res);
> +		goto close;
> +	}
> +
> +	if ((evt_receive.events & EPOLLIN) == 0) {
> +		tst_res(TFAIL, "No data received");
> +		goto close;
> +	}
> +
> +	tst_res(TINFO, "Received EPOLLIN event. Read half bytes from channel");
> +
> +	memset(buff, 0, READ_SIZE);
> +	SAFE_READ(1, evt_receive.data.fd, buff, READ_SIZE);
> +
> +	TST_EXP_EQ_LI(epoll_wait(epfd, &evt_receive, 1, 10), 0);
> +
> +close:

	SAFE_CLOSE(epfd) ?

> +	SAFE_CLOSE(fds[0]);
> +	SAFE_CLOSE(fds[1]);
> +}
> +
> +static struct tst_test test = {
> +	.cleanup = cleanup,
> +	.test_all = run,
> +};
> -- 
> 2.35.3
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
