Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB92F4214
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 03:53:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CB423C644C
	for <lists+linux-ltp@lfdr.de>; Wed, 13 Jan 2021 03:53:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 55C093C25EF
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 03:53:33 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id EC4E92003B2
 for <ltp@lists.linux.it>; Wed, 13 Jan 2021 03:53:31 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,343,1602518400"; d="scan'208";a="103425776"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 10:53:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 79C764CE602E;
 Wed, 13 Jan 2021 10:53:27 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 10:53:26 +0800
Message-ID: <5FFE60C0.1010706@cn.fujitsu.com>
Date: Wed, 13 Jan 2021 10:53:52 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <petr.vorel@gmail.com>
References: <20210112233758.11658-1-petr.vorel@gmail.com>
In-Reply-To: <20210112233758.11658-1-petr.vorel@gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 79C764CE602E.AC35A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] Fix struct __kernel_old_timeval redefinition
 on 64bit sparc
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

HI Petr

This patch is obviously ok, merged.

Best Regards
Yang Xu
> 64bit sparc is the only arch which defines struct __kernel_old_timeval
> in it's asm/posix_types.h header, thus guard it.
> 
> NOTE: previously it was guarded with __kernel_timex, which worked as well.
> 
> Fixes: a6607b81b ("syscalls: Don't pass struct timeval to tst_syscall()")
> 
> Signed-off-by: Petr Vorel<petr.vorel@gmail.com>
> ---
>   include/tst_timer.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/tst_timer.h b/include/tst_timer.h
> index d2c3f3cb1..657c0824f 100644
> --- a/include/tst_timer.h
> +++ b/include/tst_timer.h
> @@ -99,10 +99,12 @@ static inline long long tst_timeval_diff_ms(struct timeval t1,
> 
>   typedef __kernel_long_t	__kernel_old_time_t;
> 
> +#ifndef __kernel_old_timeval
>   struct __kernel_old_timeval {
>   	__kernel_old_time_t	tv_sec;		/* seconds */
>   	__kernel_suseconds_t	tv_usec;	/* microseconds */
>   };
> +#endif
> 
>   struct __kernel_old_timespec {
>   	__kernel_old_time_t	tv_sec;		/* seconds */




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
