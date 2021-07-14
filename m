Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0743C855E
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:34:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE3793C8650
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:34:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A864D3C245D
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:34:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DC19B140114E
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:34:27 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5F7EB202B7
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626269667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wq9woNRbEb2M7YYjUrRnOLjI18hYxYSzfI35dv3soBI=;
 b=mgFc1a1AHWvaO4jjAcy2hPwaaQWDNcbhRIalRjr9idhI1ki6gg9pB+P1S6A6AjR04+1ICa
 7MI8isEaaiawROSdKgVWVjo4NlLx3H+asdx5HrvbynvH1Cjop2iLiVeX9XDAmFkgcs+yZ+
 Q9r8O529heqVKxTLCnoFqCIRtCqn1oM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626269667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wq9woNRbEb2M7YYjUrRnOLjI18hYxYSzfI35dv3soBI=;
 b=aLmXgJhXmEnoxnpuXLPcIRQbWOcXFrd2/PBWRrfHPSFeNQPop5fPg4EoMRyYhLjJ0Nw8pC
 Tuq6ZsjveJdQE/Cw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3148FA3B81;
 Wed, 14 Jul 2021 13:34:27 +0000 (UTC)
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-5-rpalethorpe@suse.com> <YO7C0DgkpaUSf4Nw@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YO7C0DgkpaUSf4Nw@pevik>
Date: Wed, 14 Jul 2021 14:34:26 +0100
Message-ID: <87pmvlnhnh.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/8] doc: Remind authors and maintainers to run
 make check
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

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  doc/maintainer-patch-review-checklist.txt | 2 +-
>>  doc/test-writing-guidelines.txt           | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>
>> diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
>> index f6682b574..970779acc 100644
>> --- a/doc/maintainer-patch-review-checklist.txt
>> +++ b/doc/maintainer-patch-review-checklist.txt
>> @@ -39,7 +39,7 @@ New test should
>>  * Use new https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#22-writing-a-test-in-c[C API]
>>  * Test binaries are added into corresponding '.gitignore' files
>>  * Check coding style with
>> -  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl]
>> +  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/scripts/checkpatch.pl[checkpatch.pl] and `make check`
>>    (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#131-c-coding-style[C coding style])
> +1
>
> "131" would mean section 1.3.1. If you put it into "2.1 C coding style" the link
> should be #21-c-coding-style.

You may want to do a quick-fix commit for that, because it is not part
of my patch. Although I can add it ofcourse.

>
> Kind regards,
> Petr
>
>>  * Docparse documentation
>>  * If a test is a regression test it should include tags
>> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
>> index 74e8ad7ee..e3268852a 100644
>> --- a/doc/test-writing-guidelines.txt
>> +++ b/doc/test-writing-guidelines.txt
>> @@ -308,6 +308,7 @@ NOTE: See also
>>  3. The runtest entires are in place
>>  4. Test binaries are added into corresponding '.gitignore' files
>>  5. Patches apply over the latest git
>> +6. 'make check' does not emit any warnings
> +1
>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
