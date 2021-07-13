Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9153C711B
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 15:17:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 410EF3C8781
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 15:17:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 50B4F3C2EB9
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 15:17:50 +0200 (CEST)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6A2CC6002FC
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 15:17:50 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id y42so50252253lfa.3
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 06:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fYA121bp8cSmP27OtDoQB+E8iTQZai4U2gV15/CPWBA=;
 b=kv0TOu7+//hPAFnSLE/OoH9CwRgysLEp1Zb17dJ3FPbO6kMh6I7GSqjo8mDYzJmAuK
 0JdNEd9/FSmPub0iTr25+VDEHxj+A0LUNUsb76pJqAutot8dEs75EtNUxsxiZmwiqvAy
 9QiBPMcw1fzh9d/hxWpnjFS/fAj1dGutzu9WnxniNl+t7X+o1x3rqXulMRm0TFug0xer
 vf3fVCFTNrvOLhXLcdPd3vS0b6d3aNrRL5cEtj0wxzO5rtYnAxq1ykHu/S7SQEVZHVru
 hkO+Q0DqQKX9Es7C1Up/1CHXUg2QmONYHYyfpwdjvo0h8lWs0jMc+Kz/riMTjFYcd0YI
 yitw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fYA121bp8cSmP27OtDoQB+E8iTQZai4U2gV15/CPWBA=;
 b=ZR4biYlKAr00WHsVPMXl1TIkWL27AQNR23fO8qko29BTLLmJjsL7W/+taELZS00S7y
 holBVT/JMvfnGwOKT6ui3c5wqZXet5d6tulIAYigElnf5w8IjGZYthgz3tISkdX+n5uN
 hP4yQ6WEwKdL+xcUFG0i6I5FkEC8Jei0SwFX0TbGS+5a444lv0GlALBPP4hnjyncLZFc
 s6uOtoqdY+h/EQpD65oHeBkBbOk3VLDMWe3epmX/hztMQbxxkz5fDkjRwNbXpdKYaeJU
 ThCAogyQHr2zB8Yl8ATbWMHApkoAxRYptjrZ3fFEpYUs56N8KQ5Q+yMTHRnaU++WqBuo
 iebQ==
X-Gm-Message-State: AOAM533Ux0Uc3wyqLqQBA6fJjEXtqLg+ZuaVxWTBYtrrhqYtu/kx2ooH
 pCM5/cpB7VdqDn7PjDpE1HYRUhFMtp7V
X-Google-Smtp-Source: ABdhPJwGt4aH6/4YXkLaIk5xXage3sLpe8crp1Y40HXf9Yq6bZ8zCavXkyXY6XmDREVQZOjckCrRIQ==
X-Received: by 2002:a19:48d2:: with SMTP id v201mr3341539lfa.55.1626182269529; 
 Tue, 13 Jul 2021 06:17:49 -0700 (PDT)
Received: from [192.168.1.53] ([91.247.148.7])
 by smtp.gmail.com with ESMTPSA id s13sm1897330ljp.8.2021.07.13.06.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 06:17:49 -0700 (PDT)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210712080322.11512-1-aleksei.kodanev@bell-sw.com>
 <YOxH9JgzwMfwo+Uc@yuki>
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <b818611b-9d33-9982-3e2f-452057b5719f@bell-sw.com>
Date: Tue, 13 Jul 2021 16:17:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YOxH9JgzwMfwo+Uc@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mmap18: fix when PTHREAD_STACK_MIN < PAGE_SIZE
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

Hi Cyril,
On 12.07.2021 16:47, Cyril Hrubis wrote:
> Hi!
>> PTHREAD_STACK_MIN can be less than the page size, to be more
>> precise 2048 on musl. This value is used in the test as an
>> offset for a new stack address with mmap() + MAP_FIXED flag.
>> Though it might not be aligned to the page size.
>>
>> This breaks the test with musl:
>>
>>   tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
>>   mmap18.c:98: TBROK: mmap(0x7fe67e2ee800,2048,3,306,-1,0) failed: EINVAL (22)
>>   mmap18.c:169: TFAIL: Child: exited with 2
>>   [...]
>>
>> The fix is to align mapped_size arg to the page size.
>>
>> Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
>> ---
>>  testcases/kernel/syscalls/mmap/mmap18.c | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/mmap/mmap18.c b/testcases/kernel/syscalls/mmap/mmap18.c
>> index dc2926454..b37b29890 100644
>> --- a/testcases/kernel/syscalls/mmap/mmap18.c
>> +++ b/testcases/kernel/syscalls/mmap/mmap18.c
>> @@ -200,11 +200,12 @@ static void grow_stack_fail(size_t stack_size, size_t mapped_size)
>>  
>>  static void run_test(void)
>>  {
>> -	size_t stack_size = 8 * PTHREAD_STACK_MIN;
>> +	size_t pthread_stack = LTP_ALIGN(PTHREAD_STACK_MIN, getpagesize());
>> +	size_t stack_size = 8 * pthread_stack;
> 
> Looking at the code we have to align both stack size and mapped size so
> this is correct. I guess that we can save a bit by aligning each of them
> independently since 8 * PTHREAD_STACK_MIN would in most cases be aligned
> allready.
> 
> 	size_t pthread_stack = LTP_ALIGN(PTHREAD_STACK_MIN, getpagesize());
> 	size_t stack_size = LTP_ALIGN(8 * PTHREAD_STACK_MIN, getpagesize());
> 
> Either way this looks good so:
> 
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks for review!

Applied the original patch, it keeps the original proportion between
stack_size and mapped_size for both libc, also stack_size divided by
two after that for the mapped_size arg (though it doesn't really
matter with 8 * 2048):

> 
>> -	grow_stack_success(stack_size, PTHREAD_STACK_MIN);
>> +	grow_stack_success(stack_size, pthread_stack);
>>  	grow_stack_success(stack_size, stack_size/2);
>> -	grow_stack_fail(stack_size, PTHREAD_STACK_MIN);
>> +	grow_stack_fail(stack_size, pthread_stack);
>>  	grow_stack_fail(stack_size, stack_size/2);
>>  }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
