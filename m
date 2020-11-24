Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42B2C2B2D
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 16:23:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 877543C4E6E
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 16:23:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 36B833C2D0F
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 16:23:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A48B7600C2F
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 16:23:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D1BFAF39;
 Tue, 24 Nov 2020 15:23:55 +0000 (UTC)
Date: Tue, 24 Nov 2020 16:24:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20201124152446.GC12878@yuki.lan>
References: <79f282b7796b4b4bcf6936483bb819105e941f77.1606196558.git.viresh.kumar@linaro.org>
 <d4c771f2a43034af28a8b05ee8eb560bcf07713f.1606196558.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4c771f2a43034af28a8b05ee8eb560bcf07713f.1606196558.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 UPPERCASE_50_75 autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 2/2] syscalls: Add tests for open_by_handle_at()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +#define _GNU_SOURCE
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +#include "lapi/name_to_handle_at.h"
> +
> +#define TEST_FILE "test_file"
> +#define TEST_DIR "test_dir"
> +
> +static int dir_fd, fd_atcwd = AT_FDCWD, file_fd;
> +static struct file_handle *fhp;
> +
> +static struct tcase {
> +	int *dfd;
> +	const char *pathname;
> +	int name_flags;
> +	int flags;
> +} tcases[] = {
> +	{&dir_fd, TEST_FILE, 0, O_RDWR},
> +	{&dir_fd, TEST_FILE, 0, O_RDONLY},
> +	{&dir_fd, TEST_FILE, 0, O_WRONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&dir_fd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&dir_fd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&dir_fd, "", AT_EMPTY_PATH, O_RDONLY},
> +	{&file_fd, "", AT_EMPTY_PATH, O_RDONLY},
> +
> +	{&fd_atcwd, TEST_FILE, 0, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, 0, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, 0, O_WRONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH, O_WRONLY},
> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDWR},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_RDONLY},
> +	{&fd_atcwd, TEST_FILE, AT_EMPTY_PATH | AT_SYMLINK_FOLLOW, O_WRONLY},
> +	{&fd_atcwd, "", AT_EMPTY_PATH, O_RDONLY},
> +};

I guess that we can do better than exact copy of the
name_to_handle_at01.c.

We can as well create two handles in the test setup one for directory
and one for file and then loop over different flags for
open_by_handle_at() instead of getting the handle in each run()
iteration.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
