Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAED2C4110
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 14:23:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AE163C4E32
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 14:23:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5BF5C3C2D04
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:23:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 90A35200984
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 14:23:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFC6FAF4D;
 Wed, 25 Nov 2020 13:23:55 +0000 (UTC)
References: <20201125101633.30154-1-liwang@redhat.com>
 <87eekhof3i.fsf@suse.de> <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
Date: Wed, 25 Nov 2020 13:23:54 +0000
Message-ID: <87blflo9hx.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Martin Doucha <mdoucha@suse.cz> writes:

> On 25. 11. 20 12:22, Richard Palethorpe wrote:
>> Hello Li,
>> 
>> Li Wang <liwang@redhat.com> writes:
>> 
>>> It makes no sense to run parallel thread to simulate race conditions on
>>> system with CPU number less than two, especially for kvm guest, it does
>>> not have any chance to get real parallel running and probably encounter
>>> failure as below:
>> 
>> Most of the tests using FuzzySync do not need true parallism. We were
>> able to reproduce a number of race conditions on a single vCPU. Infact
>> it may actually benefit some races because one thread has to pause to
>> allow the other to run, perhaps creating a huge race window.
>> 
>>>
>>> === 100% reproducible on a 1cpu guest ===
>>>
>>> cmdline="af_alg07"
>>> contacts=""
>>> analysis=exit
>>> <<<test_output>>>
>>> tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
>>> ../../../include/tst_fuzzy_sync.h:507: TINFO: Minimum sampling period ended
>>> ../../../include/tst_fuzzy_sync.h:330: TINFO: loop = 1024, delay_bias = 0
>>> ../../../include/tst_fuzzy_sync.h:318: TINFO: start_a - start_b: { avg = -137522ns, avg_dev = 854248ns, dev_ratio = 6.21 }
>>> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - start_a  : { avg =  1915ns, avg_dev =   535ns, dev_ratio = 0.28 }
>>> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_b - start_b  : { avg =  1885ns, avg_dev =    42ns, dev_ratio = 0.02 }
>>> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - end_b    : { avg = -137492ns, avg_dev = 854818ns, dev_ratio = 6.22 }
>>> ../../../include/tst_fuzzy_sync.h:318: TINFO: spins            : { avg = 554786  , avg_dev =  7355  , dev_ratio = 0.01 }
>>> ../../../include/tst_fuzzy_sync.h:636: TINFO: Exceeded execution time, requesting exit
>>> af_alg07.c:96: TFAIL: fchownat() failed to fail, kernel may be vulnerable
>>>
>>> Signed-off-by: Li Wang <liwang@redhat.com>
>>> CC: Richard Palethorpe <rpalethorpe@suse.de>
>>> ---
>>>  include/tst_fuzzy_sync.h | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
>>> index 4141f5c64..2e864b312 100644
>>> --- a/include/tst_fuzzy_sync.h
>>> +++ b/include/tst_fuzzy_sync.h
>>> @@ -281,6 +281,9 @@ static void tst_init_stat(struct tst_fzsync_stat *s)
>>>  static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>>>  				  void *(*run_b)(void *))
>>>  {
>>> +	if (get_nprocs() < 2)
>>> +		tst_brk(TCONF, "Fuzzy Sync requires at least two CPUs available");
>>> +
>>>  	tst_fzsync_pair_cleanup(pair);
>>>  
>>>  	tst_init_stat(&pair->diff_ss);
>> 
>> Perhaps this test would pass with more loops and a big enough delay
>> range, but this is also wasting time on a single vCPU. I'm not sure
>> whether we should filter this test at the LTP level; it may trigger the
>> bug on some single CPU configs.
>
> No, af_alg07 requires 2 CPUs, otherwise it'll report false positives.
> The test will pass only if fchownat() hits a half-closed socket and
> returns error. But IIRC the half-closed socket will be destroyed during
> reschedule which means there's no race window to hit anymore. But it
> would be better to put the TCONF condition into the test itself.

Interesting, I wonder if this is also true for the real-time kernel with
the threads set to RT priority?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
