Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D6187BB9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:08:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A9C33C55D9
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 10:08:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5A06C3C03B2
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:08:27 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 053E0600670
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 10:08:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,563,1574092800"; d="scan'208";a="86461694"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 17:08:21 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 75DC650A9967;
 Tue, 17 Mar 2020 16:58:18 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 17:08:13 +0800
To: Zou Wei <zou_wei@huawei.com>, <ltp@lists.linux.it>
References: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0b85e10e-480f-f91a-0ce2-dc3a51cd2319@cn.fujitsu.com>
Date: Tue, 17 Mar 2020 17:07:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1584430031-47227-1-git-send-email-zou_wei@huawei.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 75DC650A9967.ADC2F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open_posix_testsuite: Fix compilation issues
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

Hi Zou


> Fix compilation issues:
> 1. Add the '-lpthread -lrt -lm' config into LDFLAGS
See ltp/openposix/build[1] documention, as below:

----------------------------
If you need to pass in any header locations, preprocessor definitions, etc,
   set the value via CFLAGS.
- If you need to pass in any libraries for linking, set the value via 
LDLIBS.
- If you need to pass any other values to the linker, set the value via 
LDFLAGS.
----------------------------

I guess we should use LDLIBS.

Also, do we must specify three '-lpthread -lrt -lm' configs into this?
Some case only needs one lib, such as functional/timers/timers .  I 
guess we can only add LDLIBS in case directory such as 
functional/timers/timers because generate-makefiles.sh will load libs 
from current directory.

ps: I will test this patch by using travis.

[1]https://github.com/linux-test-project/ltp/blob/master/testcases/open_posix_testsuite/BUILD

Best Regards
Yang Xu
> 2. Update makefile and locate-test script
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   testcases/open_posix_testsuite/LDFLAGS             | 1 +
>   testcases/open_posix_testsuite/functional/Makefile | 2 +-
>   testcases/open_posix_testsuite/scripts/locate-test | 2 +-
>   testcases/open_posix_testsuite/stress/Makefile     | 2 +-
>   4 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/open_posix_testsuite/LDFLAGS b/testcases/open_posix_testsuite/LDFLAGS
> index e69de29..6c112d3 100644
> --- a/testcases/open_posix_testsuite/LDFLAGS
> +++ b/testcases/open_posix_testsuite/LDFLAGS
> @@ -0,0 +1 @@
> +-lpthread -lrt -lm
> diff --git a/testcases/open_posix_testsuite/functional/Makefile b/testcases/open_posix_testsuite/functional/Makefile
> index 3b22c89..50e03aa 100644
> --- a/testcases/open_posix_testsuite/functional/Makefile
> +++ b/testcases/open_posix_testsuite/functional/Makefile
> @@ -5,7 +5,7 @@
>   #
> 
>   all clean install test:
> -	@for dir in `ls -d */Makefile 2>/dev/null | sed -e 's,/Makefile$$,,g'`; do \
> +	@for dir in `find . -name *Makefile | egrep -v '^./Makefile' | sed -e 's,/Makefile$$,,g'`; do \
>   		$(MAKE) -C $$dir $@;						   \
>   	done
> 
> diff --git a/testcases/open_posix_testsuite/scripts/locate-test b/testcases/open_posix_testsuite/scripts/locate-test
> index 27f0bb5..e4ef994 100755
> --- a/testcases/open_posix_testsuite/scripts/locate-test
> +++ b/testcases/open_posix_testsuite/scripts/locate-test
> @@ -92,7 +92,7 @@ runnable)
>   	# waltz down the tools directory and try and build t0 (which doesn't
>   	# make sense as it's a tool, not a test). Better criterion needs to
>   	# be established for this file.
> -	find "$WHERE/conformance" "$WHERE/stress" -type f -name '*[0-9].c' -o -name '[0-9]*-[0-9]*.sh' | grep -v buildonly | grep -v '^./tools'
> +	find "$WHERE/conformance" "$WHERE/stress" -type f -name '*[0-9a-z].c' -o -name '[0-9]*-[0-9]*.sh' | grep -v buildonly | grep -v '^./tools' | grep -v 'testfrmw.c$'
>   	find "$WHERE/functional" -type f -name '*.c'
>   	;;
>   test-tools)
> diff --git a/testcases/open_posix_testsuite/stress/Makefile b/testcases/open_posix_testsuite/stress/Makefile
> index b09527f..d6872a9 100644
> --- a/testcases/open_posix_testsuite/stress/Makefile
> +++ b/testcases/open_posix_testsuite/stress/Makefile
> @@ -5,7 +5,7 @@
>   #
> 
>   all clean install test:
> -	@for dir in `ls -d */Makefile 2>/dev/null | sed -e 's,/Makefile$$,,g'`; do \
> +	@for dir in `find . -name *Makefile | egrep -v '^./Makefile' | sed -e 's,/Makefile$$,,g'`; do \
>   		$(MAKE) -C $$dir $@;						  \
>   	done
> 
> --
> 2.6.2
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
