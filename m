Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 118393A5E09
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 10:02:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 508683C8AF5
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 10:02:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F1BC3C2E34
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 10:02:23 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5CE531A008AB
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 10:02:23 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9604D21976;
 Mon, 14 Jun 2021 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623657742;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5tCAFJY0yewHtvlPOjri4yQxY7QUO/KEzfdEDfnMHg=;
 b=DcQEI0wh7ZzDzgUuZU3DR43LJAXCHrto4VSKyJhYp6HEmSyVhOMYqZjTQZD8puVOWzS8EP
 yeAd0YhanWAWo7jzd3VGnpA5BSrAHTJ8rfDl04Je7Yd44+2GdTnse/iyjLrou/n3zRnZdn
 5LaOdEj9nss611gvEDRAN1WYF4YsPho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623657742;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5tCAFJY0yewHtvlPOjri4yQxY7QUO/KEzfdEDfnMHg=;
 b=0GL2xvPPWHhKC2qQ420daxDzK8Y5BstEGEbsXG0F35CSXqeN3cIbq+dsFcKB6C1LBpBJC4
 Y7HlIlDkL6Hc9dCw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4469BA3B87;
 Mon, 14 Jun 2021 08:02:22 +0000 (UTC)
References: <20210609114659.2445-1-chrubis@suse.cz>
 <20210609114659.2445-4-chrubis@suse.cz> <YMDBFfCZwYDYwWDg@pevik>
 <YMDC/mjGTXxoq9uH@yuki> <fd006cd4-2f65-138a-8907-94153ee3b45e@suse.cz>
 <YMZgONrus6i45R9U@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YMZgONrus6i45R9U@pevik>
Date: Mon, 14 Jun 2021 09:02:21 +0100
Message-ID: <87wnqw50xe.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 3/4] lib: Introduce concept of
 max_test_runtime
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> Hi all,
>
>> On 09. 06. 21 15:32, Cyril Hrubis wrote:
>> > Hi!
>> >>>   - the scaled value is then divided, if needed, so that we end up a
>> >>>     correct maximal runtime for an instance of a test, i.e. we have
>> >>>     max runtime for an instance fork_testrun() that is inside of
>> >>>     .test_variants and .all_filesystems loops
>> >> Now "Max runtime per iteration" can vary, right? I.e. on .all_filesystems
>> >> runtime for each filesystems depends on number of filesystems? E.g. writev03.c
>> >> with setup .timeout = 600 on 2 filesystems is 5 min (300s), but with all 9
>> >> filesystems is about 1 min. We should document that author should expect max
>> >> number of filesystems. What happen with these values in the (long) future, when
>> >> LTP support new filesystem (or drop some)? This was a reason for me to define in
>> >> the test value for "Max runtime per iteration", not whole run.
>
>> > That's one of the downsides of this approach.
>
>> > The reason why I choose this approach is that you can set upper cap for
>> > the whole test run and not only for a single filesystem/variant.
>
>> > Also this way the test timeout corresponds to the maximal test runtime.
>
>> > Another option would be to redefine the timeout to be timeout per a
>> > fork_testrun() instance, which would make the approach slightly easier
>> > in some places, however that would mean either changing default test
>> > timeout to much smaller value and annotating all long running tests.
>
>> > Hmm, I guess that annotating all long running tests and changing default
>> > timeout may be a good idea regardless this approach.
>
>> Some fuzzysync tests have long run time by design because running too
>> few loops on broken systems will not trigger the bug. Limiting maximum
>> program execution time may be useful for quick smoke tests but it's not
>> usable for real test runs where we want reliable reproducibility.
> Interesting.
>
>> I'd prefer adding a command line option to tst_test (e.g. -m) that would
>> just print test metadata, including total timeout of all fork_testrun()
>> subtests, and exit. Static metadata is not a sufficient solution for
> FYI I suggested this some time ago with private chat with Cyril, he mentioned
> that there were some problems with it. IMHO it'd be great to implement
> it.

Yes, it has been debated before. It may be an issue when cross
compiling. Also verifying whether a test should really produce TCONF. I
don't think it can be the primary way of extracting meta data. OTOH, it
really makes sense for the test to report some info to the test
runner. Including expected runtime and what environment it can see.

The test runner can compare this data with its expectations. For
example, if the test reports there is X NUMA nodes, but the runner
thinks there should be Y NUMA nodes. This can help to verify people's
configuration.

>
>> this because the same test binary may have different runtimes on
>> different system configurations, for example because the list of
>> available filesystems may change arbitrarily between test runs. It'd be
>> great if test runners other than runltp-ng could get a straighforward
>> timeout number without reimplementing a calculation that may change in
>> future versions of LTP.

Other possibilities are that a test takes much longer to run on single
core or larger page size. I have also theorised before that fuzzysync
could measure the first few loops and tune the timeouts based on that. I
don't think it is necessary, but that can change.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
