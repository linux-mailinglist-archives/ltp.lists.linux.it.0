Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16509209B9F
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 10:59:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 433D23C5890
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jun 2020 10:59:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 904D93C05A2
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 17:27:36 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D32EA200922
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 17:27:35 +0200 (CEST)
Received: from localhost.localdomain
 (pool-96-246-152-186.nycmny.fios.verizon.net [96.246.152.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C358420723;
 Wed, 24 Jun 2020 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593012453;
 bh=Yr6spdNrll7oUOWqWGrs5rYWniDz8G74d4C+lHYWeqA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=FGWath9ExccgBWHxUvajAVlDJq4QDAVtNJkrYpCqiHvuOGNX7PwUbrQaJsH0AXbMv
 8kWysw0OShnjXpVU9wHkaaaxsm0R6F4sVuh2hJS6T7kaZhOB6cB8l+i2kOas22YEjT
 7509SoGSx0/qLtC4zTTeRiYWd8V5x8Qz3yM/LxB4=
Message-ID: <1593012448.27152.59.camel@kernel.org>
From: Mimi Zohar <zohar@kernel.org>
To: Lachlan Sneff <t-josne@linux.microsoft.com>, ltp@lists.linux.it, 
 pvorel@suse.cz
Date: Wed, 24 Jun 2020 11:27:28 -0400
In-Reply-To: <1593004901.27152.17.camel@linux.ibm.com>
References: <20200617234957.10611-1-t-josne@linux.microsoft.com>
 <20200617234957.10611-2-t-josne@linux.microsoft.com>
 <1593004901.27152.17.camel@linux.ibm.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 25 Jun 2020 10:59:30 +0200
Subject: Re: [LTP] [PATCH v3 1/2] IMA: Add a test to verify measurment of
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
Cc: nramas@linux.microsoft.com, balajib@linux.microsoft.com,
 linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

[Resending due to mailer issues]

On Wed, 2020-06-24 at 09:21 -0400, Mimi Zohar wrote:
> Hi Lachian,
> 
> > +
> > +# Based on https://lkml.org/lkml/2019/12/13/564.
> > +# (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
> > +test1()
> > +{
> > +	local keyrings keycheck_line templates test_file=$(mktemp)
> > +
> > +	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
> > +
> > +	[ -f $IMA_POLICY ] || tst_brk TCONF "missing $IMA_POLICY"
> > +
> > +	[ -r $IMA_POLICY ] || tst_brk TCONF "cannot read IMA policy (CONFIG_IMA_READ_POLICY=y required)"
> > +
> > +	keycheck_line=$(grep "func=KEY_CHECK" $IMA_POLICY)
> > +	if [ -z "$keycheck_line" ]; then
> > +		tst_brk TCONF "ima policy does not specify \"func=KEY_CHECK\""
> > +	fi
> > +
> > +	if echo "$keycheck_line" | grep -q "*keyrings*"; then
> > +		tst_brk TCONF "ima policy does not specify a keyrings to check"
> > +	fi
> > +
> > +	keyrings=$(echo "$keycheck_line" | tr " " "\n" | grep "keyrings" | \
> > +		sed "s/\./\\\./g" | cut -d'=' -f2)
> > +	if [ -z "$keyrings" ]; then
> > +		tst_brk TCONF "ima policy has a keyring key-value specifier, but no specified keyrings"
> > +	fi
> > +
> > +	templates=$(echo "$keycheck_line" | tr " " "\n" | grep "template" | \
> > +		cut -d'=' -f2)
> > +
> > +	grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line
> 
> Probably because I have multiple KEY_CHECK rules, this is failing:
> 
> grep: Unmatched ( or \(
> 
> And then it continues merrily alongs its way.
> 
> ima_keys 1 TPASS: specified keyrings were measured correctly
> ima_keys 2 TCONF: missing /etc/keys/x509_ima.der
> 
> Mimi
> 
> > +	do
> > +		local digest expected_digest algorithm
> > +
> > +		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
> > +		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
> > +		keyring=$(echo "$line" | cut -d' ' -f5)
> > +
> > +		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
> > +
> > +		expected_digest="$(compute_digest $algorithm $test_file)" || \
> > +			tst_brk TCONF "cannot compute digest for $algorithm"
> > +
> > +		if [ "$digest" != "$expected_digest" ]; then
> > +			tst_res TFAIL "incorrect digest was found for the ($keyring) keyring"
> > +		fi
> > +	done
> > +
> > +	rm $test_file
> > +
> > +	tst_res TPASS "specified keyrings were measured correctly"
> > +}


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
