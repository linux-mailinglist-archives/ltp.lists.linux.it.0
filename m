Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327B33D942
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:24:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C44013C6411
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Mar 2021 17:24:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 03FE53C2D51
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:24:04 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 36EE81A01185
 for <ltp@lists.linux.it>; Tue, 16 Mar 2021 17:24:03 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1561F20B26E1;
 Tue, 16 Mar 2021 09:24:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1561F20B26E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1615911842;
 bh=y4Z7ovh3h5VbNC+wfzD4pyuYxRSzFDGiST75RbHzIT0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DoQ0y8Cs5W8kpKV0mV4+wDWxncdLEk+RHTrrnfrLh6pJkBtJHqsJdm2k08GDsQ6Zn
 IrjvWmfn16DSGrUb0H5IHP0ENmRa/ejNKXgbdGd4nDfjJnCJOux8mkDs4BTAy5Fk4y
 O9BD84yQu960er7bqEc0xOp8qYtsh+NmVf4wTLW0=
To: Petr Vorel <pvorel@suse.cz>, Mimi Zohar <zohar@linux.ibm.com>
References: <20210314233646.2925-1-nramas@linux.microsoft.com>
 <YFC7j4+wA8xorNgu@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <deeb4320-a064-fd0f-bc1e-8e52be079ff9@linux.microsoft.com>
Date: Tue, 16 Mar 2021 09:23:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YFC7j4+wA8xorNgu@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] IMA: Allow only ima-buf template for key
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

On 3/16/21 7:07 AM, Petr Vorel wrote:
> Hi Lakshmi, Mimi,
> 
>> ima-buf is the default IMA template used for all buffer measurements.
>> Therefore, IMA policy rule for measuring keys need not specify
>> an IMA template.  But if a template is specified for key measurement
>> rule then it must be only ima-buf.
> 
>> Update keys tests to not require a template to be specified for
>> key measurement rule, but if a template is specified verify it is
>> only ima-buf.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
Thanks Petr.

> 
> Just a double check does it always work without template=ima-buf for all kernel versions?
> Or only for kernels with dea87d0889dd ("ima: select ima-buf template for buffer measurement")
> i.e. v5.11-rc1 or backport?
The above change is required. Prior to this change, template has to be 
specified in the policy, otherwise the default template would be used.

> 
> Also, don't we want to change also keycheck.policy?
> Currently it contains:
> measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
> Do we want to drop template=ima-buf to test the default value? Or have two rules
> (one with template=ima-buf, other w/a?)
Good point.

I will send you the v3 patch - with two rules: one with template=buf and 
other without a template, like the following example:

measure func=KEY_CHECK 
keyrings=.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf

measure func=KEY_CHECK keyrings=.ima|.evm

  -lakshmi

> 
> Mimi, any comment on this?
> 
> Kind regards,
> Petr
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
