Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90915A511
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 10:42:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49D2B3C25E9
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 10:42:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 548DD3C1379
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 10:42:31 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D60C46015B4
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 10:42:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83204852"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 17:42:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 3505C50A9980
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 17:32:50 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 17:42:19 +0800
Message-ID: <5E43C87B.60800@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 17:42:19 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <5E438D72.4020203@cn.fujitsu.com>
 <1581492715-15110-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1581492715-15110-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3505C50A9980.A89E9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] aio02: Drop O_DIRECT flag for tmpfs
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

On 2020/2/12 15:31, Yang Xu wrote:
> tmpfs doesn't support O_DIRECT flag, drop it. userer still can run aio02
> with different filesystem by mounting specified filesystem on $TMPDIR.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  testcases/kernel/io/aio/aio02.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/io/aio/aio02.c b/testcases/kernel/io/aio/aio02.c
> index e283afba9..3bb89c45f 100644
> --- a/testcases/kernel/io/aio/aio02.c
> +++ b/testcases/kernel/io/aio/aio02.c
> @@ -18,7 +18,8 @@
>  #define AIO_MAXIO 32
>  #define AIO_BLKSIZE (64*1024)
>  
> -static int wait_count = 0;
> +static int wait_count;
Hi,

Why do you set wait_count to 0?
Isn't it default behavior?

> +static unsigned int use_tmpfs;
>  
>  #define DESC_FLAGS_OPR(x, y) .desc = (x == IO_CMD_PWRITE ? "WRITE: " #y: "READ : " #y), \
>  	.flags = y, .operation = x
> @@ -206,6 +207,11 @@ static void test_io(unsigned int n)
>  	int status;
>  	struct testcase *tc = testcases + n;
>  
> +	if (use_tmpfs && (tc->flags & O_DIRECT)) {
> +		tst_res(TINFO, "Drop O_DIRECT flag for tmpfs");
> +		tc->flags &= (~O_DIRECT);
> +	}
> +
>  	status = io_tio("file", tc->flags, tc->operation);
>  	if (status)
>  		tst_res(TFAIL, "%s, status = %d", tc->desc, status);
> @@ -213,7 +219,14 @@ static void test_io(unsigned int n)
>  		tst_res(TPASS, "%s", tc->desc);
>  }
>  
> +static void setup(void)
> +{
> +	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
> +		use_tmpfs = 1;

Could you simple the fix by moving 'tst_fs_type(".") == TST_TMPFS_MAGIC
' into test_io().
(i.e. Drop unused setup() and use_tmpfs.)

Thanks,
Xiao Yang
> +}
> +
>  static struct tst_test test = {
> +	.setup = setup,
>  	.needs_tmpdir = 1,
>  	.test = test_io,
>  	.tcnt = ARRAY_SIZE(testcases),




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
