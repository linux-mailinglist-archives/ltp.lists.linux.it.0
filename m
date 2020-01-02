Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C64D12E19A
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 03:10:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E847E3C2431
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Jan 2020 03:10:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4F86C3C23B2
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 03:10:02 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id D2E1B140138D
 for <ltp@lists.linux.it>; Thu,  2 Jan 2020 03:10:00 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81223493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 10:09:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A20D44CE3B63;
 Thu,  2 Jan 2020 10:00:58 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 10:09:49 +0800
To: Li Wang <liwang@redhat.com>
References: <20200102015236.7400-1-liwang@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <b2b1b91e-4813-a281-6f56-0924d21bb103@cn.fujitsu.com>
Date: Thu, 2 Jan 2020 10:09:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200102015236.7400-1-liwang@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A20D44CE3B63.AE0CE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH COMMITTED] tst_device: do sync() before reading
 test block device stat file
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



Hi Li
> To avoid FS deferred IO metadata/cache interferes test result, so we
> do sync simply before the tst_dev_bytes_written invocation.
> 
Looks good, acked. Also, I think we can mention it in 
doc/test-writing-guidelines.txt when using this api.

Best Regards
Yang Xu
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/fdatasync/fdatasync03.c | 2 ++
>   testcases/kernel/syscalls/fsync/fsync04.c         | 2 ++
>   testcases/kernel/syscalls/sync/sync03.c           | 2 ++
>   testcases/kernel/syscalls/syncfs/syncfs01.c       | 2 ++
>   4 files changed, 8 insertions(+)
> 
> diff --git a/testcases/kernel/syscalls/fdatasync/fdatasync03.c b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
> index ee50e75c9..032ac4b58 100644
> --- a/testcases/kernel/syscalls/fdatasync/fdatasync03.c
> +++ b/testcases/kernel/syscalls/fdatasync/fdatasync03.c
> @@ -32,6 +32,8 @@ static void verify_fdatasync(void)
>   
>   	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
>   
> +	sync();
> +
>   	tst_dev_bytes_written(tst_device->dev);
>   
>   	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
> diff --git a/testcases/kernel/syscalls/fsync/fsync04.c b/testcases/kernel/syscalls/fsync/fsync04.c
> index c67fc5692..3c1f45e94 100644
> --- a/testcases/kernel/syscalls/fsync/fsync04.c
> +++ b/testcases/kernel/syscalls/fsync/fsync04.c
> @@ -32,6 +32,8 @@ static void verify_fsync(void)
>   
>   	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
>   
> +	sync();
> +
>   	tst_dev_bytes_written(tst_device->dev);
>   
>   	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
> diff --git a/testcases/kernel/syscalls/sync/sync03.c b/testcases/kernel/syscalls/sync/sync03.c
> index a6f72d2ed..085ccfdeb 100644
> --- a/testcases/kernel/syscalls/sync/sync03.c
> +++ b/testcases/kernel/syscalls/sync/sync03.c
> @@ -32,6 +32,8 @@ static void verify_sync(void)
>   
>   	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
>   
> +	sync();
> +
>   	tst_dev_bytes_written(tst_device->dev);
>   
>   	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
> diff --git a/testcases/kernel/syscalls/syncfs/syncfs01.c b/testcases/kernel/syscalls/syncfs/syncfs01.c
> index 051a19ea6..3cf404450 100644
> --- a/testcases/kernel/syscalls/syncfs/syncfs01.c
> +++ b/testcases/kernel/syscalls/syncfs/syncfs01.c
> @@ -33,6 +33,8 @@ static void verify_syncfs(void)
>   
>   	fd = SAFE_OPEN(FNAME, O_RDWR|O_CREAT, MODE);
>   
> +	sync();
> +
>   	tst_dev_bytes_written(tst_device->dev);
>   
>   	tst_fill_fd(fd, 0, TST_MB, FILE_SIZE_MB);
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
