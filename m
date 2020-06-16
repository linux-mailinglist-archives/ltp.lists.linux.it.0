Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 602351FB825
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 17:55:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E53063C2CFE
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 17:55:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9BA293C0718
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 17:55:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3ABAA650725
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 17:55:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 70C57AD65;
 Tue, 16 Jun 2020 15:55:11 +0000 (UTC)
Date: Tue, 16 Jun 2020 17:55:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200616155501.GB8754@dell5510>
References: <20200612143842.3993-1-t-josne@linux.microsoft.com>
 <20200612143842.3993-3-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612143842.3993-3-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

> Add an IMA measurement test that verifies that an x509 certificate
> can be imported into the .ima keyring and measured correctly.

> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
> ---
>  .../security/integrity/ima/tests/ima_keys.sh  | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)

> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> index f9c60a6fc..1eabb3e2e 100755
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -5,10 +5,12 @@

>  # Verify that keys are measured correctly based on policy.

> -TST_NEEDS_CMDS="awk cut xxd"
> -TST_CNT=1
> +TST_NEEDS_CMDS="awk cut xxd keyctl evmctl openssl cmp"
> +TST_CNT=2
>  TST_NEEDS_DEVICE=1

> +CERT_FILE="${CERT_FILE:-}/etc/keys/x509_ima.der"
Key setup is something what I'd like to be either set automatically
(ideally, but maybe too hard) or documented in
testcases/kernel/security/integrity/ima/README.md.

ima_keys 1 TINFO: verifying key measurement for keyrings and templates specified in IMA policy file
ima_keys 1 TPASS: specified keyrings were measured correctly
ima_keys 2 TCONF: missing /etc/keys/x509_ima.der
=> many uses will TCONF, which is not what we want.

Running these scripts from examples/ in ima-evm-utils repository:
./ima-gen-local-ca.sh && ./ima-genkey-self.sh && ./ima-genkey.sh

is obviously not enough:

ima_keys 1 TINFO: verifying key measurement for keyrings and templates specified in IMA policy file
ima_keys 1 TPASS: specified keyrings were measured correctly
ima_keys 2 TINFO: adding a cert to the .ima keyring (/etc/keys/x509_ima.der)
add_key failed
errno: Required key not available (126)
ima_keys 2 TCONF: unable to import a cert into the .ima keyring

Does it make sense to copy these scripts into LTP (most distros ship them in
development packages, but we cannot depend on it) and run them in the test
setup? If not, we should really document that.
+ feel free to add anything relevant to README.md :)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
