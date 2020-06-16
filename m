Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F91FADDD
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:26:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEF3D3C2D1C
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 12:26:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A30C23C2CE8
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:26:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 476E1140B96D
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 12:26:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D764AC91;
 Tue, 16 Jun 2020 10:26:28 +0000 (UTC)
Date: Tue, 16 Jun 2020 12:26:18 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200616102618.GA4513@dell5510>
References: <20200612143842.3993-1-t-josne@linux.microsoft.com>
 <20200612143842.3993-3-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612143842.3993-3-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] IMA: Add a test to verify importing a
 certificate into keyring
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

few details (all can be fixed by me before merge, no need to repost).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -5,10 +5,12 @@

>  # Verify that keys are measured correctly based on policy.

> -TST_NEEDS_CMDS="awk cut xxd"
> -TST_CNT=1
> +TST_NEEDS_CMDS="awk cut xxd keyctl evmctl openssl cmp"
TST_NEEDS_CMDS="awk cmp cut evmctl keyctl openssl sed xxd"
(I ignore tail, if there is cut, sed and openssl it should be there,
the same rule as for grep).

> +TST_CNT=2
>  TST_NEEDS_DEVICE=1

> +CERT_FILE="${CERT_FILE:-}/etc/keys/x509_ima.der"
I'm sorry, I was wrong, this must be:
CERT_FILE="${CERT_FILE:-/etc/keys/x509_ima.der}"

> +
>  . ima_setup.sh

>  # Based on https://lkml.org/lkml/2019/12/13/564.
> @@ -62,4 +64,43 @@ test1()
>  	tst_res TPASS "specified keyrings were measured correctly"
>  }

> +
> +# Test that a cert can be imported into the ".ima" keyring correctly.
> +test2() {
> +	local keyring_id key_id test_file="$PWD/test.txt"
nit: Can test_file use relative path?
local test_file="test.txt"

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
