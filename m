Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F791A2DD5
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 05:12:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5B6F3C2D40
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Apr 2020 05:12:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3A2483C2D12
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 05:12:34 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 16279601265
 for <ltp@lists.linux.it>; Thu,  9 Apr 2020 05:12:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,361,1580745600"; d="scan'208";a="88723949"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 11:12:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 8CCB050A9971;
 Thu,  9 Apr 2020 11:02:00 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 11:12:24 +0800
To: <laniel_francis@privacyrequired.com>
References: <208a947b-a64a-0962-b3de-0756f1cc1c92@cn.fujitsu.com>
 <20200408211700.7958-2-laniel_francis@privacyrequired.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0a337c22-c05d-3f9a-d918-6d96762ce0db@cn.fujitsu.com>
Date: Thu, 9 Apr 2020 11:12:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200408211700.7958-2-laniel_francis@privacyrequired.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 8CCB050A9971.AAB1D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Add SAFE_PIPE2.
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

Hi Laniel

Usually, we should add safe macro for new and old api.
We have old/safe_macros.h.

But ltp only has three places to use pipe2(pipe2_01,02,03), and
pipe2_01,02 use ltp_syscall to call pipe2, so I think it is ok.

only a small nit:
move safe_pipe2() declaration to tst_safe_macros.h. We don't need to add 
it into safe_macros_fn.h. ie commit f59fa0de ("Add SAFE_PTRACE() to LTP 
library").

Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Best Regards
Yang Xu
> From: Francis Laniel <laniel_francis@privacyrequired.com>
> 
> This macro is the equivalent of SAFE_PIPE for pipe2 system call.
> ---
>   include/safe_macros_fn.h  |  3 +++
>   include/tst_safe_macros.h |  3 +++
>   lib/safe_macros.c         | 15 +++++++++++++++
>   3 files changed, 21 insertions(+)
> 
> diff --git a/include/safe_macros_fn.h b/include/safe_macros_fn.h
> index 3df952811..ec2d34ae3 100644
> --- a/include/safe_macros_fn.h
> +++ b/include/safe_macros_fn.h
> @@ -67,6 +67,9 @@ int safe_open(const char *file, const int lineno,
>   int safe_pipe(const char *file, const int lineno,
>                 void (*cleanup_fn)(void), int fildes[2]);
>   
> +int safe_pipe2(const char *file, const int lineno, void (*cleanup_fn) (void),
> +               int fildes[2], int flags);
> +
>   ssize_t safe_read(const char *file, const int lineno,
>                     void (*cleanup_fn)(void), char len_strict, int fildes,
>                     void *buf, size_t nbyte);
> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> index d95d26219..1738d3cc6 100644
> --- a/include/tst_safe_macros.h
> +++ b/include/tst_safe_macros.h
> @@ -87,6 +87,9 @@ static inline int safe_dup(const char *file, const int lineno,
>   #define SAFE_PIPE(fildes) \
>   	safe_pipe(__FILE__, __LINE__, NULL, (fildes))
>   
> +#define SAFE_PIPE2(fildes, flags) \
> +	safe_pipe2(__FILE__, __LINE__, NULL, (fildes), (flags))
> +
>   #define SAFE_READ(len_strict, fildes, buf, nbyte) \
>   	safe_read(__FILE__, __LINE__, NULL, (len_strict), (fildes), (buf), (nbyte))
>   
> diff --git a/lib/safe_macros.c b/lib/safe_macros.c
> index dde9b7b5e..780245821 100644
> --- a/lib/safe_macros.c
> +++ b/lib/safe_macros.c
> @@ -248,6 +248,21 @@ int safe_pipe(const char *file, const int lineno, void (*cleanup_fn) (void),
>   	return rval;
>   }
>   
> +int safe_pipe2(const char *file, const int lineno, void (*cleanup_fn) (void),
> +               int fildes[2], int flags)
> +{
> +	int rval;
> +
> +	rval = pipe2(fildes, flags);
> +	if (rval == -1) {
> +		tst_brkm(TBROK | TERRNO, cleanup_fn,
> +			 "%s:%d: pipe2({%d,%d}) failed",
> +			 file, lineno, fildes[0], fildes[1]);
> +	}
> +
> +	return rval;
> +}
> +
>   ssize_t safe_read(const char *file, const int lineno, void (*cleanup_fn) (void),
>                     char len_strict, int fildes, void *buf, size_t nbyte)
>   {
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
