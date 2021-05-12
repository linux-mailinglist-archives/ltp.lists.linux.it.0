Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6D637BC42
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 14:09:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 335473C8A5D
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 14:09:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7DB5D3C4CA5
 for <ltp@lists.linux.it>; Wed, 12 May 2021 14:09:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BAC5D600661
 for <ltp@lists.linux.it>; Wed, 12 May 2021 14:09:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06048AF1F;
 Wed, 12 May 2021 12:09:00 +0000 (UTC)
Date: Wed, 12 May 2021 13:42:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJu/L3HssZY14vQa@yuki>
References: <20210512103052.9646-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512103052.9646-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] netns_helper.sh: Fix parsing recent iproute2
 versions
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
Cc: Alexey Kodanev <alexey.kodanev@oracle.com>,
 Feiyu Zhu <zhufy.jy@cn.fujitsu.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
> index a5b77a0aa..4dac0e306 100755
> --- a/testcases/kernel/containers/netns/netns_helper.sh
> +++ b/testcases/kernel/containers/netns/netns_helper.sh
> @@ -47,16 +47,21 @@ IFCONF_IN6_ARG=
>  
>  tst_check_iproute()
>  {
> -	local cur_ipver="$(ip -V)"
> -	local spe_ipver="$1"
> +	local current_ver="$(ip -V)"
> +	local expected_ver="111010"

So if I'm reading this right, this is 2010 again. I wonder if we can
just remove this check as well.

I guess that the most safe variant at the moment would be pushing this
patch, then dropping the check completely after the release.

> -	cur_ipver=${cur_ipver##*s}
> +	current_ver=${current_ver##*s}
>  
> -	if [ -z "$cur_ipver" -o -z "$spe_ipver" ]; then
> +	if [ -z "$current_ver" ]; then
>  		tst_brk TBROK "failed to obtain valid iproute version"
>  	fi
>  
> -	if [ $cur_ipver -lt $spe_ipver ]; then
> +	# new version scheme since v5.7.0-77-gb687d1067169
> +	if echo "$current_ver" | grep -q 'iproute2-v\?[0-9]\+\.'; then
> +		return
> +	fi
> +
> +	if [ $current_ver -lt $expected_ver ]; then
>  		tst_brk TCONF "too old iproute version"
>  	fi
>  }
> -- 
> 2.31.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
