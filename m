Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7842E958B
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 14:07:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DB533C3206
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 14:07:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CE2AA3C240A
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 14:07:10 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 071DF2001CA
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 14:07:09 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,474,1599494400"; d="scan'208";a="103168669"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 21:07:07 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 5CCEE4CE6023;
 Mon,  4 Jan 2021 21:07:05 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 21:07:06 +0800
Message-ID: <5FF312F7.1060907@cn.fujitsu.com>
Date: Mon, 4 Jan 2021 21:07:03 +0800
From: yangx.jy <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20210104125423.19183-1-yangx.jy@cn.fujitsu.com>
 <20210104125423.19183-2-yangx.jy@cn.fujitsu.com>
In-Reply-To: <20210104125423.19183-2-yangx.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5CCEE4CE6023.AC6A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/2] include/tst_test_macros.h: Report TINFO
 when TST_EXP_FD() succeeded
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

I will change the TST_EXP_PASS as well if you approve the patch.

Best Regards,
Xiao Yang
On 2021/1/4 20:54, Xiao Yang wrote:
> In Summary output, avoid counting the double passed for one test:
> -------------------------------------
> ./open01
> tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s
> open01.c:48: TPASS: open() with sticky bit returned fd 3
> open01.c:59: TPASS: sticky bit is set as expected
> open01.c:48: TPASS: open() with sirectory bit returned fd 3
> open01.c:59: TPASS: sirectory bit is set as expected
>
> Summary:
> passed   4
> failed   0
> broken   0
> skipped  0
> warnings 0
> -------------------------------------
>
> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> ---
>  include/tst_test_macros.h               | 2 +-
>  lib/newlib_tests/test_macros01.c        | 3 ++-
>  testcases/kernel/syscalls/open/open11.c | 2 ++
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 3016d95c2..d1fc3cf70 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -64,7 +64,7 @@ extern void *TST_RET_PTR;
>  			break;                                                 \
>  		}                                                              \
>                                                                                 \
> -		TST_MSGP_(TPASS, " returned fd %ld", TST_RET,                  \
> +		TST_MSGP_(TINFO, " returned fd %ld", TST_RET,                  \
>  		         #SCALL, ##__VA_ARGS__);                               \
>                                                                                 \
>  		TST_PASS = 1;                                                  \
> diff --git a/lib/newlib_tests/test_macros01.c b/lib/newlib_tests/test_macros01.c
> index 9a920f8e4..9aa3885c7 100644
> --- a/lib/newlib_tests/test_macros01.c
> +++ b/lib/newlib_tests/test_macros01.c
> @@ -30,7 +30,8 @@ static void do_test(void)
>  	TST_EXP_FD(fail_fd(), "TEST DESCRIPTION");
>  	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
>  	TST_EXP_FD(pass_fd(), "%s", "TEST DESCRIPTION PARAM");
> -	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
> +	if (TST_PASS)
> +		tst_res(TPASS, "TST_PASS = %i", TST_PASS);
>  	TST_EXP_FD(inval_val());
>  	tst_res(TINFO, "TST_PASS = %i", TST_PASS);
>  }
> diff --git a/testcases/kernel/syscalls/open/open11.c b/testcases/kernel/syscalls/open/open11.c
> index ded384fa8..f7ac96d90 100644
> --- a/testcases/kernel/syscalls/open/open11.c
> +++ b/testcases/kernel/syscalls/open/open11.c
> @@ -283,6 +283,8 @@ static void verify_open(unsigned int n)
>  	} else if (tc[n].err == 0) {
>  		TST_EXP_FD(open(tc[n].path, tc[n].flags, tc[n].mode),
>  		           "%s", tc[n].desc);
> +		if (TST_PASS)
> +			tst_res(TPASS, "%s", tc[n].desc);
>  	} else {
>  		TEST(open(tc[n].path, tc[n].flags, tc[n].mode));
>  		tst_res(TPASS, "%s", tc[n].desc);




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
