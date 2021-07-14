Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D153C8568
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:37:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3ECDE3C8650
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:37:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 94EC73C245D
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:37:50 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 067881000F3F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:37:48 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 74346202B1
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 13:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626269868;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHjW3bJ8KZbrnIleyXT1Hu4hr071QC1ub6bEmiq7STY=;
 b=BEWhGoMUypjlrwi3u6Q0kWipSIu846uiAyVKm8fB1GFTIV42I/LoJkWlgjd5tzvc8WV8iO
 Vn1Xr4GBpGcLQt+pAddqLsXqBh1I5atKDxSGdYyB1F33bmxJTPxc41QDfQaXkmbtfZ3qL/
 Qn7vDMTEJ/hA3BVrGnfrdIMQDTMdzO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626269868;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHjW3bJ8KZbrnIleyXT1Hu4hr071QC1ub6bEmiq7STY=;
 b=gtqvhVOq33tPpAZppZ2O2kUk2Qkev4oW7GraDvN7MHCAUfG9BmgDQAjj4htXlFd0yd6L3B
 jXFAcr8r3vVC5RCw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 350BEA3B81;
 Wed, 14 Jul 2021 13:37:48 +0000 (UTC)
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-6-rpalethorpe@suse.com> <YO7HqwWdG7mtuihO@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YO7HqwWdG7mtuihO@pevik>
Date: Wed, 14 Jul 2021 14:37:47 +0100
Message-ID: <87mtqpnhhw.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/8] doc: Document TEST macro and state
 TST_RET/ERR rule LTP-002
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
> generally LGTM, with comments below.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
>> There are cases where these variables can be safely used by the
>> library. However it is a difficult problem to identify these cases
>> automatically.
>
>> Identifying any library code which uses them is relatively easy. In
>> fact it is easier to automate it than by code review. Because it is
>> such a boring thing to repeatedly look for and comment on.
>
>> If a test library function needs these variables it can recreate its
>> own private copies.
>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  doc/c-test-api.txt                     | 47 ++++++++++++++++++++++++++
>>  doc/library-api-writing-guidelines.txt | 14 ++++++++
>>  2 files changed, 61 insertions(+)
>
>> diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
>> index 45784195b..b47728f60 100644
>> --- a/doc/c-test-api.txt
>> +++ b/doc/c-test-api.txt
>> @@ -767,6 +767,53 @@ LTP_ALIGN(x, a)
>
>>  Aligns the x to be next multiple of a. The a must be power of 2.
>
>> +[source,c]
>> +-------------------------------------------------------------------------------
>> +TEST(socket(AF_INET, SOCK_RAW, 1));
>> +if (TST_RET > -1) {
>> +	tst_res(TFAIL, "Created raw socket");
>> +	SAFE_CLOSE(TST_RET);
>> +} else if (TST_ERR != EPERM) {
>> +	tst_res(TFAIL | TTERRNO,
>> +		"Failed to create socket for wrong reason");
>> +} else {
>> +	tst_res(TPASS | TTERRNO, "Didn't create raw socket");
>> +}
>> +-------------------------------------------------------------------------------
>> +
>> +The +TEST+ macro sets +TST_RET+ to its argument's return value and
>> ++TST_ERR+ to +errno+. The +TTERNO+ flag can be used to print the error
>> +number's symbolic value.
> Nice examples, but we already talk about TEST() in "1.2 Basic test interface".
> Should we put it there? If not, I'd add links to both places to the other
> (separate effort).
> Also I suppose whole thing could be simplified with TST_EXP_FAIL2().

Yes, I suppose that I missed that originally. So it needs unifying and
some wording changes.

>
>> +
>> +No LTP library function or macro, except those in 'tst_test_macros.h',
>> +will write to these variables (rule 'LTP-002'). So their values will
>> +not be changed unexpectedly.
>> +
>> +[source,c]
>> +-------------------------------------------------------------------------------
>> +TST_EXP_POSITIVE(wait(&status));
>> +
>> +if (!TST_PASS)
>> +	return;
> IMHO This is really for "1.2 Basic test interface".
>
>> +-------------------------------------------------------------------------------
>> +
>> +If the return value of 'wait' is positive. This macro will print a
>> +pass result and set +TST_PASS+ appropriately. If the return value is
>> +zero or negative, then it will print fail.
>> +
>> +This and similar macros take optional variadic arguments. These begin
>> +with a format string and then appropriate values to be formatted.
>> +
>> +[source,c]
>> +-------------------------------------------------------------------------------
>> +TST_EXP_PASS(chown("a/file", uid, gid), "chown(%s,%d,%d)",
>> +	     "a/file", uid, gid);
>> +-------------------------------------------------------------------------------
>> +
>> +Expects +chown+ to return 0 and emits a pass or a fail. The arguments
>> +to +chown+ will be printed in either case. There are many similar
>> +macros, please see 'tst_test_macros.h'.
> And this as well.
>
> ...
>
>> diff --git a/doc/library-api-writing-guidelines.txt b/doc/library-api-writing-guidelines.txt
>> index a4393fc54..2819d4177 100644
>> --- a/doc/library-api-writing-guidelines.txt
>> +++ b/doc/library-api-writing-guidelines.txt
>> @@ -21,10 +21,24 @@ Don't forget to update docs when you change the API.
>>  2. C API
>>  --------
>
>> +2.1 LTP-001: Sources have tst_ prefix
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +1
>
>> +
>>  API source code is in headers `include/*.h`, `include/lapi/*.h` (backward
>>  compatibility for old kernel and libc) and C sources in `lib/*.c`. Files have
>>  'tst_' prefix.
>
>> +2.2 LTP-002: TST_RET and TST_ERR are not modified
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +The test author is guaranteed that the test API will not modify these
>> +variables. This prevents silent errors where the return value and
>> +errno are overwritten before the test has chance to check them.
>> +
>> +The macros which are clearly intended to update these variables. That
>> +is +TEST+ and those in 'tst_test_macros.h'. Are of course allowed to
> nit: Maybe +TEST()+ (it's a "function", unlike "variables" TST_RET
> TST_ERR)?

+1

>
>> +update these variables.
>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
