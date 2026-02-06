Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMeiGPX7hWmzIwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 15:34:29 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE280FF041
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 15:34:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1F1C3CDE70
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 15:34:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 786313CC816
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 15:34:17 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7D8ED601DB8
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 15:34:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B54C45BCC9;
 Fri,  6 Feb 2026 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770388450;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UrhZG5qkFm42B2ayPaa1WVSIoK8OTLkO40O7t7ZxQg=;
 b=rAAnLd+S29utom1TgkSKKD9n1sIAFkebAuEYJfrhMGIMABAIJTmAh6kNZ86qI9ipnJKhc5
 +YbJ6dilGGG2sukD/cz+JwsODdc3hndK4ENSGUXLE3iihqrGPOx9ajYnHy3/kq7GMGd3lU
 9hAAV8JQIVhO+b1Tbex52k4J2nOF9iI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770388450;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UrhZG5qkFm42B2ayPaa1WVSIoK8OTLkO40O7t7ZxQg=;
 b=jESxVEnVeHSD4EIv8XEMzbvJoJvVsAyvsexGuBIA86V01xHIa7zqbXGHPnhUYwzVmNMQJC
 YstsfiLTqUvW6+Ag==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770388450;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UrhZG5qkFm42B2ayPaa1WVSIoK8OTLkO40O7t7ZxQg=;
 b=rAAnLd+S29utom1TgkSKKD9n1sIAFkebAuEYJfrhMGIMABAIJTmAh6kNZ86qI9ipnJKhc5
 +YbJ6dilGGG2sukD/cz+JwsODdc3hndK4ENSGUXLE3iihqrGPOx9ajYnHy3/kq7GMGd3lU
 9hAAV8JQIVhO+b1Tbex52k4J2nOF9iI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770388450;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8UrhZG5qkFm42B2ayPaa1WVSIoK8OTLkO40O7t7ZxQg=;
 b=jESxVEnVeHSD4EIv8XEMzbvJoJvVsAyvsexGuBIA86V01xHIa7zqbXGHPnhUYwzVmNMQJC
 YstsfiLTqUvW6+Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6EFA13EA63;
 Fri,  6 Feb 2026 14:34:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cusZGOL7hWnEKAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 06 Feb 2026 14:34:10 +0000
Date: Fri, 6 Feb 2026 15:34:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Message-ID: <20260206143408.GA402479@pevik>
References: <20260206125818.319190-1-vasileios.almpanis@virtuozzo.com>
 <20260206125818.319190-2-vasileios.almpanis@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206125818.319190-2-vasileios.almpanis@virtuozzo.com>
X-Spam-Score: -7.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/2] add ETH_P_CAN compat macro to LAPI headers
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:replyto,linux-test-project.readthedocs.io:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: EE280FF041
X-Rspamd-Action: no action

Hi Vasileios,

>  include/lapi/if_ether.h | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/include/lapi/if_ether.h b/include/lapi/if_ether.h
> index 536d1863a..423341c57 100644
> --- a/include/lapi/if_ether.h
> +++ b/include/lapi/if_ether.h
> @@ -16,4 +16,8 @@
>  # define ETH_P_ALL 0x0003
>  #endif

> +#ifndef ETH_P_CAN
> +# define ETH_P_CAN 0x000C
> +#endif

This is not needed, because it was added to kernel's
include/uapi/linux/if_ether.h before UAPI creation in v3.7-rc1.
And we now expect kernel >= 4.4 [1].

FYI the fallback was originally added in 2017 in
db141701dd ("Add test for CVE-2017-7308 on a raw socket's ring buffer"),
the supported systems required it back then, but now whole include/lapi/if_ether.h,
could be deleted (as an separate effort). For now it'd be enough just to ignore
this commit (not add it).

Kind regards,
Petr

[1] https://linux-test-project.readthedocs.io/en/latest/users/supported_systems.html

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
