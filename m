Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB15662CA
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:35:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67FDC3C7C07
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jul 2022 07:35:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E00D73C7C07
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:35:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B372F20077F
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 07:35:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2F3A92235E
 for <ltp@lists.linux.it>; Tue,  5 Jul 2022 05:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656999350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rsmYYVoNmNqhPEJfAJH3MTSaYMiGTb5uwR36MC783EE=;
 b=px/+PLlwtKj7gA2jyDCWnaYmTglZk2siSUekJ5ZU2gXNZwq0uDDxqYmHfo9u7hcoDLbNHq
 mL+pmrLSi+I5Ai7WKG5MTvKSzrHiR0wcvZqMaKXlPwxuEUKdUXFqJKxQb/DBaa+Gnca1Yx
 x7c3PcMnGAjPvFMO2A1NQp4kfFfVfFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656999350;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rsmYYVoNmNqhPEJfAJH3MTSaYMiGTb5uwR36MC783EE=;
 b=dR7xsV2gVGZSC5RtY0Z5ICAcuvL/P1QpmfnIXZAqO2bezW5tl6AYEcbJYX6LwCoEPKSyvu
 seJM3FM5s76ttvBA==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E61352C141;
 Tue,  5 Jul 2022 05:35:49 +0000 (UTC)
References: <20220620092146.7604-1-chrubis@suse.cz>
 <20220620092146.7604-8-chrubis@suse.cz>
 <0168e60b-9c56-af45-d754-75ce09b359fc@suse.cz>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
Date: Tue, 05 Jul 2022 06:35:33 +0100
In-reply-to: <0168e60b-9c56-af45-d754-75ce09b359fc@suse.cz>
Message-ID: <87h73wruiy.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 7/7] opeposix: pthread_barrierattr_getpshared/2-1:
 Simplify codeflow
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

Martin Doucha <mdoucha@suse.cz> writes:

> Hi,
> one small suggestion below, otherwise for the whole patchset:
>
> Reviewed-by: Martin Doucha <mdoucha@suse.cz>
>
> On 20. 06. 22 11:21, Cyril Hrubis wrote:
>> This actually fixes a 'no return in nonvoid function' warning since gcc
>> may get confused during the codeflow analysis.
>> 
>> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
>> ---
>>  .../interfaces/pthread_barrierattr_getpshared/2-1.c   | 11 +++++------
>>  1 file changed, 5 insertions(+), 6 deletions(-)
>> 
>> diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared/2-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared/2-1.c
>> index a21a5a507..52c074173 100644
>> --- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared/2-1.c
>> +++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared/2-1.c
>> @@ -141,7 +141,9 @@ int main(void)
>>  	if (pid == -1) {
>>  		perror("Error at fork()");
>>  		return PTS_UNRESOLVED;
>> -	} else if (pid == 0) {
>> +	}
>> +
>> +	if (pid == 0) {
>>  		/* Child */
>>  		/* Map the shared object to child's memory */
>>  		barrier =
>> @@ -209,10 +211,7 @@ int main(void)
>>  
>>  		printf("Test PASSED\n");
>>  		return PTS_PASS;
>> +	} else {
>> +		return serial;
>
> The return can be unconditional.

And with that also:

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

>
>>  	}
>> -
>> -	if (pid == 0) {
>> -		exit(serial);
>> -	}
>> -
>>  }
>
>
> -- 
> Martin Doucha   mdoucha@suse.cz
> QA Engineer for Software Maintenance
> SUSE LINUX, s.r.o.
> CORSO IIa
> Krizikova 148/34
> 186 00 Prague 8
> Czech Republic


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
