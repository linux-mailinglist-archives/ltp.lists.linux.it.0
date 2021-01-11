Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1702F176D
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 15:06:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C73EF3C5FD2
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 15:06:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C25243C5E04
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 15:06:40 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 43CFD1000A20
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 15:06:39 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D2C8AE46;
 Mon, 11 Jan 2021 14:06:39 +0000 (UTC)
Date: Mon, 11 Jan 2021 15:07:36 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <X/xbqGf+q8LQkXCw@yuki.lan>
References: <X/R/2VVe1dJxGhHN@yuki.lan>
 <20210110130436.9514-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210110130436.9514-1-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 1/2] include/tst_test_macros.h: Add
 TST_EXP_SILENT_{PASS, FD} macros
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

Hi!
> 1) TST_EXP_SILENT_{PASS,FD} don't report TPASS when SCALL succeeds.
> 2) TST_EXP_{PASS,FD} calls TST_EXP_SILENT_{PASS,FD} and report
>    TPASS when SCALL succeeds.

I think that the macros should have the silent after the {PASS,FD} since
that would be less confusing. I other words what is silent fd?

So I would name these as TST_EXP_FD_SILENT() or maybe
TST_EXP_FD_QUIET().

Other than that the change looks good.

> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
> ---
>  include/tst_test_macros.h | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 3016d95c2..8b71da00b 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -46,7 +46,7 @@ extern void *TST_RET_PTR;
>  	tst_res_(__FILE__, __LINE__, RES, \
>  		TST_FMT_(TST_2_(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__), PAR)
>  
> -#define TST_EXP_FD(SCALL, ...)                                                 \
> +#define TST_EXP_SILENT_FD(SCALL, ...)                                          \
>  	do {                                                                   \
>  		TEST(SCALL);                                                   \
>  		                                                               \
> @@ -64,14 +64,20 @@ extern void *TST_RET_PTR;
>  			break;                                                 \
>  		}                                                              \
>                                                                                 \
> -		TST_MSGP_(TPASS, " returned fd %ld", TST_RET,                  \
> -		         #SCALL, ##__VA_ARGS__);                               \
> -                                                                               \
>  		TST_PASS = 1;                                                  \
>                                                                                 \
>  	} while (0)
>  
> -#define TST_EXP_PASS(SCALL, ...)                                               \
> +#define TST_EXP_FD(SCALL, ...)                                                 \
> +	do {                                                                   \
> +		TST_EXP_SILENT_FD(SCALL, __VA_ARGS__);                         \
> +		                                                               \
> +		if (TST_PASS)                                                  \
> +			TST_MSGP_(TPASS, " returned fd %ld", TST_RET,          \
> +				#SCALL, ##__VA_ARGS__);                        \
> +	} while (0)
> +
> +#define TST_EXP_SILENT_PASS(SCALL, ...)                                        \
>  	do {                                                                   \
>  		TEST(SCALL);                                                   \
>  		                                                               \
> @@ -89,12 +95,17 @@ extern void *TST_RET_PTR;
>  			break;                                                 \
>  		}                                                              \
>                                                                                 \
> -		TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);             \
> -                                                                               \
>  		TST_PASS = 1;                                                  \
>                                                                                 \
>  	} while (0)
>  
> +#define TST_EXP_PASS(SCALL, ...)                                               \
> +	do {                                                                   \
> +		TST_EXP_SILENT_PASS(SCALL, __VA_ARGS__);                       \
> +		                                                               \
> +		if (TST_PASS)                                                  \
> +			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
> +	} while (0)                                                            \
>  
>  #define TST_EXP_FAIL(SCALL, ERRNO, ...)                                        \
>  	do {                                                                   \
> -- 
> 2.21.0
> 
> 
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
