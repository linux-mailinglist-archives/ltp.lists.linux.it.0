Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A66EE3A44A8
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 17:07:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30C223C8E84
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Jun 2021 17:07:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5D343C30E6
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 17:07:44 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CFA086022C1
 for <ltp@lists.linux.it>; Fri, 11 Jun 2021 17:07:43 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C4331FD6D;
 Fri, 11 Jun 2021 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623424063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4vCeeMhem3Tr1F5U3+OOBDT3cIsmd+Az2+sTh8mZdk=;
 b=VyVhUV1hkbyZ72F+tyez4fYmtM4CGHXYz3AndrKm8bWYiCEG2p1Oi3UooRmTNIbj9BbKIy
 hqOPuRrycKGrVV7xGGU1VbqHBjaBZUHK52lX9oDgl/DRm79g+HR5ot3U7zI3bAZwT6BatE
 kL9QwsQEFkh3G5Vb6sOdc2aFfP2lClw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623424063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4vCeeMhem3Tr1F5U3+OOBDT3cIsmd+Az2+sTh8mZdk=;
 b=yfSFTnkl5j/h6HGIDIqQgQQp5s13aEK2SgD1NIvzMotWH2GiYG1I3OZtd63F9kl32zOF99
 ZNWIsyihavuq3QAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0886D118DD;
 Fri, 11 Jun 2021 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623424063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4vCeeMhem3Tr1F5U3+OOBDT3cIsmd+Az2+sTh8mZdk=;
 b=VyVhUV1hkbyZ72F+tyez4fYmtM4CGHXYz3AndrKm8bWYiCEG2p1Oi3UooRmTNIbj9BbKIy
 hqOPuRrycKGrVV7xGGU1VbqHBjaBZUHK52lX9oDgl/DRm79g+HR5ot3U7zI3bAZwT6BatE
 kL9QwsQEFkh3G5Vb6sOdc2aFfP2lClw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623424063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+4vCeeMhem3Tr1F5U3+OOBDT3cIsmd+Az2+sTh8mZdk=;
 b=yfSFTnkl5j/h6HGIDIqQgQQp5s13aEK2SgD1NIvzMotWH2GiYG1I3OZtd63F9kl32zOF99
 ZNWIsyihavuq3QAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YTA1AT98w2DLDgAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Fri, 11 Jun 2021 15:07:43 +0000
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
References: <20210609114659.2445-1-chrubis@suse.cz>
 <20210609114659.2445-4-chrubis@suse.cz> <YMDBFfCZwYDYwWDg@pevik>
 <YMDC/mjGTXxoq9uH@yuki>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <fd006cd4-2f65-138a-8907-94153ee3b45e@suse.cz>
Date: Fri, 11 Jun 2021 17:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YMDC/mjGTXxoq9uH@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 09. 06. 21 15:32, Cyril Hrubis wrote:
> Hi!
>>>   - the scaled value is then divided, if needed, so that we end up a
>>>     correct maximal runtime for an instance of a test, i.e. we have
>>>     max runtime for an instance fork_testrun() that is inside of
>>>     .test_variants and .all_filesystems loops
>> Now "Max runtime per iteration" can vary, right? I.e. on .all_filesystems
>> runtime for each filesystems depends on number of filesystems? E.g. writev03.c
>> with setup .timeout = 600 on 2 filesystems is 5 min (300s), but with all 9
>> filesystems is about 1 min. We should document that author should expect max
>> number of filesystems. What happen with these values in the (long) future, when
>> LTP support new filesystem (or drop some)? This was a reason for me to define in
>> the test value for "Max runtime per iteration", not whole run.
> 
> That's one of the downsides of this approach.
> 
> The reason why I choose this approach is that you can set upper cap for
> the whole test run and not only for a single filesystem/variant.
> 
> Also this way the test timeout corresponds to the maximal test runtime.
> 
> Another option would be to redefine the timeout to be timeout per a
> fork_testrun() instance, which would make the approach slightly easier
> in some places, however that would mean either changing default test
> timeout to much smaller value and annotating all long running tests.
> 
> Hmm, I guess that annotating all long running tests and changing default
> timeout may be a good idea regardless this approach.

Some fuzzysync tests have long run time by design because running too
few loops on broken systems will not trigger the bug. Limiting maximum
program execution time may be useful for quick smoke tests but it's not
usable for real test runs where we want reliable reproducibility.

I'd prefer adding a command line option to tst_test (e.g. -m) that would
just print test metadata, including total timeout of all fork_testrun()
subtests, and exit. Static metadata is not a sufficient solution for
this because the same test binary may have different runtimes on
different system configurations, for example because the list of
available filesystems may change arbitrarily between test runs. It'd be
great if test runners other than runltp-ng could get a straighforward
timeout number without reimplementing a calculation that may change in
future versions of LTP.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
