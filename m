Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C13C8322
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 12:43:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C9133C7506
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 12:43:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2DCDD3C0354
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 12:43:34 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CC2441000EC3
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 12:43:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 266402028A;
 Wed, 14 Jul 2021 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626259413;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qTmuKLm5cWJl9HU3Rx1cUGvaRVXfB0QgM25d5rr7HJQ=;
 b=oHmV4kp8CfOYTSvY0ilqq1l/zsg/4fOd9Sbt6r2ZH7Qhuu8JYsfaKQmbBcWYq68fDMCp49
 mTB4MahBlHG2zhzHFg7EPjdmXRBcjiWBqZbbPtA08yUtZphR2utxP/+9ik0Z2IanOVO5eq
 v8nUkIG7nGPXzZ/R7axsZDJbEZrIqZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626259413;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qTmuKLm5cWJl9HU3Rx1cUGvaRVXfB0QgM25d5rr7HJQ=;
 b=s1r4cuujMQ9lQJwezeyq7RQTVEkmYigxVbxLoyRxhOxTW1NUvEuQL5ry3PCF0AOoYpYrna
 UzjkYPo0BSyWrrAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 012E413BFD;
 Wed, 14 Jul 2021 10:43:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rwWxOdS/7mD4NQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 14 Jul 2021 10:43:32 +0000
Date: Wed, 14 Jul 2021 12:43:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YO6/0+gPhMh/mbW7@pevik>
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714071158.15868-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/8] Add Sparse based checker and TST_RET/ERR
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

Hi Richie,

> Vendors in Sparse as a git module. Then uses it to check for stores to
> TST_RET/ERR within the library.

I think submodules are a bit problematic, thus I'd prefer avoiding them.
But whole thing is integrated nicely, thus:

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> diff --git a/tools/sparse/README.md b/tools/sparse/README.md
...
> +# Sparse based linting
> +
> +Note that while it is possible to build Sparse with Clang. This may
> +cause some issues. Namely `GCC_BASE` is set to the Clang resource
> +directory. This contains some headers Sparse can not parse.
> +
> +[1]: Many distributions have a Sparse package. This only contains some executables. There is no shared library
nit: missing dot here.

> diff --git a/tools/sparse/main.c b/tools/sparse/main.c
> new file mode 100644
> index 000000000..58f9a549c
> --- /dev/null
> +++ b/tools/sparse/main.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
> + *
> + * Sparse allows us to perform checks on the AST (struct symbol) or on
> + * a linearized representation. In the latter case we are given a set
> + * of entry points (functions) containing basic blocks of
> + * instructions.
> + *
> + * The basic blocks contain byte code in SSA form. This is similar to
> + * the the intermediate representation most compilers use during
nit: repeated the

> + * optimisation.
> + */

The rest LGTM.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
