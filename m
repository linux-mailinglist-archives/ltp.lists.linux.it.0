Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D805B23EEDE
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 16:15:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56E863C31E9
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 16:15:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1CD8C3C076F
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 16:15:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7D309141CE7D
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 16:15:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9D2DAC41;
 Fri,  7 Aug 2020 14:15:45 +0000 (UTC)
Date: Fri, 7 Aug 2020 16:15:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200807141524.GA3247@dell5510>
References: <20200807112929.8984-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807112929.8984-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] IMA/ima_keys.sh Fix policy content check usage
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

...
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -16,11 +16,14 @@ TST_NEEDS_DEVICE=1
>  # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
>  test1()
>  {
> -	local keyrings keycheck_lines keycheck_line templates test_file="file.txt"
> +	local keyrings keycheck_lines keycheck_line templates
> +	local policy="func=KEY_CHECK"
> +	local test_file="file.txt"

>  	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"

> -	keycheck_lines=$(require_ima_policy_content "func=KEY_CHECK" "")
> +	require_ima_policy_content $policy
> +	keycheck_lines=$(check_ima_policy_content $policy "")
>  	keycheck_line=$(echo "$keycheck_lines" | grep "keyrings" | head -n1)
While working on this patchset, I wonder, why we don't check for
'func=KEY_CHECK.*keyrings' in single grep call instead of grepping it twice.
IMHO single grep call is enough. Or am I missing something?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
