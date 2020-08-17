Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99012245BD2
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 07:13:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 274413C58CF
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 07:13:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 952E93C2629
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 07:13:27 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A787A1000A8A
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 07:13:26 +0200 (CEST)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id F409220B4908;
 Sun, 16 Aug 2020 22:13:23 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F409220B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1597641204;
 bh=qbuxvMsPJpMYhSJpirTpZzrEV8fYC5SSNw37I5HFHHY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Z8tv+g4/pKX1o9EyE6X0xPnN6q/VBNBXBopoovxStJs7AiLf7QnsBJuWUdyTlIy8h
 ihi4AeaXL6OT/irxHIJ8b6S8glbDsq/TWl0XtlwTp/FhtXinA6uUARkEYOTlhDHVFB
 fapN1aM5QAq5/AIkT1mYozAT0NcDt17bSmgJaXRk=
To: Mimi Zohar <zohar@linux.ibm.com>, Petr Vorel <pvorel@suse.cz>,
 ltp@lists.linux.it
References: <20200807204652.5928-1-pvorel@suse.cz>
 <20200807204652.5928-4-pvorel@suse.cz>
 <25a78f42d15dcb3312a59de587cb9f4e31ccd5b5.camel@linux.ibm.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <a537bbdb-1383-48f4-99a5-42ce6d082ddf@linux.microsoft.com>
Date: Sun, 16 Aug 2020 22:13:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <25a78f42d15dcb3312a59de587cb9f4e31ccd5b5.camel@linux.ibm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-15.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/4] IMA: Add a test to verify measurement of
 certificate imported into a keyring
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
Cc: linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/16/20 8:21 PM, Mimi Zohar wrote:

Hi Mimi,

>> +# Create a new keyring, import a certificate into it, and verify
>> +# that the certificate is measured correctly by IMA.
>> +test2()
>> +{
>> +	tst_require_cmds evmctl keyctl openssl
>> +
>> +	local cert_file="$TST_DATAROOT/x509_ima.der"
>> +	local keyring_name="key_import_test"
>> +	local temp_file="file.txt"
>> +	local keyring_id
>> +
>> +	tst_res TINFO "verify measurement of certificate imported into a keyring"
>> +
>> +	if ! check_ima_policy_content "^measure.*func=KEY_CHECK.*keyrings=.*$keyring_name"; then
>> +		tst_brk TCONF "IMA policy does not contain $keyring_name keyring"
>> +	fi
>> +
> 
> If the IMA policy contains multiple KEY_CHECK measurement policy rules
> it complains about "grep: Unmatched ( or \(".
> 
> Sample rules:
> measure func=KEY_CHECK template=ima-buf
> keyrings=.ima|.builtin_trusted_keys
> measure func=KEY_CHECK template=ima-buf keyrings=key_import_test
> 

I tried with the above policy entries, but am unable to reproduce the 
error you are seeing.

ima_keys 1 TINFO: verifying key measurement for keyrings and templates 
specified in IMA policy file
ima_keys 1 TPASS: specified keyrings were measured correctly
ima_keys 2 TPASS: logged cert matches original cert

>> +	keyctl new_session > /dev/null
>> +
>> +	keyring_id=$(keyctl newring $keyring_name @s) || \
>> +		tst_brk TBROK "unable to create a new keyring"
>> +
>> +	tst_is_num $keyring_id || \
>> +		tst_brk TBROK "unable to parse the new keyring id"
>> +
>> +	evmctl import $cert_file $keyring_id > /dev/null || \
>> +		tst_brk TBROK "unable to import a certificate into $keyring_name keyring"
> 
> "cert_file" needs to be updated from
> "ltp/testcases/kernel/security/integrity/ima/tests/datafiles/x509_ima.d
> er" to
> "ltp/testcases/kernel/security/integrity/ima/tests/../datafiles/ima_key
> s/x509_ima.der".
> 

The problem is actually due to missing "x509_ima.der" in 
"INSTALL_TARGETS" in datafiles/keys/Makefile

Adding the following line in the Makefile fixes the problem

INSTALL_TARGETS		:= x509_ima.der

  -lakshmi

> On failure to open the file,
> errno: No such file or directory (2)
> ima_keys 2 TBROK: unable to import a certificate into key_import_test keyring
> ima_keys 2 TINFO: SELinux enabled in enforcing mode, this may affect test results
> ima_keys 2 TINFO: it can be disabled with TST_DISABLE_SELINUX=1 (requires super/root)
> ima_keys 2 TINFO: install seinfo to find used SELinux profiles
> ima_keys 2 TINFO: loaded SELinux profiles: none
> 
> Mimi
> 
>> +
>> +	grep $keyring_name $ASCII_MEASUREMENTS | tail -n1 | cut -d' ' -f6 | \
>> +		xxd -r -p > $temp_file
>> +
>> +	if [ ! -s $temp_file ]; then
>> +		tst_res TFAIL "keyring $keyring_name not found in $ASCII_MEASUREMENTS"
>> +		return
>> +	fi
>> +
>> +	if ! openssl x509 -in $temp_file -inform der > /dev/null; then
>> +		tst_res TFAIL "logged certificate is not a valid x509 certificate"
>> +		return
>> +	fi
>> +
>> +	if cmp -s $temp_file $cert_file; then
>> +		tst_res TPASS "logged certificate matches the original"
>> +	else
>> +		tst_res TFAIL "logged certificate does not match original"
>> +	fi
>> +}
>> +
>>   tst_run
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
