Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A764A792
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 19:52:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57CE23CBE56
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Dec 2022 19:52:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A7BDC3CBE03
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 19:52:57 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 16E0C648453
 for <ltp@lists.linux.it>; Mon, 12 Dec 2022 19:52:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EA18E1F385;
 Mon, 12 Dec 2022 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1670871175;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=17Nfip1J1Lt2MsuXMoJC9OcpLIEq8FNiwjOsEvzs8TQ=;
 b=eerv2O3Ts8lCIND0lrxNkcl1205pBZY99oaxbjKBioZ1aU1ztTGBd9VhmK4+1rnSqPXHy3
 puZGuZkxuKJVDKslLlUQC4k6sji/Ktlkd+IxVozZjfz60O8HJzWkxuFPczE5lkm/2RAOjj
 58BkRQ1ABWGN6QGMC1Ge+Fc3inEmsI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1670871175;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=17Nfip1J1Lt2MsuXMoJC9OcpLIEq8FNiwjOsEvzs8TQ=;
 b=xCYJjhawi8MU7Uiw85YC13KKNvTcgaXS6IG4xpE8fzrCkJ1E1K00UHeb71ly0winLM7n0n
 T0WehOKkxtrPd2Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE9E6138F3;
 Mon, 12 Dec 2022 18:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m88nKId4l2OoSwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Dec 2022 18:52:55 +0000
Date: Mon, 12 Dec 2022 19:52:52 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>, ltp@lists.linux.it,
 Cyril Hrubis <chrubis@suse.cz>,
 Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Y5d4hBWwj0Oqpw3H@pevik>
References: <20221212160322.4600-1-pvorel@suse.cz> <87k02wshw2.fsf@suse.de>
 <Y5dzHeDwtlBKok5W@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5dzHeDwtlBKok5W@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] aio-stress.c: Use static variable iterations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi Richie,

> > Hello,

> > Petr Vorel <pvorel@suse.cz> writes:

> > > local iteration variable in worker() was probably left over from
> > > previous versions rewrite (maybe -i was not used in previous versions).

> > > Clang correctly reported:
> > > aio-stress.c:1049:6: warning: variable 'iteration' set but not used [-Wunused-but-set-variable]
> > > int iteration = 0;

> > > Fixes: 054d45390 ("Rewrite aio-stress test using LTP API")

> > > Reported-by: Richard Palethorpe <rpalethorpe@suse.com>
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > > ---
> > > Hi,

> > > reported by Richie [1], I got confused thus merge before this fix.

> > > [1] https://lore.kernel.org/ltp/87h6yfifbr.fsf@suse.de/

> > >  testcases/kernel/io/ltp-aiodio/aio-stress.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)

> > > diff --git a/testcases/kernel/io/ltp-aiodio/aio-stress.c b/testcases/kernel/io/ltp-aiodio/aio-stress.c
> > > index 39db14d65..29e679087 100644
> > > --- a/testcases/kernel/io/ltp-aiodio/aio-stress.c
> > > +++ b/testcases/kernel/io/ltp-aiodio/aio-stress.c
> > > @@ -1046,7 +1046,6 @@ static int *worker(struct thread_info *t)
> > >  	char *this_stage = NULL;
> > >  	struct timeval stage_time;
> > >  	int status = 0;
> > > -	int iteration = 0;
> > >  	int cnt;

> > >  	aio_setup(&t->io_ctx, 512);
> > > @@ -1151,7 +1150,7 @@ restart:

> > >  	/* someone got restarted, go back to the beginning */
> > >  	if (t->active_opers && cnt < iterations) {
> > > -		iteration++;
> > > +		iterations++;

> > Why is this correct?
> OK, this is obviously wrong, we don't want to increase global iterations (-i).
> iteration appeared in v6. In v8, the default changed to 500 and RUN_FOREVER -1
> was not used any more.
> The warning was on legacy version as well, IMHO code is dead and whole restart
> label and iteration variable should go away. I'll send v2.
> Thanks for catching my obvious error.

Actually, thinking about it twice, I'm not sure if restart should be really
handled and thus only iteration variable should be removed (but restart label
kept) or it's so unlikely that it happen so that also restart label should be
deleted.

Kind regards,
Petr

> Kind regards,
> Petr

> > >  		goto restart;
> > >  	}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
