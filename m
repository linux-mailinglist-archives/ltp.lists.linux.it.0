Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 265BA3A101F
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 12:28:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54E673C8F09
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 12:28:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A35723C31F4
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 12:28:16 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 07DBD2009B0
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 12:28:15 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5706B1FD4E
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623234495;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6rMhhv1lNEWsMq0qBjtZ9jz2CqRyV4qPvWU05Svgro=;
 b=QufigkMxtAfArDS03/oveg6fY99f9dOG15lWU2RgsINY6kYHQRWD13aKOahZfmvzPcntms
 qOm+Q2dQw0gdULoEGiQdAShQqTbhgsR7/3ioOp+7Fdmu6P8nCS+RcyttqwLCXj/7IFMVvR
 TLoDtpo4ww8Ms9db4A+Ulgxfos114MU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623234495;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6rMhhv1lNEWsMq0qBjtZ9jz2CqRyV4qPvWU05Svgro=;
 b=Up3V4SiBb5eTlwzZUpU5dSnbHJcTkuMnzY/TT+CmUDXoJB6w3655JJ8INCmd73Ryf3x6B2
 Dff+k2XgekcRE5Dg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 26A43A3B8A;
 Wed,  9 Jun 2021 10:28:15 +0000 (UTC)
References: <20210607141421.15072-1-rpalethorpe@suse.com>
 <YMCAe9PO5NMToFOq@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YMCAe9PO5NMToFOq@pevik>
Date: Wed, 09 Jun 2021 11:28:14 +0100
Message-ID: <875yyn5o3l.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Check-in a couple of scripts used for removing the TEST macro from the
>> library. Also a shell script to show how to run them. These are only
>> intended to help someone develop their own refactoring scripts. Not
>> for running automatically.
> Nice, LGTM, with two notes bellow.
>
>> +++ b/scripts/coccinelle/run-spatch.sh
>> @@ -0,0 +1,39 @@
>> +#!/bin/sh -eu
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +# Copyright (c) 2021 SUSE LLC  <rpalethorpe@suse.com>
>> +
>> +# Helper for running spatch Coccinelle scripts on the LTP source tree
>> +
>> +if [[ ! -d lib || ! -d scripts/coccinelle ]]; then
> [[ ... ]] is bashism. It should be
> if [ ! -d lib ] || [ ! -d scripts/coccinelle ]; then

+1

>
> or
>
>> +    echo "$0: Can't find lib or scripts directories. Run me from top src dir"
>> +    exit 1
>> +fi
>> +
>> +# Run a script on the lib dir
>> +libltp_spatch_report() {
>> +    spatch --dir lib \
>> +	   --ignore lib/parse_opts.c \
>> +	   --ignore lib/newlib_tests \
>> +	   --ignore lib/tests \
>> +	   --use-gitgrep \
>> +	   -D report \
>> +	   --include-headers \
>> +	   $*
>> +}
>> +
>> +libltp_spatch_fix() {
>> +    spatch --dir lib \
>> +	   --ignore lib/parse_opts.c \
>> +	   --ignore lib/newlib_tests \
>> +	   --ignore lib/tests \
>> +	   --use-gitgrep \
>> +	   --in-place \
>> +	   -D fix \
>> +	   --include-headers \
>> +	   $*
>> +}
>> +
>> +echo You should uncomment one of the scripts below!
>> +#libltp_spatch_report --sp-file scripts/coccinelle/libltp-test-macro.cocci
>> +#libltp_spatch_report --sp-file scripts/coccinelle/libltp-test-macro-vars.cocci \
>> +#		     --ignore lib/tst_test.c
> Maybe have getopts to specify what needs to be running would prevent a need to
> modify versioned file.

+1

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
