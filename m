Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 577F11923FF
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 10:26:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11B233C4BB2
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 10:26:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D91153C4BA4
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:26:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E46B52011BE
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:26:51 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="87256230"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 17:26:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id AA08C50A998E
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 17:16:36 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 17:26:47 +0800
To: <ltp@lists.linux.it>
References: <1585127864-1341-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <3329abd9-38f8-1268-d288-a9f874959e01@cn.fujitsu.com>
Date: Wed, 25 Mar 2020 17:26:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1585127864-1341-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AA08C50A998E.AE450
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] aio_return: Remove cases and refactor 4-1.c
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
Cc: liug.fnst@cn.fujitsu.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi


>  From aio_return(3) manpage, the aio_return() function returns the
> final return status for the asynchronous I/O request with control
> block pointed to by aiocbp. It should be called only once for any
> given request. If we want to call twice for same aiocbp, it only
> returns the last value. It doesn't make sense. So remove 2-1.c and
> 3-2.c.
> 
> For 4-1.c, it failed with the same reason. But we can refactor this
> , firstly call aio_return(&aiocb2) and then call aio_return(&aiocb).
> It tests whether value override.
> 
> Reported-by: Gang Liu <liug.fnst@cn.fujitsu.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   .../conformance/interfaces/aio_return/2-1.c   | 108 -----------------
>   .../conformance/interfaces/aio_return/3-2.c   | 111 ------------------
>   .../conformance/interfaces/aio_return/4-1.c   |  23 +++-
>   3 files changed, 18 insertions(+), 224 deletions(-)
>   delete mode 100644 testcases/open_posix_testsuite/conformance/interfaces/aio_return/2-1.c
>   delete mode 100644 testcases/open_posix_testsuite/conformance/interfaces/aio_return/3-2.c
> 
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
> index 7a039b13f..770699b54 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_return/4-1.c
> @@ -17,8 +17,10 @@
>    *
>    *	- Open a file
>    *	- fill in an aiocb for writing
> - *	- call aio_write usign this aiocb
> + *	- call aio_write using this aiocb
>    *	- fill in a new aiocb
> + *	- call aio_write using this aiocb
> + *	- call aio_return with aiocb
>    *	- call aio_return with this last aiocb
>    */
>   
> @@ -86,20 +88,31 @@ int main(void)
>   		aiocb2.aio_fildes = fd;
>   		aiocb2.aio_buf = buf;
>   		aiocb2.aio_nbytes = BUF_SIZE;
> +		if (aio_write(&aiocb2) == -1) {
> +			close(fd);
> +			printf(TNAME " Error at aio_write(): %s\n", strerror(errno));
> +			return PTS_FAIL;
> +		}
> +
> +		do {
> +			nanosleep(&completion_wait_ts, NULL);
> +			retval = aio_error(&aiocb);
Here should be aio_error(&aiocb2). Sorry.
> +		} while (retval == EINPROGRESS);
>   
>   		retval = aio_return(&aiocb2);
>   
> -		if (retval != -1 || aio_error(&aiocb) != EINVAL) {
> +		if (retval != BUF_SIZE) {
>   			close(fd);
> -			printf(TNAME "aio_return() have not failed\n");
> -			return PTS_UNTESTED;
> +			printf(TNAME " Error at aio_return(&aiocb2): %d, %s\n", retval,
> +				strerror(aio_error(&aiocb)));
Here as well.
> +			return PTS_UNRESOLVED;
>   		}
>   
>   		retval = aio_return(&aiocb);
>   
>   		if (retval != BUF_SIZE) {
>   			close(fd);
> -			printf(TNAME " Error at aio_return(): %d, %s\n", retval,
> +			printf(TNAME " Error at aio_return(&aiocb): %d, %s\n", retval,
>   			       strerror(aio_error(&aiocb)));
>   			return PTS_UNRESOLVED;
>   		}
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
