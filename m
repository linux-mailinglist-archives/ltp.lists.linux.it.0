Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E863ACC4
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 16:39:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB6B23CC685
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Nov 2022 16:39:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0C1483C0041
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 16:39:16 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0AE311A0036A
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 16:39:15 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3728221BB4
 for <ltp@lists.linux.it>; Mon, 28 Nov 2022 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669649955;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flNiIQjQ3lbVunRxi/NY3VlQPxC0OWJQq+UUZ9riMlU=;
 b=OQeiXl1G+6ztIoWxoeypfmWMwOONp1y4lwUmVgVQfuBVTQMsyIgBkfJ9yb/YoC9CWxv3DN
 bGtJVhNIPTYt3XZ+HfCdxhPh+OIE2UBitYqexK5YCjWf308AfnZMG+4XKxDHGMiSycg6hB
 7fkR66dDvjKev8G+ao7Fkw1IS5sUTgM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669649955;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=flNiIQjQ3lbVunRxi/NY3VlQPxC0OWJQq+UUZ9riMlU=;
 b=S1yAs+G+WsBblkzKsG1EF8XSQoLdAlJKySFjgqYCnA1Bd4Yvgu06S6ZQIYUxRUXjPKTBoN
 ChPQlCpNrReSz4CQ==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 106542C142;
 Mon, 28 Nov 2022 15:39:15 +0000 (UTC)
References: <20221123142716.1336-1-akumar@suse.de>
User-agent: mu4e 1.8.11; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Avinesh Kumar <akumar@suse.de>
Date: Mon, 28 Nov 2022 15:38:57 +0000
Organization: Linux Private Site
In-reply-to: <20221123142716.1336-1-akumar@suse.de>
Message-ID: <87zgcbt7fh.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fstatfs01: Convert to new API and enable for all
 filesystems
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

Merged, Thanks!

Avinesh Kumar <akumar@suse.de> writes:

> Signed-off-by: Avinesh Kumar <akumar@suse.de>
> ---
>  testcases/kernel/syscalls/fstatfs/fstatfs01.c | 126 +++++-------------
>  1 file changed, 35 insertions(+), 91 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fstatfs/fstatfs01.c b/testcases/kernel/syscalls/fstatfs/fstatfs01.c
> index b06652dd5..6b14fd0d6 100644
> --- a/testcases/kernel/syscalls/fstatfs/fstatfs01.c
> +++ b/testcases/kernel/syscalls/fstatfs/fstatfs01.c
> @@ -1,57 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * Further, this software is distributed without any warranty that it is
> - * free of the rightful claim of any third person regarding infringement
> - * or the like.  Any license provided herein, whether implied or
> - * otherwise, applies only to this software file.  Patent licenses, if
> - * any, provided herein do not apply to combinations of this program with
> - * other software, or any other product whatsoever.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - *
> - * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
> - * Mountain View, CA  94043, or:
> - *
> - * http://www.sgi.com
> - *
> - * For further information regarding this notice, see:
> - *
> - * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
> - *
> - */
> -/*
> - * DETAILED DESCRIPTION
> - *   This is a Phase I test for the fstatfs(2) system call.  It is intended
> - *   to provide a limited exposure of the system call, for now.  It
> - *   should/will be extended when full functional tests are written for
> - *   fstatfs(2).
> + * Copyright (c) 2022 SUSE LLC Avinesh Kumar <avinesh.kumar@suse.com>
>   */
>  
> -#include <sys/types.h>
> -#include <fcntl.h>
> -#include <sys/statfs.h>
> -#include <errno.h>
> -#include <signal.h>
> -#include <string.h>
> +/*\
> + * [Description]
> + *
> + * Verify that fstatfs() syscall executes successfully for all
> + * available filesystems.
> + */
>  
> -#include "test.h"
> -#include "safe_macros.h"
>  
> -static void setup(void);
> -static void cleanup(void);
> +#include <stdio.h>
> +#include "tst_test.h"
>  
> -char *TCID = "fstatfs01";
> +#define MNT_POINT "mntpoint"
> +#define TEMP_FILE MNT_POINT"/test_file"
>  
>  static int file_fd;
>  static int pipe_fd;
> @@ -59,65 +24,44 @@ static int pipe_fd;
>  static struct tcase {
>  	int *fd;
>  	const char *msg;
> -} tcases[2] = {
> +} tcases[] = {
>  	{&file_fd, "fstatfs() on a file"},
>  	{&pipe_fd, "fstatfs() on a pipe"},
>  };
>  
> -int TST_TOTAL = ARRAY_SIZE(tcases);
> -
> -int main(int ac, char **av)
> +static void run(unsigned int i)
>  {
> -	int lc, i;
> -	struct statfs stats;
> +	struct tcase *tc = &tcases[i];
> +	struct statfs buf;
>  
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		tst_count = 0;
> -
> -		for (i = 0; i < TST_TOTAL; i++) {
> -			TEST(fstatfs(*tcases[i].fd, &stats));
> -
> -			if (TEST_RETURN == -1) {
> -				tst_resm(TFAIL | TTERRNO, "%s", tcases[i].msg);
> -			} else {
> -				tst_resm(TPASS, "%s - f_type=%lx",
> -				         tcases[i].msg, stats.f_type);
> -			}
> -		}
> -	}
> -
> -	cleanup();
> -	tst_exit();
> +	TST_EXP_PASS(fstatfs(*tc->fd, &buf), "%s", tc->msg);
>  }
>  
>  static void setup(void)
>  {
>  	int pipe[2];
>  
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	file_fd = SAFE_OPEN(cleanup, "test_file", O_RDWR | O_CREAT, 0700);
> -
> -	SAFE_PIPE(cleanup, pipe);
> +	file_fd = SAFE_OPEN(TEMP_FILE, O_RDWR | O_CREAT, 0700);
> +	SAFE_PIPE(pipe);
>  	pipe_fd = pipe[0];
> -	SAFE_CLOSE(cleanup, pipe[1]);
> +	SAFE_CLOSE(pipe[1]);
>  }
>  
>  static void cleanup(void)
>  {
> -	if (file_fd > 0 && close(file_fd))
> -		tst_resm(TWARN | TERRNO, "close(file_fd) failed");
> -
> -	if (pipe_fd > 0 && close(pipe_fd))
> -		tst_resm(TWARN | TERRNO, "close(pipe_fd) failed");
> -
> -	tst_rmdir();
> +	if (file_fd > 0)
> +		SAFE_CLOSE(file_fd);
> +	if (pipe_fd > 0)
> +		SAFE_CLOSE(pipe_fd);
>  }
> +
> +static struct tst_test test = {
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = run,
> +	.mount_device = 1,
> +	.mntpoint = MNT_POINT,
> +	.all_filesystems = 1,
> +	.needs_root = 1
> +};
> -- 
> 2.38.1


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
