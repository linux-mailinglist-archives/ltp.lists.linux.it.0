Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 776132A7C70
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 11:56:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AABB3C5417
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 11:56:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 2720C3C20D7
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 11:56:45 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 4C600600C35
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 11:56:43 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,453,1596470400"; d="scan'208";a="100981177"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Nov 2020 18:56:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D3BBE4CE38A7
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 18:56:39 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 5 Nov 2020 18:56:39 +0800
Message-ID: <5FA3DA69.2020305@cn.fujitsu.com>
Date: Thu, 5 Nov 2020 18:56:41 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
References: <1604572726-11596-1-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1604572726-11596-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D3BBE4CE38A7.A1A71
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] sycalls: select03: Make nfds use the correct value
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

Hi Feiyu
> When running select03 with runltp in /opt/ltp, this case failed as below:
> select03.c:52: TFAIL: Invalid readfds: select() passed unexpectedly with 0
> select03.c:52: TFAIL: Invalid writefds: select() passed unexpectedly with 0
> select03.c:52: TFAIL: Invalid exceptfds: select() passed unexpectedly with 0
>
> When running select03 with runltp, nfds should be 8 or 9 instead of 6.
>
> Reviewed-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> Signed-off-by: Feiyu Zhu<zhufy.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/select/select03.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
> index ca1b7a5..34264d1 100644
> --- a/testcases/kernel/syscalls/select/select03.c
> +++ b/testcases/kernel/syscalls/select/select03.c
> @@ -30,19 +30,24 @@ static struct tcases {
>   	int exp_errno;
>   } tests[] = {
>   	{ "Negative nfds", -1,&preadfds_reg,&pwritefds_reg,&nullfds,&valid_to, EINVAL },
> -	{ "Invalid readfds", 6,&pfds_closed,&pwritefds_reg,&nullfds,&valid_to, EBADF },
> -	{ "Invalid writefds", 6,&preadfds_reg,&pfds_closed,&nullfds,&valid_to, EBADF },
> -	{ "Invalid exceptfds", 6,&preadfds_reg,&pwritefds_reg,&pfds_closed,&valid_to, EBADF },
> -	{ "Faulty readfds", 6,&faulty_fds,&pwritefds_reg,&nullfds,&valid_to, EFAULT },
> -	{ "Faulty writefds", 6,&preadfds_reg,&faulty_fds,&nullfds,&valid_to, EFAULT },
> -	{ "Faulty exceptfds", 6,&preadfds_reg,&pwritefds_reg,&faulty_fds,&valid_to, EFAULT },
> -	{ "Faulty timeout", 6,&preadfds_reg,&pwritefds_reg,&nullfds,&invalid_to, EFAULT },
> +	{ "Invalid readfds", 1,&pfds_closed,&pwritefds_reg,&nullfds,&valid_to, EBADF },
> +	{ "Invalid writefds", 0,&preadfds_reg,&pfds_closed,&nullfds,&valid_to, EBADF },
> +	{ "Invalid exceptfds", 1,&preadfds_reg,&pwritefds_reg,&pfds_closed,&valid_to, EBADF },
> +	{ "Faulty readfds", 1,&faulty_fds,&pwritefds_reg,&nullfds,&valid_to, EFAULT },
> +	{ "Faulty writefds", 0,&preadfds_reg,&faulty_fds,&nullfds,&valid_to, EFAULT },
> +	{ "Faulty exceptfds", 1,&preadfds_reg,&pwritefds_reg,&faulty_fds,&valid_to, EFAULT },
> +	{ "Faulty timeout", 1,&preadfds_reg,&pwritefds_reg,&nullfds,&invalid_to, EFAULT },
>   };
>
>   static void run(unsigned int n)
>   {
>   	struct tcases *tc =&tests[n];
>
> +	if (tc->nfds == 0)
> +		tc->nfds = fd[0]+1;
> +	else if (tc->nfds == 1)
> +		tc->nfds = fd[1]+1;
I guess we should only use fd[1] + 1 because fd[1] is always greater 
than fds[0]. As man-page said" nfds is the highest-numbered file 
descriptor in any of the three sets, plus 1."

So the code maybe as below
diff --git a/testcases/kernel/syscalls/select/select03.c 
b/testcases/kernel/syscalls/select/select03.c
index ca1b7a504..099b622de 100644
--- a/testcases/kernel/syscalls/select/select03.c
+++ b/testcases/kernel/syscalls/select/select03.c
@@ -29,21 +29,21 @@ static struct tcases {
         struct timeval **timeout;
         int exp_errno;
  } tests[] = {
-       { "Negative nfds", -1, &preadfds_reg, &pwritefds_reg, &nullfds, 
&valid_to, EINVAL },
-       { "Invalid readfds", 6, &pfds_closed, &pwritefds_reg, &nullfds, 
&valid_to, EBADF },
-       { "Invalid writefds", 6, &preadfds_reg, &pfds_closed, &nullfds, 
&valid_to, EBADF },
-       { "Invalid exceptfds", 6, &preadfds_reg, &pwritefds_reg, 
&pfds_closed, &valid_to, EBADF },
-       { "Faulty readfds", 6, &faulty_fds, &pwritefds_reg, &nullfds, 
&valid_to, EFAULT },
-       { "Faulty writefds", 6, &preadfds_reg, &faulty_fds, &nullfds, 
&valid_to, EFAULT },
-       { "Faulty exceptfds", 6, &preadfds_reg, &pwritefds_reg, 
&faulty_fds, &valid_to, EFAULT },
-       { "Faulty timeout", 6, &preadfds_reg, &pwritefds_reg, &nullfds, 
&invalid_to, EFAULT },
+       { "Negative nfds", 0, &preadfds_reg, &pwritefds_reg, &nullfds, 
&valid_to, EINVAL },
+       { "Invalid readfds", 1, &pfds_closed, &pwritefds_reg, &nullfds, 
&valid_to, EBADF },
+       { "Invalid writefds", 1, &preadfds_reg, &pfds_closed, &nullfds, 
&valid_to, EBADF },
+       { "Invalid exceptfds", 1, &preadfds_reg, &pwritefds_reg, 
&pfds_closed, &valid_to, EBADF },
+       { "Faulty readfds", 1, &faulty_fds, &pwritefds_reg, &nullfds, 
&valid_to, EFAULT },
+       { "Faulty writefds", 1, &preadfds_reg, &faulty_fds, &nullfds, 
&valid_to, EFAULT },
+       { "Faulty exceptfds", 1, &preadfds_reg, &pwritefds_reg, 
&faulty_fds, &valid_to, EFAULT },
+       { "Faulty timeout", 1, &preadfds_reg, &pwritefds_reg, &nullfds, 
&invalid_to, EFAULT },
  };

  static void run(unsigned int n)
  {
         struct tcases *tc = &tests[n];

-       TEST(do_select_faulty_to(tc->nfds, *tc->readfds, *tc->writefds,
+       TEST(do_select_faulty_to(tc->nfds ? fd[1] + 1 : -1, 
*tc->readfds, *tc->writefds,
                                  *tc->exceptfds, *tc->timeout,
                                  tc->timeout == &invalid_to));


Best Regrads
Yang Xu
> +
>   	TEST(do_select_faulty_to(tc->nfds, *tc->readfds, *tc->writefds,
>   				 *tc->exceptfds, *tc->timeout,
>   				 tc->timeout ==&invalid_to));




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
