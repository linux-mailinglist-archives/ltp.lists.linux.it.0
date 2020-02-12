Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1B15A0A3
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:30:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67C643C25DD
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 06:30:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 25A703C1CF5
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:30:36 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id D28421A01172
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 06:30:33 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83187621"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 13:30:31 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 132BA406AB15
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 13:20:57 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 13:30:26 +0800
Message-ID: <5E438D72.4020203@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 13:30:26 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1581484093-13127-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1581484093-13127-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 132BA406AB15.AC467
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] aio02: Use mounted filesystem instead of temp
 directory
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

On 2020/2/12 13:08, Yang Xu wrote:
> tmpfs doesn't support O_DIRECT flag, open file with this flag on
> tmpfs will report EINVAL error. I thin we should test this case on
> ext2 filesystem instead of temp directory.
Hi Xu,

Thanks for your quick fix. :-)

I don't want to use the fixed file system to run aio02.
I perfer to just drop O_DIRECT flag for tmpfs, as below:
1) Drop O_DIRECT flag for tmpfs.
2) Keep O_DIRECT flag for other filesystem.
In this case, user still can run aio02 with different filesystem by 
mounting specified filesystem on $TMPDIR.

Best Regards,
Xiao Yang
> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/io/aio/aio02.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/io/aio/aio02.c b/testcases/kernel/io/aio/aio02.c
> index e283afba9..205d1b088 100644
> --- a/testcases/kernel/io/aio/aio02.c
> +++ b/testcases/kernel/io/aio/aio02.c
> @@ -17,7 +17,8 @@
>
>   #define AIO_MAXIO 32
>   #define AIO_BLKSIZE (64*1024)
> -
> +#define MNTPOINT   "mnt_point"
> +#define FILE_TEST MNTPOINT"/file"
>   static int wait_count = 0;
>
>   #define DESC_FLAGS_OPR(x, y) .desc = (x == IO_CMD_PWRITE ? "WRITE: " #y: "READ : " #y), \
> @@ -206,7 +207,7 @@ static void test_io(unsigned int n)
>   	int status;
>   	struct testcase *tc = testcases + n;
>
> -	status = io_tio("file", tc->flags, tc->operation);
> +	status = io_tio(FILE_TEST, tc->flags, tc->operation);
>   	if (status)
>   		tst_res(TFAIL, "%s, status = %d", tc->desc, status);
>   	else
> @@ -214,7 +215,9 @@ static void test_io(unsigned int n)
>   }
>
>   static struct tst_test test = {
> -	.needs_tmpdir = 1,
> +	.mount_device = 1,
> +	.mntpoint = MNTPOINT,
> +	.needs_root = 1,
>   	.test = test_io,
>   	.tcnt = ARRAY_SIZE(testcases),
>   };




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
