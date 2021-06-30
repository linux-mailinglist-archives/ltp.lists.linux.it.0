Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6F3B81F1
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 14:19:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3CFA3C6C5F
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 14:19:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA69A3C1A4B
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 14:19:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3854B1401114
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 14:19:51 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8800A1FE86;
 Wed, 30 Jun 2021 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625055591;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bdK58tlFrJojYI59Cug9dKUjbt/gwSCZSOVzvX5qiQ=;
 b=KG5q21YF1MZlShuw+JRhMI1mYNA36LCCEllwhzOEiKCybyLVvvfvpAP+QQDOSEGspPQz30
 RDaRaFkvJpfjNdQ/WI5g+1bCc0Lhklsnv5jUPLKHqhIV1lwcHOGBjxo/v8BGtH5LrE6At5
 HHjgWYB3PAFKrGv5c6CSwfkg2BNcm2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625055591;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bdK58tlFrJojYI59Cug9dKUjbt/gwSCZSOVzvX5qiQ=;
 b=TXaosFLnFHBuPGePCmVGwximKdW6TxGi/7RBwY+Kr2+MI68UAl8cP8QIYavB35NFwWAVpq
 h6tnOHrGPi9zwADw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E7B5F118DD;
 Wed, 30 Jun 2021 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625055591;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bdK58tlFrJojYI59Cug9dKUjbt/gwSCZSOVzvX5qiQ=;
 b=KG5q21YF1MZlShuw+JRhMI1mYNA36LCCEllwhzOEiKCybyLVvvfvpAP+QQDOSEGspPQz30
 RDaRaFkvJpfjNdQ/WI5g+1bCc0Lhklsnv5jUPLKHqhIV1lwcHOGBjxo/v8BGtH5LrE6At5
 HHjgWYB3PAFKrGv5c6CSwfkg2BNcm2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625055591;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8bdK58tlFrJojYI59Cug9dKUjbt/gwSCZSOVzvX5qiQ=;
 b=TXaosFLnFHBuPGePCmVGwximKdW6TxGi/7RBwY+Kr2+MI68UAl8cP8QIYavB35NFwWAVpq
 h6tnOHrGPi9zwADw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ocejNWZh3GCPTAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 30 Jun 2021 12:19:50 +0000
Date: Wed, 30 Jun 2021 14:19:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YNxhZZLvb+xkHXMK@pevik>
References: <YNuA/0J20mjiV+NC@pevik> <87tulf3jyk.fsf@suse.de>
 <YNwk9EwTtqAnRWH6@pevik> <87r1gj3ed2.fsf@suse.de>
 <YNxDEt931O3OlUx4@pevik> <87o8bn36dn.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8bn36dn.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] tst_fuzzy_sync01 sporadically fails
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hello Petr,

> Petr Vorel <pvorel@suse.cz> writes:

> > Hi Richie,

> >> Hello Petr,

> >> Petr Vorel <pvorel@suse.cz> writes:

> >> > Hi Richie,

> >> > ...
> >> >> > tst_fuzzy_sync01.c:224: TFAIL: acs:1  act:1  art:3  | =:3    -:2999996 +:1   

> >> >> It looks like the CI machines are too noisy/contended. The avg_dev is
> >> >> very high. Probably we could relax the dev_ratio threshold to 0.2 or
> >> >> 0.3. Although we would still get failures occassionally. As this is a
> >> >> probabalistic test.
> >> > Test is failing on my laptop, thus haven't enabled it in CI.
> >> > But maybe it'll be working on it more reliably than my busy machine.

> >> Is it really that busy? Perhaps we should increase the dev ratio
> >> threshold. Clearly the deviations from contention are not enough to
> >> reproduce the races, but are enough to prevent the radomization phase.
> > I probably did some VM testing or kernel compilation or something.
> > I'll try to enable for next patchset version it to see how it works on CI.

> >> > But I'd prefer to wasting time with false positives, thus I guess we should
> >> > enable only tests which are working reliably.

> >> >> Could you change the script so that it passes so long as the test
> >> >> returns TPASS or TFAIL?
> >> > Well, accepting TFAIL sounds a bit strange to me :).
> >> > Also next effort will be (at least for shell tests) to compare actual test
> >> > output. Obviously that will not be straightforward for some tests, which aren't
> >> > reproducible (avg = 11729ns could be matched by regex, but having more variants
> >> > of results is kind of special case).

> >> >> We don't want TBROK, TCONF or no result.
> >> > FYI in my CI patchset is TCONF accepted. Motivation was to not require root for
> >> > make test as some tests needed it. Thus TCONF will be a special case, then I
> >> > guess we could add tst_fuzzy_sync01 accepting TFAIL as a special case.

> >> At least if we run the tests and look for TPASS or TFAIL, we will catch
> >> segfaults and similar.

> >> Also, for fuzzy sync, returning TCONF would be a major error. It should
> >> run on all systems.
> > Well, TCONF should be used on places where it's really a configuration issue.
> > IMHO only TBROK and TFAIL should be a problem. Or is fuzzy sync part somehow
> > special in this?

> I can't imagine any Linux config where fuzzy sync won't work. Even if we
> are compiling with some libc that doesn't have POSIX threads, we can
> work around that. Probably if it returns TCONF it's because some other
> library func has an error in it.

> For example if tst_ncpus_available starts aborting with TCONF. Then that
> is an error. Fuzzy Sync should be able to work around that.

Thanks for info, good to know. I'll see if I manage to handle this in this first
attempt, even if not I see we'll need to have some metadata whether TCONF is
safe (i.e. missing root) or something else.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
