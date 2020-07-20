Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0B225AB0
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 11:02:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5A8B33C4E10
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 11:02:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 07B993C13E1
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 11:02:50 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A631D2009F4
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 11:02:49 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,374,1589212800"; d="scan'208";a="96612740"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Jul 2020 17:02:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A58CA4CE1505;
 Mon, 20 Jul 2020 17:02:43 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 20 Jul 2020 17:02:45 +0800
Message-ID: <5F155DB2.8080709@cn.fujitsu.com>
Date: Mon, 20 Jul 2020 17:02:42 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
 <20200710172044.21592-7-pvorel@suse.cz>
In-Reply-To: <20200710172044.21592-7-pvorel@suse.cz>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A58CA4CE1505.AC7F8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 6/7] net/test: Add basic testing for
 tst_rhost_run
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

On 2020/7/11 1:20, Petr Vorel wrote:
> Regression test for use of nested single quotes
> (fixed in previous commit).
>
> Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  lib/newlib_tests/shell/net/tst_rhost_run.sh | 25 +++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100755 lib/newlib_tests/shell/net/tst_rhost_run.sh
>
> diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> new file mode 100755
> index 000000000..4c034a4ac
> --- /dev/null
> +++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> +
> +TST_TESTFUNC=do_test
> +PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
> +. tst_net.sh
> +
> +do_test()
> +{
> +	local file="/etc/fstab"
> +
> +	tst_rhost_run -c 'which grep > /dev/null' || \
> +		tst_res TCONF "grep not found on rhost"
Hi Petr,

1) Do you want to discard stderr as well? For example:
-------------------------------------------------
# which gre >/dev/null
/usr/bin/which: no gre in
(/opt/ltp/testcases/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/root/bin)
-------------------------------------------------
2) Is it necessary to continue if grep command is not found on rhost?
How about calling tst_brk?

> +
> +	tst_rhost_run -c "[ -f $file ]" || \
> +		tst_res TCONF "$file not found on rhost"
Call tst_brk as well?

Thanks,
Xiao Yang
> +
> +	tst_rhost_run -s -c "grep -q \"[^ ]\" $file"
> +	tst_rhost_run -s -c "grep -q '[^ ]' $file"
> +
> +	tst_res TPASS "tst_rhost_run is working"
> +}
> +
> +tst_run




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
