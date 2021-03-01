Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E01433275ED
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 02:48:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9EA2E3C577D
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 02:48:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EED003C3352
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 02:48:55 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 7924E600668
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 02:48:53 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,214,1610380800"; d="scan'208";a="104961691"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 01 Mar 2021 09:48:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 870614CE72EE;
 Mon,  1 Mar 2021 09:48:44 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 1 Mar 2021 09:48:36 +0800
Message-ID: <603C4803.5090909@cn.fujitsu.com>
Date: Mon, 1 Mar 2021 09:48:51 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Zhao Gongyi <zhaogongyi@huawei.com>
References: <20210227033230.175881-1-zhaogongyi@huawei.com>
In-Reply-To: <20210227033230.175881-1-zhaogongyi@huawei.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 870614CE72EE.AC0BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fanotify13.c/setxattr01.c: Remove requirement of
 needs_tmpdir
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

Hi gongyi
> The testcases aim to run on all_filesystems, so we need remove the
> requirement of needs_tmpdir.
>
This commit message is confusing. See commit dae8427740f(" Remove 
duplicated ".needs_tmpdir=1" when using equivalent flags").

The needs_tmpdir flag is not needed to be set when use these flags:
'.all_filesystems', '.format_device', '.mntpoint', '.mount_device'
'.needs_checkpoints', '.needs_device', '.resource_file'.
  These flags imply creating temporary directory.

Does have other case still have this duplicated flag?

> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> ---
>   testcases/kernel/syscalls/fanotify/fanotify13.c | 1 -
>   testcases/kernel/syscalls/setxattr/setxattr01.c | 1 -
>   2 files changed, 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
> index 6d812cdd1..1fb12ae68 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify13.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
> @@ -289,7 +289,6 @@ static struct tst_test test = {
>   	.setup = do_setup,
>   	.cleanup = do_cleanup,
>   	.needs_root = 1,
> -	.needs_tmpdir = 1,
>   	.mount_device = 1,
>   	.mntpoint = MOUNT_PATH,
>   	.all_filesystems = 1,
> diff --git a/testcases/kernel/syscalls/setxattr/setxattr01.c b/testcases/kernel/syscalls/setxattr/setxattr01.c
> index 8b84dfe0d..8cd2821d0 100644
> --- a/testcases/kernel/syscalls/setxattr/setxattr01.c
> +++ b/testcases/kernel/syscalls/setxattr/setxattr01.c
> @@ -210,7 +210,6 @@ static struct tst_test test = {
>   	.mntpoint = MNTPOINT,
>   	.mount_device = 1,
>   	.all_filesystems = 1,
> -	.needs_tmpdir = 1,
>   	.needs_root = 1,
>   };
>
> --
> 2.17.1
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
