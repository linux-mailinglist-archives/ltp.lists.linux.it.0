Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB192477D5
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 22:02:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 53DAF3C58DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 22:02:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E41033C2FFD
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 22:02:09 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C7C55600831
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 22:02:06 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id B3EC120B4908;
 Mon, 17 Aug 2020 13:02:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B3EC120B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1597694524;
 bh=2kp5ghcCRtPQbyIOLyk13l3Yu40CQWzri5r/ljwsKFI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qJLxntGY2OBmUXuS9DE9TZ1ZeZ092XacdCovENDukXqHHICp1STvVr5gd3P+UV39a
 +iWdeupLAIUUvtyJUXauD8cEY6+zO8foXTTPi9Cjm8ooDHwvKuCzTu7pZi8vbH3zEI
 gX1AvW3zwmS5CnVh4HuvPZPM7C6uYZiBhg5qgL/w=
To: Mimi Zohar <zohar@linux.ibm.com>, Petr Vorel <pvorel@suse.cz>,
 ltp@lists.linux.it
References: <20200817130916.27634-1-pvorel@suse.cz>
 <bc89bf8e0c40e6d66c86b42f55f9bf69ec7e335e.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <cdf45ba0-287b-8fa1-d067-1c6c4f386939@linux.microsoft.com>
Date: Mon, 17 Aug 2020 13:02:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bc89bf8e0c40e6d66c86b42f55f9bf69ec7e335e.camel@linux.ibm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-15.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/4] IMA: verify measurement of certificate
 imported into a keyring
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
Cc: linux-integrity@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/17/20 12:18 PM, Mimi Zohar wrote:

> On Mon, 2020-08-17 at 15:09 +0200, Petr Vorel wrote:
>> Hi Mimi, Lakshmi,
>>
>> changes v2->v3:
>> fixed regression in my third commit.
>> (please verify it on installed LTP, or at least run make install in
>> testcases/kernel/security/integrity/ima/datafiles/ima_keys/)
> 
> I did, but nothing changed.  I probably need to set an environment
> variable.
> 
> After building and installing LTP, it's finding the file, but some of
> the issues still exist:
> 
> ima_keys 1 TINFO: $TMPDIR is on tmpfs => run on loop device
> ima_keys 1 TINFO: Formatting /dev/loop0 with ext3 extra opts=''
> ima_keys 1 TINFO: verify key measurement for keyrings and templates specified in IMA policy
> grep: Unmatched ( or \(
> ima_keys 1 TPASS: specified keyrings were measured correctly
> ima_keys 2 TINFO: verify measurement of certificate imported into a keyring
> keyctl_session_to_parent: Operation not permitted
> ima_keys 2 TPASS: logged certificate matches the original
> 
> IMA policy:
> measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist|key_import_test template=ima-buf
> measure func=KEY_CHECK keyrings=key_import_test template=ima-buf
> 

I think I see the problem

keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
		sed "s/\./\\\./g" | cut -d'=' -f2; done | sort -u

The above line generates the list of keyrings (read from the IMA policy) 
with a newline after the first policy entry with "keyrings=". Please see 
below:

ima_keys 1 TINFO: \.ima|\.builtin_trusted_keys
key_import_test

When this is checked in the "do-done" loop grep returns "mismatched (" 
due to the newline.

I tried with "(" removed from the following line and that fixes the problem:

grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line

But a better fix might be to remove the "newline" in $keyrings. I'll try 
that.

Regarding the following error:
keyctl_session_to_parent: Operation not permitted

The following line in test2() can be removed. Not sure if this is needed.
	keyctl new_session > /dev/null

thanks,
  -lakshmi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
