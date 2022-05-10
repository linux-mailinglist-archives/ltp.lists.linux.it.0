Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA7752171A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 15:19:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4995F3CA96A
	for <lists+linux-ltp@lfdr.de>; Tue, 10 May 2022 15:19:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F1CCC3CA44E
 for <ltp@lists.linux.it>; Tue, 10 May 2022 15:19:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2DE1B600325
 for <ltp@lists.linux.it>; Tue, 10 May 2022 15:19:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6402A21BFE;
 Tue, 10 May 2022 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652188783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVOCuqxkfz0fVKbyW+kEGtSy7ejSDYe3enmyE7WuPc0=;
 b=M1feliD/ga9ZCZ4WXMYfLdfzWqQOc4P3313AbU/KiLku4TqQ/gb8vf00OxR3xicO7EbxaN
 xuZ8WaNSh53h99M7M6uErYK4dIIouC7dcYgzd0oa1us3jTko7QxkoP4sl9nXSDTaKNjAQq
 uw6UE8Avz2h5o//4ex24LRgiI1RAH/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652188783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVOCuqxkfz0fVKbyW+kEGtSy7ejSDYe3enmyE7WuPc0=;
 b=A2jpQzWPIon72PmrksduSsQ74PptIiqXcSz6DKRcMm5tNKbmeE+q4Yx7snJnB2c1tCOkVw
 m31Wcq7qZtgmR+CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5033613AC1;
 Tue, 10 May 2022 13:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ufhBEm9memLnJAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 10 May 2022 13:19:43 +0000
Date: Tue, 10 May 2022 15:21:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Ynpm8zmnkyi4rBik@yuki>
References: <20220510065104.1199-1-pvorel@suse.cz>
 <20220510065104.1199-2-pvorel@suse.cz> <YnpXGnJyjjZhxuRN@yuki>
 <YnpjcH4i33YxyeFJ@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnpjcH4i33YxyeFJ@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] tst_net.sh: Fix for disabled IPv6
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git testcases/lib/tst_net.sh testcases/lib/tst_net.sh
> index 29d80df89..48dd6e8eb 100644
> --- testcases/lib/tst_net.sh
> +++ testcases/lib/tst_net.sh
> @@ -1008,7 +1008,7 @@ if [ -z "$_tst_net_parse_variables" ]; then
>         eval $(tst_net_ip_prefix $IPV4_LHOST || echo "exit $?")
>         eval $(tst_net_ip_prefix -r $IPV4_RHOST || echo "exit $?")
> 
> -       tst_net_detect_ipv6 rhost
> +       [ "$TST_NET_IPV6_ENABLED" = 1 ] && tst_net_detect_ipv6 rhost

That solves the case where lhost does not support ipv6 but rhost does,
but there is still case where lhost does support it but rhost does not,
to fix that we have to clear TST_NET_IPV6_ENABLED in the
tst_net_detect_ipv6() as well.

	if [ $ret -eq 0 ]; then
		TST_NET_IPV6_ENABLED=1
	else
		TST_NET_IPV6_ENABLED=0
		tst_res TINFO "IPv6 disabled on $type"
	fi

>         if [ "$TST_NET_IPV6_ENABLED" = 1 ]; then
>                 eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
> 
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
