Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50627396ED4
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 10:22:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8FD43C8044
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 10:22:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 647623C1939
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 10:22:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BD1551A00E10
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 10:22:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 967C31FD2E;
 Tue,  1 Jun 2021 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622535769;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QODA12IDeA6U/aMxCwfI51M2UgfgRfYcxqPh1ybHsJM=;
 b=ihoFRokMKfp3EoiuwToRvoKOn6pJ4Zt38u47d+fe44jV1L6T2ldjXI7O3urGx4e9DaI80H
 BBIRvm/dmXVjcytiQytHLwZuZ71A7hezPp5+SP292gfK6DC0UjwEmGdp+GZiINKJVcawj4
 vH+E55hp4vt78U+3J45o2G/oSDzepD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622535769;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QODA12IDeA6U/aMxCwfI51M2UgfgRfYcxqPh1ybHsJM=;
 b=QFdZJkGC9xWY8S7/JBavKYUhairQ1pkTOTbdVJzXJH/LQV82QgW0yGr736zQB0AcL12WJT
 u0BN19yOwpHt63BQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2C21511A98;
 Tue,  1 Jun 2021 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622535769;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QODA12IDeA6U/aMxCwfI51M2UgfgRfYcxqPh1ybHsJM=;
 b=ihoFRokMKfp3EoiuwToRvoKOn6pJ4Zt38u47d+fe44jV1L6T2ldjXI7O3urGx4e9DaI80H
 BBIRvm/dmXVjcytiQytHLwZuZ71A7hezPp5+SP292gfK6DC0UjwEmGdp+GZiINKJVcawj4
 vH+E55hp4vt78U+3J45o2G/oSDzepD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622535769;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QODA12IDeA6U/aMxCwfI51M2UgfgRfYcxqPh1ybHsJM=;
 b=QFdZJkGC9xWY8S7/JBavKYUhairQ1pkTOTbdVJzXJH/LQV82QgW0yGr736zQB0AcL12WJT
 u0BN19yOwpHt63BQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oZnACVnutWCzQwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 01 Jun 2021 08:22:49 +0000
Date: Tue, 1 Jun 2021 10:22:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YLXuV//RKGTO2Ics@pevik>
References: <20210531135314.5067-1-mdoucha@suse.cz>
 <20210531135314.5067-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531135314.5067-2-mdoucha@suse.cz>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.50
X-Spamd-Result: default: False [-4.50 / 100.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.00)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; REPLY(-4.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] network/busy_poll: Remove unnecessary driver
 check
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

Hi Martin,

> Kernel v4.5 extended the busy_poll functionality to all network drivers.
> Limiting the test only to drivers which implemented busy_poll as internal
> feature on older kernels does not make sense.

Ah, you mean 85c72ba1ed0c ("Merge branch 'net-generic-busy-polling'")
Good catch, thx!!

Fixes: ead28f929 ("busy_poll: skip busy_poll flag test on kernels 4.5+")

Kind regards,
Petr

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  testcases/network/busy_poll/busy_poll_lib.sh | 4 ----
>  1 file changed, 4 deletions(-)

> diff --git a/testcases/network/busy_poll/busy_poll_lib.sh b/testcases/network/busy_poll/busy_poll_lib.sh
> index 5270a1bbd..d17504466 100755
> --- a/testcases/network/busy_poll/busy_poll_lib.sh
> +++ b/testcases/network/busy_poll/busy_poll_lib.sh
> @@ -25,9 +25,5 @@ busy_poll_check_config()
>  		ethtool --show-features $(tst_iface) | \
>  			grep -q 'busy-poll.*on' || \
>  			tst_brk TCONF "busy poll not supported by driver"
> -	else
> -		drvs="bnx2x|bnxt|cxgb4|enic|benet|ixgbe|ixgbevf|mlx4|mlx5|myri10ge|sfc|virtio"
> -		ethtool -i $(tst_iface) | grep -qE "driver: ($drvs)" || \
> -			tst_brk TCONF "busy poll not supported"
>  	fi
>  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
