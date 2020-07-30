Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64E233951
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 21:50:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A90B93C589B
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 21:50:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D27C83C059F
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 21:50:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4EF141003C50
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 21:50:42 +0200 (CEST)
Received: from localhost.localdomain
 (pool-96-246-152-186.nycmny.fios.verizon.net [96.246.152.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D1A22074B;
 Thu, 30 Jul 2020 19:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596138640;
 bh=YvcGbYZEw3vFmip1LWbW7P2dPiKLq+rSoC2yjz9Nw/A=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Xk3mmOsJjzD8KcGkOW+392890YPvEG3jzTlNo/swEFXpPUJzzze0j44g36LLDDIw4
 uOPtgEqmcONDTlsXzGvluBFv6LYvVXqmcjP47IjT9NFY/TslmutretGymK0f2omBVq
 QcbAlfBk/LUlzgj6EUJX7DMthm88Ygk2zf33fHQs=
Message-ID: <1596138638.25003.6.camel@kernel.org>
From: Mimi Zohar <zohar@kernel.org>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Thu, 30 Jul 2020 15:50:38 -0400
In-Reply-To: <20200727223041.13110-3-pvorel@suse.cz>
References: <20200727223041.13110-1-pvorel@suse.cz>
 <20200727223041.13110-3-pvorel@suse.cz>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/4] IMA: Add policy related helpers
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, 2020-07-28 at 00:30 +0200, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <pvorel@suse.cz>

Other than inverting the [ -f $IMA_POLICY ] tests.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

> ---
> New in v5.
> 
>  .../security/integrity/ima/tests/ima_setup.sh | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> index 975ce9cbb..c46f273ab 100644
> --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> @@ -54,6 +54,45 @@ compute_digest()
>  	return 1
>  }
>  
> +check_policy_readable()
> +{
> +	if [ -f $IMA_POLICY ]; then
> +		tst_res TINFO "missing $IMA_POLICY (reboot or CONFIG_IMA_WRITE_POLICY=y required)"
> +		return 1
> +	fi
> +	cat $IMA_POLICY > /dev/null 2>/dev/null
> +}
> +
> +require_policy_readable()
> +{
> +	if [ -f $IMA_POLICY ]; then
> +		tst_brk TCONF "missing $IMA_POLICY (reboot or CONFIG_IMA_WRITE_POLICY=y required)"
> +	fi
> +	if ! check_policy_readable; then
> +		tst_brk TCONF "cannot read IMA policy (CONFIG_IMA_READ_POLICY=y required)"
> +	fi
> +}
> +
> +check_ima_policy_content()
> +{
> +	local pattern="$1"
> +	local grep_params="${2--q}"
> +
> +	check_policy_readable || return 1
> +	grep $grep_params "$pattern" $IMA_POLICY
> +}
> +
> +require_ima_policy_content()
> +{
> +	local pattern="$1"
> +	local grep_params="${2--q}"
> +
> +	require_policy_readable
> +	if ! grep $grep_params "$pattern" $IMA_POLICY; then
> +		tst_brk TCONF "IMA policy does not specify '$pattern'"
> +	fi
> +}
> +
>  require_ima_policy_cmdline()
>  {
>  	local policy="$1"


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
