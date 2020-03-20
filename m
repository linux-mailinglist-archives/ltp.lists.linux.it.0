Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5147018C8D8
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 09:15:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAC9E3C538F
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 09:15:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 539623C1F2C
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 09:15:40 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A2F551A01928
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 09:15:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,283,1580745600"; d="scan'208";a="86661189"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 16:15:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id B076F49DF125;
 Fri, 20 Mar 2020 16:05:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 16:15:32 +0800
To: Zou Wei <zou_wei@huawei.com>
References: <1584586550-11668-1-git-send-email-zou_wei@huawei.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <6fb895d9-0396-1ee7-429f-ab7ea3ebdf0d@cn.fujitsu.com>
Date: Fri, 20 Mar 2020 16:15:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1584586550-11668-1-git-send-email-zou_wei@huawei.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B076F49DF125.AD891
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] aio_error/3-1.c: Call write before aio_error
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

Hi Zou

> In the case, if there is no write/read operation before aio_error,
> aio_error will judge that the current asynchronous I/O has been successfully
> completed, then return 0, case failed.
> 
> After the write/read operation is added, because aiocb.aio_reqprio is -1,
> the write/read operation will return -1, so aio_error will also return EINVAL
> because it detects that the asynchronous I/O has not completed successfully.
I have seen glibc code about aio_write and aio_err function, you are 
right. Thanks for the fix.

Looks good to me.
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Best Regards
Yang Xu
> 
> ps:
> http://man7.org/linux/man-pages/man3/aio_error.3.html
> RETURN VALUE
>         This function returns one of the following:
>         *  EINPROGRESS, if the request has not been completed yet.
>         *  ECANCELED, if the request was canceled.
>         *  0, if the request completed successfully.
>         *  A positive error number, if the asynchronous I/O operation failed.
>            This is the same value that would have been stored in the errno
>            variable in the case of a synchronous read(2), write(2), fsync(2),
>            or fdatasync(2) call.
> ERRORS
>         EINVAL aiocbp does not point at a control block for an asynchronous
>                I/O request of which the return status (see aio_return(3)) has
>                not been retrieved yet.
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   .../open_posix_testsuite/conformance/interfaces/aio_error/3-1.c      | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c b/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c
> index 9ccda05..2b2c65b 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/aio_error/3-1.c
> @@ -64,6 +64,11 @@ int main(void)
>   	aiocb.aio_reqprio = -1;
>   	aiocb.aio_nbytes = BUF_SIZE;
> 
> +	if (aio_write(&aiocb) != -1) {
> +                printf(TNAME " Error at aio_write(): %s\n", strerror(errno));
> +                return PTS_FAIL;
> +        }
> +
>   	ret = aio_error(&aiocb);
> 
>   	if (ret != EINVAL) {
> --
> 2.6.2
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
