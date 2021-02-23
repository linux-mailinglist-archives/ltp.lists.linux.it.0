Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1832339D
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 23:14:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE9823C60EA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 23:14:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7D2453C2BEF
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 23:14:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BE22A1400519
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 23:14:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE642AC69;
 Tue, 23 Feb 2021 22:14:34 +0000 (UTC)
Date: Tue, 23 Feb 2021 23:14:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <YDV+SdQqGnCoykph@pevik>
References: <20210222023805.12846-1-nramas@linux.microsoft.com>
 <YDVCsNAfn+Ot6QIB@pevik>
 <fdda206c-e156-d66b-7f53-0ee9c1417597@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdda206c-e156-d66b-7f53-0ee9c1417597@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Add test for selinux measurement
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
Cc: paul@paul-moore.com, selinux@vger.kernel.org,
 stephen.smalley.work@gmail.com, tusharsu@linux.microsoft.com,
 linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 2/23/21 10:00 AM, Petr Vorel wrote:


> > > +++ b/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
> > ...
> > > +validate_policy_capabilities()
> > > +{
> > > +	local measured_cap measured_value expected_value
> > > +	local result=1
> > > +	local inx=7
> > > +
> > > +	# Policy capabilities flags start from "network_peer_controls"
> > > +	# in the measured SELinux state at offset 7 for 'awk'
> > > +	while [ $inx -lt 20 ]; do
> > > +		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
> > > +		inx=$(( $inx + 1 ))
> > > +
> > > +		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
> > > +		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
> > > +		if [ "$measured_value" != "$expected_value" ];then
> > > +			tst_res TWARN "$measured_cap: expected: $expected_value, got: $digest"
> > We rarely use TWARN in the tests, only when the error is not related to the test result.
> > Otherwise we use TFAIL.
> ok - I will change it to TFAIL.
Thanks!
But I've noticed that this error is handled twice, first in validate_policy_capabilities()
as TWARN (or TFAIL) and then in test2(). Let's use TPASS/TFAIL in
validate_policy_capabilities():

validate_policy_capabilities()
{
	local measured_cap measured_value expected_value
	local inx=7

	# Policy capabilities flags start from "network_peer_controls"
	# in the measured SELinux state at offset 7 for 'awk'
	while [ $inx -lt 20 ]; do
		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
		inx=$(($inx + 1))

		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
		if [ "$measured_value" != "$expected_value" ]; then
			tst_res TFAIL "$measured_cap: expected: $expected_value, got: $digest"
			return
		fi

		inx=$(($inx + 1))
	done

	tst_res TPASS "SELinux state measured correctly"
}

test2()
{
	...
	validate_policy_capabilities $measured_data
}

...
> > As we discuss, I'm going tom merge test when patchset is merged in maintainers tree,
> > please ping me. And ideally we should mention kernel commit hash as a comment in
> > the test.
> Will do. Thank you.
Thanks!

...
> > +++ testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
> > @@ -13,16 +13,14 @@ TST_SETUP="setup"
> >   . ima_setup.sh
> >   FUNC_CRITICAL_DATA='func=CRITICAL_DATA'
> > -REQUIRED_POLICY="^measure.*($FUNC_CRITICAL_DATA)"
> > +REQUIRED_POLICY="^measure.*$FUNC_CRITICAL_DATA"
> >   setup()
> >   {
> > -	SELINUX_DIR=$(tst_get_selinux_dir)
> > -	if [ -z "$SELINUX_DIR" ]; then
> > -		tst_brk TCONF "SELinux is not enabled"
> > -		return
> > -	fi
> > +	tst_require_selinux_enabled
> Please correct me if I have misunderstood this one:

> tst_require_selinux_enabled is checking if SELinux is enabled in "enforce"
> mode. Would this check fail if SELinux is enabled in "permissive" mode?

> For running the test, we just need SELinux to be enabled. I verify that by
> checking for the presence of SELINUX_DIR.

Good catch. Your original version is correct (put it back into ima/selinux.v2.fixes).
I didn't put a helper for it, because you need $SELINUX_DIR anyway.
Thus removed tst_require_selinux_enabled() as not needed.

I renamed tst_selinux_enabled() to tst_selinux_enforced() to make the purpose clearer
(commit 82b598ea1 IMA: Add test for selinux measurement).

I've updated branch ima/selinux.v2.fixes with all mentioned changes
https://github.com/pevik/ltp/commits/ima/selinux.v2.fixes

Kind regards,
Petr

> thanks,
>  -lakshmi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
