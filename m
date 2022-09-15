Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFE45B9CCF
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 16:19:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E8BB3CAC4D
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Sep 2022 16:19:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 48CC43CA900
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 16:19:31 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D57FE600207
 for <ltp@lists.linux.it>; Thu, 15 Sep 2022 16:19:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F01D01F891;
 Thu, 15 Sep 2022 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663251568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ih93cxpx9TGGy73/6TS2NWW56OhRiKWSJrUK3qXLEZM=;
 b=XUqXHB6BQMj7YNYeOZZ7u3xWVBRtu5kiwpIX1mGTJxpAtqqPTt2b9cMRhCfN1OWVnnH3Om
 ijyMXhyUB+exnWa1p8Bjc9rSvkzp6fITrshxcW8jJgcdaMtIQmQLF/p4/DKqd2eHd73qsj
 q8/jfnjH5FGi38kSpnMnFy5KfXG3yMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663251568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ih93cxpx9TGGy73/6TS2NWW56OhRiKWSJrUK3qXLEZM=;
 b=eeRzxayt3W91kgcxU2Z/mRRWl/fUldxuyKnFYw4hDqbX68Vn5qMZz9zrLIBYIUyFNxVyWd
 dQMLwiT6V9u6viDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D812B133B6;
 Thu, 15 Sep 2022 14:19:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dP/TMnA0I2MudQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 15 Sep 2022 14:19:28 +0000
Date: Thu, 15 Sep 2022 16:21:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YyM05nwf1+0eCd3w@yuki>
References: <20220915031020.2633347-1-liwang@redhat.com>
 <YyMgBQu+phGCulxV@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyMgBQu+phGCulxV@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] open04: add EMFILE check
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > diff --git a/testcases/kernel/syscalls/open/open04.c b/testcases/kernel/syscalls/open/open04.c
> > index d452405d4..01a8b12d6 100644
> > --- a/testcases/kernel/syscalls/open/open04.c
> > +++ b/testcases/kernel/syscalls/open/open04.c
> > @@ -33,7 +33,12 @@ static void setup(void)
> 
> >  	for (i = first + 1; i < fds_limit; i++) {
> >  		sprintf(fname, FNAME ".%d", i);
> > -		fd = SAFE_OPEN(fname, O_RDWR | O_CREAT, 0777);
> > +		fd = open(fname, O_RDWR | O_CREAT, 0777);
> > +		if (fd == -1) {
> > +			if (errno != EMFILE)
> > +				tst_brk(TBROK, "Expected EMFILE but got %d", errno);
> > +			break;
> > +		}
> >  		fds[i - first] = fd;
> >  	}
> >  }
> 
> LGTM.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

I faintly remmeber a similar patch where we decided not to work around
for a test harness leaking filedescriptors into testcases.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
