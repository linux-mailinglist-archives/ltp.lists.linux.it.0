Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 24766229BD2
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:52:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C83213C76E0
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:52:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 700DD3C2876
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:52:29 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 01EC6201130
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:52:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595433147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvuN2eZ1HLXKFBGaKgNYInPXG+1SWiPIE/LuEkndy9A=;
 b=fBXW1GoGjBmjLDbPFApQQiL0tRuII8DJKhgJuIaWlGeLMTyqDRZV+HJyQJOJGbvilw6a7/
 go7gAq5MyrzV1IKKl7YhlIfNQQFv39e9uZ66BKFSWzFjmkeRiI8E4TwX7Yhq3sdkNC0NWg
 qVHZNMk+LhxQvEUWNPLJ/AAS4Zi6ks4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-GvThhLJeNLm1BYzm8s3ifg-1; Wed, 22 Jul 2020 11:52:25 -0400
X-MC-Unique: GvThhLJeNLm1BYzm8s3ifg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ADA41DE8;
 Wed, 22 Jul 2020 15:52:24 +0000 (UTC)
Received: from centennial.enunes.eu (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C607F60C47;
 Wed, 22 Jul 2020 15:52:23 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200720194920.22784-1-ernunes@redhat.com>
 <20200720194920.22784-2-ernunes@redhat.com> <20200721152649.GB13733@yuki.lan>
From: Erico Nunes <ernunes@redhat.com>
Message-ID: <0386a2c0-607b-7f20-fb2a-221e963b45fc@redhat.com>
Date: Wed, 22 Jul 2020 17:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721152649.GB13733@yuki.lan>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] ioperm01: skip test if kernel is locked down
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

On 7/21/20 5:26 PM, Cyril Hrubis wrote:
> Hi!
>> ioperm is restricted under kernel lockdown.
>>
>> Signed-off-by: Erico Nunes <ernunes@redhat.com>
>> ---
>>  testcases/kernel/syscalls/ioperm/ioperm01.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/testcases/kernel/syscalls/ioperm/ioperm01.c b/testcases/kernel/syscalls/ioperm/ioperm01.c
>> index 4c5c0e6ea..d1d633b20 100644
>> --- a/testcases/kernel/syscalls/ioperm/ioperm01.c
>> +++ b/testcases/kernel/syscalls/ioperm/ioperm01.c
>> @@ -42,6 +42,9 @@ static void verify_ioperm(void)
>>  
>>  static void setup(void)
>>  {
>> +	/* ioperm is restricted under kernel lockdown. */
>> +	tst_lockdown_skip();
>> +
>>  	/*
>>  	 * The value of IO_BITMAP_BITS (include/asm-i386/processor.h) changed
>>  	 * from kernel 2.6.8 to permit 16-bits ioperm
> 
> This looks good, however shouldn't we as well add a third ioperm test
> that checks that the call fails for root when lockdown is enabled?
> 

Good point. I think it is a good idea, but can be done in a separate
patchset.
There are many other things that can be covered together with that by
new tests considering the recent lockdown feature (enum lockdown_reason
seems to provide a good list and starting point).

Erico


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
