Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 686A632306B
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 19:16:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B6743C60EA
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 19:16:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 72D063C4C13
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 19:16:35 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9B6D51A000A0
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 19:16:34 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9988320B6C40;
 Tue, 23 Feb 2021 10:16:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9988320B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614104192;
 bh=3zmvt53PNA66gksALwsT99qOTtVwufHUhpdoDWUZNG4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bu31T5ZMUhRpjFIwqQueFAWX/nV0kJASFpYd3s3t2SnMrfxea44ZsdhGx7eBfqzF4
 Q1fwBstKH8tIYlvzFm8EBS7i16d4nNKo9SY8m2gIsRLn/mcYhIVi8SW9hDj+hLAKHs
 gJ1cVNuCXWJWW9ykwiR7D/f//qQF44jevQn4JKvI=
To: Petr Vorel <pvorel@suse.cz>
References: <20210222023421.12576-1-nramas@linux.microsoft.com>
 <YDTJtl9C9HbRILQb@pevik>
 <2b7f2f88-7df8-bd31-59cb-fd74bfe555fd@linux.microsoft.com>
 <YDU77/zetTzs569z@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <c03396df-95de-2054-432e-b289659e6ad2@linux.microsoft.com>
Date: Tue, 23 Feb 2021 10:16:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YDU77/zetTzs569z@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

On 2/23/21 9:31 AM, Petr Vorel wrote:

>>>> ima-buf is the default IMA template used for all buffer measurements.
>>>> Therefore, IMA policy rule for measuring keys need not specify
>>>> an IMA template.
>>> Good catch. But was it alway?
> 
>>> IMHO ima-buf as default was added in dea87d0889dd ("ima: select ima-buf template for buffer measurement") in v5.11-rc1.
>> For key measurements ima-buf template was required in the policy rule, but
>> with the above commit (dea87d0889dd) it was changed to ima-buf. So we no
>> longer need to specify the template in the policy.
> 
>>> But test1() tests 450d0fd51564 ("IMA: Call workqueue functions to measure queued keys") from v5.6-rc1.
>>> Is it safe to ignore it?
>> Even when the key is queued for measurement, ima-buf template will be used
>> when the key is dequeued. Not sure if that answers your question.
> IMHO template=ima-buf is required from v5.6-rc1 to v5.10, right?
That is correct Petr.

> But maybe it's just enough to check that no other template is used as we discuss
> below.
I agree.

> 
>>> BTW template=ima-buf requirement was added in commit b0418c93f ("IMA/ima_keys.sh: Require template=ima-buf, fix grep pattern")
> 
>>> Also, shouldn't we check that there is none of the other templates (e.g. template=ima-ng, ...)?
>> This is a good point - yes: we should check if no other template other than
>> ima-buf is specified in the policy rule for measuring keys.
> It'd be great if you include it in v2.
Will do.

> 
> ...
>>>>    FUNC_KEYCHECK='func=KEY_CHECK'
>>>> -TEMPLATE_BUF='template=ima-buf'
>>>> -REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_KEYCHECK)"
>>>> +REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK)"
>>> nit: remove brackets:
>>> REQUIRED_POLICY="^measure.*$FUNC_KEYCHECK"
>> Sure - will remove that.
> Thanks!
> 
>>> There is
>>> testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy file,
>>> which should be a helper to load proper policy and needs to be updated as well:
>>> -measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
>>> +measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test
> 
>>> I was also thinking to move keyrings to REQUIRED_POLICY, e.g.:
> 
>>> KEYRINGS="keyrings=\.[a-z]+"
>>> REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$KEYRINGS|$KEYRINGS.*$FUNC_KEYCHECK)"
>> "keyrings=" is optional in the policy. If keyrings is specified it should be
>> checked.
> OK, just optional.
> 

I'll see how to validate an optional field and update the test.

thanks,
  -lakshmi




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
