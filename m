Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9223B7E91
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:02:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E9473C8CF1
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Jun 2021 10:02:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD32E3C6BE5
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:01:59 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 410E6600943
 for <ltp@lists.linux.it>; Wed, 30 Jun 2021 10:01:58 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E22822566;
 Wed, 30 Jun 2021 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625040118;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kHS/IB+G+aWE3nkKl71HNj2KIihwtFrrgUIJb48vQ=;
 b=XEG758DEQ6JJRCWuMFWSAeHXuJpq1URngFmylVUKbJk1WUFJvPHw/H6IjTCBznm8IgNiMH
 h4hHmfXh38NSa4em22TvJs+5HL4JNQYt4fDns9RXpFj5blr1TRD8gOFrcEdrhJtB8ay0AO
 cNU2CL01xXwbOviORrPV31CgqiVsZjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625040118;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kHS/IB+G+aWE3nkKl71HNj2KIihwtFrrgUIJb48vQ=;
 b=ZHiCsZ8Y2g2vQqllIC84B70FICYw0hBM2bkYRzMwgErUQijcO7pfIMQI47H3N6rZc6U/Fq
 kPHgoZ030+eyWQCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2DE9B11906;
 Wed, 30 Jun 2021 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625040118;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kHS/IB+G+aWE3nkKl71HNj2KIihwtFrrgUIJb48vQ=;
 b=XEG758DEQ6JJRCWuMFWSAeHXuJpq1URngFmylVUKbJk1WUFJvPHw/H6IjTCBznm8IgNiMH
 h4hHmfXh38NSa4em22TvJs+5HL4JNQYt4fDns9RXpFj5blr1TRD8gOFrcEdrhJtB8ay0AO
 cNU2CL01xXwbOviORrPV31CgqiVsZjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625040118;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H7kHS/IB+G+aWE3nkKl71HNj2KIihwtFrrgUIJb48vQ=;
 b=ZHiCsZ8Y2g2vQqllIC84B70FICYw0hBM2bkYRzMwgErUQijcO7pfIMQI47H3N6rZc6U/Fq
 kPHgoZ030+eyWQCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id NJ2sCfYk3GBaMQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 30 Jun 2021 08:01:58 +0000
Date: Wed, 30 Jun 2021 10:01:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YNwk9EwTtqAnRWH6@pevik>
References: <YNuA/0J20mjiV+NC@pevik>
 <87tulf3jyk.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tulf3jyk.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

...
> > tst_fuzzy_sync01.c:224: TFAIL: acs:1  act:1  art:3  | =:3    -:2999996 +:1   

> It looks like the CI machines are too noisy/contended. The avg_dev is
> very high. Probably we could relax the dev_ratio threshold to 0.2 or
> 0.3. Although we would still get failures occassionally. As this is a
> probabalistic test.
Test is failing on my laptop, thus haven't enabled it in CI.
But maybe it'll be working on it more reliably than my busy machine.
But I'd prefer to wasting time with false positives, thus I guess we should
enable only tests which are working reliably.

> Could you change the script so that it passes so long as the test
> returns TPASS or TFAIL?
Well, accepting TFAIL sounds a bit strange to me :).
Also next effort will be (at least for shell tests) to compare actual test
output. Obviously that will not be straightforward for some tests, which aren't
reproducible (avg = 11729ns could be matched by regex, but having more variants
of results is kind of special case).

> We don't want TBROK, TCONF or no result.
FYI in my CI patchset is TCONF accepted. Motivation was to not require root for
make test as some tests needed it. Thus TCONF will be a special case, then I
guess we could add tst_fuzzy_sync01 accepting TFAIL as a special case.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
