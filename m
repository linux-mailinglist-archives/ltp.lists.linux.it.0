Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60A2A4B9E
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 17:34:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 458CB3C302A
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 17:34:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F1EF03C3019
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 17:34:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7AE7D632820
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 17:34:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E30EDACF5
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 16:34:04 +0000 (UTC)
References: <20201028171056.2151-1-rpalethorpe@suse.com>
 <20201103154247.GA10565@yuki.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201103154247.GA10565@yuki.lan>
Date: Tue, 03 Nov 2020 16:34:04 +0000
Message-ID: <875z6m5rib.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04: Limit the number of packets sent to avoid
 timeout
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

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> At the end of the test we transmit many packets while closing the PTY
>> to check for races in the kernel. However if the process which closes
>> the PTY is delayed this can result a very large number of packets
>> being transmitted. The kernel appears to handle this quite slowly
>> which can cause the test to timeout or even a softlockup.
>> 
>> This is not supposed to be a performance test, so this commit puts an
>> upper bound on the number of packets transmitted.
>> 
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>> 
>> Hopefully will solve: https://github.com/linux-test-project/ltp/issues/674
>> 
>>  testcases/kernel/pty/pty04.c | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>> 
>> diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
>> index 4adf2cbb7..a59de7830 100644
>> --- a/testcases/kernel/pty/pty04.c
>> +++ b/testcases/kernel/pty/pty04.c
>> @@ -136,7 +136,8 @@ static int open_pty(const struct ldisc_info *ldisc)
>>  static ssize_t try_write(int fd, const char *data,
>>  			 ssize_t size, ssize_t *written)
>>  {
>> -	ssize_t ret = write(fd, data, size);
>> +	ssize_t off = written ? *written : 0;
>> +	ssize_t ret = write(fd, data + off, size);
>
> This seems to be correct, but should be send in a seprate patch.

I suppose I can, but this is actually part of limiting the number of
packets otherwise we don't care that we try to resend the whole packet
each time.

>
>>  	if (ret < 0)
>>  		return -(errno != EAGAIN);
>> @@ -149,6 +150,7 @@ static void write_pty(const struct ldisc_info *ldisc)
>>  	char *data;
>>  	ssize_t written, ret;
>>  	size_t len = 0;
>> +	int max_writes = 1000;
>>  
>>  	switch (ldisc->n) {
>>  	case N_SLIP:
>> @@ -190,7 +192,8 @@ static void write_pty(const struct ldisc_info *ldisc)
>>  
>>  	tst_res(TPASS, "Wrote PTY %s %d (2)", ldisc->name, ptmx);
>>  
>> -	while (try_write(ptmx, data, len, NULL) >= 0)
>> +	TST_CHECKPOINT_WAIT2(0, 100000);
>> +	while (max_writes-- && try_write(ptmx, data, len, NULL) >= 0)
>>  		;
>
> I wonder if we should change this to be time based instead. I.e. try to
> write packets for 10 seconds or so, since hardcoding number of
> iterations usually does not scale from embedded to supercomputers.

Writing is most likely far quicker than reading on any computer, so
limiting it by time worries me more. On a system that is very fast, but
highly contended (e.g. OpenQA guests), one CPU may be able to fill the
TTY buffer before another gets chance to start converting that data to
CAN packets. This will most likely result in a softlockup/timeout which
is what we are trying to avoid. With an iteration limit the fast system
will simply exit the loop before we get chance to read (if contended).

On a slow system which is also highly contended we just have to hope the
iteration limit is low enough. If we set a time limit instead, we still
have the issue of how many seconds to set before the TTY buffers are
full enough to queue up too much work.

I guess we could do two-way communication instead of just writing to the
PTY...

>
>>  	tst_res(TPASS, "Writing to PTY interrupted by hangup");
>
> And this should be true only if we do not run out of tries meanwhile,
> right?

Yes, I suppose we should not print that if the while loop finishes

>
>> @@ -331,7 +334,7 @@ static void read_netdev(const struct ldisc_info *ldisc)
>>  	check_data(ldisc, data, plen);
>>  	tst_res(TPASS, "Read netdev %s %d (2)", ldisc->name, sk);
>>  
>> -	TST_CHECKPOINT_WAKE(0);
>> +	TST_CHECKPOINT_WAKE2(0, 2);
>>  	while ((rlen = read(sk, data, plen)) > 0)
>>  		check_data(ldisc, data, rlen);
>>  
>> -- 
>> 2.28.0
>> 
>> 
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
