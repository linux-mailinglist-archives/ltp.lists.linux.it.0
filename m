Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC96165793
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:25:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9038A3C223C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 07:25:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DAF423C1B32
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:25:29 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 30DC31A01775
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 07:25:27 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,462,1574092800"; d="scan'208";a="83607808"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Feb 2020 14:25:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6402B50A996A;
 Thu, 20 Feb 2020 14:15:45 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 20 Feb 2020 14:25:23 +0800
To: Khem Raj <raj.khem@gmail.com>
References: <20200220054844.3365462-1-raj.khem@gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <aeaab177-aedf-b47a-3d9d-84793dc8681f@cn.fujitsu.com>
Date: Thu, 20 Feb 2020 14:25:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200220054844.3365462-1-raj.khem@gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6402B50A996A.AB8B6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls: Check for time64 unsafe syscalls
 before using them
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



Hi Khem
> musl is using 64bit time_t now on 32bit architectures and these syscalls
> no longer exist, therefore its better to check for them being available
> before using them
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   lib/tst_clocks.c                                        | 9 +++++----
>   testcases/kernel/syscalls/gettimeofday/gettimeofday01.c | 6 ++----
>   testcases/kernel/syscalls/gettimeofday/gettimeofday02.c | 8 +++-----
>   3 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> index 5195da38f3..f4f8b2846b 100644
> --- a/lib/tst_clocks.c
> +++ b/lib/tst_clocks.c
> @@ -10,21 +10,22 @@
>   #define _GNU_SOURCE
>   #include <unistd.h>
>   #include <time.h>
> -#include <sys/syscall.h>
>   
> +#include "test.h"
>   #include "tst_clocks.h"
> +#include "lapi/syscalls.h"
>   
>   int tst_clock_getres(clockid_t clk_id, struct timespec *res)
>   {
> -	return syscall(SYS_clock_getres, clk_id, res);
> +	return ltp_syscall(__NR_clock_getres, clk_id, res);
It should use new api, include "tst_test.h" and use tst_syscall. It 
doesn't like gettimeofday01.c.
>   }
>   
>   int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>   {
> -	return syscall(SYS_clock_gettime, clk_id, ts);
> +	return ltp_syscall(__NR_clock_gettime, clk_id, ts);
>   }
>   
>   int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
>   {
> -	return syscall(SYS_clock_settime, clk_id, ts);
> +	return ltp_syscall(__NR_clock_settime, clk_id, ts);
>   }
> diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> index 583d8f7b9b..08ea1673ad 100644
> --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday01.c
> @@ -38,10 +38,8 @@
>   #include <sys/time.h>
>   #include <errno.h>
>   #include "test.h"
> -#include <sys/syscall.h>
>   #include <unistd.h>
> -
> -#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> +#include "lapi/syscalls.h"
>   
>   char *TCID = "gettimeofday01";
>   int TST_TOTAL = 1;
> @@ -63,7 +61,7 @@ int main(int ac, char **av)
>   	for (lc = 0; TEST_LOOPING(lc); lc++) {
>   		tst_count = 0;
>   
> -		TEST(gettimeofday((void *)-1, (void *)-1));
> +		TEST(ltp_syscall(__NR_gettimeofday, (void *)-1, (void *)-1));
In future, we can convert this case into new api and use tst_syscall.
>   
>   		/* gettimeofday returns an int, so we need to turn the long
>   		 * TEST_RETURN into an int to test with */
> diff --git a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> index 1d60f448e8..5170ad2f78 100644
> --- a/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> +++ b/testcases/kernel/syscalls/gettimeofday/gettimeofday02.c
> @@ -16,14 +16,12 @@
>   #include <stdint.h>
>   #include <sys/time.h>
>   #include <stdlib.h>
> -#include <sys/syscall.h>
>   #include <unistd.h>
>   #include <time.h>
>   #include <errno.h>
>   
>   #include "tst_test.h"
> -
> -#define gettimeofday(a,b)  syscall(__NR_gettimeofday,a,b)
> +#include "lapi/syscalls.h"
>   
>   static volatile sig_atomic_t done;
>   static char *str_rtime;
> @@ -48,13 +46,13 @@ static void verify_gettimeofday(void)
>   
>   	alarm(rtime);
>   
> -	if (gettimeofday(&tv1, NULL)) {
> +	if (tst_syscall(__NR_gettimeofday, &tv1, NULL)) {
>   		tst_res(TBROK | TERRNO, "gettimeofday() failed");
>   		return;
>   	}
>   
>   	while (!done) {
> -		if (gettimeofday(&tv2, NULL)) {
> +		if (tst_syscall(__NR_gettimeofday, &tv2, NULL)) {
>   			tst_res(TBROK | TERRNO, "gettimeofday() failed");
>   			return;
>   		}
> 
other than, this patch looks good to me.
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
