Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D785D62F4
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 14:50:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C4DE3C235D
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 14:50:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2BA473C1CB8
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 14:50:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 54D77600AA3
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 14:50:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89008B416;
 Mon, 14 Oct 2019 12:50:16 +0000 (UTC)
Date: Mon, 14 Oct 2019 14:50:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191014125015.GA25950@rei.lan>
References: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mlock_8-1,
 munlock_10-1: don't use LONG_MAX as invalid pointer
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
> arm64 kernel with commit 057d3389108e ("mm: untag user pointers passed to
> memory syscalls") will assume this is tagged user pointer and will
> attempt to clear first byte. This leads to test hitting different error
> (EINVAL instead of ENOMEM).
> 
> Add a helper function which provides invalid/unused pointer from user
> address space.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  .../conformance/interfaces/mlock/8-1.c             | 11 ++--------
>  .../conformance/interfaces/munlock/10-1.c          | 11 ++--------
>  .../open_posix_testsuite/include/invalid_helpers.h | 25 ++++++++++++++++++++++
>  3 files changed, 29 insertions(+), 18 deletions(-)
>  create mode 100644 testcases/open_posix_testsuite/include/invalid_helpers.h
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
> index d9569008b82b..5883ff8ec162 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/mlock/8-1.c
> @@ -20,22 +20,15 @@
>  #include <errno.h>
>  #include <limits.h>
>  #include "posixtest.h"
> +#include "invalid_helpers.h"
>  
>  #define BUFSIZE 8
>  
>  int main(void)
>  {
>  	int result;
> -	long page_size;
> -	void *page_ptr;
> +	void *page_ptr = get_invalid_ptr();
>  
> -	page_size = sysconf(_SC_PAGESIZE);
> -	if (errno) {
> -		perror("An error occurs when calling sysconf()");
> -		return PTS_UNRESOLVED;
> -	}
> -
> -	page_ptr = (void *)(LONG_MAX - (LONG_MAX % page_size));
>  	result = mlock(page_ptr, BUFSIZE);
>  
>  	if (result == -1 && errno == ENOMEM) {
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
> index cf870289b512..1bc3d8015808 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/munlock/10-1.c
> @@ -20,22 +20,15 @@
>  #include <errno.h>
>  #include <limits.h>
>  #include "posixtest.h"
> +#include "invalid_helpers.h"
>  
>  #define BUFSIZE 8
>  
>  int main(void)
>  {
>  	int result;
> -	long page_size;
> -	void *page_ptr;
> +	void *page_ptr = get_invalid_ptr();
>  
> -	page_size = sysconf(_SC_PAGESIZE);
> -	if (errno) {
> -		perror("An error occurs when calling sysconf()");
> -		return PTS_UNRESOLVED;
> -	}
> -
> -	page_ptr = (void *)(LONG_MAX - (LONG_MAX % page_size));
>  	result = munlock(page_ptr, BUFSIZE);
>  
>  	if (result == -1 && errno == ENOMEM) {
> diff --git a/testcases/open_posix_testsuite/include/invalid_helpers.h b/testcases/open_posix_testsuite/include/invalid_helpers.h
> new file mode 100644
> index 000000000000..7882c783abf6
> --- /dev/null
> +++ b/testcases/open_posix_testsuite/include/invalid_helpers.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (c) 2019 Linux Test Project
> + */
> +
> +#ifndef __INVALID_HELPERS_H__
> +#define __INVALID_HELPERS_H__
            ^
	    Strictly speaking the double underscores are reserved for
	    low level code i.e. libc and related code so we should avoid
	    them.

> +#include <stdlib.h>
> +#include "safe_helpers.h"
> +
> +#define DISTANT_AREA_SIZE (128*1024*1024)
> +
> +static void *get_invalid_ptr(void)
> +{
> +	int page_size;
> +	void *ptr;
> +
> +	page_size = sysconf(_SC_PAGESIZE);
> +	SAFE_PFUNC(posix_memalign(&ptr, page_size, DISTANT_AREA_SIZE));
> +	free(ptr);
> +
> +	return (char *)ptr + (DISTANT_AREA_SIZE / 2);
> +}

Maybe it's worth of a comment what is the idea behind this code here.

> +#endif
> -- 
> 1.8.3.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
