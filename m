Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DE532F402
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 20:36:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 33FED3C6DE4
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 20:36:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 180FF3C5639
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 20:36:54 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id CBCC6600984
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 20:36:53 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id B84F620B83EA;
 Fri,  5 Mar 2021 11:36:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B84F620B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614973011;
 bh=4XfKI01xCGDF7/kmNKwFpOEKuZ6joFfuhk32D0n4kn8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GUC8b22xykyN8ATFMSP79Z8qSm/7lsAlL1fP4qUW7TuWpAnOv8h+aM2jGoSrACexA
 8UxZToa4s5zOA0PAMI47ELxwMSqCqLCb5BCUWRjheJPKW9xZAY1OQNgphHMCis93DK
 7y8ZzT37JqcdBJguCstuU1jTUe1a8t9D3yevWkJQ=
To: Petr Vorel <pvorel@suse.cz>
References: <20210303203254.12856-1-nramas@linux.microsoft.com>
 <YEJZIQqa1arYKwK+@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <466bc969-977f-e843-1f90-711a6d1193e0@linux.microsoft.com>
Date: Fri, 5 Mar 2021 11:36:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YEJZIQqa1arYKwK+@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Allow only ima-buf template for key
 measurement
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
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 3/5/21 8:15 AM, Petr Vorel wrote:

Hi Petr,

> 
> for my record: previous version was
> https://patchwork.ozlabs.org/project/ltp/patch/20210222023421.12576-1-nramas@linux.microsoft.com/
> 
>> ima-buf is the default IMA template used for all buffer measurements.
>> Therefore, IMA policy rule for measuring keys need not specify
>> an IMA template.  But if a template is specified for key measurement
>> rule then it must be only ima-buf.
> 
>> Update keys tests to not require a template to be specified for
>> key measurement rule, but if a template is specified verify it is
>> only ima-buf.
> Good, but there are some issues, see below.
> 
> ...
>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
> ...
>> +	check_policy_template "template=ima-buf" $FUNC_KEYCHECK || return
>> +
>>   	check_keys_policy "$pattern" > $tmp_file || return
>>   	keycheck_lines=$(cat $tmp_file)
>>   	keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
>> @@ -101,6 +103,8 @@ test2()
> 
>>   	tst_res TINFO "verify measurement of certificate imported into a keyring"
> 
>> +	check_policy_template "template=ima-buf" $FUNC_KEYCHECK || return
>> +
>>   	check_keys_policy "$pattern" >/dev/null || return
> 
>>   	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
>> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
>> index 59a7ffeac..01ebec2b6 100644
>> --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
>> @@ -107,6 +107,22 @@ check_ima_policy_cmdline()
>>   	return 1
>>   }
> 
>> +check_policy_template()
>> +{
>> +	local template="$1"
>> +	local func="$2"
>> +	grep -E "template=" $TST_TMPDIR/policy.txt | while read line
>> +	do
>> +		ima_template=$(echo $line | grep $template)
>> +		if [ -z "$ima_template" ]; then
> instead of putting it into variable, why not just using grep?
> if ! echo $line | grep -q $template; then
> 
Sure - will make this change.

>> +			tst_res TCONF "Only $template can be specified for $func"
>> +			return 1
> Have you test it? This will not work. There is ${PIPESTATUS[@]} bash/zsh
> array, thus 1 is in $pipestatus[1]. But that's bashism, which will not work on
> dash busybox ash, ...
> 

I tested it by running "/opt/ltp/run -f ima -s keys" to run the keys 
test in IMA. I followed the pattern in check_keys_policy() to check for 
the template and validate the change. I will check this again and 
update. Sorry about that.

> You need to do:
> while read line; do
> 	if ! echo $line | grep -q $template; then
> 		tst_res TCONF "only $template can be specified for $func"
> 		return 1
> 	fi
> done < $TST_TMPDIR/policy.txt
> return 0

Sure - will make this change.

> 
> *BUT* on vanilla 5.11 with and SLES 5.3.18-47-default with many backports when
> testing with this wrong policy:
> measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-ng
> 
> 
> ima_keys 1 TINFO: verify key measurement for keyrings and templates specified in IMA policy
> ima_keys 1 TCONF: Only template=ima-buf can be specified for func=KEY_CHECK
> ima_keys 1 TINFO: keyrings: '\.ima|\.evm|\.builtin_trusted_keys|\.blacklist|key_import_test'
> ima_keys 1 TINFO: templates: 'ima-ng'
> ima_keys 1 TPASS: specified keyrings were measured correctly
>             ^
> first test passes. Why? Is that correct?
> I haven't tested any other templates.
No - the test should not pass if an incorrect template is specified. I 
will check this again and update.

> 
> ima_keys 2 TINFO: verify measurement of certificate imported into a keyring
> ima_keys 2 TCONF: Only template=ima-buf can be specified for func=KEY_CHECK
> errno: No such file or directory (2)
> ima_keys 2 TBROK: unable to import a certificate into key_import_test keyring
> 
>> +		fi
>> +	done
> 
> Besides that, I'd like to put check_policy_template() into ima_keys.sh because
> 1) is so far needed only in ima_keys.sh 2) it expects $TST_TMPDIR/policy.txt.
> Functions in ima_setup.sh which are used for more tests should not expect any
> function was called before.
Agreed. I'll move check_policy_template() to ima_keys.sh.

> 
> dm-crypt measurement tests from Tushar Sugandhi will require these, I'll put it
> into ima_setup.sh during rebase and probably add policy file as a function parameter.
That sounds good.

Thanks a lot Petr.

  -lakshmi


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
