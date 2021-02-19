Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B227331FDEF
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 18:37:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62FEB3C65BC
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Feb 2021 18:37:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3BC7D3C4F0B
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 18:37:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ADE072010BB
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 18:37:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05506ACD9
 for <ltp@lists.linux.it>; Fri, 19 Feb 2021 17:37:57 +0000 (UTC)
To: rpalethorpe@suse.de
References: <20210219125728.18580-1-mdoucha@suse.cz> <87blcg5dnm.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <446bc235-8bc7-9a78-44b5-7151b3c85f47@suse.cz>
Date: Fri, 19 Feb 2021 18:37:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87blcg5dnm.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for possible writev() issues with NULL
 buffer in iovec
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

On 19. 02. 21 15:35, Richard Palethorpe wrote:
>> +static void *thread_run(void *arg)
>> +{
>> +	while (tst_fzsync_run_b(&fzsync_pair)) {
>> +		writefd = SAFE_OPEN(TEMPFILE, O_CREAT|O_WRONLY|O_TRUNC, 0644);
>> +		written = BUF_SIZE;
>> +		tst_fzsync_wait_b(&fzsync_pair);
>> +
>> +		/*
>> +		 * Do *NOT* preload the data using MAP_POPULATE or touching
>> +		 * the mapped range. We're testing whether writev() handles
>> +		 * fault-in correctly.
>> +		 */
>> +		map_ptr = SAFE_MMAP(NULL, BUF_SIZE, PROT_READ, MAP_SHARED,
>> +			mapfd, 0);
> 
> Possibly, instead of recreating the mapping each loop you could call
> madvise MADV_DONTNEED on the mapping. In which case it may also be best
> to use MAP_PRIVATE as well. Of courese if it is already fast then this
> does not matter.

I considered using madvise(MADV_DONTNEED) but decided against it because
it might only mark the memory page as stale but otherwise leave the
contents untouched. That would result in writev() always writing the
correct data after the first iteration even if the page-in is completely
broken and the first iteration only passed due to lucky timing.
Recreating the mapping is fast enough and more reliable for reproducing
the expected bugs.

>> +static void run(void)
>> +{
>> +	int fd, failed = 0;
>> +	ssize_t total_read;
>> +	unsigned char readbuf[BUF_SIZE];
>> +
>> +	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
>> +
>> +	while (!failed && tst_fzsync_run_a(&fzsync_pair)) {
>> +		tst_fzsync_wait_a(&fzsync_pair);
>> +		fd = SAFE_OPEN(TEMPFILE, O_RDONLY);
>> +		tst_fzsync_start_race_a(&fzsync_pair);
>> +
>> +		for (total_read = 0; total_read < written;) {
> 
> Also read from written with the tst_atomic functions. This is especially
> important for weak memory models because written may not be synchronised
> straight away. Then it could block on read().
> 
> There is also a small chance some architecture will update ssize_t
> non-atomically so written is smaller than expected. This would lead to a
> false positive.
> 
> I suppose an alternative would be to complete writing the data just using
> an ordinary write() call or however you want.

This test does not care whether writev() actually writes anything to the
test file. Returning -1 is perfectly valid result and the test will
simply skip to the next iteration. The only failure states are:
- read() fails (returning 0 is OK)
- read() finds too much data in the file (I should adjust readbuf size
to actually detect that)
- read() loads something that doesn't match what was supposed to be
written (and in case of short write, we care only about the portion that
was actually written)

> I guess CVE is on the way?

I'm not aware of any existing CVE and the bugfix is almost 4 years old
so I don't expect any.

I'll resubmit on Monday after some improvements, including atomic
load/store.

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
