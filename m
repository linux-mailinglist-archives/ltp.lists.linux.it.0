Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5995A2D9545
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 10:32:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D5CF43C5834
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 10:32:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 0DD6C3C24CF
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 10:32:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4DBC61A00CCB
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 10:32:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58F90AC90
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 09:32:42 +0000 (UTC)
References: <875z6m5rib.fsf@suse.de>
 <20201104163528.13833-1-rpalethorpe@suse.com>
 <20201105155400.GA15701@yuki.lan>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20201105155400.GA15701@yuki.lan>
Date: Mon, 14 Dec 2020 09:32:41 +0000
Message-ID: <87sg88hgw6.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] pty04: Limit the number of packets sent to
 avoid timeout
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
>> +static ssize_t try_async_write(int fd, const char *data, ssize_t size,
>> +			       ssize_t *done)
>>  {
>> -	ssize_t ret = write(fd, data, size);
>> +	ssize_t off = done ? *done : 0;
>> +	ssize_t ret = write(fd, data + off, size - off);
>>  
>>  	if (ret < 0)
>>  		return -(errno != EAGAIN);
>>  
>> -	return !written || (*written += ret) >= size;
>> +	if (!done)
>> +		return 1;
>> +
>> +	*done += ret;
>> +	return *done >= size;
>> +}
>> +
>> +static ssize_t try_async_read(int fd, char *data, ssize_t size,
>> +			      ssize_t *done)
>> +{
>> +	ssize_t off = done ? *done : 0;
>> +	ssize_t ret = read(fd, data + off, size - off);
>> +
>> +	if (ret < 0)
>> +		return -(errno != EAGAIN);
>> +
>> +	if (!done)
>> +		return 1;
>> +
>> +	*done += ret;
>> +	return *done >= size;
>>  }
>>  
>> -static void write_pty(const struct ldisc_info *ldisc)
>> +#define RETRY_ASYNC(fn) ({				      \
>> +	ssize_t done = 0;				      \
>> +	TST_RETRY_FUNC(try_async_##fn(ptmx, data, len, &done),\
>> +		       TST_RETVAL_NOTNULL);		      \
>> +})
>
> I do not like this macro that much. Maybe we can have two inline
> functions here one for read and one for write.

OK.

>
> So we do have one process that just reads and one that reads and writes
> right? I wonder if that is okay, maybe we should write twice as much as
> we read in the do_pty()?
>
> Other than that it looks fine.

They both read and write in the final loop. I will make this clearer in
the final while loop.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
