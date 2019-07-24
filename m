Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285C7425D
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 01:52:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25E243C1CF3
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 01:52:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9B0D23C0300
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 01:52:15 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DFBE810006B4
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 01:52:01 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id b13so21720325pfo.1
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 16:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NoALU55vro1UsnS1IeUYvQSSrit2K4YU92w/F+e8B8g=;
 b=SqYJN4bQQIJoUNZRa9Kri+n1FI7MAwRc9Vl4JnjC2/tvdxnJDZ37vIEfsMMwmSpR81
 ssiyL94+1tXqAYxPBFMAYbup/d+NSmjoMOO8u9CRMCIb4s4ag7m7CCfUCP06OCuxLDBu
 IHxSTeqMvCwrVomfxcHVqm+S84IDkazMU6grlHPZNwVLRJRA1XRvRNV/lU47ODu33DE/
 l4pvUPDDmxVLknKRDVOlblp0iu8bFK03LUsbOxVEC97EGAfCuha/qoFBEGwIMbqkeUQq
 LR5ymq7oMaE/20MMtil3G0IHLEql+J6T3YqLp0OEUqIsmfiRSK9CVfJnIx0FS7dgpmpR
 HPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NoALU55vro1UsnS1IeUYvQSSrit2K4YU92w/F+e8B8g=;
 b=ereQgwcGyLi1R2ObA4dKJOlnoUR2RrYW5u7N2xf6dnWR3CWawrVW6tjDY970szoOkx
 vCCXKIESXvXSLkQ0O91GGomhExmc3zpxTHUPnOHX5WQvhCLhOJo/h1tX/r+QJ1QsAh2v
 qH4qrwzAXcnW97fmNMMcBjovZrR+LNNO5UXCMjmuB8AMeAGt/4Jx/IazScy6eNNLjhBy
 nn8CHuvjpiE8FK1wCTZac7p88XzJ6mxY0Ws3OPdhriNh4bZiKJ3WdyD7de5WrxavBp63
 oE9zuXjh5Qd2cdoqK/pTAd3MyNjIpEuNDNop/H76LEzKOPgnokEu0t8zYz5slXoRQKap
 yQuw==
X-Gm-Message-State: APjAAAVoCX4fK42qrWOhJiFjivEWEgaWaqPW2tugT/Z938b3/RfVw2/+
 UQ2KS5T6iu0WtfCnuWbyaMcnYQ==
X-Google-Smtp-Source: APXvYqxWF8JsYLFJW+7lU81cz2ZFdgZAz51S2U9bjQBK6FemqFw6pK/SZAij2GAShbgmRzWEA2BF+A==
X-Received: by 2002:a63:fb14:: with SMTP id o20mr71787470pgh.136.1564012325262; 
 Wed, 24 Jul 2019 16:52:05 -0700 (PDT)
Received: from ?IPv6:2620:0:1000:2514:1b4a:f4aa:2d85:6656?
 ([2620:0:1000:2514:1b4a:f4aa:2d85:6656])
 by smtp.gmail.com with ESMTPSA id 22sm55336979pfu.179.2019.07.24.16.52.04
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 16:52:04 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190723203133.202257-1-smuckle@google.com>
 <20190724134155.GC19478@rei.lan>
From: Steve Muckle <smuckle@google.com>
Message-ID: <2d8ac294-d537-43d2-eb41-f2fcfed82a2c@google.com>
Date: Wed, 24 Jul 2019 16:52:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724134155.GC19478@rei.lan>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, thanks for your feedback.

