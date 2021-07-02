Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB603BA25F
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 16:52:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 473153C8EAE
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 16:52:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B55493C6AD2
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 16:52:11 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 28C3F1A017AC
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 16:52:10 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6DC5222988;
 Fri,  2 Jul 2021 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625237530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Vs+LSbmpJYyGp1JKXy1cxkZb5mPRjBP5xNdEHO9hoA=;
 b=imMz1rmlgoORCr5OeKXeodCMvzvbUXGoy3xod0j4Z/yzaEHN/h9+v8FGjNNEgeQChTV6v2
 VrSBTrNoRDaG04upyvGR11q7EKCdgOxHZule6LNW/y0AXJTkM4C9mXld9TGaHjaDC4zatQ
 eeDNmgLNFKnD6rNvgzvJjyvKATu/qV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625237530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Vs+LSbmpJYyGp1JKXy1cxkZb5mPRjBP5xNdEHO9hoA=;
 b=/402osYCdCGRnCtgdxB6xiZb/tsOiGenK4mWpgsqfgYdazd8Oyjzbkzmur9dr8jZGBlDVH
 Mv9BmYEQayIbuYCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 4EC0F11C84;
 Fri,  2 Jul 2021 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625237530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Vs+LSbmpJYyGp1JKXy1cxkZb5mPRjBP5xNdEHO9hoA=;
 b=imMz1rmlgoORCr5OeKXeodCMvzvbUXGoy3xod0j4Z/yzaEHN/h9+v8FGjNNEgeQChTV6v2
 VrSBTrNoRDaG04upyvGR11q7EKCdgOxHZule6LNW/y0AXJTkM4C9mXld9TGaHjaDC4zatQ
 eeDNmgLNFKnD6rNvgzvJjyvKATu/qV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625237530;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Vs+LSbmpJYyGp1JKXy1cxkZb5mPRjBP5xNdEHO9hoA=;
 b=/402osYCdCGRnCtgdxB6xiZb/tsOiGenK4mWpgsqfgYdazd8Oyjzbkzmur9dr8jZGBlDVH
 Mv9BmYEQayIbuYCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id w7sUEhoo32DjbwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 02 Jul 2021 14:52:10 +0000
Date: Fri, 2 Jul 2021 16:26:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YN8iG1fchuyC/SEI@yuki>
References: <20210702123533.18008-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702123533.18008-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] vsock01,
 CVE-2021-26708: Add reproducer for race condition
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
> diff --git a/include/lapi/vm_sockets.h b/include/lapi/vm_sockets.h
> new file mode 100644
> index 000000000..94d0248c5
> --- /dev/null
> +++ b/include/lapi/vm_sockets.h
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
> + */
> +
> +#include <sys/socket.h>
> +
> +#if HAVE_LINUX_VM_SOCKETS_H
> +#  include <linux/vm_sockets.h>
> +#endif
> +
> +#ifndef VMADDR_CID_LOCAL
> +#  define VMADDR_CID_LOCAL 1
> +#endif

I've added guards to this header.

> +#include "config.h"
> +#include "tst_test.h"
> +
> +#if HAVE_LINUX_VM_SOCKETS_H
> +#  include "tst_fuzzy_sync.h"
> +#  include "lapi/vm_sockets.h"
> +
> +static struct tst_fzsync_pair pair;
> +int vsock = -1;
> +
> +void *writer(LTP_ATTRIBUTE_UNUSED void *unused)
> +{
> +	const uint64_t b_buflen = 0x4141;
> +
> +	while (tst_fzsync_run_b(&pair)) {
> +		tst_fzsync_start_race_b(&pair);
> +		SAFE_SETSOCKOPT(vsock, AF_VSOCK,
> +				SO_VM_SOCKETS_BUFFER_SIZE,
> +				&b_buflen, sizeof(b_buflen));
> +		tst_fzsync_end_race_b(&pair);
> +	}
> +
> +
> +	return NULL;
> +}

And sprinkled a few 'static' keywords here, and pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
