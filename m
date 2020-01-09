Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9FC135641
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:52:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05FB13C24AF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:52:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3ACAA3C2459
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:52:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B36C91000A28
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:52:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39870C21D;
 Thu,  9 Jan 2020 09:52:40 +0000 (UTC)
Date: Thu, 9 Jan 2020 10:52:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200109095239.GB31981@rei.lan>
References: <20200109071510.11223-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109071510.11223-1-liwang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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
> +#define _GNU_SOURCE
>  #include <unistd.h>
> +#include <sys/syscall.h>

Defining _GNU_SOURCE anywhere but at the top of the test source is
meaningless. It has to be defined before we include any libc headers
otherwise it's ignored.

>  struct tst_device {
>  	const char *dev;
> @@ -75,9 +77,9 @@ int tst_detach_device(const char *dev_path);
>   * simply before the tst_dev_bytes_written invocation. For easy to use,
>   * we create this inline function tst_dev_sync.
>   */
> -static inline void tst_dev_sync(int fd)
> +static inline int tst_dev_sync(int fd)
>  {
> -	syncfs(fd);
> +	return syscall(__NR_syncfs, fd);
>  }
>  
>  /*
> diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> index 2af040840..f5d7ca8ac 100644
> --- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> +++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
> @@ -20,6 +20,7 @@
>   *	None
>   */
>  
> +#define _GNU_SOURCE
>  #define _XOPEN_SOURCE 600
>  #include <fcntl.h>

Why do we need the _GNU_SOURCE here? We switched to a syscall() in the
header, hence we do not need the syncfs() prototype anymore.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
