Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCE1AD570
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 07:01:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C98993C2A94
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Apr 2020 07:01:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A3CD03C2A8B
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 07:01:03 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 844C560022B
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 07:01:01 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,393,1580745600"; d="scan'208";a="89186922"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Apr 2020 13:00:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5603850A996E
 for <ltp@lists.linux.it>; Fri, 17 Apr 2020 12:50:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 17 Apr 2020 13:00:56 +0800
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20200415080854.65971-1-yangx.jy@cn.fujitsu.com>
 <20200415080854.65971-2-yangx.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <aaaec198-27b7-8e41-bff7-7636965fa0b2@cn.fujitsu.com>
Date: Fri, 17 Apr 2020 13:00:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200415080854.65971-2-yangx.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5603850A996E.ABC53
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/quotactl04.c: Specify inode size for
 prjquota feature
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

Hi Xiao

Acked.
> Background:
> 1) LTP uses default 256M filesystem to run test.
> 2) Mke2fs sets inode size to 128 bytes for small filesystem(e.g. 256M) usually.
> 3) Prjquota feature requires bigger inode size which is at least 256 bytes.
> 
> new mke2fs can adjust inode size to 256M automatically by commit 66aae96 in
> e2fsprogs, but old mke2fs cannot do it and reports the following error:
> -----------------------------------------------------------
> mke2fs 1.43.4 (31-Jan-2017)
> mkfs.ext4: 128 byte inodes are too small for project quota; specify larger size
> -----------------------------------------------------------
> 
> Make quotactl04 with old mke2fs works by specifying inode size to 256 bytes.
> 
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/quotactl/quotactl04.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/quotactl/quotactl04.c b/testcases/kernel/syscalls/quotactl/quotactl04.c
> index b0db8fe5d..73980d7e9 100644
> --- a/testcases/kernel/syscalls/quotactl/quotactl04.c
> +++ b/testcases/kernel/syscalls/quotactl/quotactl04.c
> @@ -102,7 +102,7 @@ static struct tcase {
>   
>   static void setup(void)
>   {
> -	const char *const fs_opts[] = {"-O quota,project", NULL};
> +	const char *const fs_opts[] = {"-I 256", "-O quota,project", NULL};
>   
>   	test_id = geteuid();
>   	SAFE_MKFS(tst_device->dev, tst_device->fs_type, fs_opts, NULL);
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
