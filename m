Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0F2DB8C8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 03:10:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F04A83C5A0C
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 03:10:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E05573C4AE8
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 03:10:41 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B289B1400DA5
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 03:10:40 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,423,1599494400"; d="scan'208";a="102438555"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Dec 2020 10:10:36 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6FFA64CE6009;
 Wed, 16 Dec 2020 10:10:30 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 16 Dec 2020 10:10:29 +0800
Message-ID: <5FD96C97.6020602@cn.fujitsu.com>
Date: Wed, 16 Dec 2020 10:10:31 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Radoslav Kolev <radoslav.kolev@suse.com>
References: <20201215155650.6496-1-radoslav.kolev@suse.com>
In-Reply-To: <20201215155650.6496-1-radoslav.kolev@suse.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6FFA64CE6009.AD1BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05.c: skip test on overlay
 filesystem
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
Cc: Radoslav Kolev via ltp <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Radoslav
> The undelrying device can't be properly detected and causes failure
> when running in an overlay filesystem.

I guess the best way is to change tst_find_backing_dev api, so it can 
detect the correct underlying device.

>
> Signed-off-by: Radoslav Kolev<radoslav.kolev@suse.com>
> ---
>   testcases/kernel/syscalls/ioctl/ioctl_loop05.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> index e3c14faab..f8fa413a9 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
> @@ -101,6 +101,9 @@ static void setup(void)
>   	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>   		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag");
>
> +	if (tst_fs_type(".") == TST_OVERLAYFS_MAGIC)
> +		tst_brk(TCONF, "device isn't properly detected in overlay fs");
> +
>   	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
>   	if (dev_num<  0)
>   		tst_brk(TBROK, "Failed to find free loop device");




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
