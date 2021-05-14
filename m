Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E07A3804E8
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 10:12:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D3FF3C3309
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 10:12:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE7AC3C2306
 for <ltp@lists.linux.it>; Fri, 14 May 2021 10:12:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 28BE9601068
 for <ltp@lists.linux.it>; Fri, 14 May 2021 10:12:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99CCFAFAB;
 Fri, 14 May 2021 08:12:11 +0000 (UTC)
Date: Fri, 14 May 2021 09:45:53 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJ4qsVYYYfW3lldj@yuki>
References: <20210514080630.11273-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210514080630.11273-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lapi: Add missing IFA_FLAGS
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
>  configure.ac             |  1 +
>  include/lapi/rtnetlink.h | 17 +++++++++++++++++
>  lib/tst_netdevice.c      |  3 ++-
>  3 files changed, 20 insertions(+), 1 deletion(-)
>  create mode 100644 include/lapi/rtnetlink.h
> 
> diff --git a/configure.ac b/configure.ac
> index 136d82d09..95c6d2e72 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -59,6 +59,7 @@ AC_CHECK_HEADERS_ONCE([ \
>      linux/mempolicy.h \
>      linux/module.h \
>      linux/netlink.h \
> +    linux/rtnetlink.h \

I wonder if this is really needed, if that header is not present we will
have to add much more stuff to lapi/rtnetlink.h, so I would just avoid
configure check here.

>      linux/seccomp.h \
>      linux/securebits.h \
>      linux/tty.h \
> diff --git a/include/lapi/rtnetlink.h b/include/lapi/rtnetlink.h
> new file mode 100644
> index 000000000..d1dc53df8
> --- /dev/null
> +++ b/include/lapi/rtnetlink.h
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
> +
> +#ifndef LAPI_IF_ADDR_H__
> +# define LAPI_IF_ADDR_H__
> +
> +#include "config.h"
> +
> +#ifdef HAVE_LINUX_RTNETLINK_H
> +# include <linux/rtnetlink.h>
> +#endif
> +
> +#ifndef IFA_FLAGS
> +# define IFA_FLAGS 8
> +#endif
> +
> +#endif	/* LAPI_IF_ADDR_H__ */
> diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
> index 5ca523759..d098173d5 100644
> --- a/lib/tst_netdevice.c
> +++ b/lib/tst_netdevice.c
> @@ -5,10 +5,11 @@
>  
>  #include <asm/types.h>
>  #include <linux/netlink.h>
> -#include <linux/rtnetlink.h>
>  #include <linux/veth.h>
>  #include <sys/socket.h>
>  #include <net/if.h>
> +#include "lapi/rtnetlink.h"
> +
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
>  #include "tst_rtnetlink.h"
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
