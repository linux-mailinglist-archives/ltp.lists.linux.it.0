Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7536C217
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 11:50:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 515533C657A
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 11:50:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFF1E3C19BB
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 11:50:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 900446009F0
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 11:50:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D6461AFC6
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 09:50:39 +0000 (UTC)
References: <20210426120107.6632-1-rpalethorpe@suse.com>
 <20210426120107.6632-2-rpalethorpe@suse.com> <YIfZqZ29H2AN1vqh@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YIfZqZ29H2AN1vqh@pevik>
Date: Tue, 27 Apr 2021 10:50:39 +0100
Message-ID: <87k0oot5sg.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] bpf: Check truncation on 32bit div/mod by zero
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

> Hi Richard,
>
>> Add a test which checks for a number of issues surrounding division by
>> zero.
>
>> +++ b/testcases/kernel/syscalls/bpf/bpf_prog05.c
> ...
>> +/*\
>> + * [Description]
>> + *
>> + * Compare the effects of 32-bit div/mod by zero with the "expected"
> FYI this causes docparser error:
>
> /usr/src/ltp/docparse/testinfo.pl metadata.json
> , or ] expected while parsing array, at character offset 70801 (before "expected"",\n     "b...") at /usr/src/ltp/docparse/testinfo.pl line 423
>
> Because we don't escap double quotes (among other issues previously reported,
> e.g. tabs), it produces invalid json:

bah, maybe we should just base64 encode doc strings in the JSON?

>
>    "doc": [
>      "[Description]",
>      "",
>      "Compare the effects of 32-bit div/mod by zero with the "expected"",
>      "behaviour.",
>      "",
>
> But I tested it on various OS and the code compiles and runs ok.
>
> I also looked at the code (very interesting), but with my minimal bpf knowledge
> I'm not the one who should review it.
>
>> + * behaviour.
>> + *
>> + * The commit "bpf: fix subprog verifier bypass by div/mod by 0
>> + * exception", changed div/mod by zero from exiting the current
>> + * program to setting the destination register to zero (div) or
>> + * leaving it untouched (mod).
>> + *
>> + * This solved one verfier bug which allowed dodgy pointer values, but
>                       ^
>                       verifier

+1

>
>> + * it turned out that the source register was being 32-bit truncated
>> + * when it should not be. Also the destination register for mod was
>> + * not being truncated when it should be.
>> + *
>> + * So then we have the following two fixes:
>> + * "bpf: Fix 32 bit src register truncation on div/mod"
>> + * "bpf: Fix truncation handling for mod32 dst reg wrt zero"
> - * "bpf: Fix 32 bit src register truncation on div/mod"
> - * "bpf: Fix truncation handling for mod32 dst reg wrt zero"
> (making it list)

+1
>
>> + *
>> + * Testing for all of these issues is a problem. Not least because
>> + * division by zero is undefined, so in theory any result is
>> + * acceptable so long as the verifier and runtime behaviour
>> + * match.
>> + *
>> + * However to keep things simple we just check if the source and
>> + * destination register runtime values match the current upstream
>> + * behaviour at the time of writing.
>> + *
>> + * If the test fails you may have one or more of the above patches
>> + * missing. In this case it is possible that you are not vulnerable
>> + * depending on what other backports and fixes have been applied. If
>> + * upstream changes the behaviour of division by zero, then the test
>> + * will need updating.
>> +\*/
> @metan: remove this before merge.
>
>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