On 7/24/19 6:42 AM, Cyril Hrubis wrote:
>> diff --git a/configure.ac b/configure.ac
>> index 3dcf282e8..5e4e7f1f9 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -82,9 +82,11 @@ AC_CHECK_FUNCS([ \
>>       pwritev \
>>       pwritev2 \
>>       readlinkat \
>> +    recvmmsg \
>>       renameat \
>>       renameat2 \
>>       sched_getcpu \
>> +    sendmmsg \
>>       sigpending \
>>       splice \
>>       stime \
>> @@ -253,6 +255,7 @@ LTP_CHECK_TIME
>>   LTP_CHECK_TIMERFD
>>   test "x$with_tirpc" = xyes && LTP_CHECK_TIRPC
>>   LTP_CHECK_TPACKET_V3
>> +LTP_CHECK_MMSGHDR
> 
> This seems to be already there under the # custom functions comment.

Ah yes looks like this got added while I was sitting on the patch, and I 
failed to notice it when I rebased. Removed.

>> +	addr.sin_family = AF_INET;
>> +	addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
>> +	addr.sin_port = htons(port);
> 
> The port returned by TST_GET_UNUSED_PORT() is already in network byte
> order, we found a bug recently where test was failing randomly since if
> we attempt to convert the value we may end up with priviledged port
> number if we are unlucky.

Fixed.

> 
>> +	SAFE_CONNECT(send_sockfd, (struct sockaddr *) &addr, sizeof(addr));
>> +
>> +	memset(msg1, 0, sizeof(msg1));
>> +	msg1[0].iov_base = "one";
>> +	msg1[0].iov_len = 3;
>> +	msg1[1].iov_base = "two";
>> +	msg1[1].iov_len = 3;
>> +
>> +	memset(&msg2, 0, sizeof(msg2));
>> +	msg2.iov_base = "three";
>> +	msg2.iov_len = 5;
>> +
>> +	memset(msg, 0, sizeof(msg));
>> +	msg[0].msg_hdr.msg_iov = msg1;
>> +	msg[0].msg_hdr.msg_iovlen = 2;
>> +
>> +	msg[1].msg_hdr.msg_iov = &msg2;
>> +	msg[1].msg_hdr.msg_iovlen = 1;
>> +
>> +	sem_wait(&send_sem);
>> +
>> +	while (msgs) {
>> +		retval = do_sendmmsg(send_sockfd, msg, msgs, 0);
>> +		if (retval < 0) {
>> +			/*
>> +			 * tst_brk is used here so reader is not left waiting
>> +			 * for data - note timeout for recvmmsg does not work
>> +			 * as one would expect (see man page)
>> +			 */
>> +			tst_brk(TBROK|TTERRNO, "sendmmsg failed");
>> +			goto out;
>> +		}
>> +		msgs -= retval;
> 
> Wouldn't this resend the start of the message again if we got
> interrupted in the middle?

The failure modes aren't clear to me. Based on the man page for sendmmsg 
it sounded like it returns the number of messages successfully sent, and 
I assumed that unsuccessfully sent messages were not partially sent? The 
sendmsg page says that it only sends messages that can fit atomically in 
the underlying protocol.

> I guess that the correct retry would loop over the messages and
> decrement the iov_len and shift the buffers based on the msg_len.
> Something as:
> 
> retry:
> 	retval = do_sendmmsg(send_sockfd, msg, msgs, 0);
> 
> 	for (i = 0; i < retval; i++) {
> 		int transmitted = msg[i].msg_len;
> 		msg[i].msg_len = 0;
> 		for (j = 0; j < msg[i].msg_iovlen; j++) {
> 			int len = msg[i].msg_iov[j].msg_iovlen;
> 
> 			/* whole buffer send */
> 			if (transmitted >= len) {
> 				transmitted -= len;
> 				msg[i].msg_iov[j].msg_iovlen = 0;
> 				continue;
> 			}
> 
> 			msg[i].msg_iov[j].msg_iovlen -= transmitted;
> 			msg[i].msg_iov[j].msg_iov += transmitted;
> 
> 			goto retry;
> 		}
> 	}
> 
> Also I'm pretty sure that we will actually happen to write the whole
> buffer unless we fill up the kernel buffers, which we hardly will with
> a few bytes. So maybe we should just send the message here and check
> that the msg_len are filled correctly in this case.

That works for me, after all if we get unlucky and cannot send the first 
message in the vector, sendmmsg() returns an error and the test will 
fail. So retrying on the second message is a bit inconsistent.

>> +	addr.sin_port = htons(port);
> 
> Here as well, the htons() should be dropped.

Fixed.

thanks,
steve

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
