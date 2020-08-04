Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF64523B435
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 06:35:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5247D3C3319
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Aug 2020 06:35:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 074643C2543
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 06:35:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 58858200C0D
 for <ltp@lists.linux.it>; Tue,  4 Aug 2020 06:35:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7C7EAB3D;
 Tue,  4 Aug 2020 04:35:23 +0000 (UTC)
Date: Tue, 4 Aug 2020 06:35:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200804043504.GA76360@x230>
References: <20200803184726.2416-1-t-josne@linux.microsoft.com>
 <20200803184726.2416-2-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803184726.2416-2-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] IMA: Update key test documentation
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
Cc: balajib@linux.microsoft.com, nramas@linux.microsoft.com,
 tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan,

> The current documentation for the existing IMA key test was
> left in by accident by a previous merge. It does not apply
> to the test that is currently included in the LTP.

> Update the documentation for the IMA key test.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Thanks for fixing this, I propose this changes:

Fixes: d2768c84e ("IMA: Add a test to verify measurement of keys")

> ---
>  .../kernel/security/integrity/ima/README.md   | 22 +++++--------------
>  1 file changed, 5 insertions(+), 17 deletions(-)

> diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
> index d4644ba39..2956ac7fd 100644
> --- a/testcases/kernel/security/integrity/ima/README.md
> +++ b/testcases/kernel/security/integrity/ima/README.md
> @@ -15,27 +15,15 @@ Although a custom policy, loaded via dracut, systemd or manually from user
>  space, may contain equivalent measurement tcb rules, detecting them would
>  require `IMA_READ_POLICY=y` therefore ignore this option.

> -### IMA key import test
> -`ima_keys.sh` requires a x509 public key, by default in `/etc/keys/x509_ima.der`
> -(defined in `CONFIG_IMA_X509_PATH` kernel config option).
> -The key must be signed by the private key you generate. Follow these instructions:
> -https://manpages.ubuntu.com/manpages/disco/man1/evmctl.1.html#generate%20trusted%20keys
> -
> -The test cannot be set-up automatically because the x509 public key must be
> -built into the kernel and loaded onto a trusted keyring
> -(e.g. `.builtin_trusted_keys`, `.secondary_trusted_keyring`).
> -
> -As well as what's required for the IMA tests, the following are also required
> -in the kernel configuration:
> +### IMA key test
> +`ima_keys.sh` requires a readable IMA policy, as well as a loaded policy
> +with `func=KEY_CHECK keyrings=...`, see example in `keycheck.policy`.
> +
> +Mandatory kernel configuration for IMA:
This "Mandatory kernel configuration for IMA:" would be in docs twice. The above
one (CONFIG_INTEGRITY=y, CONFIG_IMA=y) is required for all tests.
Take it that "### IMA key test" is header 3, but ## IMA tests
is header 2 (upper level).

>  ```
>  CONFIG_IMA_READ_POLICY=y
> -CONFIG_IMA_X509_PATH="/etc/keys/x509_ima.der"
> -CONFIG_SYSTEM_TRUSTED_KEYRING=y
> -CONFIG_SYSTEM_TRUSTED_KEYS="/etc/keys/ima-local-ca.pem"
>  ```

> -Test also requires loaded policy with `func=KEY_CHECK`, see example in `keycheck.policy`.
> -
>  ### IMA kexec test

>  `ima_kexec.sh` requires loaded policy which contains `measure func=KEXEC_CMDLINE`,

I also removed "IMA" from EVM tests header.

Kind regards,
Petr

diff --git testcases/kernel/security/integrity/ima/README.md testcases/kernel/security/integrity/ima/README.md
index 2956ac7fd..392e1e868 100644
--- testcases/kernel/security/integrity/ima/README.md
+++ testcases/kernel/security/integrity/ima/README.md
@@ -19,7 +19,8 @@ require `IMA_READ_POLICY=y` therefore ignore this option.
 `ima_keys.sh` requires a readable IMA policy, as well as a loaded policy
 with `func=KEY_CHECK keyrings=...`, see example in `keycheck.policy`.
 
-Mandatory kernel configuration for IMA:
+As well as what's required for the IMA tests, the following are also required
+-in the kernel configuration:
 ```
 CONFIG_IMA_READ_POLICY=y
 ```
@@ -38,7 +39,7 @@ To kexec a different kernel image export `IMA_KEXEC_IMAGE=<pathname>`.
 kernel parameter) which appraises the integrity of all files owned by root and EVM setup.
 Again, for simplicity ignore possibility to load requires rules via custom policy.
 
-Mandatory kernel configuration for IMA & EVM:
+Mandatory kernel configuration for EVM tests:
 ```
 CONFIG_INTEGRITY=y
 CONFIG_INTEGRITY_SIGNATURE=y
@@ -50,7 +51,7 @@ CONFIG_TRUSTED_KEYS=y
 CONFIG_ENCRYPTED_KEYS=y
 ```
 
-Example of installing IMA + EVM on openSUSE:
+Example of preparing environment on for EVM on openSUSE:
 
 * Boot install system with `ima_policy=tcb|appraise_tcb ima_appraise=fix evm=fix` kernel parameters
   (for IMA measurement, IMA appraisal and EVM protection)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
