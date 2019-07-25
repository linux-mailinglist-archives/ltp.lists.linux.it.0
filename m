Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF474DAD
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 14:04:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 856383C1CF5
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 14:04:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 11D633C0270
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 14:04:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 85244100173B
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 14:04:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1BAE4AC7F;
 Thu, 25 Jul 2019 12:04:32 +0000 (UTC)
Date: Thu, 25 Jul 2019 14:04:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Steve Muckle <smuckle@google.com>
Message-ID: <20190725120429.GA11617@rei.lan>
References: <20190723203133.202257-1-smuckle@google.com>
 <20190724134155.GC19478@rei.lan>
 <2d8ac294-d537-43d2-eb41-f2fcfed82a2c@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d8ac294-d537-43d2-eb41-f2fcfed82a2c@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/sendmmsg: add new test
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> +	while (msgs) {
> >> +		retval = do_sendmmsg(send_sockfd, msg, msgs, 0);
> >> +		if (retval < 0) {
> >> +			/*
> >> +			 * tst_brk is used here so reader is not left waiting
> >> +			 * for data - note timeout for recvmmsg does not work
> >> +			 * as one would expect (see man page)
> >> +			 */
> >> +			tst_brk(TBROK|TTERRNO, "sendmmsg failed");
> >> +			goto out;
> >> +		}
> >> +		msgs -= retval;
> > 
> > Wouldn't this resend the start of the message again if we got
> > interrupted in the middle?
> 
> The failure modes aren't clear to me. Based on the man page for sendmmsg 
> it sounded like it returns the number of messages successfully sent, and 
> I assumed that unsuccessfully sent messages were not partially sent? The 
> sendmsg page says that it only sends messages that can fit atomically in 
> the underlying protocol.

Looking at the kernel code for sendmmsg() it's just a simple loop that calls
sendmsg() for each msghdr in the struct mmsghdr with a special MSG_BATCH flag
for all but the last message, see net/socket.c and as far as I can tell it just
loops over the msgvec so each individual message should behave like it was send
with sendmsg() and the return value from sendmsg() is stored in the msg_len
field. The return value from sendmmsg() describes the number of updated
elements of the struct mmsghdr vector, not necessarily all the data from the
last updated msg_hdr are send.

Now it depends on if the file descriptor is blocking or non-blocking and also
on the particular protocol.

Generally blocking call should return either with error or with all data send,
which is also default. However for some protocols we may as well get first
positive number i.e. part of the buffer send, then next call would return
an error.

If it's non-blocking (we did fcntl() with O_NONBLOCK or passed MSG_DONTWAIT) we
may return early with partial buffer send/received if the operation would block
i.e. socket send buffer full/no data ready.

For the case of UDP looking at the udp_sendmsg() as far as I can tell it either
returns error or sends everything either way and this makese sense because we
even do not care if there is anyone listening on the other side and we are
allowed to drop the datagram anyways. I guess that for TCP we may write part of
buffers for quite a lot of different reasons.

Also for UDP as far as I can tell the maximal atomic message size is 0xFFFF.
Which would be limit of the 16 bit field lengh in UDP header, at least that is
what is checked for at the start of the udp_sendmsg() which we end up calling
for the socket here.

To sum it up, in our very simple case we do not care about retrying at all.

> > I guess that the correct retry would loop over the messages and
> > decrement the iov_len and shift the buffers based on the msg_len.
> > Something as:
> > 
> > retry:
> > 	retval = do_sendmmsg(send_sockfd, msg, msgs, 0);
> > 
> > 	for (i = 0; i < retval; i++) {
> > 		int transmitted = msg[i].msg_len;
> > 		msg[i].msg_len = 0;
> > 		for (j = 0; j < msg[i].msg_iovlen; j++) {
> > 			int len = msg[i].msg_iov[j].msg_iovlen;
> > 
> > 			/* whole buffer send */
> > 			if (transmitted >= len) {
> > 				transmitted -= len;
> > 				msg[i].msg_iov[j].msg_iovlen = 0;
> > 				continue;
> > 			}
> > 
> > 			msg[i].msg_iov[j].msg_iovlen -= transmitted;
> > 			msg[i].msg_iov[j].msg_iov += transmitted;
> > 
> > 			goto retry;
> > 		}
> > 	}
> > 
> > Also I'm pretty sure that we will actually happen to write the whole
> > buffer unless we fill up the kernel buffers, which we hardly will with
> > a few bytes. So maybe we should just send the message here and check
> > that the msg_len are filled correctly in this case.
> 
> That works for me, after all if we get unlucky and cannot send the first 
> message in the vector, sendmmsg() returns an error and the test will 
> fail. So retrying on the second message is a bit inconsistent.

Agreed all we should care about is that the return value from sendmmsg() is
correct and that the msg_len fields are updated correctly.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
