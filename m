Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 017CF312D65
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 10:37:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2096D3C6FFC
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Feb 2021 10:37:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BAF983C5492
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 10:37:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F1BFB1400BE6
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 10:37:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 27C43AC6E
 for <ltp@lists.linux.it>; Mon,  8 Feb 2021 09:37:24 +0000 (UTC)
To: Petr Vorel <pvorel@suse.cz>
References: <20210204110342.11821-1-mdoucha@suse.cz>
 <20210204110342.11821-4-mdoucha@suse.cz> <YB13HM7so0YBwO8v@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <9a49f90c-7467-ae65-84be-2f559a8771dd@suse.cz>
Date: Mon, 8 Feb 2021 10:37:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YB13HM7so0YBwO8v@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/4] Add test for CVE 2020-29373
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

On 05. 02. 21 17:49, Petr Vorel wrote:
> Hi Martin,
> 
>> Fixes #770
> 
> Nice port thanks!
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Few questions below.
> 
> ...
>> +static void run(void)
>> +{
>> +	uint32_t i, count, tail;
>> +	int beef_found = 0;
>> +	struct io_uring_sqe *sqe_ptr;
>> +	const struct io_uring_cqe *cqe_ptr;
>> +
>> +	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sockpair);
>> +	SAFE_SETSOCKOPT_INT(sockpair[0], SOL_SOCKET, SO_SNDBUF,
>> +		32+sizeof(buf));
>> +	SAFE_FCNTL(sockpair[0], F_SETFL, O_NONBLOCK);
>> +
>> +	SAFE_IO_URING_INIT(512, &params, &uring);
>> +	sqe_ptr = uring.sqr_entries;
>> +
>> +	/* Add spam requests to force async processing of the real test */
>> +	for (i = 0, tail = *uring.sqr_tail; i < 255; i++, tail++, sqe_ptr++) {
>> +		memset(sqe_ptr, 0, sizeof(*sqe_ptr));
>> +		sqe_ptr->opcode = IORING_OP_SENDMSG;
>> +		sqe_ptr->flags = IOSQE_IO_DRAIN;
>> +		sqe_ptr->fd = sockpair[0];
>> +		sqe_ptr->addr = (__u64)&spam_header;
>> +		sqe_ptr->user_data = SPAM_MARK;
> Interesting, original reproducer uses here i
> 
>> +		uring.sqr_array[tail & *uring.sqr_mask] = i;
>> +	}
>> +
>> +	/* Add the real test to queue */
>> +	memset(sqe_ptr, 0, sizeof(*sqe_ptr));
>> +	sqe_ptr->opcode = IORING_OP_SENDMSG;
>> +	sqe_ptr->flags = IOSQE_IO_DRAIN;
>> +	sqe_ptr->fd = sendsock;
>> +	sqe_ptr->addr = (__u64)&beef_header;
>> +	sqe_ptr->user_data = BEEF_MARK;
> and here also 255, you use much higher 0xbeef.
> 
> You probably have a good reason to use here 0xfa7 (higher value). But maybe
> explaining why?

The good reason is that I like puns. sqe_ptr->user_data is not processed
by the kernel in any way except for copying the value into the
completion queue when the I/O request finishes. And we don't care
whether we can tell apart the spam request results from one another so
giving them all the same marker is good enough.

>> +	uring.sqr_array[tail & *uring.sqr_mask] = i;
>> +	count = ++i;
>> +	tail++;
>> +
>> +	__atomic_store(uring.sqr_tail, &tail, __ATOMIC_RELEASE);
>> +	SAFE_IO_URING_ENTER(1, uring.fd, count, count, IORING_ENTER_GETEVENTS,
>> +		NULL);
>> +
>> +	/* Check test results */
>> +	__atomic_load(uring.cqr_tail, &tail, __ATOMIC_ACQUIRE);
>> +
>> +	for (i = *uring.cqr_head; i != tail; i++, count--) {
>> +		cqe_ptr = uring.cqr_entries + (i & *uring.cqr_mask);
>> +		TST_ERR = -cqe_ptr->res;
>> +
>> +		if (cqe_ptr->user_data == SPAM_MARK) {
>> +			if (cqe_ptr->res >= 0 || cqe_ptr->res == -EAGAIN)
>> +				continue;
>> +
>> +			tst_res(TFAIL | TTERRNO,
>> +				"Spam request failed unexpectedly");
> I'm sorry, I'm lost to which TEST*() call this TTERRNO refers (there are mostly
> SAFE_*() macros.

I'm setting TST_ERR manually 6 lines above the tst_res() call. The errno
value is in cqe_ptr->res.


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
