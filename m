Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20645325CCA
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 05:59:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC2123C5A3F
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Feb 2021 05:59:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 383563C0F06
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 05:59:42 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4AD82600715
 for <ltp@lists.linux.it>; Fri, 26 Feb 2021 05:59:40 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,207,1610380800"; d="scan'208";a="104893474"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Feb 2021 12:59:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 620414CE76FC;
 Fri, 26 Feb 2021 12:59:37 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Feb 2021 12:59:33 +0800
Message-ID: <60388032.7010600@cn.fujitsu.com>
Date: Fri, 26 Feb 2021 12:59:30 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Zhao Gongyi <zhaogongyi@huawei.com>
References: <20210226040057.184076-1-zhaogongyi@huawei.com>
In-Reply-To: <20210226040057.184076-1-zhaogongyi@huawei.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 620414CE76FC.A947C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl: Remove requirement of loop driver
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

On 2021/2/26 12:00, Zhao Gongyi wrote:
> There is no loop driver when config CONFIG_BLK_DEV_LOOP is set to y, and
> we have check the loop device in tst_find_free_loopdev. So we can remove
> the requirement of loop driver.
Hi Zhongyi,

1) I think .needs_driver can parse either CONFIG_BLK_DEV_LOOP=y or 
CONFIG_BLK_DEV_LOOP=m correctly.
     Do you have any issue that .needs_driver cannot parse 
CONFIG_BLK_DEV_LOOP=y correctly?
2) If CONFIG_BLK_DEV_LOOP is not set, we would like to report TCONF by 
.needs_driver rather than TBROK by tst_find_free_loopdev().

Best Regards,
Xiao Yang
> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> ---
>   testcases/kernel/syscalls/ioctl/ioctl_loop01.c | 4 ----
>   testcases/kernel/syscalls/ioctl/ioctl_loop02.c | 4 ----
>   testcases/kernel/syscalls/ioctl/ioctl_loop03.c | 4 ----
>   testcases/kernel/syscalls/ioctl/ioctl_loop04.c | 4 ----
>   testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 4 ----
>   testcases/kernel/syscalls/ioctl/ioctl_loop06.c | 4 ----
>   testcases/kernel/syscalls/ioctl/ioctl_loop07.c | 4 ----
>   7 files changed, 28 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> index cf71184b4..27713847d 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop01.c
> @@ -142,10 +142,6 @@ static struct tst_test test = {
>   	.cleanup = cleanup,
>   	.test_all = verify_ioctl_loop,
>   	.needs_root = 1,
> -	.needs_drivers = (const char *const []) {
> -		"loop",
> -		NULL
> -	},
>   	.tags = (const struct tst_tag[]) {
>   		{"linux-git", "10c70d95c0f2"},
>   		{"linux-git", "6ac92fb5cdff"},
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
> index ac6184216..538b64e00 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop02.c
> @@ -157,8 +157,4 @@ static struct tst_test test = {
>   	.test = verify_ioctl_loop,
>   	.needs_root = 1,
>   	.needs_tmpdir = 1,
> -	.needs_drivers = (const char *const []) {
> -		"loop",
> -		NULL
> -	}
>   };
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop03.c b/testcases/kernel/syscalls/ioctl/ioctl_loop03.c
> index 9cf5a41fa..ee3748178 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop03.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop03.c
> @@ -68,8 +68,4 @@ static struct tst_test test = {
>   	.test_all = verify_ioctl_loop,
>   	.needs_root = 1,
>   	.needs_tmpdir = 1,
> -	.needs_drivers = (const char *const []) {
> -		"loop",
> -		NULL
> -	}
>   };
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
> index b4ab44a74..615247aec 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop04.c
> @@ -91,8 +91,4 @@ static struct tst_test test = {
>   	.test_all = verify_ioctl_loop,
>   	.needs_root = 1,
>   	.needs_tmpdir = 1,
> -	.needs_drivers = (const char *const []) {
> -		"loop",
> -		NULL
> -	}
>   };
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> index f8fa413a9..ec88d6039 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> @@ -151,8 +151,4 @@ static struct tst_test test = {
>   	.test_all = verify_ioctl_loop,
>   	.needs_root = 1,
>   	.needs_tmpdir = 1,
> -	.needs_drivers = (const char *const []) {
> -		"loop",
> -		NULL
> -	}
>   };
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
> index bd0d289ca..969b98c41 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
> @@ -136,8 +136,4 @@ static struct tst_test test = {
>   	.tcnt = ARRAY_SIZE(tcases),
>   	.needs_root = 1,
>   	.needs_tmpdir = 1,
> -	.needs_drivers = (const char *const []) {
> -		"loop",
> -		NULL
> -	}
>   };
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop07.c b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
> index efe48962e..5e1b38866 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop07.c
> @@ -158,8 +158,4 @@ static struct tst_test test = {
>   		{"linux-git", "79e5dc59e297"},
>   		{}
>   	},
> -	.needs_drivers = (const char *const []) {
> -		"loop",
> -		NULL
> -	}
>   };
> --
> 2.17.1
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
