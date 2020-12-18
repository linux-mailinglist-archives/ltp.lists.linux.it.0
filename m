Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 040982DE8F8
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 19:37:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40D8E3C66E4
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 19:37:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AEF933C0041
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 19:37:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 292B22009FF
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 19:37:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D51BAC7B;
 Fri, 18 Dec 2020 18:37:48 +0000 (UTC)
Date: Fri, 18 Dec 2020 19:37:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <X9z2+nXBdTMqHPgD@pevik>
References: <20200928194730.20862-1-nramas@linux.microsoft.com>
 <20200928194730.20862-2-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928194730.20862-2-nramas@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/1] ima: Add test for selinux measurement
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
Cc: paul@paul-moore.com, stephen.smalley.work@gmail.com,
 tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lakshmi, Mimi, all,

@Lakshmi
TL;DR: I added some fixes in my fork, branch ima/selinux.v2.draft,
https://github.com/pevik/ltp/commits/ima/selinux.v2.draft

+ added 3 additional commits, one of them as you as the author.
I moved some functions to testcases/lib/tst_security.sh, renamed them.
Can you please have a look and test? I don't have any SELinux machine.

@Mimi, all: any comment to this test? My changes are just LTP cleanup
so you can comment it on this patchset.
I suppose you get to this in January.

Some notes for my changes:

As files are quite similar (checks etc), I put both tests into single
file ima_selinux.sh.

> New functionality is being added to IMA to measure data provided by
> kernel components. With this feature, IMA policy can be set to enable
> measuring data provided by Linux Security Modules (LSM). Currently one
> such LSM namely selinux is being updated to use this functionality.
> This new functionality needs test automation in LTP.

> Add test cases which verify that the IMA subsystem correctly measures
> the data provided by selinux.

Could you please put into commit message and test kernel commit hash relevant
for the test. Is that 8861d0af642c646c8e148ce34c294bdef6f32f6a (merged into
v5.10-rc1) or there are more relevant commits?

...
> +### IMA SELinux test
> +
> +To enable IMA to measure SELinux state and policy, `ima_selinux_policy.sh`
> +and `ima_selinux_state.sh` require a readable IMA policy, as well as
> +a loaded measure policy with
> +`measure func=CRITICAL_DATA data_sources=selinux template=ima-buf`
I put this into
testcases/kernel/security/integrity/ima/datafiles/ima_selinux/selinux.policy
and mention it in docs.

> +test1()
> +{
> +	local policy_digest expected_policy_digest algorithm
> +	local data_source_name="selinux"
> +	local pattern="data_sources=[^[:space:]]*$data_source_name"
> +	local tmp_file="$TST_TMPDIR/selinux_policy_tmp_file.txt"
> +
> +	check_policy_pattern "$pattern" $FUNC_CRITICAL_DATA $TEMPLATE_BUF > $tmp_file || return
> +
> +	tst_res TINFO "Verifying selinux policy measurement"
> +
> +	#
> +	# Trigger a measurement by changing selinux state
> +	#
> +	update_selinux_state
Here I used tst_update_selinux_state.

...
> --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh

> +#
> +# Update selinux state. This is used for validating IMA
> +# measurement of selinux constructs.
> +#
> +update_selinux_state()
> +{
> +	local cur_val new_val
> +
> +	cur_val=$(cat $SELINUX_FOLDER/checkreqprot)
> +
> +	if [ $cur_val = 1 ]; then
> +		new_val=0
> +	else
> +		new_val=1
> +	fi
> +
> +	echo $new_val > $SELINUX_FOLDER/checkreqprot
> +}
> +
> +#
> +# Verify selinux is enabled in the system
> +#
> +check_selinux_state()
> +{
> +	[ -d $SELINUX_FOLDER ] || tst_brk TCONF "selinux is not enabled"
> +}

As I mentioned above, this is not needed as I put them under different names in
testcases/lib/tst_security.sh.

>  mount_helper()
>  {
>  	local type="$1"
> @@ -238,6 +265,7 @@ ima_setup()
>  	ASCII_MEASUREMENTS="$IMA_DIR/ascii_runtime_measurements"
>  	BINARY_MEASUREMENTS="$IMA_DIR/binary_runtime_measurements"
>  	IMA_POLICY="$IMA_DIR/policy"
> +	SELINUX_FOLDER="$SYSFS/fs/selinux"

nit: I renamed it to $SELINUX_DIR (for consistency with $IMA_DIR)
and moved to ima_selinux.sh.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
