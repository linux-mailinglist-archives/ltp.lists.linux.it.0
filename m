Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A20D7E515C
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Nov 2023 08:52:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00EEA3CC66A
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Nov 2023 08:52:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F2173C62E0
 for <ltp@lists.linux.it>; Wed,  8 Nov 2023 08:52:06 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 18F011006082
 for <ltp@lists.linux.it>; Wed,  8 Nov 2023 08:52:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B7031F8AA;
 Wed,  8 Nov 2023 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1699429925;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFQFS9FoJreTeVTJgb0BE3iAE3pELV2FP4Y+lDzryLI=;
 b=WSC177FSjv28+RRydYraVKiNBI8T/RsvWn7KD6pdJzII1lRF6XdOLa9+hIxkldDy/RPl/W
 2Ad4lnSMtsvc/I/Raw4VBav4LHkYl+AK7/MqWyBN9OXlI7MAcJ41MVoIF0g9K5zqf1qbPN
 8jF6Bxw1SffZoxJZ82yCcr2axtDz43w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1699429925;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFQFS9FoJreTeVTJgb0BE3iAE3pELV2FP4Y+lDzryLI=;
 b=8QWhQt6jhJooGkKR380X03PJ4eSZfGY03H7mTRwvLM6wTsU4NoW5AetC7m5kHH6H7Fc5TE
 yRc5aaP2EuIif9DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B8F0133F5;
 Wed,  8 Nov 2023 07:52:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C0rPDCU+S2XMJAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 08 Nov 2023 07:52:05 +0000
Date: Wed, 8 Nov 2023 08:52:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20231108075203.GB1383908@pevik>
References: <20231107105836.68108-1-xuyang2018.jy@fujitsu.com>
 <20231107105836.68108-2-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231107105836.68108-2-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] link08: Convert docs to docparse
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

Hi Xu,

> update copyright, fix grammar
...
> +++ b/testcases/kernel/syscalls/link/link08.c
> @@ -1,23 +1,26 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2014 Fujitsu Ltd.
> + * Copyright (c) Linux Test Project, 2014-2023
>   * Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
>   */
> -/*
> - * Test Description:
> - *  Verify that,
> - *   1. link() fails with -1 return value and sets errno to EPERM
> - *      if oldpath is a directory.
> - *   2. link() fails with -1 return value and sets errno to EXDEV
> - *      if oldpath and newpath are not on the same mounted file system( Linux
> - *      permits a file system to be mounted at multiple points, but link()
> - *      does not work across different mount points, even if the same
> - *      file system is mounted on both. ).
> - *   3. link() fails with -1 return value and sets errno to EROFS
> - *      if the file is on a read-only file system.
> - *   4. link() fails with -1 return value and sets errno to ELOOP
> - *      if too many symbolic links were encountered in resolving path.
> +
> +/*\
> + * [Description]
> + *
> + * Verify that,
nit: * Verify that:

Thanks!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
