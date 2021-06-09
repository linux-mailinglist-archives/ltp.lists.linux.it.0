Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DC33A0EE6
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 10:49:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E00DC3C4D8C
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 10:49:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7EB433C4D94
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 10:49:02 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1DEBA6012DC
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 10:49:01 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8AD1B219B7;
 Wed,  9 Jun 2021 08:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623228541;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yfJUIijJr9NDrY6jGXXer1hr0MnaK5jkSVDJ26O/sY=;
 b=002X/14GGksATCqNvN0LEtjIN2DpsY/CkbUWb5CCBd1L3enOMe7QduzdLUPj2471G7Jpbv
 8IcFuz0xNBqhyOaz8XtHCyXbTU2Ec2DyXIWoRIN3WYV4F3vRuAo1bPthAZ5yVZz2Rsc7wG
 pwvnpcbn99g02iDTHtzwHJQQE9i2pYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623228541;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yfJUIijJr9NDrY6jGXXer1hr0MnaK5jkSVDJ26O/sY=;
 b=gAaVzKDZNnAbZtBcbFezGwtlysMfFZ5pWeNDOzvMQL+0Cq+HTn6ld6KmHOTQScKwxCOVAp
 fcqrjEjklG3bvTBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6060A118DD;
 Wed,  9 Jun 2021 08:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623228541;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yfJUIijJr9NDrY6jGXXer1hr0MnaK5jkSVDJ26O/sY=;
 b=002X/14GGksATCqNvN0LEtjIN2DpsY/CkbUWb5CCBd1L3enOMe7QduzdLUPj2471G7Jpbv
 8IcFuz0xNBqhyOaz8XtHCyXbTU2Ec2DyXIWoRIN3WYV4F3vRuAo1bPthAZ5yVZz2Rsc7wG
 pwvnpcbn99g02iDTHtzwHJQQE9i2pYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623228541;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yfJUIijJr9NDrY6jGXXer1hr0MnaK5jkSVDJ26O/sY=;
 b=gAaVzKDZNnAbZtBcbFezGwtlysMfFZ5pWeNDOzvMQL+0Cq+HTn6ld6KmHOTQScKwxCOVAp
 fcqrjEjklG3bvTBA==
Received: from director1.suse.de ([192.168.254.71]) by imap3-int with ESMTPSA
 id yBEIFn2AwGBpZAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 09 Jun 2021 08:49:01 +0000
Date: Wed, 9 Jun 2021 10:48:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YMCAe9PO5NMToFOq@pevik>
References: <20210607141421.15072-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607141421.15072-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Add Coccinelle helper scripts for reference
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

> Check-in a couple of scripts used for removing the TEST macro from the
> library. Also a shell script to show how to run them. These are only
> intended to help someone develop their own refactoring scripts. Not
> for running automatically.
Nice, LGTM, with two notes bellow.

> +++ b/scripts/coccinelle/run-spatch.sh
> @@ -0,0 +1,39 @@
> +#!/bin/sh -eu
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
> +
> +# Helper for running spatch Coccinelle scripts on the LTP source tree
> +
> +if [[ ! -d lib || ! -d scripts/coccinelle ]]; then
[[ ... ]] is bashism. It should be
if [ ! -d lib ] || [ ! -d scripts/coccinelle ]; then

or

> +    echo "$0: Can't find lib or scripts directories. Run me from top src dir"
> +    exit 1
> +fi
> +
> +# Run a script on the lib dir
> +libltp_spatch_report() {
> +    spatch --dir lib \
> +	   --ignore lib/parse_opts.c \
> +	   --ignore lib/newlib_tests \
> +	   --ignore lib/tests \
> +	   --use-gitgrep \
> +	   -D report \
> +	   --include-headers \
> +	   $*
> +}
> +
> +libltp_spatch_fix() {
> +    spatch --dir lib \
> +	   --ignore lib/parse_opts.c \
> +	   --ignore lib/newlib_tests \
> +	   --ignore lib/tests \
> +	   --use-gitgrep \
> +	   --in-place \
> +	   -D fix \
> +	   --include-headers \
> +	   $*
> +}
> +
> +echo You should uncomment one of the scripts below!
> +#libltp_spatch_report --sp-file scripts/coccinelle/libltp-test-macro.cocci
> +#libltp_spatch_report --sp-file scripts/coccinelle/libltp-test-macro-vars.cocci \
> +#		     --ignore lib/tst_test.c
Maybe have getopts to specify what needs to be running would prevent a need to
modify versioned file.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
