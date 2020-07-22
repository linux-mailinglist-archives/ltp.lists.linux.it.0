Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 40839229F4E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:34:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04F953C7F45
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:34:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1CFE33C1D5C
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:34:31 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 0B6F5600F22
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:33:12 +0200 (CEST)
Received: from [192.168.1.21] (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 53C3B20B4908;
 Wed, 22 Jul 2020 11:34:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 53C3B20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1595442867;
 bh=lumykPH8Xv1/KoymF5J+Y+VzAg7ZcGzcBw2d6BcnvsE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QrMJjfE7BaMprZE/Ryn0ngnVALf4tLPeP+9Rlu86ipzLCzvS/YngXoguHXyad8FvD
 msditzPnc395I1vXYK9wSyySlfr0w4Awpi44RzdIra1pil8x99uFmcKQtFKL81Xb8t
 DjuOtSPqbzeRk+occtOJMSgatQFbQblsnQdpQ6BA=
To: Mimi Zohar <zohar@linux.ibm.com>, pvorel@suse.cz, ltp@lists.linux.it
References: <20200722164040.23109-1-t-josne@linux.microsoft.com>
 <1595441389.5211.1.camel@linux.ibm.com>
From: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <d1908820-cb58-6196-3ecd-243aa7a652bf@linux.microsoft.com>
Date: Wed, 22 Jul 2020 14:34:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595441389.5211.1.camel@linux.ibm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] IMA: Add test for kexec cmdline measurement
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Thank you for signing off on this patch!

I apologize for the issues on applying. I should've caught the trailing 
spaces, but the inability to apply the README
is actually a result of this patch being based on the custom keyring 
patch that I sent out last Friday [1].

[1]: [PATCH] IMA: Add a test to verify importing a certificate into 
custom keyring

On 7/22/20 2:09 PM, Mimi Zohar wrote:
> On Wed, 2020-07-22 at 12:40 -0400, Lachlan Sneff wrote:
>> IMA policy can be set to measure the command line passed in the kexec system call.
>> There needs to be a test to validate this kexec command line measurement.
>>
>> Add a testcase that verifies that the IMA subsystem has correctly
>> measured the cmdline specified during a kexec.
>>
>> Note that this test does not actually reboot.
>>
>> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
> Other than the patch not applying cleanly and leading blanks,
>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
