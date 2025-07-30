Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB98B164D5
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jul 2025 18:37:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40E9E3CB4F7
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jul 2025 18:37:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20FF93C29D4
 for <ltp@lists.linux.it>; Wed, 30 Jul 2025 18:37:00 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7FE731000936
 for <ltp@lists.linux.it>; Wed, 30 Jul 2025 18:37:00 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9BE641F385;
 Wed, 30 Jul 2025 16:36:59 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D6E31388B;
 Wed, 30 Jul 2025 16:36:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ysc/HStKimgddwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 30 Jul 2025 16:36:59 +0000
Date: Wed, 30 Jul 2025 18:36:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20250730163654.GA673913@pevik>
References: <20250730-ioctl_pidfd_supported-v4-1-db7bd905a1d6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250730-ioctl_pidfd_supported-v4-1-db7bd905a1d6@suse.com>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 9BE641F385
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4] Correctly check if PIDFD_INFO_EXIT is available
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

Hi Andrea, all,

> When systems are not having the PIDFD_INFO_EXIT implementation,
> ioctl_pidfd testing suite might fail with:

> 	ioctl_pidfd.h:32: TBROK: ioctl(...) failed: ENOTTY (25)

> Fix the ioctl_pidfd_info_exit_supported() behavior, considering ENOTTY,
> EINVAL and ESRCH errors like a sign for not having PIDFD_INFO_EXIT
> implemented in the system.

Thanks for doing the investigation and fixing this!

...
> -	SAFE_IOCTL(pidfd, PIDFD_GET_INFO, &info);
> -	SAFE_CLOSE(pidfd);
> +	ret = ioctl(pidfd, PIDFD_GET_INFO, &info);
> +	if (ret == -1) {
> +		/* - ENOTTY: old kernels not implementing fs/pidfs.c:pidfd_ioctl
> +		 * - EINVAL: until v6.13 kernel
> +		 * - ESRCH: all kernels between v6.13 and v6.15
> +		 */
> +		if (errno != ENOTTY &&
> +			errno != EINVAL &&
> +			errno != ESRCH)
> +			tst_brk(TBROK | TERRNO, "ioctl error");
> +	} else {
> +		if (info.mask & PIDFD_INFO_EXIT)

nit: this could have been:

	} else if (info.mask & PIDFD_INFO_EXIT) {

Kind regards,
Petr

> +			supported = 1;
> +	}

> -	if (info.mask & PIDFD_INFO_EXIT)
> -		ret = 1;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
