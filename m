Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230E187A35
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:15:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19CE33C55CD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 08:15:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 10ABC3C55C3
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:15:03 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id ED22E1000CA0
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 08:14:59 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,563,1574092800"; d="scan'208";a="86454037"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 15:14:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 9548A50A9984;
 Tue, 17 Mar 2020 15:04:48 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 15:14:51 +0800
Message-ID: <5E7078E9.9080809@cn.fujitsu.com>
Date: Tue, 17 Mar 2020 15:14:49 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Zou Wei <zou_wei@huawei.com>
References: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1584327515-74727-1-git-send-email-zou_wei@huawei.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9548A50A9984.A93EB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
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

Hi Zou,

Pushed.

BTW:
1) we also need to update open_posix_testsuite so that it can compile 
these stress tests by default.
2) Your patch seems to be broken so I recreate and apply it.

Thanks,
Xiao Yang
On 2020/3/16 10:58, Zou Wei wrote:
> pthread_cond_init/s-c.c testcase lose a #ifndef line, fix it
>
> Reported-by: Zou Wei<zou_wei@huawei.com>
> Signed-off-by: Zou Wei<zou_wei@huawei.com>
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
