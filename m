Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 623611E2338
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 15:43:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E79CE3C32D5
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 15:43:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DC5443C223E
 for <ltp@lists.linux.it>; Tue, 26 May 2020 15:43:32 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 21A321000650
 for <ltp@lists.linux.it>; Tue, 26 May 2020 15:43:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,437,1583164800"; d="scan'208";a="93128943"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 May 2020 21:43:24 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id A977550A996F;
 Tue, 26 May 2020 21:43:21 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 May 2020 21:43:20 +0800
Message-ID: <5ECD1CF8.5010607@cn.fujitsu.com>
Date: Tue, 26 May 2020 21:43:20 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <ltp@lists.linux.it>
References: <5EC48FCD.9050600@cn.fujitsu.com>
 <20200522014007.3108-1-yangx.jy@cn.fujitsu.com>
In-Reply-To: <20200522014007.3108-1-yangx.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: A977550A996F.A765D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib/tst_test.c: Take account of
 tst_brk(TCONF/TFAIL) in summary output
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I want to push it tomorrow if nobody has any objection.

Thanks,
Xiao Yang
On 2020/5/22 9:40, Xiao Yang wrote:
> Current summary output doesn't take account of tst_brk(TCONF/TFAIL),
> for example:
> -----------------------------------------------------
> [root@Fedora-30  pidfd_send_signal]# ./pidfd_send_signal01
> tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
> ../../../../include/lapi/pidfd_send_signal.h:16: CONF: syscall(424) __NR_pidfd_send_signal not supported
> 
> Summary:
> passed   0
> failed   0
> skipped  0
> warnings 0
> ----------------------------------------------------
> 
> 1) Add update_result() in tst_vbrk_() to fix the issue.
> 2) Remove redundant update_result() in run_tcases_per_fs() after the fix.
> 
> Signed-off-by: Xiao Yang<yangx.jy@cn.fujitsu.com>
> ---
>   lib/tst_test.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 0e58060e0..e93c88ba5 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -316,6 +316,7 @@ void tst_vbrk_(const char *file, const int lineno, int ttype,
>                  const char *fmt, va_list va)
>   {
>   	print_result(file, lineno, ttype, fmt, va);
> +	update_results(TTYPE_RESULT(ttype));
> 
>   	/*
>   	 * The getpid implementation in some C library versions may cause cloned
> @@ -1316,10 +1317,8 @@ static int run_tcases_per_fs(void)
>   			mntpoint_mounted = 0;
>   		}
> 
> -		if (ret == TCONF) {
> -			update_results(ret);
> +		if (ret == TCONF)
>   			continue;
> -		}
> 
>   		if (ret == 0)
>   			continue;




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
