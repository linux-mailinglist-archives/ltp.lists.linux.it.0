Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1045379139
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 16:47:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2E7C3C66FC
	for <lists+linux-ltp@lfdr.de>; Mon, 10 May 2021 16:47:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EC5C3C2646
 for <ltp@lists.linux.it>; Mon, 10 May 2021 16:47:15 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 4D24C60029A
 for <ltp@lists.linux.it>; Mon, 10 May 2021 16:47:14 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5316620B7178;
 Mon, 10 May 2021 07:47:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5316620B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1620658032;
 bh=+MR2sJfy4yb7RLdpuJHh0zxQZPNiqB72G1vqsOMUJtk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jeKp3e6t2M3S7ygHNO9IVKXlUm65R0qawMba3S3p6wmG+PGstklwboisIbj+eaOvs
 dtzEjOxOoAADhonSaII7coRseJJWt+O83bVkbSgWisjGhHHg07vaOw+JUTYLuu2nov
 Kz+oZXKUDzN05GJ7Wro3mAP2VWkpXV6bVs+ifKFg=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210507191414.14795-1-pvorel@suse.cz>
 <20210507191414.14795-2-pvorel@suse.cz>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <f22e507d-1983-b7a0-b5e0-15e1519ca038@linux.microsoft.com>
Date: Mon, 10 May 2021 07:47:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210507191414.14795-2-pvorel@suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] ima_keys.sh: Check policy only once
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 5/7/21 12:14 PM, Petr Vorel wrote:
> Not needed to check the same policy twice.
> Rename to contain 'require' as we use tst_brk.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> new in v4
> 
>   .../security/integrity/ima/tests/ima_keys.sh       | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

> 
> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> index 9951ab999..3476b8007 100755
> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> @@ -1,7 +1,7 @@
>   #!/bin/sh
>   # SPDX-License-Identifier: GPL-2.0-or-later
>   # Copyright (c) 2020 Microsoft Corporation
> -# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
> +# Copyright (c) 2020-2021 Petr Vorel <pvorel@suse.cz>
>   # Author: Lachlan Sneff <t-josne@linux.microsoft.com>
>   #
>   # Verify that keys are measured correctly based on policy.
> @@ -20,6 +20,7 @@ REQUIRED_POLICY="^measure.*$FUNC_KEYCHECK"
>   setup()
>   {
>   	require_ima_policy_content "$REQUIRED_POLICY" '-E' > $TST_TMPDIR/policy.txt
> +	require_valid_policy_template
>   }
>   
>   cleanup()
> @@ -27,15 +28,14 @@ cleanup()
>   	tst_is_num $KEYRING_ID && keyctl clear $KEYRING_ID
>   }
>   
> -check_policy_template()
> +
> +require_valid_policy_template()
>   {
>   	while read line; do
>   	if echo $line | grep -q 'template=' && ! echo $line | grep -q 'template=ima-buf'; then
> -		tst_res TCONF "only template=ima-buf can be specified for KEY_CHECK"
> -		return 1
> +		tst_brk TCONF "only template=ima-buf can be specified for KEY_CHECK"
>   	fi
>   	done < $TST_TMPDIR/policy.txt
> -	return 0
>   }
>   
>   check_keys_policy()
> @@ -59,8 +59,6 @@ test1()
>   
>   	tst_res TINFO "verify key measurement for keyrings and templates specified in IMA policy"
>   
> -	check_policy_template || return
> -
>   	check_keys_policy "$pattern" > $tmp_file || return
>   	keycheck_lines=$(cat $tmp_file)
>   	keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
> @@ -115,8 +113,6 @@ test2()
>   
>   	tst_res TINFO "verify measurement of certificate imported into a keyring"
>   
> -	check_policy_template || return
> -
>   	check_keys_policy "$pattern" >/dev/null || return
>   
>   	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
