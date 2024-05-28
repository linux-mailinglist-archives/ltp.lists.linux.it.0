Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC98D1B7A
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2024 14:40:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F2ED3D0543
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2024 14:40:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B8763CFCD7
 for <ltp@lists.linux.it>; Tue, 28 May 2024 14:39:56 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5CCFC206C29
 for <ltp@lists.linux.it>; Tue, 28 May 2024 14:39:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F36221D36;
 Tue, 28 May 2024 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716899993;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iicRO/9MJSnUmnckuQtsdvqPpmpixMJaHlvh578H0Ns=;
 b=T6PyK8rVTdV/16cpjSvYIxgopH44lCD43cTYtQ4wS7nHjo6VqCzZoXKDnvS+6AUevoM+b4
 OO68E0Pohs2DCnb9y3ZkJbkSZi9WW7a1pp79Zp80rqv8hFJ4PU/bj6Hf7k+7VFpMQMLb71
 AnbTWJXTsNkYtNat+U+DawxYlWRpizg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716899993;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iicRO/9MJSnUmnckuQtsdvqPpmpixMJaHlvh578H0Ns=;
 b=0y9kn3hag8h8n93KqKnz8n19Mo5GtVAfy3cH8qxmxkC2ft7TVKQA3GydoZAh9YYpHlAxbz
 qIuU/gFXAUJCNZAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1716899992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iicRO/9MJSnUmnckuQtsdvqPpmpixMJaHlvh578H0Ns=;
 b=W5pT4OfWBWdSfiRhPsHVQXLh4zaeKOXJ1T1W+3KK3EItDKpgnC+X7H39nB8KByvQSF0j1W
 TsNC6BEHMmXWeikvLgzprPkHNVGtjRWbH5wWBQlisYtejzDmRBdI4s8dO3cCmIrTGmdkvO
 /u18X7t0vjKxs4rV5IbzeEfrUgLEFjc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1716899992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iicRO/9MJSnUmnckuQtsdvqPpmpixMJaHlvh578H0Ns=;
 b=UEFxa/Q8MKUau1RH9NW6aYyDfsVgSzDQ00EuL7v9rn8oO1DVh11b4zD5aCa3C5pShs3lY5
 nDKeyFxHOzJo0hDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52FDA13A6B;
 Tue, 28 May 2024 12:39:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BqGBEpjQVWYKSQAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 28 May 2024 12:39:52 +0000
Date: Tue, 28 May 2024 14:39:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Kara <jack@suse.cz>
Message-ID: <20240528123945.GC435237@pevik>
References: <20240522124754.9599-1-wegao@suse.com>
 <20240527231636.GA375669@pevik>
 <20240528095030.valplwc5t3m3betn@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528095030.valplwc5t3m3betn@quack3>
X-Spam-Level: 
X-Spamd-Result: default: False [-3.50 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto]; 
 REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -3.50
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] msync04: Check disk content if dirty bit check
 failed
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

> Hi Petr!

> On Tue 28-05-24 01:16:36, Petr Vorel wrote:
> > > msync04 test is inherently racy and nothing guarantees that the page
> > > is not written out before get_dirty_page() manages to read the page state.
> > > Hence the test should be reworked to verify the page contents is on disk
> > > when it finds dirty bit isn't set anymore...

> > @Jan some time ago [1] you asked to:

> > 	mmap file, write to mmap, msync, abort fs, mount fs again, check the data is
> > 	there.

> > Could you please have a look if this is enough? Or is it aborting fs and mounting
> > again necessary?

> Well, it depends on what functionality exactly you want to test... See
> below.

> > > diff --git a/testcases/kernel/syscalls/msync/msync04.c b/testcases/kernel/syscalls/msync/msync04.c
> > > index 72ddc27a4..c296c8b20 100644
> > > --- a/testcases/kernel/syscalls/msync/msync04.c
> > > +++ b/testcases/kernel/syscalls/msync/msync04.c
> > > @@ -46,6 +46,7 @@ uint64_t get_dirty_bit(void *data)
> > >  static void test_msync(void)
> > >  {
> > >  	uint64_t dirty;
> > > +	char buffer[20];

> > >  	test_fd = SAFE_OPEN("msync04/testfile", O_CREAT | O_TRUNC | O_RDWR,
> > >  		0644);
> > > @@ -56,20 +57,27 @@ static void test_msync(void)
> > >  	mmaped_area[8] = 'B';
> > >  	dirty = get_dirty_bit(mmaped_area);
> > >  	if (!dirty) {
> > > -		tst_res(TFAIL, "Expected dirty bit to be set after writing to"
> > > -				" mmap()-ed area");
> > > -		goto clean;
> > > -	}
> > > -	if (msync(mmaped_area, pagesize, MS_SYNC) < 0) {
> > > -		tst_res(TFAIL | TERRNO, "msync() failed");
> > > -		goto clean;
> > > +		tst_res(TINFO, "Not see dirty bit so we check content of file instead");
> > > +		test_fd = SAFE_OPEN("msync04/testfile", O_RDONLY);
> > > +		SAFE_READ(0, test_fd, buffer, 9);
> > > +		if (buffer[8] == 'B')
> > > +			tst_res(TCONF, "write file ok but msync couldn't be tested"
> > > +				" because the storage was written to too quickly");
> > > +		else
> > > +			tst_res(TFAIL, "write file failed");

> So this will read the very same page in the page cache that mmap(2) has
> been using for write. As such it isn't very interesting verification. I'd
> at least use direct IO to verify the data is stored on disk now.

+1

> > > +	} else {
> > > +		if (msync(mmaped_area, pagesize, MS_SYNC) < 0) {
> > > +			tst_res(TFAIL | TERRNO, "msync() failed");
> > > +			goto clean;
> > > +		}
> > > +		dirty = get_dirty_bit(mmaped_area);
> > > +		if (dirty)
> > > +			tst_res(TFAIL, "msync() failed to write dirty page despite"
> > > +					" succeeding");
> > > +		else
> > > +			tst_res(TPASS, "msync() working correctly");
> > > +
> > >  	}
> > > -	dirty = get_dirty_bit(mmaped_area);
> > > -	if (dirty)
> > > -		tst_res(TFAIL, "msync() failed to write dirty page despite"
> > > -				" succeeding");
> > > -	else
> > > -		tst_res(TPASS, "msync() working correctly");

> Overall this looks correct. But what this test really does is that it
> verifies msync(2) is clearing dirty page bits. That is not very useful
> verification from userspace point of view (as IMO it leans too much on
> internal kernel implementation details). msync(2) is really a data
> integrity operation so ideally its tests would verify data integrity
> guarantees are met after a power failure - that is what userspace is
> interested in. But probably these test are more within the realm of fstests
> (where we do similar tests) as LTP lacks necessary infrastructure to do
> this low-level filesystem manipulation so I guess what you have is fine.

Thanks for having a deeper look and explanation! I guess we take it and we can
think how hard would be to implement the hard way (abort fs), as Cyril wanted we
do it.  Or we at least add direct IO. (update that in the ticket:
https://github.com/linux-test-project/ltp/issues/1157).
And sure, if anybody adds msync() support to fstests, that would be the best.

But for now I merged it with your RBT (I'm sorry if I was too inventive to add
it) to get some improvement (hope that without direct IO we did not actually
turned it into false negative).

@Wei: feel free to further improve it.

Kind regards,
Petr

> 								Honza

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
