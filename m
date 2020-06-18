Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 749481FFC61
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 22:14:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 190A63C2C8F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 22:14:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9C9C53C1C9A
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 22:14:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D146B1000DD2
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 22:14:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D597AB76;
 Thu, 18 Jun 2020 20:14:55 +0000 (UTC)
Date: Thu, 18 Jun 2020 22:14:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200618201450.GA171055@x230>
References: <20200617234957.10611-1-t-josne@linux.microsoft.com>
 <20200617234957.10611-3-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617234957.10611-3-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] IMA: Add a test to verify importing a
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
Cc: nramas@linux.microsoft.com, balajib@linux.microsoft.com,
 zohar@linux.ibm.com, ltp@lists.linux.it, linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan,

LGTM, I'd just like to do some tests. That's what prevents me from merging (my
notes below are just nits, I'll fix them before merging).
@Mimi: would you have time to have look into these tests?

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Add an IMA measurement test that verifies that an x509 certificate
> can be imported into the .ima keyring and measured correctly.

> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
> ---
>  .../kernel/security/integrity/ima/README.md   | 21 +++++++++
>  .../security/integrity/ima/tests/ima_keys.sh  | 47 ++++++++++++++++++-
>  2 files changed, 66 insertions(+), 2 deletions(-)

> diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
> index 16a1f48c3..e41f7b570 100644
> --- a/testcases/kernel/security/integrity/ima/README.md
> +++ b/testcases/kernel/security/integrity/ima/README.md
> @@ -16,6 +16,27 @@ CONFIG_INTEGRITY=y
>  CONFIG_IMA=y
>  ```
Thanks for a docs, I'll move it to the first commit.

> +IMA Key Import test
IMA Key Import tests
> +-------------
> +
> +`ima_keys.sh` requires an x509 key to be generated and placed
> +at `/etc/keys/x509_ima.der`.
`ima_keys.sh` requires an x509 public key to be generated and placed
> +at `/etc/keys/x509_ima.der`.

> +
> +The x509 public key key must be signed by the private key you generate.
> +Follow these instructions:
> +https://manpages.ubuntu.com/manpages/disco/man1/evmctl.1.html#generate%20trusted%20keys.
I was thinking to use non-distro link:
https://www.mankier.com/1/evmctl#Generate_Trusted_Keys
as Ubuntu docs is tied to certain evmctl version, but on the other hand it
document what you used when wrote tests. And Ubuntu URL is probably is probably
safer to use (mankier.com can vanish in the future). Thus keep this one.

> +
> +The test cannot be set-up automatically because the kernel must be built
> +with one of the keys you generate.
> +
> +As well as what's required for the IMA tests, the following are also required
> +in the kernel configuration:
> +```
> +CONFIG_IMA_READ_POLICY=y
> +CONFIG_SYSTEM_TRUSTED_KEYRING=y
> +CONFIG_SYSTEM_TRUSTED_KEYS="/etc/keys/ima-local-ca.pem"
> +```
> +
>  EVM tests
>  ---------
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> index 2b5324dbf..1d9824aba 100755
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -5,10 +5,12 @@

>  # Verify that keys are measured correctly based on policy.

> -TST_NEEDS_CMDS="grep mktemp cut sed tr"
> -TST_CNT=1
> +TST_NEEDS_CMDS="grep mktemp cut sed tr xxd keyctl evmctl openssl cmp"
> +TST_CNT=2
>  TST_NEEDS_DEVICE=1

> +CERT_FILE="${CERT_FILE:-/etc/keys/x509_ima.der}"
> +
>  . ima_setup.sh

>  # Based on https://lkml.org/lkml/2019/12/13/564.
> @@ -64,4 +66,45 @@ test1()
>  	tst_res TPASS "specified keyrings were measured correctly"
>  }

> +
> +# Test that a cert can be imported into the ".ima" keyring correctly.
> +test2() {
> +	local keyring_id key_id test_file=$(mktemp)
> +
> +	[ -f $CERT_FILE ] || tst_brk TCONF "missing $CERT_FILE"
> +
> +	if ! openssl x509 -in $CERT_FILE -inform der > /dev/null; then
> +		tst_brk TCONF "The suppled cert file ($CERT_FILE) is not a valid x509 certificate"
> +	fi
> +
> +	tst_res TINFO "adding a cert to the .ima keyring ($CERT_FILE)"
> +
> +	keyring_id=$(keyctl show %:.ima | sed -n 2p | \
> +		sed 's/^[[:space:]]*//' | cut -d' ' -f1) || \
> +		tst_btk TCONF "unable to retrieve .ima keyring id"
> +
> +	if ! tst_is_num	"$keyring_id"; then
> +		tst_brk TCONF "unable to parse keyring id from keyring"
> +	fi
> +
> +	evmctl import $CERT_FILE "$keyring_id" > /dev/null || \
> +		tst_brk TCONF "unable to import a cert into the .ima keyring"
> +
> +	grep -F ".ima" "$ASCII_MEASUREMENTS" | tail -n1 | cut -d' ' -f6 | \
> +		xxd -r -p > $test_file || \
> +		tst_brk TCONF "cert not found in ascii_runtime_measurements log"
> +
> +	if ! openssl x509 -in $test_file -inform der > /dev/null; then
> +		tst_brk TCONF "The cert logged in ascii_runtime_measurements is not a valid x509 certificate"
> +	fi
> +
> +	if cmp -s "$test_file" $CERT_FILE; then
> +		tst_res TPASS "logged cert matches original cert"
> +	else
> +		tst_res TFAIL "logged cert does not match original cert"
> +	fi
> +
> +	rm $test_file
I guess you can avoid deleting this file. There is automatic cleanup of the test
directory and even if the test is run with -i (number of iterations), it'll be
unique as it's using using mktemp.

> +}
> +
>  tst_run


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
