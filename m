Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D033227B3
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 10:24:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EF2DA3C5AC0
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 10:24:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B98013C4E45
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 10:24:09 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4A51C600BFD
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 10:24:08 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34846AF23;
 Tue, 23 Feb 2021 09:24:08 +0000 (UTC)
Date: Tue, 23 Feb 2021 10:24:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YDTJtl9C9HbRILQb@pevik>
References: <20210222023421.12576-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222023421.12576-1-nramas@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Check for ima-buf template is not required
 for keys tests
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
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lakmasi,

> ima-buf is the default IMA template used for all buffer measurements.
> Therefore, IMA policy rule for measuring keys need not specify
> an IMA template.
Good catch. But was it alway?
IMHO ima-buf as default was added in dea87d0889dd ("ima: select ima-buf template for buffer measurement") in v5.11-rc1.
But test1() tests 450d0fd51564 ("IMA: Call workqueue functions to measure queued keys") from v5.6-rc1.
Is it safe to ignore it?
BTW template=ima-buf requirement was added in commit b0418c93f ("IMA/ima_keys.sh: Require template=ima-buf, fix grep pattern")

Also, shouldn't we check that there is none of the other templates (e.g. template=ima-ng, ...)?

> Update keys tests to not check for ima template in the policy rule.

> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
> This patch is based
> in https://github.com/pevik/ltp/commits/ima/selinux.v2.draft
> in branch ima/selinux.v2.draft.

>  testcases/kernel/security/integrity/ima/tests/ima_keys.sh | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> index c9eef4b68..a3a7afbf7 100755
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -15,8 +15,7 @@ TST_CLEANUP=cleanup
>  . ima_setup.sh

>  FUNC_KEYCHECK='func=KEY_CHECK'
> -TEMPLATE_BUF='template=ima-buf'
> -REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_KEYCHECK)"
> +REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK)"
nit: remove brackets:
REQUIRED_POLICY="^measure.*$FUNC_KEYCHECK"

There is
testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy file,
which should be a helper to load proper policy and needs to be updated as well:
-measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
+measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test

I was also thinking to move keyrings to REQUIRED_POLICY, e.g.:

KEYRINGS="keyrings=\.[a-z]+"
REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$KEYRINGS|$KEYRINGS.*$FUNC_KEYCHECK)"

Kind regards,
Petr

>  setup()
>  {
> @@ -33,7 +32,7 @@ check_keys_policy()
>  	local pattern="$1"

>  	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
> -		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
> +		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK"
>  		return 1
>  	fi
>  	return 0

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
