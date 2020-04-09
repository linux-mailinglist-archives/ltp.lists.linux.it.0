Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC241A32D1
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:51:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 824FC3C2CCF
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 12:51:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E19B43C2CC6
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:51:01 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 1744C6012A0
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 12:50:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,362,1580745600"; d="scan'208";a="88749216"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 18:50:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B4C37406AB15
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 18:40:30 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 18:50:55 +0800
To: <ltp@lists.linux.it>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <e0ebbfe0-a264-a969-ecfa-0db2ab9a41c3@cn.fujitsu.com>
Date: Thu, 9 Apr 2020 18:50:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B4C37406AB15.AC337
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 01/10] lapi/loop.h: Add fallback for loop ioctl
 and flag
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi All

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   include/lapi/loop.h | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 include/lapi/loop.h
> 
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
Sorry, this should be removed.
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
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
