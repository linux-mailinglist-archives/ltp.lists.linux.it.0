Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE3458964
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 07:45:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18CD23C8C68
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 07:45:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 857A23C0204
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 07:45:20 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0DBC7600950
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 07:45:19 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 013039FB3D;
 Mon, 22 Nov 2021 06:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1637563519; bh=nqPdKz6Rf44jETX3UTbtoE7cDpreTssV6YfPHdm8jqA=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=InDXE4/9IJlaY/cSG4mjTFfHJQBNemeME39OBji6x9sJbx84r+dQDkLK7F09DYchT
 FAqxfWv+YMihCxIDMRvPnfHQ1GVky1Db9OefMbtSCcKlBoewFrgJO7Cn47J3w4O+CU
 HqK28YWe+OCGFNnTHKJt/iLDy8UNljNCiawbcPeU=
Message-ID: <091b9181-2f6c-8b84-4d1c-5398ea34fe99@jv-coder.de>
Date: Mon, 22 Nov 2021 07:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>
References: <20211119074602.857595-1-lkml@jv-coder.de>
 <20211119074602.857595-3-lkml@jv-coder.de> <YZe4V8mbn7Dk8x3U@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
In-Reply-To: <YZe4V8mbn7Dk8x3U@yuki>
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 02/12] posix/mq_(timed)send/5-1: Fix error
 reporting
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On 11/19/2021 3:44 PM, Cyril Hrubis wrote:
> Hi!
> Applied, thanks.
>
>> --- a/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/5-1.c
>> +++ b/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/5-1.c
>> @@ -58,7 +58,6 @@ int main(void)
>>   	char msgrcd[BUFFER];
>>   	const char *msgptr = MSGSTR;
>>   	struct mq_attr attr;
>> -	int unresolved = 0;
>>   	unsigned pri;
>>   
>>   	sprintf(gqname, "/mq_timedsend_5-1_%d", getpid());
>> @@ -119,7 +118,10 @@ int main(void)
>>   		/* receive message and allow blocked send to complete */
>>   		if (mq_receive(gqueue, msgrcd, BUFFER, &pri) == -1) {
>>   			perror("mq_receive() did not return success");
>> -			unresolved = 1;
>> +			kill(pid, SIGKILL);	//kill child
>> +			mq_close(gqueue);
>> +			mq_unlink(gqname);
>> +			return PTS_UNRESOLVED;
>>   		}
> There is another place where it does not clean up the queue in the code
> under the if (j == MAXMSG+1) condition, that should be fixed as well.
>
> Also I guess the cleanest way how to write this test would be a kernel
> style goto cleanup. E.g.:
>
> 	int rval = PTS_UNRESOLVED;
>
>
> 	if (foo) {
> 		rval = PTS_FAIL;
> 		goto ret;
> 	}
>
> 	if (bar)
> 		goto ret;
>
> 	...
>
> 	pid = 0;
> ret:
> 	if (pid)
> 		kill(pid, SIGKILL);
> 	mq_close(queue);
> 	mq_unlink(queue);
> 	return rval;
You are right, but I wanted to keep changes minimal. I think there are 
lots of small bug in the posix tests,
but fixing all of them while trying to just get rid of warnings, would 
have made this patchset even bigger and
I would have never finished. So I had to stop somewhere.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
