Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D691700B8
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 15:08:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E17233C25A8
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 15:08:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id EC2353C1ABA
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 15:08:27 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 22D06600831
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 15:08:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,488,1574092800"; d="scan'208";a="84362862"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 22:08:20 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id E20B550A9978;
 Wed, 26 Feb 2020 21:58:34 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 22:08:18 +0800
Message-ID: <5E567BD2.302@cn.fujitsu.com>
Date: Wed, 26 Feb 2020 22:08:18 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <54a3d6fcef8cfed89a1e4f0b56717f56aa502293.1582611994.git.viresh.kumar@linaro.org>
 <2f579843fb1ff09cfaaa1b991b48437f525740b3.1582673499.git.viresh.kumar@linaro.org>
In-Reply-To: <2f579843fb1ff09cfaaa1b991b48437f525740b3.1582673499.git.viresh.kumar@linaro.org>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E20B550A9978.A8975
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls/pidfd_open: Continue with rest of the
 tests on failure
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/2/26 7:33, Viresh Kumar wrote:
> With tst_brk(), the tests end immediately while what we want to do here
> is to test rest of the failure tests. Use tst_res() to report result and
> continue with rest of the failure tests.
>
> Signed-off-by: Viresh Kumar<viresh.kumar@linaro.org>
> ---
> V2: Use return, instead of if/else blocks.
>
>   testcases/kernel/syscalls/pidfd_open/pidfd_open02.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> index d73b5326b3b1..9cdded13525a 100644
> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open02.c
> @@ -35,14 +35,16 @@ static void run(unsigned int n)
>
>   	if (TST_RET != -1) {
>   		SAFE_CLOSE(TST_RET);
> -		tst_brk(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
> +		tst_res(TFAIL, "%s: pidfd_open succeeded unexpectedly (index: %d)",
>   			tc->name, n);
> +		return;
>   	}
>
>   	if (tc->exp_errno != TST_ERR) {
> -		tst_brk(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
> +		tst_res(TFAIL | TTERRNO, "%s: pidfd_open() should fail with %s",
>   			tc->name, tst_strerrno(tc->exp_errno));
> -	}
> +		return;
> +	 }
>
>   	tst_res(TPASS | TTERRNO, "%s: pidfd_open() failed as expected",
>   		tc->name);
  Acked-by: Xiao Yang <ice_yangxiao@163.com>



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
