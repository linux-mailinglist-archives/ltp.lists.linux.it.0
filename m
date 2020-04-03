Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C0019D5FB
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 13:44:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0E563C2F8A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 13:44:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B4ADA3C136A
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 13:44:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3CEC46002C6
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 13:44:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 684EDAC19;
 Fri,  3 Apr 2020 11:44:04 +0000 (UTC)
Date: Fri, 3 Apr 2020 13:44:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200403114418.GB26355@yuki.lan>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585839990-19923-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 01/10] lapi: Add a configure check and fallback
 for loop ioctl and flag
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
> ---
>  configure.ac        |  1 +
>  include/lapi/loop.h | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 include/lapi/loop.h
> 
> diff --git a/configure.ac b/configure.ac
> index e1069b57e..e088cb564 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -50,6 +50,7 @@ AC_CHECK_HEADERS([ \
>      linux/if_ether.h \
>      linux/if_packet.h \
>      linux/keyctl.h \
> +    linux/loop.h \

I do wonder if there is actually a distrbution without the linux/loop.h
header, have you seen one?

>      linux/mempolicy.h \
>      linux/module.h \
>      linux/netlink.h \
> diff --git a/include/lapi/loop.h b/include/lapi/loop.h
> new file mode 100644
> index 000000000..bc6d9950d
> --- /dev/null
> +++ b/include/lapi/loop.h
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + */
> +#ifndef LAPI_LOOP_H
> +#define LAPI_LOOP_H
> +
> +#include <linux/types.h>
> +#ifdef HAVE_LINUX_LOOP_H
> +# include <linux/loop.h>
> +#endif
> +
> +#ifndef LO_FLAGS_PARTSCAN
> +# define LO_FLAGS_PARTSCAN 8
> +#endif
> +
> +#ifndef LO_FLAGS_DIRECT_IO
> +# define LO_FLAGS_DIRECT_IO 16
> +#endif
> +
> +#ifndef LOOP_SET_CAPACITY
> +# define LOOP_SET_CAPACITY 0x4C07
> +#endif
> +
> +#ifndef LOOP_SET_DIRECT_IO
> +# define LOOP_SET_DIRECT_IO 0x4C08
> +#endif
> +
> +#ifndef LOOP_SET_BLOCK_SIZE
> +# define LOOP_SET_BLOCK_SIZE 0x4C09
> +#endif
> +
> +#endif
> +
> -- 
> 2.23.0
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
