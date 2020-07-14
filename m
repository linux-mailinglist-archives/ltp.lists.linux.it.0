Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB40C21EAB0
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 09:55:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9089E3C2A4E
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 09:55:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C2B663C28F5
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 09:55:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 49BDD1A01202
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 09:55:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FA54ADE5;
 Tue, 14 Jul 2020 07:55:44 +0000 (UTC)
Date: Tue, 14 Jul 2020 09:55:39 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <20200714075539.GA23472@dell5510>
References: <20200626021126.56760-1-t-josne@linux.microsoft.com>
 <20200626021126.56760-2-t-josne@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626021126.56760-2-t-josne@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] IMA: Add a test to verify measurment of
 keys
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
Cc: nramas@linux.microsoft.com, balajib@linux.microsoft.com, ltp@lists.linux.it,
 linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lachlan,

...
> +# Based on https://lkml.org/lkml/2019/12/13/564.
> +# (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
> +test1()
> +{
> +	local keyrings keycheck_lines keycheck_line templates test_file="file.txt"
$keycheck_lines and $keycheck_line are a bit hard to distinguish, but we already
use $line later on, thus let's keep it.
> +
> +	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
> +
> +	[ -f $IMA_POLICY ] || tst_brk TCONF "missing $IMA_POLICY"
> +
> +	[ -r $IMA_POLICY ] || tst_brk TCONF "cannot read IMA policy (CONFIG_IMA_READ_POLICY=y required)"
> +
> +	keycheck_lines=$(grep "func=KEY_CHECK" $IMA_POLICY)
> +	if [ -z "$keycheck_lines" ]; then
> +		tst_brk TCONF "ima policy does not specify \"func=KEY_CHECK\""
> +	fi
> +
> +	keycheck_line=$(echo "$keycheck_lines" | grep "keyrings" | head -n1)
> +
> +	if [ -z "$keycheck_line" ]; then
> +		tst_brk TCONF "ima policy does not specify a keyrings to check"
> +	fi
> +
> +	keyrings=$(echo "$keycheck_line" | tr " " "\n" | grep "keyrings" | \
> +		sed "s/\./\\\./g" | cut -d'=' -f2)
> +	if [ -z "$keyrings" ]; then
> +		tst_brk TCONF "ima policy has a keyring key-value specifier, but no specified keyrings"
> +	fi
> +
> +	templates=$(echo "$keycheck_line" | tr " " "\n" | grep "template" | \
> +		cut -d'=' -f2)
> +
> +	success=true
> +
> +	grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line
> +	do
> +		local digest expected_digest algorithm
> +
> +		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
> +		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
> +		keyring=$(echo "$line" | cut -d' ' -f5)
> +
> +		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
> +
> +		expected_digest="$(compute_digest $algorithm $test_file)" || \
> +			tst_brk TCONF "cannot compute digest for $algorithm"
> +
> +		if [ "$digest" != "$expected_digest" ]; then
> +			$success=false
$success=false is wrong, success=false must be used. And it's not defined as
local. And also although it's working this way, LTP shell code style is using
1/empty, not true/false. Can you use:
			fail=1

And also, does it make sense to continue evaluating on error? If not (not sure
myself) return after tst_res TFAIL would be the best.

> +			tst_res TFAIL "incorrect digest was found for the ($keyring) keyring"
> +		fi
> +	done
> +
> +	if $success; then
and here:
if [ "$fail" ]; then
> +		tst_res TPASS "specified keyrings were measured correctly"
> +	fi
...

The rest looks ok to me (no need to repost new version just for this).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
