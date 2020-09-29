Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0D627CA1B
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 14:17:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F8BD3C2AA9
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 14:17:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6899F3C0151
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 14:17:38 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E0B4F200982
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 14:17:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27112ACC6;
 Tue, 29 Sep 2020 12:17:37 +0000 (UTC)
Date: Tue, 29 Sep 2020 14:17:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200929121735.GA11889@dell5510>
References: <20200925185034.24155-1-pvorel@suse.cz>
 <20200925185034.24155-4-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925185034.24155-4-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] ima_tpm.sh: Fix calculating boot aggregate
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
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

>  test1()
>  {
>  	tst_res TINFO "verify boot aggregate"

> -	local zero="0000000000000000000000000000000000000000"
>  	local tpm_bios="$SECURITYFS/tpm0/binary_bios_measurements"
> -	local ima_measurements="$ASCII_MEASUREMENTS"
> -	local boot_aggregate boot_hash line
> +	local cmd="evmctl ima_boot_aggregate"
> +	local boot_aggregate cmd zero

> -	# IMA boot aggregate
> -	read line < $ima_measurements
> -	boot_hash=$(echo $line | awk '{print $(NF-1)}' | cut -d':' -f2)
> +	if [ "$MISSING_EVMCTL" = 1 ]; then
> +		if [ -f "$tpm_bios" ]; then
I leaved this error during rebase:
if [ ! -f "$tpm_bios" ]; then

I'm still investigating corner case issue when
/sys/kernel/security/tpm0/binary_bios_measurements
is not presented (mostly when no TPM device, thus IMA "TPM-bypass" code being
used, but sometimes also for TPM 2.0 which does not export event log).

I'll send shortly v3.

Kind regards,
Petr

> +			tst_res TCONF "missing $tpm_bios, $ERRMSG_EVMCTL"
> +			return
> +		fi
> +		tst_check_cmds ima_boot_aggregate || return
> +		cmd="ima_boot_aggregate -f $tpm_bios"
> +	fi
> +	tst_res TINFO "using command: $cmd"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
