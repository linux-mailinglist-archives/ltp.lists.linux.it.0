Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B710339B576
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:03:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 626163C4F28
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 11:03:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8C5A63C27D2
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:03:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6565A14011B9
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 11:03:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9CC3F219F5
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 09:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622797421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4mxl3RY4CeyPjqBsxeVyYsgZ+Fb1uyQ86H0/GVymaQ=;
 b=D2Xic38HxWdig6FnYel2UMSOd9K7vq4ceaZIuQeYZfmGCinicX7KzMGKkocftDj2w/iwbf
 4FcJY5vDEtBgzlp3r35Bq807FoLcvNt4RqukiEdeIOhC5+XLKuvNOFVzKGI56Bt6SU+nIF
 zKvmomq3umCm3F7huTVEqYHHBuQ28Pc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622797421;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4mxl3RY4CeyPjqBsxeVyYsgZ+Fb1uyQ86H0/GVymaQ=;
 b=2secmZXsRPETnLAgRg3LdFqceI62d9tuLY+QiFoDdNfGqPTu7qyC9MPRUnxTswuLHzwrBY
 4oTC1fTQOHnY4fDw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6A661A3B8C;
 Fri,  4 Jun 2021 09:03:41 +0000 (UTC)
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <YLnGIJWPf2XsAdTt@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YLnGIJWPf2XsAdTt@pevik>
Date: Fri, 04 Jun 2021 10:03:40 +0100
Message-ID: <875yyuj91v.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] Libclang based analyzer
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
>> Hello,
>
>> This implements a TEST() check and integrates the check into the build
>> system.
>
>> Compared to the Coccinelle version it's very ugly. However I think
>> this will allow us to get all the low hanging fruit without creating
>> major problems for test developers.
>
>> I guess it could be run during CI if we either fix all the existing
>> TEST() usages in the library or add an ignore list. I already have a
>> Coccinelle script to help with the former.
> +1.
>
> FYI yesterday I sent patch to add make check{,-c,shell}, but for running C/shell API tests:
> https://patchwork.ozlabs.org/project/ltp/list/?series=247103

So I guess we have a name collision here. Something to consider is that
GNU Make defines 'checks' as running self tests. So perhaps you are
correct to use that word.

I could rename the static analyses to 'analyze' or 'lint'. OTOH it might
be better if running the self tests is called 'make
run-{c,shell}-api-tests', because only a few people need to do
that. Whereas it is intended that all contributors run the static
analyses checks.

Although, if someone runs 'make check' in the lib directory, then it
makes sense to run the C API tests as well as do the analyses. Or not?

>
> Taking 2 latests commits + adding clang-devel / libclang-dev packages makes CI
> running.
>
> https://github.com/pevik/ltp/commit/b2427f39ddb15c97761208a605637e0da6fe66ca

Thanks, I guess this shows that libclang is well supported.

>
> The only missing piece is include/mk/clang-checks.mk (this patchset not even
> compile now).
>
>> Richard Palethorpe (2):
>>   Add 'make checks' and clang-checks to build system
> make check ... clang-check (to avoid confusion).
>
>>   Start libclang based analyzer and TEST() check
>
>>  configure.ac                       |   2 +
>>  include/mk/config.mk.in            |   5 +
>>  include/mk/env_post.mk             |   8 ++
>>  include/mk/generic_leaf_target.inc |   5 +-
>>  include/mk/lib.mk                  |   3 +
>>  include/mk/rules.mk                |   9 ++
>>  include/mk/testcases.mk            |   1 +
>>  tools/clang-checks/.gitignore      |   1 +
>>  tools/clang-checks/Makefile        |  13 ++
>>  tools/clang-checks/main.c          | 218 +++++++++++++++++++++++++++++
> I'd name it tools/clang-check/ (and include/mk/clang-check.mk), but that's just
> personal opinion.

Yeah, we do not want a mixture of check and checks. I should probably
just make it 'check' as it saves typing one letter.

>
> Kind regards,
> Petr
>
>>  10 files changed, 264 insertions(+), 1 deletion(-)
>>  create mode 100644 tools/clang-checks/.gitignore
>>  create mode 100644 tools/clang-checks/Makefile
>>  create mode 100644 tools/clang-checks/main.c


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
