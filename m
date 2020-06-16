Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82C1FB632
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 17:31:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 343F63C2D00
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 17:31:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 626EE3C02EF
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 17:31:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BC3A91424C4C
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 17:31:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DB1FAAFA7;
 Tue, 16 Jun 2020 15:31:25 +0000 (UTC)
Date: Tue, 16 Jun 2020 17:31:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200616153116.GA8754@dell5510>
References: <20200612143842.3993-1-t-josne@linux.microsoft.com>
 <20200612143842.3993-2-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612143842.3993-2-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] IMA: Add a test to verify measurment of
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.com,
 zohar@linux.ibm.com, ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

..
> +++ b/testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
> @@ -0,0 +1 @@
> +measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist template=ima-buf
Thanks for this!
You don't use it, but that's ok, I'll add that policy handling myself after
merging. I have some notes about documentation / setup for both commits.

It would be nice to mention CONFIG_IMA_READ_POLICY=y in
testcases/kernel/security/integrity/ima/README.md as it's required.
That trivial thing I could do myself, but it'd help to add more info for setup
needed (and it's always preferred to do the setup, if possible, but for some
tests e.g. EVM testing in evm_overlay.sh it must be during the installation).

> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> new file mode 100755
> index 000000000..f9c60a6fc
> --- /dev/null
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -0,0 +1,65 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Copyright (c) 2020 Microsoft Corporation
> +# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
> +#
> +# Verify that keys are measured correctly based on policy.
> +
> +TST_NEEDS_CMDS="awk cut xxd"
nit: actually sed was meant to be added in this commit (I reported in previous
one).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
