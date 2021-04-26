Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32536ABD9
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 07:42:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 015EC3C674A
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 07:42:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4FAB23C19B9
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 07:42:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 72816600633
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 07:42:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A40CAF42;
 Mon, 26 Apr 2021 05:42:38 +0000 (UTC)
Date: Mon, 26 Apr 2021 07:42:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: sujiaxun <sujiaxun@uniontech.com>
Message-ID: <YIZSzNd9uK8kItYb@pevik>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422072609.9938-1-sujiaxun@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi sujiaxun,

[ Cc: Viresh, the original author ]

> https://github.com/torvalds/linux/blob/master/arch/mips/include/uapi/asm/shmbuf.h
> The mips 64-bit macro definition in the kernel is "__mips64",
>  and the mips 64-bit macro definition in the ltp is "__arch64__".

> Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
> ---
>  include/lapi/msgbuf.h | 2 +-
>  include/lapi/sembuf.h | 2 +-
>  include/lapi/shmbuf.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

> diff --git a/include/lapi/msgbuf.h b/include/lapi/msgbuf.h
> index f3277270d..f010695f1 100644
> --- a/include/lapi/msgbuf.h
> +++ b/include/lapi/msgbuf.h
> @@ -17,7 +17,7 @@
>  #if defined(__mips__)
>  #define HAVE_MSQID64_DS

> -#if defined(__arch64__)
> +#if defined(__mips64)
So __arch64__ is not defined for mips 64 bit? (as it's defined for sparc 64bit?)
__mips64 is obviously correct and better readable, but is it really required?
(you can check it with: echo | gcc -dM -E -).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
