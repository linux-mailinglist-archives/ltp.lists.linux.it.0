Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 105653A1277
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 13:20:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BC753C8F0A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 13:20:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC24D3C3230
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 13:20:50 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 68FE2100116B
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 13:20:50 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=mussarela)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <cascardo@canonical.com>)
 id 1lqwGO-0003sl-Ng; Wed, 09 Jun 2021 11:20:49 +0000
Date: Wed, 9 Jun 2021 08:20:39 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YMCkB/iS54OJaby4@mussarela>
References: <20210608132723.255996-1-cascardo@canonical.com>
 <YMB6aoVvTKJQ6wif@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMB6aoVvTKJQ6wif@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_wake04: avoid tst_ts_from_ns overflow on
 32-bit platforms
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Jun 09, 2021 at 10:23:06AM +0200, Cyril Hrubis wrote:
> Hi!
> Good catch, I guess that it would be slightly cleaner to fix the
> NSEC_PER_SEC size instead with:
> 
> diff --git a/include/lapi/common_timers.h b/include/lapi/common_timers.h
> index b783beff4..e50f698d6 100644
> --- a/include/lapi/common_timers.h
> +++ b/include/lapi/common_timers.h
> @@ -12,7 +12,7 @@
>  #include "lapi/posix_clocks.h"
> 
>  #ifndef NSEC_PER_SEC
> -#define NSEC_PER_SEC (1000000000L)
> +#define NSEC_PER_SEC (1000000000LL)
>  #endif
> 
>  static const clock_t clock_list[] = {
> 
> 
> What do you think?
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

Yeah, I even wrote and tested that it would build, but I wasn't able to go
through any build logs or run complete tests.

But maybe I am just overthinking this, and any promotions due to this would
only fix issues and not introduce any new ones.

Well, on second thought, on 32-bit, in cases like variadic functions, it could
cause a problem. So, I am just afraid that applying this fix without looking
for every use of NSEC_PER_SEC might lead to new bugs.

Cascardo.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
