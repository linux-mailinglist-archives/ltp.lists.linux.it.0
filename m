Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE839A6C9
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 06:33:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25DA93C1CFE
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 06:33:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id B33513C0ECB
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 06:33:45 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D78C81A014BE
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 06:33:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,419,1559491200"; d="scan'208";a="74140488"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Aug 2019 12:33:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 04EA14CE03EB;
 Fri, 23 Aug 2019 12:33:34 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 23 Aug 2019 12:33:37 +0800
Message-ID: <5D5F6CA1.8010305@cn.fujitsu.com>
Date: Fri, 23 Aug 2019 12:33:37 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Richard Palethorpe <rpalethorpe@suse.com>
References: <20190808153825.18363-2-rpalethorpe@suse.com>
 <20190822141713.26825-1-rpalethorpe@suse.com>
 <20190822141713.26825-2-rpalethorpe@suse.com>
In-Reply-To: <20190822141713.26825-2-rpalethorpe@suse.com>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 04EA14CE03EB.AFA9A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] capability: library tests
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

on 2019/08/22 22:17, Richard Palethorpe wrote:

> diff --git a/lib/newlib_tests/tst_capability01.c b/lib/newlib_tests/tst_capability01.c
> new file mode 100644
> index 000000000..1a9cb0568
> --- /dev/null
> +++ b/lib/newlib_tests/tst_capability01.c
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2019 Richard Palethorpe<rpalethorpe@suse.com>
> + *
> + * The user or file requires CAP_NET_RAW for this test to work.
> + * e.g use "$ setcap cap_net_raw=pei tst_capability"
> + */
> +
> +#include<unistd.h>
> +#include<sys/types.h>
> +
> +#include "tst_test.h"
> +#include "tst_capability.h"
> +#include "tst_safe_net.h"
> +
> +#include "lapi/socket.h"
> +
> +static void run(void)
> +{
> +	TEST(socket(AF_INET, SOCK_RAW, 1));
> +	if (TST_RET>  -1) {
> +		tst_res(TFAIL, "Created raw socket");
                         SAFE_CLOSE(TST_RET);

> +	} else if (TST_ERR != EPERM) {
> +		tst_res(TBROK | TTERRNO,
> +			"Failed to create socket for wrong reason");
> +	} else {
> +		tst_res(TPASS | TTERRNO, "Didn't create raw socket");
> +	}
> +}
> +




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
