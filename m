Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 139172C3F62
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:56:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D269E3C2E2A
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Nov 2020 12:56:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BC49F3C223E
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:56:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5C534600207
 for <ltp@lists.linux.it>; Wed, 25 Nov 2020 12:56:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B31D1AE07;
 Wed, 25 Nov 2020 11:56:43 +0000 (UTC)
To: rpalethorpe@suse.de, Li Wang <liwang@redhat.com>
References: <20201125101633.30154-1-liwang@redhat.com> <87eekhof3i.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <04c4b073-6ad3-836a-7f63-7632a4e6ddb7@suse.cz>
Date: Wed, 25 Nov 2020 12:56:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <87eekhof3i.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 25. 11. 20 12:22, Richard Palethorpe wrote:
> Hello Li,
> 
> Li Wang <liwang@redhat.com> writes:
> 
>> It makes no sense to run parallel thread to simulate race conditions on
>> system with CPU number less than two, especially for kvm guest, it does
>> not have any chance to get real parallel running and probably encounter
>> failure as below:
> 
> Most of the tests using FuzzySync do not need true parallism. We were
> able to reproduce a number of race conditions on a single vCPU. Infact
> it may actually benefit some races because one thread has to pause to
> allow the other to run, perhaps creating a huge race window.
> 
>>
>> === 100% reproducible on a 1cpu guest ===
>>
>> cmdline="af_alg07"
>> contacts=""
>> analysis=exit
>> <<<test_output>>>
>> tst_test.c:1248: TINFO: Timeout per run is 0h 05m 00s
>> ../../../include/tst_fuzzy_sync.h:507: TINFO: Minimum sampling period ended
>> ../../../include/tst_fuzzy_sync.h:330: TINFO: loop = 1024, delay_bias = 0
>> ../../../include/tst_fuzzy_sync.h:318: TINFO: start_a - start_b: { avg = -137522ns, avg_dev = 854248ns, dev_ratio = 6.21 }
>> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - start_a  : { avg =  1915ns, avg_dev =   535ns, dev_ratio = 0.28 }
>> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_b - start_b  : { avg =  1885ns, avg_dev =    42ns, dev_ratio = 0.02 }
>> ../../../include/tst_fuzzy_sync.h:318: TINFO: end_a - end_b    : { avg = -137492ns, avg_dev = 854818ns, dev_ratio = 6.22 }
>> ../../../include/tst_fuzzy_sync.h:318: TINFO: spins            : { avg = 554786  , avg_dev =  7355  , dev_ratio = 0.01 }
>> ../../../include/tst_fuzzy_sync.h:636: TINFO: Exceeded execution time, requesting exit
>> af_alg07.c:96: TFAIL: fchownat() failed to fail, kernel may be vulnerable
>>
>> Signed-off-by: Li Wang <liwang@redhat.com>
>> CC: Richard Palethorpe <rpalethorpe@suse.de>
>> ---
>>  include/tst_fuzzy_sync.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/include/tst_fuzzy_sync.h b/include/tst_fuzzy_sync.h
>> index 4141f5c64..2e864b312 100644
>> --- a/include/tst_fuzzy_sync.h
>> +++ b/include/tst_fuzzy_sync.h
>> @@ -281,6 +281,9 @@ static void tst_init_stat(struct tst_fzsync_stat *s)
>>  static void tst_fzsync_pair_reset(struct tst_fzsync_pair *pair,
>>  				  void *(*run_b)(void *))
>>  {
>> +	if (get_nprocs() < 2)
>> +		tst_brk(TCONF, "Fuzzy Sync requires at least two CPUs available");
>> +
>>  	tst_fzsync_pair_cleanup(pair);
>>  
>>  	tst_init_stat(&pair->diff_ss);
> 
> Perhaps this test would pass with more loops and a big enough delay
> range, but this is also wasting time on a single vCPU. I'm not sure
> whether we should filter this test at the LTP level; it may trigger the
> bug on some single CPU configs.

No, af_alg07 requires 2 CPUs, otherwise it'll report false positives.
The test will pass only if fchownat() hits a half-closed socket and
returns error. But IIRC the half-closed socket will be destroyed during
reschedule which means there's no race window to hit anymore. But it
would be better to put the TCONF condition into the test itself.

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
