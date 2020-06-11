Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE791F6B41
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 17:42:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A31353C6171
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 17:42:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id E57813C2DFC
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 17:42:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 827C11000B48
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 17:42:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7399BACBD;
 Thu, 11 Jun 2020 15:42:54 +0000 (UTC)
Date: Thu, 11 Jun 2020 17:42:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200611154249.GB25057@dell5510>
References: <1591808483-22040-1-git-send-email-t-josne@linux.microsoft.com>
 <1591808483-22040-2-git-send-email-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591808483-22040-2-git-send-email-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] IMA: Add a test to verify importing a
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 zohar@linux.ibm.com, ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan, Mimi,

@Mimi: I'd also appreciate you to review both commits.

> Add an IMA measurement test that verifies that an x509 certificate
> can be imported into the .ima keyring and measured correctly.

> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
> ---
>  .../security/integrity/ima/tests/ima_keys.sh  | 44 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)

> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> index 1b0dd0aed..6904fabfa 100644
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -7,7 +7,7 @@

>  TST_NEEDS_CMDS="awk cut"
Not only xxd, but also keyctl needs to be here.
ALso it looks like you require openssl (unlike compute_digest where it's like
fallback and even here I was thinking about writing hint which packages are
required).
I'd also add cmp (probably less common than cut).
NOTE: Although not documented, we consider grep to be everywhere.

>  TST_SETUP="setup"
> -TST_CNT=1
> +TST_CNT=2
>  TST_NEEDS_DEVICE=1

Please put it here to allow overwrite it:
CERT_FILE="${CERT_FILE:-}/etc/keys/x509_ima.der"

>  . ima_setup.sh
> @@ -69,4 +69,46 @@ $(echo "$line" | cut -d' ' -f5) keyring"
>  	tst_res TPASS "specified keyrings were measured correctly"
>  }

> +
> +# Test that a cert can be imported into the ".ima" keyring correctly.
> +test2() {
> +	local keyring_id key_id
> +	CERT_FILE="/etc/keys/x509_ima.der" # Default
instead of here.
> +
> +	[ -f $CERT_FILE ] || tst_brk TCONF "missing $CERT_FILE"
> +
> +	if ! openssl x509 -in $CERT_FILE -inform der > /dev/null; then
> +		tst_brk TCONF "The suppled cert file ($CERT_FILE) is not \
> +a valid x509 certificate"
> +	fi
> +
> +	tst_res TINFO "adding a cert to the \".ima\" keyring ($CERT_FILE)"
nit: I personally would not quot .ima. I usually don't quot that much or use '
to help people grep, but that's not important.

> +
> +	keyring_id=$(sudo keyctl show %:.ima | sed -n 2p | \
> +		sed 's/^[[:space:]]*//' | cut -d' ' -f1) || \
> +		tst_btk TCONF "unable to retrieve .ima keyring id"
> +
> +	if ! tst_is_num	"$keyring_id"; then
> +		tst_brk TCONF "unable to parse keyring id from keyring"
> +	fi
> +
> +	sudo evmctl import $CERT_FILE "$keyring_id" > /dev/null || \
This test requires to be run with root (see TST_NEEDS_ROOT=1 in ima_setup.sh,
maybe I should have put the variables in each test to be this clear),
thus no need for sudo. Also you'd need to specify sudo in TST_NEEDS_CMDS
(precise check is needed as these tests can be run on some custom embedded
board, without any support.  Also some people test kernel with rapido.)

> +		tst_brk TCONF "unable to import a cert into the .ima keyring"
> +
> +	grep -F ".ima" "$ASCII_MEASUREMENTS" | tail -n1 | cut -d' ' -f6 | \
> +		xxd -r -p > $TEST_FILE || \
> +		tst_brk TCONF "cert not found in ascii_runtime_measurements log"
> +
> +	if ! openssl x509 -in $TEST_FILE -inform der > /dev/null; then
> +		tst_brk TCONF "The cert logged in ascii_runtime_measurements \
> +($CERT_FILE) is not a valid x509 certificate"
> +	fi
> +
> +	if cmp -s "$TEST_FILE" $CERT_FILE; then
> +		tst_res TPASS "logged cert matches original cert"
> +	else
> +		tst_res TFAIL "logged cert does not match original cert"
> +	fi
> +}
> +
>  tst_run

Again, thank for your patches!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
