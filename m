Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1232F5B7
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 23:10:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 63EAD3C6DD6
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Mar 2021 23:10:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 570E53C4E61
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 23:10:28 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 581161000675
 for <ltp@lists.linux.it>; Fri,  5 Mar 2021 23:10:27 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1F51A20B83EA;
 Fri,  5 Mar 2021 14:10:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1F51A20B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614982225;
 bh=tS0kZd38cOZYLhiGPqvSavC58Q8S3BMf+o9IS38H8nQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kboBfiBs6sRWbRp8dsjwiDjBIlhxry7KlLF4JwBi6NCs9Tltbf+ECDX/wS8Sf4nWL
 irGUQ2Zcbf0P5D77u03Bv2aAeP63i9oWG+pCAx3l9ZJOLiFW15Xmy6rZPNNlnBj+8V
 DFp+28GLAsIxPB8qqjCU75jhHKLnomrCWJHnJNSw=
To: Petr Vorel <pvorel@suse.cz>
References: <20210303203254.12856-1-nramas@linux.microsoft.com>
 <YEJZIQqa1arYKwK+@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <33ba6274-e7ef-27de-b481-5a702136c0df@linux.microsoft.com>
Date: Fri, 5 Mar 2021 14:10:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YEJZIQqa1arYKwK+@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

A small change is needed:

In the while loop, for each line of the KEY_CHECK policy, we need to 
check if a "template" is specified, and if it is then verify if it is 
"ima-buf".

> You need to do:
> while read line; do
> 	if ! echo $line | grep -q $template; then
> 		tst_res TCONF "only $template can be specified for $func"
> 		return 1
> 	fi
> done < $TST_TMPDIR/policy.txt
> return 0

Please see the change below:

while read line; do
	if echo $line | grep -q 'template=' && ! echo $line | grep -q $template 
; then
		tst_res TCONF "only $template can be specified for $func"
		return 1
	fi
done < $TST_TMPDIR/policy.txt
return 0

With check_policy_template() moved from ima_setup.sh to ima_keys.sh, the 
test works fine

When the policy contains the following
    measure func=KEY_CHECK keyrings=key_import_test template=ima-buf
    measure func=KEY_CHECK keyrings=.builtin_trusted_keys

the test passes:

ima_keys 1 TINFO: verify key measurement for keyrings and templates 
specified in IMA policy
ima_keys 1 TINFO: keyrings: 'key_import_test|\.builtin_trusted_keys'
ima_keys 1 TINFO: templates: 'ima-buf'
ima_keys 1 TPASS: specified keyrings were measured correctly


But if the policy is changed to below:
    measure func=KEY_CHECK keyrings=key_import_test template=ima-buf
    measure func=KEY_CHECK keyrings=.builtin_trusted_keys template=ima-sig

the test fails as expected.

ima_keys 1 TINFO: verify key measurement for keyrings and templates 
specified in IMA policy
ima_keys 1 TCONF: only template=ima-buf can be specified for func=KEY_CHECK

I'll post the updated patch shortly.

thanks,
  -lakshmi



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
