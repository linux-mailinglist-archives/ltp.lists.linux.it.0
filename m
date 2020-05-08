Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3651CA555
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:40:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF9983C25F7
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:40:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 73BBE3C25D6
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:40:23 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C92071001599
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:40:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,366,1583164800"; d="scan'208";a="91681172"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 May 2020 15:40:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 7425F4BCC89F
 for <ltp@lists.linux.it>; Fri,  8 May 2020 15:40:13 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 May 2020 15:40:13 +0800
Message-ID: <5EB50CDB.5060909@cn.fujitsu.com>
Date: Fri, 8 May 2020 15:40:11 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1588916828-4228-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1588916828-4228-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 7425F4BCC89F.ABC5B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop01: Add linux git tag
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

Hi Xu,

The commit actually fixes the failure of ioctl_loop01 so I will apply it 
shortly.
Acked-by: Xiao Yang <yangx.jy@cn.fujitsu.com>

Thanks,
Xiao Yang
On 2020/5/8 13:47, Yang Xu wrote:
> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/ioctl/ioctl_loop01.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> index faef22e47..2d9733f95 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> @@ -12,6 +12,9 @@
>    * For LO_FLAGS_PARTSCAN flag, it is the same as LO_FLAGS_AUTOCLEAR flag.
>    * But we also check whether we can scan partition table correctly ie check
>    * whether /dev/loopnp1 and /sys/bloclk/loop0/loop0p1 existed.
> + *
> + * It is also a regression test for kernel
> + * commit 10c70d95c0f2 ("block: remove the bd_openers checks in blk_drop_partitions").
>    */
>
>   #include<stdio.h>
> @@ -137,5 +140,9 @@ static struct tst_test test = {
>   		"loop",
>   		NULL
>   	},
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "10c70d95c0f2"},
> +		{}
> +	},
>   	.needs_tmpdir = 1,
>   };




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
