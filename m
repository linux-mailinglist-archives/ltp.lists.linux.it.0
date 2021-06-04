Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF839B27D
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:20:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79D4D3C4EE0
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 08:20:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B8C173C281C
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:20:23 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D21A8600212
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:20:19 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF44E1FD37;
 Fri,  4 Jun 2021 06:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622787618;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/p/pDhfbrms9LdCJS0FISAqv1cibz01hOePvEMhMblo=;
 b=wfcRFYcC4gowiavzuaDZr/EkF1LBfhpx5mL1lYCsKea/NzqV4/plFby0pS6nQr8II47JqX
 243vNRuA/Nfp6X/PqJ0IGc8sMjaDzu/0x5jkM/GOlSmSy0n1l7dA/ucR5+pIq/Ag5CIzOt
 m0hieguKxOYh1K8OwJP3SNPA9OEDpio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622787618;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/p/pDhfbrms9LdCJS0FISAqv1cibz01hOePvEMhMblo=;
 b=g88sgc9Xn1+TJp+ujk/v/AlDGXju4rL62spRx509C7QliFjUgc2pcaBwZu7hkrSFgvjzDS
 RQG4xowhhtYPK0BQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 83A5C118DD;
 Fri,  4 Jun 2021 06:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622787618;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/p/pDhfbrms9LdCJS0FISAqv1cibz01hOePvEMhMblo=;
 b=wfcRFYcC4gowiavzuaDZr/EkF1LBfhpx5mL1lYCsKea/NzqV4/plFby0pS6nQr8II47JqX
 243vNRuA/Nfp6X/PqJ0IGc8sMjaDzu/0x5jkM/GOlSmSy0n1l7dA/ucR5+pIq/Ag5CIzOt
 m0hieguKxOYh1K8OwJP3SNPA9OEDpio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622787618;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/p/pDhfbrms9LdCJS0FISAqv1cibz01hOePvEMhMblo=;
 b=g88sgc9Xn1+TJp+ujk/v/AlDGXju4rL62spRx509C7QliFjUgc2pcaBwZu7hkrSFgvjzDS
 RQG4xowhhtYPK0BQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id XOBGHSLGuWBXIgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 06:20:18 +0000
Date: Fri, 4 Jun 2021 08:20:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YLnGIJWPf2XsAdTt@pevik>
References: <20210603154825.30165-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603154825.30165-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] Libclang based analyzer
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

> Hello,

> This implements a TEST() check and integrates the check into the build
> system.

> Compared to the Coccinelle version it's very ugly. However I think
> this will allow us to get all the low hanging fruit without creating
> major problems for test developers.

> I guess it could be run during CI if we either fix all the existing
> TEST() usages in the library or add an ignore list. I already have a
> Coccinelle script to help with the former.
+1.

FYI yesterday I sent patch to add make check{,-c,shell}, but for running C/shell API tests:
https://patchwork.ozlabs.org/project/ltp/list/?series=247103

Taking 2 latests commits + adding clang-devel / libclang-dev packages makes CI
running.

https://github.com/pevik/ltp/commit/b2427f39ddb15c97761208a605637e0da6fe66ca

The only missing piece is include/mk/clang-checks.mk (this patchset not even
compile now).

> Richard Palethorpe (2):
>   Add 'make checks' and clang-checks to build system
make check ... clang-check (to avoid confusion).

>   Start libclang based analyzer and TEST() check

>  configure.ac                       |   2 +
>  include/mk/config.mk.in            |   5 +
>  include/mk/env_post.mk             |   8 ++
>  include/mk/generic_leaf_target.inc |   5 +-
>  include/mk/lib.mk                  |   3 +
>  include/mk/rules.mk                |   9 ++
>  include/mk/testcases.mk            |   1 +
>  tools/clang-checks/.gitignore      |   1 +
>  tools/clang-checks/Makefile        |  13 ++
>  tools/clang-checks/main.c          | 218 +++++++++++++++++++++++++++++
I'd name it tools/clang-check/ (and include/mk/clang-check.mk), but that's just
personal opinion.

Kind regards,
Petr

>  10 files changed, 264 insertions(+), 1 deletion(-)
>  create mode 100644 tools/clang-checks/.gitignore
>  create mode 100644 tools/clang-checks/Makefile
>  create mode 100644 tools/clang-checks/main.c

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
