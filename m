Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4072A1BEEC7
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 05:58:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96DB43C5ED5
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Apr 2020 05:58:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 999113C28F0
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 05:58:30 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C3CB81000A4F
 for <ltp@lists.linux.it>; Thu, 30 Apr 2020 05:58:24 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,333,1583164800"; d="scan'208";a="90802450"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2020 11:58:21 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 67CEC50A996E;
 Thu, 30 Apr 2020 11:58:18 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Apr 2020 11:58:18 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200429141411.9051-1-chrubis@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <643ba523-3421-fa27-cdc9-9c64e60647c3@cn.fujitsu.com>
Date: Thu, 30 Apr 2020 11:58:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200429141411.9051-1-chrubis@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 67CEC50A996E.A0B04
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Do not fail on success
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

Hi Cyril


> The code in __loop_update_dio() uses inode->i_sb->s_bdev to get the
> logical block size for the backing file for the loop device. If that
> pointer is NULL, which happens to be the case for Btrfs, the checks for
> alignment and block size are ignored and direct I/O can be turned on
> regardless of the offset and logical block size.Since kernel comment "the above condition may be loosed in the future, 
and direct I/O may be switched runtime at that time because most
of requests in sane applications should be PAGE_SIZE aligned". I think 
pass is ok, also print filesystem let user know this fs igores this 
align is better.

   loopinfo.lo_offset = 0;
   TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), 
TST_RETVAL_EQ0);

These should be moved to the beginning of test function.

Best Regards
Yang Xu
> 
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> index 3a028ba2c..d26fa61bf 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> @@ -71,7 +71,7 @@ static void verify_ioctl_loop(void)
>   
>   	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
>   	if (TST_RET == 0) {
> -		tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
> +		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
>   		SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
>   		return;
>   	}
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
