Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE5A6C4B4B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 14:09:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A07E3CCBF2
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 14:09:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33CF93CA4EB
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 14:09:18 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2FFC01000A14
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 14:09:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3DA8F33B37;
 Wed, 22 Mar 2023 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1679490556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwjHYjFu97N1Uc5b0K4EIitH424YpCqSCrQoagAM0eo=;
 b=wmRLdBJapBUtWbA0zBcDp1RK+OZegH38KLkEwwtCXFu8cqP8cxjDhQgJ9KlPwhrmNhym97
 1mhL5zigX/ISz5M0jlWrboX2AuTtwMMKZcPbtpViqJOr1wJT2hb/RGdTJrVsCg2QfjFbJ+
 qVLAyxVc1SwjyT9wS0V2mH2riMTU2ck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1679490556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lwjHYjFu97N1Uc5b0K4EIitH424YpCqSCrQoagAM0eo=;
 b=LaxHTliF2ro5SFMLTMZ6kchunCn9TsrSvyVB9sbqyJs60hxeiinpFJWvbHFoZpj8ZZRQ2G
 zxgDfPHkQGnTUpDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A3AC138E9;
 Wed, 22 Mar 2023 13:09:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wf9zCfz9GmRTdAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Mar 2023 13:09:16 +0000
Date: Wed, 22 Mar 2023 14:10:27 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <ZBr+Q9xW68Q2V+8d@yuki>
References: <20230217151036.10295-1-pvorel@suse.cz>
 <20230217151036.10295-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230217151036.10295-3-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] tst_net.sh: Detect IPv6 disabled on
 interface via sysctl
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
> IPv6 on interface can be also disabled by sysctl
> net.ipv6.conf.$iface.disable_ipv6=1. This is better to be checked:
> * for all interfaces before run (can be disabled even for netns
>   interface previously created).
> * before ip addr command tries to work with IPv6 (in tst_init_iface()
>   and tst_add_ipaddr(), other functions should run these before)
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  testcases/lib/tst_net.sh | 46 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
> index 96eed50793..f414dd9359 100644
> --- a/testcases/lib/tst_net.sh
> +++ b/testcases/lib/tst_net.sh
> @@ -121,6 +121,47 @@ tst_net_detect_ipv6()
>  	TST_NET_IPV6_ENABLED=1
>  }
>  
> +# Detect IPv6 disabled on interface via sysctl
> +# net.ipv6.conf.$iface.disable_ipv6=1.
> +# $TST_NET_IPV6_ENABLED: 1 on IPv6 enabled, 0 on IPv6 disabled.
> +# return: 0 on IPv6 enabled, 1 on IPv6 disabled.
> +tst_net_detect_ipv6_iface()
> +{
> +	[ "$TST_NET_IPV6_ENABLED" = 1 ] || return 1
> +
> +	local iface="$1"
> +	local type="${2:-lhost}"
> +	local check="sysctl -n net.ipv6.conf.$iface.disable_ipv6"

Here as well.

> +	local disabled
> +
> +	if [ "$type" = "lhost" ]; then
> +		disabled=$($check)
> +	else
> +		disabled=$(tst_rhost_run -c "$check")
> +	fi
> +	if [ $disabled = 1 ]; then
> +		tst_res_ TINFO "IPv6 disabled on $type on $iface"
> +		TST_NET_IPV6_ENABLED=0
> +		return 1
> +	fi
> +
> +	return 0
> +}
> +
> +# Detect IPv6 disabled on used interfaces.
> +tst_net_check_ifaces_ipv6()
> +{
> +	local iface
> +
> +	for iface in $(tst_get_ifaces); do
> +		tst_net_detect_ipv6_iface || return
                                          ^
					  $iface
> +	done
> +
> +	for iface in $(tst_get_ifaces rhost); do
> +		tst_net_detect_ipv6_iface $iface rhost || return
> +	done
> +}
> +
>  tst_net_require_ipv6()
>  {
>  	[ "$TST_NET_IPV6_ENABLED" = 1 ] || tst_brk_ TCONF "IPv6 disabled"
> @@ -531,7 +572,9 @@ tst_init_iface()
>  	local type="${1:-lhost}"
>  	local link_num="${2:-0}"
>  	local iface="$(tst_iface $type $link_num)"
> +
>  	tst_res_ TINFO "initialize '$type' '$iface' interface"
> +	tst_net_detect_ipv6_iface $iface $type
>  
>  	if [ "$type" = "lhost" ]; then
>  		if ip xfrm state 1>/dev/null 2>&1; then
> @@ -591,6 +634,8 @@ tst_add_ipaddr()
>  	local link_num="${2:-0}"
>  	local iface=$(tst_iface $type $link_num)
>  
> +	tst_net_detect_ipv6_iface $iface $type
> +
>  	if [ "$TST_IPV6" ]; then
>  		dad="nodad"
>  		[ "$type" = "lhost" ] && mask=$IPV6_LPREFIX || mask=$IPV6_RPREFIX
> @@ -1005,6 +1050,7 @@ tst_net_setup_network()
>  		$IPV4_RHOST/$IPV4_RPREFIX || echo "exit $?")
>  
>  	if [ "$TST_NET_IPV6_ENABLED" = 1 ]; then
> +		tst_net_check_ifaces_ipv6
>  		eval $(tst_net_iface_prefix $IPV6_LHOST || echo "exit $?")
>  		eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV6_RHOST \
>  			|| echo "exit $?")
> -- 
> 2.39.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
