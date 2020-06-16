Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B66B71FC0DF
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 23:18:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 58B483C5FB9
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 23:18:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E59503C02EF
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 23:18:30 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E91A5200D38
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 23:18:28 +0200 (CEST)
Received: from [192.168.1.21] (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id D387F20B4780;
 Tue, 16 Jun 2020 14:18:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D387F20B4780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1592342306;
 bh=97NnOnumTDfA7ft0uXwH0H4kte4Ud399cPVa5QU6PaI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=icuSg0vCJkG3WesvV5qB9rFPUlKgUUWK1DOj1vP91nQSBGkxifgLYySgjiLW3C+Gs
 KTf11guvZA280Z9F9qPXnSlP6EqR0bGsRuJ9+/kjw3zGNmfnKXPAIRDM41yZnqUTDI
 od9E1kX3giPwOnWJabTMA+ggLHd+BX9cIhPnqrR4=
To: Petr Vorel <pvorel@suse.cz>
References: <20200612143842.3993-1-t-josne@linux.microsoft.com>
 <20200612143842.3993-3-t-josne@linux.microsoft.com>
 <20200616155501.GB8754@dell5510>
From: Lachlan Sneff <t-josne@linux.microsoft.com>
Message-ID: <841954da-fbe5-4cde-5d07-f3374d512e10@linux.microsoft.com>
Date: Tue, 16 Jun 2020 17:18:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616155501.GB8754@dell5510>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] IMA: Add a test to verify importing a
 certificate into keyring
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.com,
 zohar@linux.ibm.com, ltp@lists.linux.it, balajib@linux.microsoft.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


On 6/16/20 11:55 AM, Petr Vorel wrote:
>> Add an IMA measurement test that verifies that an x509 certificate
>> can be imported into the .ima keyring and measured correctly.
>> Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
>> ---
>>   .../security/integrity/ima/tests/ima_keys.sh  | 45 ++++++++++++++++++-
>>   1 file changed, 43 insertions(+), 2 deletions(-)
>> diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> index f9c60a6fc..1eabb3e2e 100755
>> --- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> +++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
>> @@ -5,10 +5,12 @@
>>   # Verify that keys are measured correctly based on policy.
>> -TST_NEEDS_CMDS="awk cut xxd"
>> -TST_CNT=1
>> +TST_NEEDS_CMDS="awk cut xxd keyctl evmctl openssl cmp"
>> +TST_CNT=2
>>   TST_NEEDS_DEVICE=1
>> +CERT_FILE="${CERT_FILE:-}/etc/keys/x509_ima.der"
> Key setup is something what I'd like to be either set automatically
> (ideally, but maybe too hard) or documented in
> testcases/kernel/security/integrity/ima/README.md.
>
> ima_keys 1 TINFO: verifying key measurement for keyrings and templates specified in IMA policy file
> ima_keys 1 TPASS: specified keyrings were measured correctly
> ima_keys 2 TCONF: missing /etc/keys/x509_ima.der
> => many uses will TCONF, which is not what we want.
>
> Running these scripts from examples/ in ima-evm-utils repository:
> ./ima-gen-local-ca.sh && ./ima-genkey-self.sh && ./ima-genkey.sh
>
> is obviously not enough:
>
> ima_keys 1 TINFO: verifying key measurement for keyrings and templates specified in IMA policy file
> ima_keys 1 TPASS: specified keyrings were measured correctly
> ima_keys 2 TINFO: adding a cert to the .ima keyring (/etc/keys/x509_ima.der)
> add_key failed
> errno: Required key not available (126)
> ima_keys 2 TCONF: unable to import a cert into the .ima keyring
>
> Does it make sense to copy these scripts into LTP (most distros ship them in
> development packages, but we cannot depend on it) and run them in the test
> setup? If not, we should really document that.
> + feel free to add anything relevant to README.md :)
>
> Kind regards,
> Petr

Hi Petr,

I'll look into whether it's doable to automatically generate keys. I 
suspect that including the scripts to generate the key

is the best way forward with this, as well as noting in the README how 
to generate your own key and use that instead.

Expect a further patch in the next few days.


Thank you reviewing this further!

Lachlan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
