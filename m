Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4115320FA0
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 04:07:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F0563C658F
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 04:07:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id D1BCA3C3236
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 04:06:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5B7AA60071D
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 04:06:52 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,195,1610380800"; d="scan'208";a="104708147"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 11:06:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E51964CE7315;
 Mon, 22 Feb 2021 11:06:47 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 11:06:49 +0800
Message-ID: <60331FCB.2020108@cn.fujitsu.com>
Date: Mon, 22 Feb 2021 11:06:51 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Li Wang <liwang@redhat.com>
References: <20210220123724.16939-1-liwang@redhat.com>
In-Reply-To: <20210220123724.16939-1-liwang@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E51964CE7315.ABF12
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: correct fork11-1 report log
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
Looks good to me,
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

ps: My pc (I use it to merge patch) is not with me, you can merge this 
yourself.
> Signed-off-by: Li Wang<liwang@redhat.com>
> ---
>   .../open_posix_testsuite/conformance/interfaces/fork/11-1.c   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> index 8a7796cfd..e31f3896f 100644
> --- a/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> +++ b/testcases/open_posix_testsuite/conformance/interfaces/fork/11-1.c
> @@ -47,7 +47,7 @@ static int child(int fd)
>
>   	if (fcntl(fd, F_SETLK,&fl) == -1) {
>   		if (errno == EACCES || errno == EAGAIN) {
> -			printf("PASSED: child did not inherit the lock\n");
> +			printf("PASSED: Child locked file already locked by parent\n");
>   			return PTS_PASS;
>   		}
>
> @@ -56,7 +56,7 @@ static int child(int fd)
>   		return PTS_UNRESOLVED;
>   	}
>
> -	printf("Child locked file already locked by parent\n");
> +	printf("Child did not inherit the lock\n");
>   	return PTS_FAIL;
>   }
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
