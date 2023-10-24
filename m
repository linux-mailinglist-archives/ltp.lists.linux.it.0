Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7E07D4C33
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Oct 2023 11:28:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 750CD3CCD87
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Oct 2023 11:28:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3939E3CBB03
 for <ltp@lists.linux.it>; Tue, 24 Oct 2023 11:28:21 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CF9D01A0C252
 for <ltp@lists.linux.it>; Tue, 24 Oct 2023 11:28:20 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 204A11FD71;
 Tue, 24 Oct 2023 09:28:19 +0000 (UTC)
Received: from g78 (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.25.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5A3B02CB0D;
 Tue, 24 Oct 2023 09:28:18 +0000 (UTC)
References: <20231016123320.9865-1-chrubis@suse.cz>
 <20231016123320.9865-4-chrubis@suse.cz>
User-agent: mu4e 1.10.7; emacs 29.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 24 Oct 2023 10:26:19 +0100
Organization: Linux Private Site
In-reply-to: <20231016123320.9865-4-chrubis@suse.cz>
Message-ID: <87fs20v07j.fsf@suse.de>
MIME-Version: 1.0
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de; dkim=none; dmarc=none;
 spf=softfail (smtp-out2.suse.de: 149.44.160.134 is neither permitted nor
 denied by domain of rpalethorpe@suse.de) smtp.mailfrom=rpalethorpe@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-2.21 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[rpalethorpe@suse.de]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 RWL_MAILSPIKE_GOOD(0.00)[149.44.160.134:from];
 NEURAL_HAM_LONG(-3.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; DMARC_NA(0.20)[suse.de];
 R_SPF_SOFTFAIL(0.60)[~all:c]; HAS_ORG_HEADER(0.00)[];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; VIOLATED_DIRECT_SPF(3.50)[];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-1.00)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(0.20)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -2.21
X-Rspamd-Queue-Id: 204A11FD71
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] syscalls: accept: Add tst_fd test
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
Cc: mszeredi@redhat.com, brauner@kernel.org, Jan Kara <jack@suse.cz>,
 Matthew Wilcox <willy@infradead.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> It looks like we return wrong errno on O_PATH file and open_tree() file descriptors.
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  runtest/syscalls                            |  1 +
>  testcases/kernel/syscalls/accept/.gitignore |  1 +
>  testcases/kernel/syscalls/accept/accept01.c |  8 ----
>  testcases/kernel/syscalls/accept/accept03.c | 47 +++++++++++++++++++++
>  4 files changed, 49 insertions(+), 8 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/accept/accept03.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 53e519639..55396aad8 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -3,6 +3,7 @@ abort01 abort01
>  
>  accept01 accept01
>  accept02 accept02
> +accept03 accept03
>  
>  accept4_01 accept4_01
>  
> diff --git a/testcases/kernel/syscalls/accept/.gitignore b/testcases/kernel/syscalls/accept/.gitignore
> index 5b1462699..f81d4bec9 100644
> --- a/testcases/kernel/syscalls/accept/.gitignore
> +++ b/testcases/kernel/syscalls/accept/.gitignore
> @@ -1,2 +1,3 @@
>  /accept01
>  /accept02
> +/accept03
> diff --git a/testcases/kernel/syscalls/accept/accept01.c b/testcases/kernel/syscalls/accept/accept01.c
> index 85af0f8af..e5db1dfec 100644
> --- a/testcases/kernel/syscalls/accept/accept01.c
> +++ b/testcases/kernel/syscalls/accept/accept01.c
> @@ -26,7 +26,6 @@
>  struct sockaddr_in sin0, sin1, fsin1;
>  
>  int invalid_socketfd = 400; /* anything that is not an open file */
> -int devnull_fd;
>  int socket_fd;
>  int udp_fd;
>  
> @@ -45,10 +44,6 @@ static struct test_case {
>  		(struct sockaddr *)&fsin1, sizeof(fsin1), EBADF,
>  		"bad file descriptor"
>  	},
> -	{
> -		PF_INET, SOCK_STREAM, 0, &devnull_fd, (struct sockaddr *)&fsin1,
> -		sizeof(fsin1), ENOTSOCK, "fd is not socket"
> -	},
>  	{
>  		PF_INET, SOCK_STREAM, 0, &socket_fd, (struct sockaddr *)3,
>  		sizeof(fsin1), EINVAL, "invalid socket buffer"
> @@ -73,8 +68,6 @@ static void test_setup(void)
>  	sin0.sin_port = 0;
>  	sin0.sin_addr.s_addr = INADDR_ANY;
>  
> -	devnull_fd = SAFE_OPEN("/dev/null", O_WRONLY);
> -
>  	socket_fd = SAFE_SOCKET(PF_INET, SOCK_STREAM, 0);
>  	SAFE_BIND(socket_fd, (struct sockaddr *)&sin0, sizeof(sin0));
>  
> @@ -88,7 +81,6 @@ static void test_setup(void)
>  
>  static void test_cleanup(void)
>  {
> -	SAFE_CLOSE(devnull_fd);
>  	SAFE_CLOSE(socket_fd);
>  	SAFE_CLOSE(udp_fd);
>  }

Is this supposed to be part of the patchset?

I don't mind, but if we are strict, it should be in another commit.

> diff --git a/testcases/kernel/syscalls/accept/accept03.c b/testcases/kernel/syscalls/accept/accept03.c
> new file mode 100644
> index 000000000..084bedaf4
> --- /dev/null
> +++ b/testcases/kernel/syscalls/accept/accept03.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +/*
> + * Copyright (C) 2023 Cyril Hrubis <chrubis@suse.cz>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Verify that accept() returns ENOTSOCK for non-socket file descriptors.
> + */
> +
> +#include <sys/socket.h>
> +#include <netinet/in.h>
> +
> +#include "tst_test.h"
> +
> +void check_accept(struct tst_fd *fd)
> +{
> +	struct sockaddr_in addr = {
> +		.sin_family = AF_INET,
> +		.sin_port = 0,
> +		.sin_addr = {.s_addr = INADDR_ANY},
> +	};
> +	socklen_t size = sizeof(addr);
> +
> +	switch (fd->type) {
> +	case TST_FD_UNIX_SOCK:
> +	case TST_FD_INET_SOCK:
> +		return;
> +	default:
> +		break;
> +	}
> +
> +	TST_EXP_FAIL2(accept(fd->fd, (void*)&addr, &size),
> +		ENOTSOCK, "accept() on %s", tst_fd_desc(fd));
> +}
> +
> +static void verify_accept(void)
> +{
> +	TST_FD_FOREACH(fd)
> +		check_accept(&fd);
> +}
> +
> +static struct tst_test test = {
> +	.test_all = verify_accept,
> +};
> -- 
> 2.41.0

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
