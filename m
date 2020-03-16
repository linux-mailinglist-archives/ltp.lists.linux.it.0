Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD5186437
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 05:31:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1976B3C579E
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 05:31:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4A9F83C0889
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 05:31:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id BB8661000A61
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 05:31:28 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,559,1574092800"; d="scan'208";a="86374700"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Mar 2020 12:31:23 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 0797B50A9960;
 Mon, 16 Mar 2020 12:21:16 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Mar 2020 12:31:20 +0800
To: Zou Wei <zou_wei@huawei.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <8eec82a7-f9eb-1002-ee86-71b94a55bdf4@cn.fujitsu.com>
Date: Mon, 16 Mar 2020 12:31:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 0797B50A9960.AD7C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pthread_cond_init/s-c.c: Add the lose ifndef line
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

It was introduced by commit 310c9eb6e6("Remove explicit #define's for 
`_POSIX_C_SOURCE` and `_XOPEN_SOURCE`").

IMO, we can remove this WITHOUT_XOPEN macro directly because we have 
setted -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 in 
ltp/testcases/open_posix_testsuite/CFLAGS.

Best Regards
Yang Xu
> pthread_cond_init/s-c.c testcase lose a #ifndef line, fix it
> 
> Reported-by: Zou Wei <zou_wei@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c b/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c
> index 6a5c70a..8d18484 100644
> --- a/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c
> +++ b/testcases/open_posix_testsuite/stress/threads/pthread_cond_init/s-c.c
> @@ -80,6 +80,7 @@
>   /***********************************    Test case   *****************************************/
>   /********************************************************************************************/
> +#ifndef WITHOUT_XOPEN
>   typedef struct _teststruct {
>   	pthread_cond_t cnd[10 * SCALABILITY_FACTOR];
>   	pthread_condattr_t ca[4];
> --
> 2.6.2
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
