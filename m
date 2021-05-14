Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369538049E
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 09:49:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1C9A3C3308
	for <lists+linux-ltp@lfdr.de>; Fri, 14 May 2021 09:49:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B97F73C1AE8
 for <ltp@lists.linux.it>; Fri, 14 May 2021 09:49:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8B434601D15
 for <ltp@lists.linux.it>; Fri, 14 May 2021 09:49:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9DFB6B14B;
 Fri, 14 May 2021 07:49:31 +0000 (UTC)
Date: Fri, 14 May 2021 09:23:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJ4lYU5PC4d9Yc+0@yuki>
References: <20210513182638.5514-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513182638.5514-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lapi: Add missing IFA_FLAGS
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
> and use them in tst_netdevice.c. This fixes on older toolchains
> (e.g. sourcery-arm from Buildroot):
> 
> tst_netdevice.c: In function 'modify_address':
> tst_netdevice.c:218:44: error: 'IFA_FLAGS' undeclared (first use in this function)
>   if (!tst_rtnl_add_attr(file, lineno, ctx, IFA_FLAGS, &addr_flags,
> 
> Fixes: bc2151a65 ("lib: Add helper functions for managing network interfaces")
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  configure.ac           |  1 +
>  include/lapi/if_addr.h | 15 +++++++++++++++
>  lib/tst_netdevice.c    |  2 ++
>  3 files changed, 18 insertions(+)
>  create mode 100644 include/lapi/if_addr.h
> 
> diff --git a/configure.ac b/configure.ac
> index 136d82d09..08a56f9ef 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -51,6 +51,7 @@ AC_CHECK_HEADERS_ONCE([ \
>      linux/dccp.h \
>      linux/fs.h \
>      linux/genetlink.h \
> +    linux/if_addr.h \
>      linux/if_alg.h \
>      linux/if_ether.h \
>      linux/if_packet.h \
> diff --git a/include/lapi/if_addr.h b/include/lapi/if_addr.h
> new file mode 100644
> index 000000000..c1acfe4fb
> --- /dev/null
> +++ b/include/lapi/if_addr.h
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com> */
> +
> +#ifndef LAPI_IF_ADDR_H__
> +# define LAPI_IF_ADDR_H__
> +
> +# ifdef HAVE_LINUX_IF_ADDR_H
> +#  include <linux/if_addr.h>

This file is usually included from the rtnetlink.h, shouldn't we rather
add lapi/rtnetlink.h that would include linux/rtnetlink.h and simply
adds the IFA_FLAGS definition if it's missing?

> +# endif
> +
> +#ifndef IFA_FLAGS
> +# define IFA_FLAGS 8
> +#endif
> +
> +#endif	/* LAPI_IF_ADDR_H__ */
> diff --git a/lib/tst_netdevice.c b/lib/tst_netdevice.c
> index 5ca523759..a95f19d35 100644
> --- a/lib/tst_netdevice.c
> +++ b/lib/tst_netdevice.c
> @@ -9,6 +9,8 @@
>  #include <linux/veth.h>
>  #include <sys/socket.h>
>  #include <net/if.h>
> +#include "lapi/if_addr.h"
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
