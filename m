Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD61FFC79
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 22:28:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20C143C2C8F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 22:28:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5F9E83C1C9A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 22:28:46 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7B97A1000BD7
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 22:28:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE46BADC2;
 Thu, 18 Jun 2020 20:28:44 +0000 (UTC)
Date: Thu, 18 Jun 2020 22:28:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200618202840.GA175579@x230>
References: <20200617234957.10611-1-t-josne@linux.microsoft.com>
 <20200617234957.10611-2-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617234957.10611-2-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] IMA: Add a test to verify measurment of
 keys
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
Cc: nramas@linux.microsoft.com, balajib@linux.microsoft.com,
 zohar@linux.ibm.com, ltp@lists.linux.it, linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -0,0 +1,67 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Microsoft Corporation
> +# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
> +#
> +# Verify that keys are measured correctly based on policy.
> +
> +TST_NEEDS_CMDS="grep mktemp cut sed tr"
This is already a dependency for tst_test.sh, but it does not harm to have it
here (in case we remove the dependency from tst_test.sh).
> +TST_CNT=1
> +TST_NEEDS_DEVICE=1
> +
> +. ima_setup.sh
> +
> +# Based on https://lkml.org/lkml/2019/12/13/564.
> +# (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
> +test1()
> +{
> +	local keyrings keycheck_line templates test_file=$(mktemp)
Do we need mktemp? Can't it be just:
	local keyrings keycheck_line templates test_file="file.txt"

...
> +		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
Because you later just overwrite the file (simplicity).

I also try to keep shell dependencies low so it's possible to run it with in
dracut initramfs with rapido [1] without too many dependencies (although mktemp
is already tst_test.sh dependency).

> +
> +		expected_digest="$(compute_digest $algorithm $test_file)" || \
> +			tst_brk TCONF "cannot compute digest for $algorithm"
> +
> +		if [ "$digest" != "$expected_digest" ]; then
> +			tst_res TFAIL "incorrect digest was found for the ($keyring) keyring"
> +		fi
> +	done
> +
> +	rm $test_file
Again, IMHO no need to delete the file.

[1] https://github.com/rapido-linux/rapido

> +
> +	tst_res TPASS "specified keyrings were measured correctly"
This TPASS will be called even if there is previous TFAIL "incorrect digest was
found for the ($keyring) keyring". We should either exit testing with return,
or have variable to detect failure and not call this (not sure what makes more
sense).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
