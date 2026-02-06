Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICeAC0n9hWnUIwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 15:40:09 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE34FF145
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 15:40:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 296103CC997
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 15:40:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD6F33CC816
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 15:39:58 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 49D64200DB1
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 15:39:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDF853E6D4;
 Fri,  6 Feb 2026 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770388796;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDXLgiWjXpQ6Kq402rYqS0b4YNAtvG7va1JhY25U5ZM=;
 b=YSDJVosQPZC/q2dHZhpf34Qe9Ts7Kh+icZ4s6kInmGJbVpXXk/ETOzpSm2cjTDvHB1thdA
 9pI07gCBFVGvq0aC6ADaBCwtK84fK+PzAFBdReshZPP7iQFqnftXlmf1DmwaBM3mGY9oei
 UW88b+cjsK0bIPAftClrGraBwsErkKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770388796;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDXLgiWjXpQ6Kq402rYqS0b4YNAtvG7va1JhY25U5ZM=;
 b=UcCWajIFmvrGCVES3CZbKjU73YFQQDE+G3WAbxz627a5l5XJ8VPWSjHZWhtb6hn00+GuCr
 9ibbAyDtVn0+YxDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=YSDJVosQ;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=UcCWajIF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770388796;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDXLgiWjXpQ6Kq402rYqS0b4YNAtvG7va1JhY25U5ZM=;
 b=YSDJVosQPZC/q2dHZhpf34Qe9Ts7Kh+icZ4s6kInmGJbVpXXk/ETOzpSm2cjTDvHB1thdA
 9pI07gCBFVGvq0aC6ADaBCwtK84fK+PzAFBdReshZPP7iQFqnftXlmf1DmwaBM3mGY9oei
 UW88b+cjsK0bIPAftClrGraBwsErkKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770388796;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jDXLgiWjXpQ6Kq402rYqS0b4YNAtvG7va1JhY25U5ZM=;
 b=UcCWajIFmvrGCVES3CZbKjU73YFQQDE+G3WAbxz627a5l5XJ8VPWSjHZWhtb6hn00+GuCr
 9ibbAyDtVn0+YxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E0973EA63;
 Fri,  6 Feb 2026 14:39:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 00ZxITz9hWm3BgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Feb 2026 14:39:56 +0000
Date: Fri, 6 Feb 2026 15:39:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Message-ID: <20260206143955.GC402479@pevik>
References: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
 <20260206125818.319190-3-vasileios.almpanis@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206125818.319190-3-vasileios.almpanis@virtuozzo.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] pty04: use the correct protocol per line
 discipline to avoid extra packets
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:email,linux.it:url];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: ACE34FF145
X-Rspamd-Action: no action

Hi Vasileios,

> Use specific protocol filter (ETH_P_IP for N_SLIP, ETH_P_CAN for N_SLCAN)
> instead of ETH_P_ALL to avoid catching unrelated packets like IPv6
> multicast (MLD) which cause false test failures.

LGTM.
@Martin: could you please double check?

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> Signed-off-by: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
> ---
>  testcases/kernel/pty/pty04.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

> diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
> index 204703253..770c053c4 100644
> --- a/testcases/kernel/pty/pty04.c
> +++ b/testcases/kernel/pty/pty04.c
> @@ -258,6 +258,19 @@ static void open_netdev(const struct ldisc_info *ldisc)
>  {
>  	struct ifreq ifreq = { 0 };
>  	struct sockaddr_ll lla = { 0 };
> +	int protocol;
> +
> +	switch (ldisc->n) {
> +		case N_SLIP:
> +			protocol = ETH_P_IP;
> +			break;
> +		case N_SLCAN:
> +			protocol = ETH_P_CAN;
> +			break;
> +		default:
> +			protocol = ETH_P_ALL;
> +			break;
> +	}

>  	SAFE_IOCTL(pts, SIOCGIFNAME, ifreq.ifr_name);
>  	tst_res(TINFO, "Netdev is %s", ifreq.ifr_name);
> @@ -282,7 +295,7 @@ static void open_netdev(const struct ldisc_info *ldisc)
>  	SAFE_IOCTL(sk, SIOCGIFINDEX, &ifreq);

>  	lla.sll_family = PF_PACKET;
> -	lla.sll_protocol = htons(ETH_P_ALL);
> +	lla.sll_protocol = htons(protocol);
>  	lla.sll_ifindex = ifreq.ifr_ifindex;
>  	SAFE_BIND(sk, (struct sockaddr *)&lla, sizeof(struct sockaddr_ll));

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
