Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 649CF2C864F
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 15:16:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE36B3C4E9C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 15:16:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 22AA83C2C15
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 15:16:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 83DC91A00EA1
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 15:16:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0886ABD2;
 Mon, 30 Nov 2020 14:16:22 +0000 (UTC)
To: rpalethorpe@suse.de, Li Wang <liwang@redhat.com>
References: <20201125101633.30154-1-liwang@redhat.com>
 <87eekhof3i.fsf@suse.de> <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
 <87blflo9hx.fsf@suse.de> <f9b2e084-f2e0-1016-f505-6218d7c1853e@jv-coder.de>
 <CAEemH2fXpPXvQVi_UUovp+eB5JeWfdTjv47KXnCBhF=VG0Rsog@mail.gmail.com>
 <87wny3md61.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <cbc0bc4c-9165-63ab-ded4-1153f3766b16@suse.cz>
Date: Mon, 30 Nov 2020 15:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <87wny3md61.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fzsync: skip test when avaliable CPUs less than 2
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 30. 11. 20 10:01, Richard Palethorpe wrote:
> Hello,
> 
> Li Wang <liwang@redhat.com> writes:
> 
>> Hi Joerg,
>>
>> On Mon, Nov 30, 2020 at 3:53 PM Joerg Vehlow <lkml@jv-coder.de> wrote:
>>
>>> Hi,
>>>>> No, af_alg07 requires 2 CPUs, otherwise it'll report false positives.
>>>>> The test will pass only if fchownat() hits a half-closed socket and
>>>>> returns error. But IIRC the half-closed socket will be destroyed during
>>>>> reschedule which means there's no race window to hit anymore. But it
>>>>> would be better to put the TCONF condition into the test itself.
>>>> Interesting, I wonder if this is also true for the real-time kernel with
>>>> the threads set to RT priority?
>>> It looks like the test can fail even with more than one cpu. I've seen
>>> this sporadic failure on different hardware with more than two cores, at
>>> least on intel denverton (x86_64) and renesas r-car (aarch64) systems.
>>> Both with kernel 4.19 with the fix included, on the denverton system the
>>> rt parches were included and on the r-car not. The test passes most of
>>> the time, but sometimes fails with the message Li posted.
>>>
>>> It also seems to fail sporadically on other systems as well:
>>> https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1892860
>>>
>>> Additionally I tested on qemu-x86 with 4.19 with and without rt patches.
>>> The test succeeds even with only one virtualized cpu. So either Martin's
>>> assumption is wrong or it holds only for newer kernel versions?
>>>
>>
>> No, Mertin is not wrong, and you are also right.
>>
>> They are totally two different issues of af_alg07, the test on 1CPU
>> should be fixed with TCONF. But the fail with aarch64 is more like a
>> hardware issue, Chunyu has a drafted patch to add init delay value for
>> such a system.
>>
>> Can you try this on your aarm64 platform?
>> -----------------------------
>> fzsync can't get a random delay range on hpe-moonshot systems, so run with
>> delay=0 during all the tests. This is probably the hardware issue such as
>> cache line design so can't get a stable state during the execution of the
>> critical
>> section. Provide an experience delay value on hpe-moonshot to make it hit
>> the race window immediately without exceeding samples.
>>
>> ---
>>  testcases/kernel/crypto/af_alg07.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/testcases/kernel/crypto/af_alg07.c
>> b/testcases/kernel/crypto/af_alg07.c
>> index 6ad86f4f3..24f5b8088 100644
>> --- a/testcases/kernel/crypto/af_alg07.c
>> +++ b/testcases/kernel/crypto/af_alg07.c
>> @@ -47,6 +47,7 @@ static void setup(void)
>>   fd = SAFE_OPEN("tmpfile", O_RDWR | O_CREAT, 0644);
>>
>>   tst_fzsync_pair_init(&fzsync_pair);
>> + fzsync_pair.delay_bias = 700;
> 
> I hope there is some way to set this dynamically. Similar to
> CVE-2016-7117.
> 
> If we know that we should get some particular error we could modify the
> bias until the error happens.

There are three possible outcomes of the race:
1) fchownat() returns 0 => fchownat() was called too early or the kernel
is vulnerable, you can adjust bias here
2) fchwonat() fails with ENOENT => kernel is fixed, print TPASS and exit
3) fchownat() fails with EBADF => fchownat() was called too late, you
can adjust bias here

IIRC I didn't play with bias in this test because on x86_64 it passes
almost instantly on a fixed kernel. Feel free to add dynamic bias
adjustment for ARM.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
