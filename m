Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4D63D79B
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 15:06:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 940B43CC525
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 15:06:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 19DA23C0367
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 15:06:35 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8B0EC1400B87
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 15:06:35 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD2551F37C;
 Wed, 30 Nov 2022 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669817194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qx68NTpY6ClwM2XbilRROkLlOYVeAp+ngIyGL3wSjO0=;
 b=fm8Hhl7OA3sO6MDvaqR+UjXpyDGQ0aWM3UBgFwQogJg8BtHFCvCALjXcrZ8tMxAdUfbXnO
 ozQOAYj+n/w2YtQOkqjDbZ3uaiCNdlWKEGpyhjWQLomlNO3SvbSZFBjTOfkDO3nfSOv2Mp
 AexaT180X+G4z4Wkiyf9DYsHXgf8+0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669817194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qx68NTpY6ClwM2XbilRROkLlOYVeAp+ngIyGL3wSjO0=;
 b=/N5NdvHKudb+aJcBX3Sa+ZfBrfsWmUIRDCEOODhD8YxqjIfa9Ns4Qn3Qrm8+KQ+/32LmeZ
 bPLRmrNztiyphoDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C197113A70;
 Wed, 30 Nov 2022 14:06:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Rz8dLWpjh2OfcwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 30 Nov 2022 14:06:34 +0000
Date: Wed, 30 Nov 2022 15:06:29 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Tudor Cretu <tudor.cretu@arm.com>
Message-ID: <Y4djZbb+hxgmUUiN@rei>
References: <20221130133619.632073-1-tudor.cretu@arm.com>
 <20221130133619.632073-3-tudor.cretu@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130133619.632073-3-tudor.cretu@arm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] safe_open,
 safe_openat: Fix undefined behaviour in vararg handling
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
> +#ifndef __OPEN_NEEDS_MODE
> + #define __OPEN_NEEDS_MODE(oflag) \
> +	(((oflag) & O_CREAT) != 0 || ((oflag) & O_TMPFILE) == O_TMPFILE)
> +#endif

I suppose that it would be a bit cleaner just to define our macro
TST_OPEN_NEEDS_MODE() instead.

Other than that it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
