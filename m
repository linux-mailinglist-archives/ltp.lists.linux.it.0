Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CF327323407
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 00:01:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87B2E3C60C3
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 00:01:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C22783C1D2B
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 00:01:50 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 084DE600788
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 00:01:49 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0208620B6C40;
 Tue, 23 Feb 2021 15:01:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0208620B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614121308;
 bh=YgvvF1ZA37nOG01x0OVvh9FjTSqplz7AT39j3cpYs3c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Tbou0/fsQ80HZAFWAkqhTGGyVkIRBky07qUStocc9fhuyEyurENl1GS6AwsrLN6fN
 WIIiaKLlFddpFAxN2ob+6WjrrHipM/lrc1EgJrziTwcnaSUJVKrGD8mJ82AzrO7nK9
 1kSTbQQ5/BjlvYf3+VxUnl1ouQX5XxFd3VmEJRvY=
To: Petr Vorel <pvorel@suse.cz>
References: <20210222023805.12846-1-nramas@linux.microsoft.com>
 <YDVCsNAfn+Ot6QIB@pevik>
 <fdda206c-e156-d66b-7f53-0ee9c1417597@linux.microsoft.com>
 <YDV+SdQqGnCoykph@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <21490e27-a965-7d25-4c44-07bd89d0ac40@linux.microsoft.com>
Date: Tue, 23 Feb 2021 15:01:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YDV+SdQqGnCoykph@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: paul@paul-moore.com, selinux@vger.kernel.org,
 stephen.smalley.work@gmail.com, tusharsu@linux.microsoft.com,
 linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2/23/21 2:14 PM, Petr Vorel wrote:
>> On 2/23/21 10:00 AM, Petr Vorel wrote:
> 
> 
>>>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
>>> ...
>>>> +validate_policy_capabilities()
>>>> +{
>>>> +	local measured_cap measured_value expected_value
>>>> +	local result=1
>>>> +	local inx=7
>>>> +
>>>> +	# Policy capabilities flags start from "network_peer_controls"
>>>> +	# in the measured SELinux state at offset 7 for 'awk'
>>>> +	while [ $inx -lt 20 ]; do
>>>> +		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
>>>> +		inx=$(( $inx + 1 ))
>>>> +
>>>> +		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
>>>> +		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
>>>> +		if [ "$measured_value" != "$expected_value" ];then
>>>> +			tst_res TWARN "$measured_cap: expected: $expected_value, got: $digest"
>>> We rarely use TWARN in the tests, only when the error is not related to the test result.
>>> Otherwise we use TFAIL.
>> ok - I will change it to TFAIL.
> Thanks!
> But I've noticed that this error is handled twice, first in validate_policy_capabilities()
> as TWARN (or TFAIL) and then in test2(). Let's use TPASS/TFAIL in
> validate_policy_capabilities():
Sure - will make that change.

> 
> validate_policy_capabilities()
> {
> 	local measured_cap measured_value expected_value
> 	local inx=7
> 
> 	# Policy capabilities flags start from "network_peer_controls"
> 	# in the measured SELinux state at offset 7 for 'awk'
> 	while [ $inx -lt 20 ]; do
> 		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
> 		inx=$(($inx + 1))
> 
> 		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
> 		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
> 		if [ "$measured_value" != "$expected_value" ]; then
> 			tst_res TFAIL "$measured_cap: expected: $expected_value, got: $digest"
> 			return
> 		fi
> 
> 		inx=$(($inx + 1))
> 	done
> 
> 	tst_res TPASS "SELinux state measured correctly"
> }
> 
> test2()
> {
> 	...
> 	validate_policy_capabilities $measured_data
> }
> 
> ...
>>> As we discuss, I'm going tom merge test when patchset is merged in maintainers tree,
>>> please ping me. And ideally we should mention kernel commit hash as a comment in
>>> the test.
>> Will do. Thank you.
> Thanks!
> 
> ...
>>> +++ testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
>>> @@ -13,16 +13,14 @@ TST_SETUP="setup"
>>>    . ima_setup.sh
>>>    FUNC_CRITICAL_DATA='func=CRITICAL_DATA'
>>> -REQUIRED_POLICY="^measure.*($FUNC_CRITICAL_DATA)"
>>> +REQUIRED_POLICY="^measure.*$FUNC_CRITICAL_DATA"
>>>    setup()
>>>    {
>>> -	SELINUX_DIR=$(tst_get_selinux_dir)
>>> -	if [ -z "$SELINUX_DIR" ]; then
>>> -		tst_brk TCONF "SELinux is not enabled"
>>> -		return
>>> -	fi
>>> +	tst_require_selinux_enabled
>> Please correct me if I have misunderstood this one:
> 
>> tst_require_selinux_enabled is checking if SELinux is enabled in "enforce"
>> mode. Would this check fail if SELinux is enabled in "permissive" mode?
> 
>> For running the test, we just need SELinux to be enabled. I verify that by
>> checking for the presence of SELINUX_DIR.
> 
> Good catch. Your original version is correct (put it back into ima/selinux.v2.fixes).
> I didn't put a helper for it, because you need $SELINUX_DIR anyway.
> Thus removed tst_require_selinux_enabled() as not needed.
Thanks

> 
> I renamed tst_selinux_enabled() to tst_selinux_enforced() to make the purpose clearer
> (commit 82b598ea1 IMA: Add test for selinux measurement).
> 
> I've updated branch ima/selinux.v2.fixes with all mentioned changes
> https://github.com/pevik/ltp/commits/ima/selinux.v2.fixes
> 
Thanks again. I'll make my changes in this branch and post the patches 
later this week.

  -lakshmi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
