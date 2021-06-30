Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC563B7FB9
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:12:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E93093C6C53
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 11:12:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C4DCE3C1888
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 11:12:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 10A6B14010E7
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 11:12:43 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6689822429;
 Wed, 30 Jun 2021 09:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625044363;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IR3fw0upbJtkQkB1CxqHJ+VHaUG7Uc1XLok01D/KDSA=;
 b=VDzvVAVbwRHn/tlPKwJ5gzwPo0jVT0eW47kIbTjNmOKoB4xOChro0b35LW289pka88S8gv
 4iYj10J5kfNH545rQX4QfgPmg6dwYglCPGaPTT4CnIDqqN/xQmqFrKwDD6fk8jihqoW/db
 uvCk/bl/BGL+pClnbr06asMqQsC7trs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625044363;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IR3fw0upbJtkQkB1CxqHJ+VHaUG7Uc1XLok01D/KDSA=;
 b=YNpo5zmt6Kcv+sC5XFupIx0lOi++yFHycpG0RzHSpvYLm5tkhR37FYttDnMVcciSha1VbI
 MBy1VYSzOvqhIeCg==
Received: from g78 (unknown [10.163.17.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id ED5CAA3B85;
 Wed, 30 Jun 2021 09:12:42 +0000 (UTC)
References: <YNuA/0J20mjiV+NC@pevik> <87tulf3jyk.fsf@suse.de>
 <YNwk9EwTtqAnRWH6@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YNwk9EwTtqAnRWH6@pevik>
Date: Wed, 30 Jun 2021 10:12:41 +0100
Message-ID: <87r1gj3ed2.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] ee
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
Cc: ltp@lists.linux.it, Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
> ...
>> > tst_fuzzy_sync01.c:224: TFAIL: acs:1  act:1  art:3  | =:3    -:2999996 +:1   
>
>> It looks like the CI machines are too noisy/contended. The avg_dev is
>> very high. Probably we could relax the dev_ratio threshold to 0.2 or
>> 0.3. Although we would still get failures occassionally. As this is a
>> probabalistic test.
> Test is failing on my laptop, thus haven't enabled it in CI.
> But maybe it'll be working on it more reliably than my busy machine.

Is it really that busy? Perhaps we should increase the dev ratio
threshold. Clearly the deviations from contention are not enough to
reproduce the races, but are enough to prevent the radomization phase.

> But I'd prefer to wasting time with false positives, thus I guess we should
> enable only tests which are working reliably.
>
>> Could you change the script so that it passes so long as the test
>> returns TPASS or TFAIL?
> Well, accepting TFAIL sounds a bit strange to me :).
> Also next effort will be (at least for shell tests) to compare actual test
> output. Obviously that will not be straightforward for some tests, which aren't
> reproducible (avg = 11729ns could be matched by regex, but having more variants
> of results is kind of special case).
>
>> We don't want TBROK, TCONF or no result.
> FYI in my CI patchset is TCONF accepted. Motivation was to not require root for
> make test as some tests needed it. Thus TCONF will be a special case, then I
> guess we could add tst_fuzzy_sync01 accepting TFAIL as a special case.

At least if we run the tests and look for TPASS or TFAIL, we will catch
segfaults and similar.

Also, for fuzzy sync, returning TCONF would be a major error. It should
run on all systems.

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
