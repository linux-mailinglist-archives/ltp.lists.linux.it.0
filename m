Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9653230A9
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 19:26:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C51F3C60DB
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 19:26:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A39AD3C2656
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 19:26:28 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id E5B011A008BB
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 19:26:27 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id B93C820A247E;
 Tue, 23 Feb 2021 10:26:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B93C820A247E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614104785;
 bh=NUMe5lmR/dT/1V1j2O+ngIlr8sbdiTRotyWRQGMQDvk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gDjy5Eym+S5L8KFY91UT0Oj9kY+3k3pJigJ+InDBWUO2Kx9OYeTQPTiEjgJkXxpni
 niBPEoNxfXtG8RzqR8vduHk1RqYerUFW/Wq/prSapeJtqD1p9jXQK3jsCBzgiwHaF+
 eRWTjwj9SnSCk1hh5h8VtKroO+uNyw5AcfWiOBoQ=
To: Petr Vorel <pvorel@suse.cz>
References: <20210222023805.12846-1-nramas@linux.microsoft.com>
 <YDVCsNAfn+Ot6QIB@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <fdda206c-e156-d66b-7f53-0ee9c1417597@linux.microsoft.com>
Date: Tue, 23 Feb 2021 10:26:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YDVCsNAfn+Ot6QIB@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

On 2/23/21 10:00 AM, Petr Vorel wrote:

> 
>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
> ...
>> +validate_policy_capabilities()
>> +{
>> +	local measured_cap measured_value expected_value
>> +	local result=1
>> +	local inx=7
>> +
>> +	# Policy capabilities flags start from "network_peer_controls"
>> +	# in the measured SELinux state at offset 7 for 'awk'
>> +	while [ $inx -lt 20 ]; do
>> +		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
>> +		inx=$(( $inx + 1 ))
>> +
>> +		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
>> +		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
>> +		if [ "$measured_value" != "$expected_value" ];then
>> +			tst_res TWARN "$measured_cap: expected: $expected_value, got: $digest"
> We rarely use TWARN in the tests, only when the error is not related to the test result.
> Otherwise we use TFAIL.
ok - I will change it to TFAIL.

> 
> The rest LGTM.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> I did few formatting and style changes:
> https://github.com/pevik/ltp/commits/ima/selinux.v2.fixes
> (branch ima/selinux.v2.fixes), see diff below.
The changes look. Thanks Petr.
I do have one comment - please see below.

> 
> As we discuss, I'm going tom merge test when patchset is merged in maintainers tree,
> please ping me. And ideally we should mention kernel commit hash as a comment in
> the test.
Will do. Thank you.

> 
> Thanks a lot!
> 
> Kind regards,
> Petr
> 
> diff --git testcases/kernel/security/integrity/ima/tests/ima_selinux.sh testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
> index e5060a5e3..ed758631b 100755
> --- testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
> +++ testcases/kernel/security/integrity/ima/tests/ima_selinux.sh
> @@ -13,16 +13,14 @@ TST_SETUP="setup"
>   . ima_setup.sh
>   
>   FUNC_CRITICAL_DATA='func=CRITICAL_DATA'
> -REQUIRED_POLICY="^measure.*($FUNC_CRITICAL_DATA)"
> +REQUIRED_POLICY="^measure.*$FUNC_CRITICAL_DATA"
>   
>   setup()
>   {
> -	SELINUX_DIR=$(tst_get_selinux_dir)
> -	if [ -z "$SELINUX_DIR" ]; then
> -		tst_brk TCONF "SELinux is not enabled"
> -		return
> -	fi
> +	tst_require_selinux_enabled
Please correct me if I have misunderstood this one:

tst_require_selinux_enabled is checking if SELinux is enabled in 
"enforce" mode. Would this check fail if SELinux is enabled in 
"permissive" mode?

For running the test, we just need SELinux to be enabled. I verify that 
by checking for the presence of SELINUX_DIR.

thanks,
  -lakshmi

>   	require_ima_policy_content "$REQUIRED_POLICY" '-E' > $TST_TMPDIR/policy.txt
> +
> +	SELINUX_DIR=$(tst_get_selinux_dir)
>   }
>   
>   # Format of the measured SELinux state data.
> @@ -41,16 +39,16 @@ validate_policy_capabilities()
>   	# in the measured SELinux state at offset 7 for 'awk'
>   	while [ $inx -lt 20 ]; do
>   		measured_cap=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
> -		inx=$(( $inx + 1 ))
> +		inx=$(($inx + 1))
>   
>   		measured_value=$(echo $1 | awk -F'[=;]' -v inx="$inx" '{print $inx}')
>   		expected_value=$(cat "$SELINUX_DIR/policy_capabilities/$measured_cap")
> -		if [ "$measured_value" != "$expected_value" ];then
> +		if [ "$measured_value" != "$expected_value" ]; then
>   			tst_res TWARN "$measured_cap: expected: $expected_value, got: $digest"
>   			result=0
>   		fi
>   
> -		inx=$(( $inx + 1 ))
> +		inx=$(($inx + 1))
>   	done
>   
>   	return $result
> @@ -109,7 +107,6 @@ test2()
>   	local initialized_value
>   	local enforced_value expected_enforced_value
>   	local checkreqprot_value expected_checkreqprot_value
> -	local result
>   
>   	tst_res TINFO "verifying SELinux state measurement"
>   
> @@ -149,27 +146,25 @@ test2()
>   	measured_data=$(cat $state_file)
>   	enforced_value=$(echo $measured_data | awk -F'[=;]' '{print $4}')
>   	expected_enforced_value=$(cat $SELINUX_DIR/enforce)
> -	if [ "$expected_enforced_value" != "$enforced_value" ];then
> +	if [ "$expected_enforced_value" != "$enforced_value" ]; then
>   		tst_res TFAIL "enforce: expected: $expected_enforced_value, got: $enforced_value"
>   		return
>   	fi
>   
>   	checkreqprot_value=$(echo $measured_data | awk -F'[=;]' '{print $6}')
>   	expected_checkreqprot_value=$(cat $SELINUX_DIR/checkreqprot)
> -	if [ "$expected_checkreqprot_value" != "$checkreqprot_value" ];then
> +	if [ "$expected_checkreqprot_value" != "$checkreqprot_value" ]; then
>   		tst_res TFAIL "checkreqprot: expected: $expected_checkreqprot_value, got: $checkreqprot_value"
>   		return
>   	fi
>   
>   	initialized_value=$(echo $measured_data | awk -F'[=;]' '{print $2}')
> -	if [ "$initialized_value" != "1" ];then
> +	if [ "$initialized_value" != "1" ]; then
>   		tst_res TFAIL "initialized: expected 1, got: $initialized_value"
>   		return
>   	fi
>   
> -	validate_policy_capabilities $measured_data
> -	result=$?
> -	if [ $result = 0 ]; then
> +	if validate_policy_capabilities $measured_data; then
>   		tst_res TFAIL "policy capabilities did not match"
>   		return
>   	fi
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
