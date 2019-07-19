Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 936376E499
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 12:59:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 63E183C1D46
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jul 2019 12:59:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 732833C0300
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 12:59:22 +0200 (CEST)
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0081F6008E5
 for <ltp@lists.linux.it>; Fri, 19 Jul 2019 12:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=h2yT/
 WxGJZnuLNnJRojzr2dMkcnsKa9cCUj/kpQmD4Y=; b=nZL8cJ/4nwYbq5nuaYyrq
 EbcAJkuRx1yaB+H3cfsZ6aR5c31chNWsICcyx/LDBiJVGiXOEx1rHYJJwAiLbnOX
 uxOy1q0hw+0h6atTyIhlLPjvO3tAXX6ik++P47+Kgl1qRxI/0ST2268A31Gjcuti
 vM592o7apvtKwP2Jq697nY=
Received: from [192.168.1.168] (unknown [112.25.212.39])
 by smtp9 (Coremail) with SMTP id DcCowAA3b4uBojFdKNPcBw--.10588S2;
 Fri, 19 Jul 2019 18:59:14 +0800 (CST)
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, ltp@lists.linux.it
References: <1563533334-2232-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <1b8b7f73-fd31-58d2-5162-3648fa9729a5@163.com>
Date: Fri, 19 Jul 2019 18:59:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1563533334-2232-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Content-Language: en-US
X-CM-TRANSID: DcCowAA3b4uBojFdKNPcBw--.10588S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw4UZrW5uF1rJF1rGrWDCFg_yoW5Aw1xpa
 9xX3W8CFn8GFyjk3Z5J3W2gan5G398GF1fWayDurs7ZF13A3WUJrsFkrWkWa48GayDX34F
 gF4SgF4IgrWUXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b-hL8UUUUU=
X-Originating-IP: [112.25.212.39]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiEAP2XlWBnILXAAAAsm
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] m4: remove useless ltp-securebits.m4
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

Hi Xu,

LGTM. :-)

Reviewed-by: Xiao Yang <ice_yangxiao@163.com>

Best Regards,

Xiao Yang

On 07/19/2019 06:48 PM, Yang Xu wrote:
> Since commit fe9d9218c, we have detected linux/securebits.h in
> confiure.ac. one place used the HAVE_SECUREBITS(ltp-securebits.m4
> defined), it only controls compile. kernel/security/securebits/
> check_keepcaps.c has HAVE_LINUX_SECUREBITS_H check in internal,
> so removing it is safe.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   configure.ac                       |  1 -
>   include/mk/features.mk.default     |  3 ---
>   include/mk/features.mk.in          |  3 ---
>   m4/ltp-securebits.m4               | 10 ----------
>   testcases/kernel/security/Makefile |  4 ----
>   5 files changed, 21 deletions(-)
>   delete mode 100644 m4/ltp-securebits.m4
>
> diff --git a/configure.ac b/configure.ac
> index 3dcf282e8..f899d8ebc 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -226,7 +226,6 @@ LTP_CHECK_NOMMU_LINUX
>   LTP_CHECK_PERF_EVENT
>   LTP_CHECK_PRCTL_SUPPORT
>   LTP_CHECK_RLIMIT64
> -LTP_CHECK_SECUREBITS
>   LTP_CHECK_SELINUX
>   LTP_CHECK_SIGNAL
>   LTP_CHECK_STATX
> diff --git a/include/mk/features.mk.default b/include/mk/features.mk.default
> index 94b8b0c54..3a6cc5176 100644
> --- a/include/mk/features.mk.default
> +++ b/include/mk/features.mk.default
> @@ -29,9 +29,6 @@ WITH_PYTHON			:= no
>   
>   # Features knobs
>   
> -# Is securebits[.h], et all support available?
> -HAVE_SECUREBITS			:= no
> -
>   # Test suite knobs
>   
>   # Enable testcases/kernel/power_management's compile and install?
> diff --git a/include/mk/features.mk.in b/include/mk/features.mk.in
> index 7536b6f20..8e561b738 100644
> --- a/include/mk/features.mk.in
> +++ b/include/mk/features.mk.in
> @@ -29,9 +29,6 @@ WITH_PYTHON			:= @WITH_PYTHON@
>   
>   # Features knobs
>   
> -# Is securebits[.h], et all support available?
> -HAVE_SECUREBITS			:= @HAVE_SECUREBITS@
> -
>   # Test suite knobs
>   
>   # Enable testcases/kernel/power_management's compile and install?
> diff --git a/m4/ltp-securebits.m4 b/m4/ltp-securebits.m4
> deleted file mode 100644
> index 7888e6335..000000000
> --- a/m4/ltp-securebits.m4
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -dnl SPDX-License-Identifier: GPL-2.0-or-later
> -dnl Copyright (c) Serge Hallyn (2010)
> -
> -AC_DEFUN([LTP_CHECK_SECUREBITS],[
> -	AC_CHECK_HEADERS(linux/securebits.h,[have_securebits=yes])
> -if test "x$have_securebits" != xyes; then
> -	have_securebits=no
> -fi
> -AC_SUBST(HAVE_SECUREBITS,$have_securebits)
> -])
> diff --git a/testcases/kernel/security/Makefile b/testcases/kernel/security/Makefile
> index 0b4b98b83..eea794aa9 100644
> --- a/testcases/kernel/security/Makefile
> +++ b/testcases/kernel/security/Makefile
> @@ -24,10 +24,6 @@ top_srcdir		?= ../../..
>   
>   include	$(top_srcdir)/include/mk/env_pre.mk
>   
> -ifneq ($(HAVE_SECUREBITS),yes)
> -FILTER_OUT_DIRS		+= securebits
> -endif
> -
>   OPT_CFLAGS		+= -O
>   DEBUG_LDFLAGS		+= -s
>   



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
