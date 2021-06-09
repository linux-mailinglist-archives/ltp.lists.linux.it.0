Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C93A1683
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:04:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 30B923C90BF
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 16:04:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5E2583C7AD0
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:03:56 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5CAEA601C66
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 16:03:55 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A465219B7;
 Wed,  9 Jun 2021 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMDxCOhgFZ+BNb+bH2tGKYYZ8cbk1IQ54MMEjlbZXnA=;
 b=O+XB4hog90LI5oTBWjhajbC6mXRGVLUj9dY36vnL3K6waZzO4ldRGfUUw9xBfKZ8hucbrg
 17uBdoTWwQdYn1EyV5eCR9YmtDYbU3IIENxCLXYEmrHAs3ObyB0U3CcFKW5+dBk/cRxHxl
 6zWWwYRbT34zR5IfHo0dEbVCrsCgtA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMDxCOhgFZ+BNb+bH2tGKYYZ8cbk1IQ54MMEjlbZXnA=;
 b=2lJpJ7bAXYk0kYtKr5ulQvn/Lo8CWuATA2T4OXH7RJqZAVJissHhdaSxYPx0xrJ2e0+7cy
 9Bn641gnD7hVwODQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7C896118DD;
 Wed,  9 Jun 2021 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623247434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMDxCOhgFZ+BNb+bH2tGKYYZ8cbk1IQ54MMEjlbZXnA=;
 b=O+XB4hog90LI5oTBWjhajbC6mXRGVLUj9dY36vnL3K6waZzO4ldRGfUUw9xBfKZ8hucbrg
 17uBdoTWwQdYn1EyV5eCR9YmtDYbU3IIENxCLXYEmrHAs3ObyB0U3CcFKW5+dBk/cRxHxl
 6zWWwYRbT34zR5IfHo0dEbVCrsCgtA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623247434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMDxCOhgFZ+BNb+bH2tGKYYZ8cbk1IQ54MMEjlbZXnA=;
 b=2lJpJ7bAXYk0kYtKr5ulQvn/Lo8CWuATA2T4OXH7RJqZAVJissHhdaSxYPx0xrJ2e0+7cy
 9Bn641gnD7hVwODQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bpA+HUrKwGCXQgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 09 Jun 2021 14:03:54 +0000
Date: Wed, 9 Jun 2021 15:38:05 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <YMDEPYSWZG5FzUTi@yuki>
References: <20210608132723.255996-1-cascardo@canonical.com>
 <YMB6aoVvTKJQ6wif@yuki> <YMCkB/iS54OJaby4@mussarela>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMCkB/iS54OJaby4@mussarela>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] futex_wake04: avoid tst_ts_from_ns overflow on
 32-bit platforms
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
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Good catch, I guess that it would be slightly cleaner to fix the
> > NSEC_PER_SEC size instead with:
> > 
> > diff --git a/include/lapi/common_timers.h b/include/lapi/common_timers.h
> > index b783beff4..e50f698d6 100644
> > --- a/include/lapi/common_timers.h
> > +++ b/include/lapi/common_timers.h
> > @@ -12,7 +12,7 @@
> >  #include "lapi/posix_clocks.h"
> > 
> >  #ifndef NSEC_PER_SEC
> > -#define NSEC_PER_SEC (1000000000L)
> > +#define NSEC_PER_SEC (1000000000LL)
> >  #endif
> > 
> >  static const clock_t clock_list[] = {
> > 
> > 
> > What do you think?
> > 
> > -- 
> > Cyril Hrubis
> > chrubis@suse.cz
> 
> Yeah, I even wrote and tested that it would build, but I wasn't able to go
> through any build logs or run complete tests.
> 
> But maybe I am just overthinking this, and any promotions due to this would
> only fix issues and not introduce any new ones.

That would be my expectation.

> Well, on second thought, on 32-bit, in cases like variadic functions, it could
> cause a problem. So, I am just afraid that applying this fix without looking
> for every use of NSEC_PER_SEC might lead to new bugs.

Having a look at 'git grep NSEC_PER_SEC' there are five uses of
NSEC_PER_SEC and all of these should be, as far as I can tell, safe.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
