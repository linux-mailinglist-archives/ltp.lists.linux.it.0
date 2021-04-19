Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF31363E24
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 11:02:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C68C83C6D75
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 11:02:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 524103C19F2
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 11:02:47 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5E31410009AF
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 11:02:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5126B1C8;
 Mon, 19 Apr 2021 09:02:46 +0000 (UTC)
Date: Mon, 19 Apr 2021 10:49:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: ice_yangxiao@163.com
Message-ID: <YH1EJ8BmbYTBOvdk@yuki>
References: <20210419044112.31443-1-ice_yangxiao@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419044112.31443-1-ice_yangxiao@163.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] include/tst_test_macros.h: Add TST_EXP_PID
 and TST_EXP_PID_SILENT macros
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
> Signed-off-by: Xiao Yang <yangx.jy@fujitsu.com>
> ---
>  include/tst_test_macros.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
> index 189891507..101ac2c87 100644
> --- a/include/tst_test_macros.h
> +++ b/include/tst_test_macros.h
> @@ -77,6 +77,17 @@ extern void *TST_RET_PTR;
>  				#SCALL, ##__VA_ARGS__);                        \
>  	} while (0)
>  
> +#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_FD_SILENT(SCALL, __VA_ARGS__)

Maybe we should rename the TST_EXP_FD_SILENT() to TST_EXP_POSITIVE() and
then define both TST_EXP_PID_SILENT() and TST_EXP_FD_SILENT() based on
TST_EXP_POSITIVE(), but that's very minor.

Looks good to me:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

> +#define TST_EXP_PID(SCALL, ...)                                                \
> +	do {                                                                   \
> +		TST_EXP_PID_SILENT(SCALL, __VA_ARGS__);                        \
> +									       \
> +		if (TST_PASS)                                                  \
> +			TST_MSGP_(TPASS, " returned pid %ld", TST_RET,         \
> +				#SCALL, ##__VA_ARGS__);                        \
> +	} while (0)
> +
>  #define TST_EXP_PASS_SILENT(SCALL, ...)                                        \
>  	do {                                                                   \
>  		TEST(SCALL);                                                   \
> -- 
> 2.26.2
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
