Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9EE170CCB
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 00:52:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 541D53C25A8
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 00:52:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E4CA03C1D97
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 00:52:21 +0100 (CET)
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2605B200B21
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 00:52:21 +0100 (CET)
Received: by mail-il1-x144.google.com with SMTP id p78so737253ilb.10
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 15:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QICudEUHxOA++v+LRCEdgMFeKASCfrfUoVpv9CqlbKE=;
 b=YilpeeCoe9ui69EJXI9Djfjjd7kGG5BgDylvUNpnp9kK03Q+fBTyHji3sD7XPkmDGc
 H/xw/Tt+thMG33jJeudXG8cIrKRdyoATKifxCzx2NvEibaU0mEPxqOuQ+AtvpvzchnNY
 w19AoC4QPNgG5K7J5MoQ1OBZTJ7lAKIr0fiZlRmwgiS7zHOsubXp2kp2Ilu2q8AeTpPM
 ueYoEpE8UOtXiLgq90RRYWbyO9mtyXYpaqk/tmwookA3HdsAF6VWYIX1Nnx973V4tpQa
 phjfnB6N94zAtv/fAaWGoq+EvtIyOSKucoGcRC4iD0yfiK8iFlMbDcA9DZbAw1fqGgQ4
 lxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QICudEUHxOA++v+LRCEdgMFeKASCfrfUoVpv9CqlbKE=;
 b=FmeQLSlQeifqwCRWj82hAsbegnJa/uQeL7Dxs6H8/sidw6Q746ooC3idR1ywf1vw2A
 HVamRVvlcOa7/tdMdGZ5G3Lh2qziCbdesL7CXKUfpW7fzWywTn1yW1WK220PAcdMVmb6
 VVUc+Eyx2d/7jveHWDFJFd0j/Pp4UXZCNUm484KaKaO6nO2a0DX7KQkkHfaWlWBn3QMx
 CzNrlPL9uhenbr7KrDrgU7G8XIR4KsxTPZuBgaSeiFsg62XnUBEZxhZvJ+8Ql6fvIl5a
 /QtB9y5EGsnpuVwz4FPFMGXNM1mhVUIBhlf/6eTEjQehTzc1d0kUwF3O7OmEHSMIflRp
 nSWw==
X-Gm-Message-State: APjAAAULRZL24lMd0BuaFFY4mwdmgURZcClPQDpOpi7lzBsvisfudzd6
 BGnCJ/8N/kOTXXqRxI6vbg05s1cNGVM=
X-Google-Smtp-Source: APXvYqyLmo95NkIyO6pjx89chF1EiPuNXe35DMmT8fimCYx70kIYtSktR4T8fjyAi9dYbm0glSTFpA==
X-Received: by 2002:a92:d708:: with SMTP id m8mr1526514iln.244.1582761139297; 
 Wed, 26 Feb 2020 15:52:19 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:19c7:2796:79bc:80ea?
 ([2601:646:9200:4e0:19c7:2796:79bc:80ea])
 by smtp.gmail.com with ESMTPSA id h19sm1164502ild.76.2020.02.26.15.52.18
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 15:52:18 -0800 (PST)
To: ltp@lists.linux.it
References: <20200220065204.485391-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <759857e6-247c-33fc-53e1-80fa73704906@gmail.com>
Date: Wed, 26 Feb 2020 15:52:17 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220065204.485391-1-raj.khem@gmail.com>
Content-Language: en-GB
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls: Check for time64 unsafe syscalls
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ping

On 2/19/20 10:52 PM, Khem Raj wrote:
> musl is using 64bit time_t now on 32bit architectures and these syscalls
> no longer exist, therefore its better to check for them being available
> before using them
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   lib/tst_clocks.c                                      | 11 ++++++-----
>   .../kernel/syscalls/gettimeofday/gettimeofday01.c     |  6 ++----
>   .../kernel/syscalls/gettimeofday/gettimeofday02.c     |  8 +++-----
>   3 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
> index 5195da38f3..155551170d 100644
> --- a/lib/tst_clocks.c
> +++ b/lib/tst_clocks.c
> @@ -10,21 +10,22 @@
>   #define _GNU_SOURCE
>   #include <unistd.h>
>   #include <time.h>
> -#include <sys/syscall.h>
> -
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
>   #include "tst_clocks.h"
> +#include "lapi/syscalls.h"
>   
>   int tst_clock_getres(clockid_t clk_id, struct timespec *res)
>   {
> -	return syscall(SYS_clock_getres, clk_id, res);
> +	return tst_syscall(__NR_clock_getres, clk_id, res);
>   }
>   
>   int tst_clock_gettime(clockid_t clk_id, struct timespec *ts)
>   {
> -	return syscall(SYS_clock_gettime, clk_id, ts);
> +	return tst_syscall(__NR_clock_gettime, clk_id, ts);
>   }
>   
>   int tst_clock_settime(clockid_t clk_id, struct timespec *ts)
>   {
> -	return syscall(SYS_clock_settime, clk_id, ts);
> +	return tst_syscall(__NR_clock_settime, clk_id, ts);
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

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
