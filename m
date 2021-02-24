Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B3323532
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 02:27:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5519B3C60F4
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 02:27:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 70FB33C2656
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 02:27:13 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 7DEEF1000402
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 02:27:12 +0100 (CET)
Received: from [192.168.86.31] (c-71-197-163-6.hsd1.wa.comcast.net
 [71.197.163.6])
 by linux.microsoft.com (Postfix) with ESMTPSA id 130C820B6C40;
 Tue, 23 Feb 2021 17:27:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 130C820B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614130030;
 bh=Rz63EwxifwahcHu97kiZNA7TJSJhj6rDo7xRcgKSU6Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Qv2FeUuhYmYuQPt+lv1wBRqQnBQxG6jAql2QdtlhPOUK2XgZq2aywyq/6pcjG1cVn
 4cVv3VbqgOAL5dVB5PdiRQeV10qSOElARxjcKPfsPP4siH0baObrhobD/vOBUdodb9
 XH0dMqbTPQRmSbftsMUolQpTla5Ka+GyVlI/kbfw=
To: Mimi Zohar <zohar@linux.ibm.com>, Petr Vorel <pvorel@suse.cz>,
 ltp@lists.linux.it
References: <20210223225930.27095-1-pvorel@suse.cz>
 <0a25f4b7ed53566b13211d5aeea18e7f13f12bd7.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <e8232b66-8081-090e-4e26-0e1d2544e752@linux.microsoft.com>
Date: Tue, 23 Feb 2021 17:27:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a25f4b7ed53566b13211d5aeea18e7f13f12bd7.camel@linux.ibm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,SPF_HELO_PASS,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 0/2] IMA: Add test for dm-crypt measurement
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
Cc: snitzer@redhat.com, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 dm-devel@redhat.com, linux-integrity@vger.kernel.org,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, gmazyland@gmail.com, agk@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 2021-02-23 4:43 p.m., Mimi Zohar wrote:
> Hi Petr,
> 
> On Tue, 2021-02-23 at 23:59 +0100, Petr Vorel wrote:
>> Hi!
>>
>> I updated Tushar's patchset to speedup things.
>>
Thank you. :)

>> Changes v2->v3
>> * rename function s/check_ima_ascii_log_for_policy/test_policy_measurement/
>> * move tst_res TPASS/TFAIL into test_policy_measurement()
>> * drop template=ima-buf (see Lakshmi's patch [1] and discussion about
>>    it, it will be removed from ima_keys.sh as well)
Makes sense.

>> * moved ima_dm_crypt.sh specific changes to second commit
>> * further API and style related cleanup
>>
>> Could you please check this patchset?
I reviewed the patchset.
Patch 1 looks ok. (generalize key measurement tests)
Patch 2 won't work as is, since the dm kernel code is not upstreamed
yet. (see my comments below for more context)

> 
> I'm not sure about the status of the associated IMA dm-crypt kernel
> patch set.  It hasn't even been reviewed, definitely not upstreamed.
>   I would hold off on upstreaming the associated ltp test.
> 
That is correct.

The device mapper measurement work is being revisited - to cover aspects
like more DM targets (not just dm-crypt), better memory management, more
relevant attributes from the DM targets, other corner cases etc.

Therefore, even though the first patch of the series "generalize key
measurement tests", would be useful for other tests; I will have to
revisit the second patch, "dm-crypt measurements", to address the
DM side changes I mentioned above.

To summarize,
  - you may upstream the first patch (generalizing the key
    measurements). It would be useful for us while writing more tests in
    this space.

  - but please hold off upstreaming the second patch (dm-crypt test)
    as Mimi has suggested.

Thanks,
Tushar

> thanks,
> 
> Mimi
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
