Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7CE25569F
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 10:43:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42FD03C2E4A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 10:43:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 08FA33C25A9
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 10:43:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6B0611A00E03
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 10:43:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5B62BB585;
 Fri, 28 Aug 2020 08:44:08 +0000 (UTC)
Date: Fri, 28 Aug 2020 10:43:34 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200828084334.GA1648@dell5510>
References: <1598005119-2147-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598005119-2147-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_af_alg: fix build error when
 ALG_SET_AEAD_ASSOCLEN undefined
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

>  configure.ac          |  6 ++++++
>  include/lapi/if_alg.h | 39 ++++++++++++++++++++++++++++++---------
>  2 files changed, 36 insertions(+), 9 deletions(-)

> diff --git a/configure.ac b/configure.ac
> index 382963d8b..f711ac123 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -193,6 +193,12 @@ AC_CHECK_TYPES([struct xt_entry_match, struct xt_entry_target],,,[
>  #include <linux/netfilter_ipv4/ip_tables.h>
>  ])

> +AC_CHECK_TYPES([struct sockaddr_alg, struct af_alg_iv],,,[
> +#ifdef HAVE_LINUX_IF_ALG_H
> +# include <linux/if_alg.h>
> +#endif
> +])
nit: This list was meant to be sorted. I'll handle that during merge.
> +
>  # Tools knobs

>  # Expect
> diff --git a/include/lapi/if_alg.h b/include/lapi/if_alg.h
> index 5a74df99b..9c04a444c 100644
> --- a/include/lapi/if_alg.h
> +++ b/include/lapi/if_alg.h
> @@ -8,9 +8,10 @@

>  #ifdef HAVE_LINUX_IF_ALG_H
>  #  include <linux/if_alg.h>
> -#else
> +#endif
>  #  include <stdint.h>
BTW <stdint.h> is needed only for "#ifndef HAVE_STRUCT_SOCKADDR_ALG" and "#ifndef
HAVE_STRUCT_AF_ALG_IVL" (for uint*_t) but we can ignore that as a detail (better
than have complicated guarder:
#if ! (defined(HAVE_STRUCT_SOCKADDR_ALG) && defined(HAVE_STRUCT_AF_ALG_IVL)

(and later forgot to update it).

> +#ifndef HAVE_STRUCT_SOCKADDR_ALG
>  struct sockaddr_alg {
>  	uint16_t	salg_family;
>  	uint8_t		salg_type[14];
> @@ -18,21 +19,41 @@ struct sockaddr_alg {
>  	uint32_t	salg_mask;
>  	uint8_t		salg_name[64];
>  };
> +#endif

The rest lgtm:
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
