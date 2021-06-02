Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE65C398E58
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5F0B3C5AAF
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Jun 2021 17:19:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E8FE13C5575
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7A1D71A008AB
 for <ltp@lists.linux.it>; Wed,  2 Jun 2021 17:18:31 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02F341FE3B;
 Wed,  2 Jun 2021 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622647111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQbhKGd5zWLDSQVrL49ON0MKl9rLYujy3+q92GZKbq8=;
 b=AzWGXjbA6MtBfLLjrbJShH9SKb02+rRh6qdun//UE9z3SeSciyuImLvaJjQQW1LMMjSu4y
 1xovPzmcKoFgp44Ek0zWSBsh7hbzu/ZLg6xjwRVzLTtL92I/LhxpaqAXgEqCjxru7asc1Z
 38roavuDZjPXFPSY4/O5gT7ru4wuK+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622647111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQbhKGd5zWLDSQVrL49ON0MKl9rLYujy3+q92GZKbq8=;
 b=qhBDy1fYY2l6gkOEhnh47WJV+9HB+BI1el2Dre4inOHMowNrLQkAFmBKKlKlgScJEha9N4
 CWOOAlKBdd/PfsBQ==
Received: by imap.suse.de (Postfix, from userid 51)
 id F2FD011CC0; Wed,  2 Jun 2021 16:20:03 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5C1BE11DD4;
 Wed,  2 Jun 2021 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622632736;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQbhKGd5zWLDSQVrL49ON0MKl9rLYujy3+q92GZKbq8=;
 b=1WCgwHxHuTUWE1CWVHrr5ysoglLp/UfqSIuBoFCtlZ+aCmXny9jWjqJ9Bi7DA+SKv5smcO
 JdjPXvIU14m1Dhux/FovFOuZdeHpozVTBD+6QuamzNDdRx+iPumBRWvyaBYAsPQk9z4aO8
 Agy1iih/yKu8LPElr3RShqKjybeWMNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622632736;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQbhKGd5zWLDSQVrL49ON0MKl9rLYujy3+q92GZKbq8=;
 b=mFV/5fskwlngxSGiBLmF+frcf3GHXwttigCv3g7BX1PDu/FCVXgFsDdXHlgo8YtcgDV4Su
 X9uAfvvrgPRucSDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id +4nkFCBpt2ApbQAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 02 Jun 2021 11:18:56 +0000
Date: Wed, 2 Jun 2021 13:18:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YLdpHqnNJhy7YUaf@pevik>
References: <20210531032910.6739-1-pvorel@suse.cz>
 <YLSkz6OUbgwuB7my@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLSkz6OUbgwuB7my@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: Drop uClinux support
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > some shorter form could be added to 3. Test Contribution Checklist [1] as well.

> > Kind regards,
> > Petr

> > [1] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#3-test-contribution-checklist

> >  doc/maintainer-patch-review-checklist.txt | 3 +++
> >  1 file changed, 3 insertions(+)

> > diff --git a/doc/maintainer-patch-review-checklist.txt b/doc/maintainer-patch-review-checklist.txt
> > index 5420fa933..81ed61ddf 100644
> > --- a/doc/maintainer-patch-review-checklist.txt
> > +++ b/doc/maintainer-patch-review-checklist.txt
> > @@ -44,6 +44,9 @@ New test should
> >  * Docparse documentation
> >  * If a test is a regression test it should include tags
> >    (more in https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2238-test-tags[Test tags])
> > +* When rewritting old tests, https://en.wikipedia.org/wiki/%CE%9CClinux[uClinux
> > +  (??Clinux)] support should be removed (project has been discontinued).
>       ^
>       I would just use u instead of \textmu

> > +  E.g. `FORK_OR_VFORK()` should be replaced with simple `fork()` or `SAFE_FORK()`.

> + and all #ifdef UCLINUX should be removed as well.

Fixed and merged.

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
