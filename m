Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B923EEF1
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 16:19:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0656B3C3209
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 16:19:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8818E3C2565
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 16:19:39 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E4EF1600D79
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 16:18:07 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7A27420B4908;
 Fri,  7 Aug 2020 07:19:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7A27420B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1596809976;
 bh=9UTKQRLLAv9PZnTXUwjNrOzFDyjSffWMD+Uhbj7o5Y4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eqyVzfeSKUxwkTRZzpEOwAAVXq4Zn4jWSv6SMoWhJYULxCOkPhKHSkuR20J0TjMjx
 9Z1A2uTsiEvDehBbQjBCnBQf32ZmOp6v3wZB8NAqbC0xNlvci+rU15vyOC/rKVgMaE
 /tBww1X295wBXF0tSL+M3mRuldnmzMCoF17mx8rI=
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20200807112929.8984-1-pvorel@suse.cz>
 <20200807141524.GA3247@dell5510>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <51daca31-72b6-2a59-bed2-40609af9e420@linux.microsoft.com>
Date: Fri, 7 Aug 2020 07:19:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807141524.GA3247@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-16.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] IMA/ima_keys.sh Fix policy content check usage
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
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/7/20 7:15 AM, Petr Vorel wrote:
> Hi all,
> 
> ...
>> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> @@ -16,11 +16,14 @@ TST_NEEDS_DEVICE=1
>>   # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
>>   test1()
>>   {
>> -	local keyrings keycheck_lines keycheck_line templates test_file="file.txt"
>> +	local keyrings keycheck_lines keycheck_line templates
>> +	local policy="func=KEY_CHECK"
>> +	local test_file="file.txt"
> 
>>   	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
> 
>> -	keycheck_lines=$(require_ima_policy_content "func=KEY_CHECK" "")
>> +	require_ima_policy_content $policy
>> +	keycheck_lines=$(check_ima_policy_content $policy "")
>>   	keycheck_line=$(echo "$keycheck_lines" | grep "keyrings" | head -n1)
> While working on this patchset, I wonder, why we don't check for
> 'func=KEY_CHECK.*keyrings' in single grep call instead of grepping it twice.
> IMHO single grep call is enough. Or am I missing something?
> 

Instead require_ima_policy_content calling "tst_brk" in error condition, 
it can just return false and the caller can handle it as appropriate. 
Would that avoid two grep calls?

thanks,
  -lakshmi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
