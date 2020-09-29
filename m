Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031527BE3F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 09:41:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 068EE3C4C90
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 09:41:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 13CAC3C2985
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 09:41:43 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A2E84600ACA
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 09:41:41 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,317,1596470400"; d="scan'208";a="99706279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 15:41:33 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A1C3148990F6;
 Tue, 29 Sep 2020 15:41:32 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 15:41:31 +0800
Message-ID: <5F72E52E.40609@cn.fujitsu.com>
Date: Tue, 29 Sep 2020 15:41:34 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200929073501.4598-1-pvorel@suse.cz>
In-Reply-To: <20200929073501.4598-1-pvorel@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A1C3148990F6.A9F37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] io_destroy01: TCONF when unsupported
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

Hi Petr
Why not using kconfig in tst_test struct.

Best Regards
Yang Xu
> to fix test on kernel built without CONFIG_AIO=y.
>
> Cleanup: use return instead of else, join string.
>
> Signed-off-by: Petr Vorel<pvorel@suse.cz>
> ---
> Hi,
>
> simple patch, but can wait after release.
> I can move cleanup into separate commit.
>
> Kind regards,
> Petr
>
>   testcases/kernel/syscalls/io_destroy/io_destroy01.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/io_destroy/io_destroy01.c b/testcases/kernel/syscalls/io_destroy/io_destroy01.c
> index 560d7b3fb..5c5c59335 100644
> --- a/testcases/kernel/syscalls/io_destroy/io_destroy01.c
> +++ b/testcases/kernel/syscalls/io_destroy/io_destroy01.c
> @@ -32,14 +32,19 @@ static void verify_io_destroy(void)
>   		return;
>   	}
>
> +	if (TST_RET == -ENOSYS) {
> +		tst_res(TCONF, "io_destroy() not supported");
> +		return;
> +	}
> +
>   	if (TST_RET == -EINVAL) {
>   		tst_res(TPASS,
>   			"io_destroy() failed as expected, returned -EINVAL");
> -	} else {
> -		tst_res(TFAIL, "io_destroy() failed unexpectedly, "
> -			"returned -%s expected -EINVAL",
> -			tst_strerrno(-TST_RET));
> +		return;
>   	}
> +
> +	tst_res(TFAIL, "io_destroy() failed unexpectedly, returned -%s expected -EINVAL",
> +		tst_strerrno(-TST_RET));
>   }
>
>   static struct tst_test test = {




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
