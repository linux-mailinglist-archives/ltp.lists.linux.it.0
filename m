Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16680322DFF
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 16:52:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E4E83C5EE6
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 16:52:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id DCA183C58D5
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 16:52:37 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0729B601158
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 16:52:36 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id BFCCA20B6C40;
 Tue, 23 Feb 2021 07:52:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFCCA20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614095554;
 bh=faEJBn8Q16fecxyvqfEcpWpy1hmaT12R7RUhZQ6+NgU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WwuOum/SmxNQ30yI+rMA90ZsQGSofXVNSj+WwXlXiw3z1qR3nRuYydlvlkrwGTepW
 /OwhECAglnrPuVnjXNFJ28AMiz/8DY/LB21cTKouKHmjLzTh/z4CDuceKu4TLMuLGi
 73sNRzcmIHJDPyLbTy+2Kb//2jTMA+SADBzRghqk=
To: Petr Vorel <pvorel@suse.cz>
References: <20210222023421.12576-1-nramas@linux.microsoft.com>
 <YDTJtl9C9HbRILQb@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <2b7f2f88-7df8-bd31-59cb-fd74bfe555fd@linux.microsoft.com>
Date: Tue, 23 Feb 2021 07:52:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YDTJtl9C9HbRILQb@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] IMA: Check for ima-buf template is not required
 for keys tests
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

On 2/23/21 1:24 AM, Petr Vorel wrote:

Hi Petr,

> 
>> ima-buf is the default IMA template used for all buffer measurements.
>> Therefore, IMA policy rule for measuring keys need not specify
>> an IMA template.
> Good catch. But was it alway?

> IMHO ima-buf as default was added in dea87d0889dd ("ima: select ima-buf template for buffer measurement") in v5.11-rc1.
For key measurements ima-buf template was required in the policy rule, 
but with the above commit (dea87d0889dd) it was changed to ima-buf. So 
we no longer need to specify the template in the policy.

> But test1() tests 450d0fd51564 ("IMA: Call workqueue functions to measure queued keys") from v5.6-rc1.
> Is it safe to ignore it?
Even when the key is queued for measurement, ima-buf template will be 
used when the key is dequeued. Not sure if that answers your question.

> BTW template=ima-buf requirement was added in commit b0418c93f ("IMA/ima_keys.sh: Require template=ima-buf, fix grep pattern")
> 
> Also, shouldn't we check that there is none of the other templates (e.g. template=ima-ng, ...)?
This is a good point - yes: we should check if no other template other 
than ima-buf is specified in the policy rule for measuring keys.

> 
>> Update keys tests to not check for ima template in the policy rule.
> 
>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> ---
>> This patch is based
>> in https://github.com/pevik/ltp/commits/ima/selinux.v2.draft
>> in branch ima/selinux.v2.draft.
> 
>>   testcases/kernel/security/integrity/ima/tests/ima_keys.sh | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
>> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> index c9eef4b68..a3a7afbf7 100755
>> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> @@ -15,8 +15,7 @@ TST_CLEANUP=cleanup
>>   . ima_setup.sh
> 
>>   FUNC_KEYCHECK='func=KEY_CHECK'
>> -TEMPLATE_BUF='template=ima-buf'
>> -REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_KEYCHECK)"
>> +REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK)"
> nit: remove brackets:
> REQUIRED_POLICY="^measure.*$FUNC_KEYCHECK"
Sure - will remove that.

> 
> There is
> testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy file,
> which should be a helper to load proper policy and needs to be updated as well:
> -measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
> +measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test
> 
> I was also thinking to move keyrings to REQUIRED_POLICY, e.g.:
> 
> KEYRINGS="keyrings=\.[a-z]+"
> REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$KEYRINGS|$KEYRINGS.*$FUNC_KEYCHECK)"
"keyrings=" is optional in the policy. If keyrings is specified it 
should be checked.

thanks,
  -lakshmi

> 
>>   setup()
>>   {
>> @@ -33,7 +32,7 @@ check_keys_policy()
>>   	local pattern="$1"
> 
>>   	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
>> -		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
>> +		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK"
>>   		return 1
>>   	fi
>>   	return 0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
