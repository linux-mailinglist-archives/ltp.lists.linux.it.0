Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E8728E237
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 16:32:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 374033C5816
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 16:32:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 15F373C268D
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 16:32:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 998431001374
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 16:32:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E195DB160;
 Wed, 14 Oct 2020 14:32:50 +0000 (UTC)
Date: Wed, 14 Oct 2020 16:33:17 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20201014143317.GC13224@yuki.lan>
References: <20201001231256.6930-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001231256.6930-1-petr.vorel@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] lapi: Add sysinfo.h to fix build with
 MUSL libc
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
> The reason is to avoid indirect <linux/sysinfo.h> include when using
> some UAPI headers: <linux/netlink.h> or others -> <linux/kernel.h>
> -> <linux/sysinfo.h>
> 
> This indirect include causes on MUSL redefinition of struct sysinfo when
> included both <sys/sysinfo.h> and some of UAPI headers:
> 
> In file included from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:5,
>                  from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:5,
>                  from ../include/tst_netlink.h:14,
>                  from tst_crypto.c:13:
> x86_64-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:8:8: error: redefinition of ???struct sysinfo???
>  struct sysinfo {
>         ^~~~~~~
> In file included from ../include/tst_safe_macros.h:15,
>                  from ../include/tst_test.h:93,
>                  from tst_crypto.c:11:
> x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> another MUSL specific workaround. I'm ok if we don't want to accept it.
> 
> I also sent patch to kernel, but don't think it will be accepted.
> 
> https://lore.kernel.org/linux-api/20201001211942.13336-1-petr.vorel@gmail.com/T/#me9d7d385157ec5f6288bae77d738a96c12ab8ca7
> 
> Kind regards,
> Petr
> 
>  include/lapi/sysinfo.h                        | 22 +++++++++++++++++++
>  include/tst_safe_macros.h                     |  2 +-
>  lib/safe_macros.c                             |  2 +-
>  lib/tst_memutils.c                            |  2 +-
>  testcases/kernel/mem/mtest01/mtest01.c        |  2 +-
>  testcases/kernel/syscalls/madvise/madvise06.c |  2 +-
>  testcases/kernel/syscalls/sysinfo/sysinfo01.c |  2 +-
>  testcases/kernel/syscalls/sysinfo/sysinfo02.c |  2 +-
>  testcases/kernel/syscalls/sysinfo/sysinfo03.c |  2 +-
>  9 files changed, 30 insertions(+), 8 deletions(-)
>  create mode 100644 include/lapi/sysinfo.h
> 
> diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
> new file mode 100644
> index 000000000..d0e0e93d7
> --- /dev/null
> +++ b/include/lapi/sysinfo.h
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
> + */
> +
> +#ifndef SYSINFO_H__
> +
> +/*
> + * Don't use <sys/sysinfo.h> as it breaks build MUSL toolchain.
> + * Use <linux/sysinfo.h> instead.
> + *
> + * Some kernel UAPI headers do indirect <linux/sysinfo.h> include:
> + * <linux/netlink.h> or others -> <linux/kernel.h> -> <linux/sysinfo.h>
> + *
> + * This indirect include causes on MUSL redefinition of struct sysinfo when
> + * included both <sys/sysinfo.h> and some of UAPI headers:
> + */
> +#include <linux/sysinfo.h>
> +
> +#define SYSINFO_H__
> +
> +#endif /* SYSINFO_H__ */

Well the #define SYSINFO_H__ usually goes right after the #ifndef on the
top.

Apart from that it looks like the kernel patch has been ignored. I guess
that you should try to push it a bit more before we give up and apply
workarounds...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
