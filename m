Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C515A113
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 07:11:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA63C3C25DE
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Feb 2020 07:11:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 246393C0137
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 07:11:25 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id AD44420141F
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 07:11:23 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,428,1574092800"; d="scan'208";a="83190492"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Feb 2020 14:11:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 6B0CF49DF128
 for <ltp@lists.linux.it>; Wed, 12 Feb 2020 14:01:48 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 12 Feb 2020 14:11:18 +0800
Message-ID: <5E439705.4010303@cn.fujitsu.com>
Date: Wed, 12 Feb 2020 14:11:17 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1581486286-13615-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 6B0CF49DF128.AABD6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/kill11: add a check between hard limit
 and MIN_RLIMIT_CORE
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

On 2020/2/12 13:44, Yang Xu wrote:
> Currently, running this case will report EINVAL error if I run "ulimit -c
> 1023" command firstly. From setrlimit(2)manpage, it got EINVAL error because
> rlim->rlim_cur was greater than rlim->rlim_max. So add a check for it before
> setrlimit.
Hi Xu,

It seems better to fix the issue by setting both rlim_cur and rlimit_max 
to the MIN_RLIMIT_CORE.

Thanks,
Xiao Yang
> Reported-by: Pankaj Vinadrao Joshi<Pankaj.VJ@exaleapsemi.com>
> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/kill/kill11.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/kill/kill11.c b/testcases/kernel/syscalls/kill/kill11.c
> index 83fba5beb..5f70b0a07 100644
> --- a/testcases/kernel/syscalls/kill/kill11.c
> +++ b/testcases/kernel/syscalls/kill/kill11.c
> @@ -201,6 +201,9 @@ void setup(void)
>
>   	SAFE_GETRLIMIT(NULL, RLIMIT_CORE,&rlim);
>
> +	if (rlim.rlim_max<  MIN_RLIMIT_CORE)
> +		tst_brkm(TCONF, NULL, "hard limit(%lu)less than MIN_RLIMT_CORE(%i)",
> +				rlim.rlim_max, MIN_RLIMIT_CORE);
>   	if (rlim.rlim_cur<  MIN_RLIMIT_CORE) {
>   		tst_resm(TINFO, "Adjusting RLIMIT_CORE to %i", MIN_RLIMIT_CORE);
>   		rlim.rlim_cur = MIN_RLIMIT_CORE;




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
