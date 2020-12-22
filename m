Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A59C12E0E41
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 19:38:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2794C3C332D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 19:38:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 692B93C332D
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 19:38:00 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 3142C20091A
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 19:37:58 +0100 (CET)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id 665BF20B83DE;
 Tue, 22 Dec 2020 10:37:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 665BF20B83DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1608662274;
 bh=RlzaGSzxcAjcy4e0WbapOoCPC8AIE8qAdKsa1Onqa70=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=o/UEuB23MVhad1F9P2MJz5oTPv7lEAHUzWCLKMdNNWMNksSDtQSIPFnL17Ko3Qc8a
 F0FJhPS0ZN8RT5v+jd6vpvNU/SgVVoQxrxcyg8wwzWNffLx6BUbUc3TqP74ruan5Om
 44RRf6mKkKUuDuvuqEnJCq5f2NXzDcTTTKxDXjCI=
To: Petr Vorel <pvorel@suse.cz>
References: <20200928194730.20862-1-nramas@linux.microsoft.com>
 <20200928194730.20862-2-nramas@linux.microsoft.com> <X9z2+nXBdTMqHPgD@pevik>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <0db52810-c7e2-713a-80ed-748e8bb3db74@linux.microsoft.com>
Date: Tue, 22 Dec 2020 10:37:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X9z2+nXBdTMqHPgD@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-17.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/1] ima: Add test for selinux measurement
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
Cc: paul@paul-moore.com, stephen.smalley.work@gmail.com,
 tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 12/18/20 10:37 AM, Petr Vorel wrote:

Hi Petr,

> 
> @Lakshmi
> TL;DR: I added some fixes in my fork, branch ima/selinux.v2.draft,
> https://github.com/pevik/ltp/commits/ima/selinux.v2.draft
> 
> + added 3 additional commits, one of them as you as the author.
> I moved some functions to testcases/lib/tst_security.sh, renamed them.
> Can you please have a look and test? I don't have any SELinux machine.

I'll take a look at the changes in your branch and test it with SELinux 
enabled.

> 
> @Mimi, all: any comment to this test? My changes are just LTP cleanup
> so you can comment it on this patchset.
> I suppose you get to this in January.
> 
> Some notes for my changes:
> 
> As files are quite similar (checks etc), I put both tests into single
> file ima_selinux.sh.
This should be fine.

The reason I put the tests in different files was because I couldn't 
find a way to run the tests independently (i mean - say, run the SELinux 
policy measurement test but not the state measurement test or vice-versa).

> 
>> New functionality is being added to IMA to measure data provided by
>> kernel components. With this feature, IMA policy can be set to enable
>> measuring data provided by Linux Security Modules (LSM). Currently one
>> such LSM namely selinux is being updated to use this functionality.
>> This new functionality needs test automation in LTP.
> 
>> Add test cases which verify that the IMA subsystem correctly measures
>> the data provided by selinux.
> 
> Could you please put into commit message and test kernel commit hash relevant
> for the test. Is that 8861d0af642c646c8e148ce34c294bdef6f32f6a (merged into
> v5.10-rc1) or there are more relevant commits?

The IMA hook to measure kernel critical data + SELinux measurement 
changes are still being reviewed. Tushar has posted v9 of the patch set.

> 
> ...
>> +### IMA SELinux test
>> +
>> +To enable IMA to measure SELinux state and policy, `ima_selinux_policy.sh`
>> +and `ima_selinux_state.sh` require a readable IMA policy, as well as
>> +a loaded measure policy with
>> +`measure func=CRITICAL_DATA data_sources=selinux template=ima-buf`
> I put this into
> testcases/kernel/security/integrity/ima/datafiles/ima_selinux/selinux.policy
> and mention it in docs.
Sounds good - Thanks.

"template=ima_buf" is no longer needed in the IMA policy rule since 
"ima_buf" is the default template for buffer measurement now. I will 
update "datafiles/ima_selinux/selinux.policy" file.

> 
>> +test1()
>> +{
>> +	local policy_digest expected_policy_digest algorithm
>> +	local data_source_name="selinux"
>> +	local pattern="data_sources=[^[:space:]]*$data_source_name"
>> +	local tmp_file="$TST_TMPDIR/selinux_policy_tmp_file.txt"
>> +
>> +	check_policy_pattern "$pattern" $FUNC_CRITICAL_DATA $TEMPLATE_BUF > $tmp_file || return
>> +
>> +	tst_res TINFO "Verifying selinux policy measurement"
>> +
>> +	#
>> +	# Trigger a measurement by changing selinux state
>> +	#
>> +	update_selinux_state
> Here I used tst_update_selinux_state.
okay.

> 
> ...
>> --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
> 
>> +#
>> +# Update selinux state. This is used for validating IMA
>> +# measurement of selinux constructs.
>> +#
>> +update_selinux_state()
>> +{
>> +	local cur_val new_val
>> +
>> +	cur_val=$(cat $SELINUX_FOLDER/checkreqprot)
>> +
>> +	if [ $cur_val = 1 ]; then
>> +		new_val=0
>> +	else
>> +		new_val=1
>> +	fi
>> +
>> +	echo $new_val > $SELINUX_FOLDER/checkreqprot
>> +}
>> +
>> +#
>> +# Verify selinux is enabled in the system
>> +#
>> +check_selinux_state()
>> +{
>> +	[ -d $SELINUX_FOLDER ] || tst_brk TCONF "selinux is not enabled"
>> +}
> 
> As I mentioned above, this is not needed as I put them under different names in
> testcases/lib/tst_security.sh.
okay.

> 
>>   mount_helper()
>>   {
>>   	local type="$1"
>> @@ -238,6 +265,7 @@ ima_setup()
>>   	ASCII_MEASUREMENTS="$IMA_DIR/ascii_runtime_measurements"
>>   	BINARY_MEASUREMENTS="$IMA_DIR/binary_runtime_measurements"
>>   	IMA_POLICY="$IMA_DIR/policy"
>> +	SELINUX_FOLDER="$SYSFS/fs/selinux"
> 
> nit: I renamed it to $SELINUX_DIR (for consistency with $IMA_DIR)
> and moved to ima_selinux.sh.
okay.

Thanks a lot for your help Petr. Appreciate it.

  -lakshmi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
