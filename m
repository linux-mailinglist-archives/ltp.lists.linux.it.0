Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81D1959AF
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 16:23:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A27213C3329
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Mar 2020 16:23:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id C041F3C32DD
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 16:23:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 208061A01138
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 16:23:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 84007AE2A
 for <ltp@lists.linux.it>; Fri, 27 Mar 2020 15:23:48 +0000 (UTC)
Date: Fri, 27 Mar 2020 16:23:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200327152347.GA8979@dell5510>
References: <20200324143839.3647c485@daedruan>
 <20200326084504.GB29830@dell5510> <20200326134603.GA5185@yuki.lan>
 <20200326203222.GA19445@dell5510> <20200327095715.GA16912@dell5510>
 <98d9d28a-5da8-5c28-3b8f-0678a4988eda@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98d9d28a-5da8-5c28-3b8f-0678a4988eda@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Avoid zero or negative int results in
 calculations
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
Cc: Jozef Pupava <jpupava@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Like I said in the previous e-mail, that slowdown is caused by the test
> intentionally randomizing the number of disk writes, not the patch. Run
> the test several times.

> > My concern is about brief explanation where/how is zero or negative result
> > appears. But maybe it's obvious and I just don't see it.

> Let me explain.

> > @@ -60,17 +61,15 @@ static void run(void) {

> >  	double time_delta;

> >  	long int random_number;



> > -	while (max_block <= data_blocks) {

> > -		random_number = rand();

> > -		max_block = random_number % max_blks;

> > -		data_blocks = random_number % 1000 + 1;

> > -	}

> > +	random_number = rand();

> > +	max_block = random_number % max_blks + 1;

> > +	data_blocks = random_number % max_block;


> This fixes a potential infinite loop if max_blks == 1000. This
> calculation is also the reason why the test has random run length.

Thanks for an explanation!

> >  	for (i = 1; i <= data_blocks; i++) {

> >  		offset = i * ((BLOCKSIZE * max_block) / data_blocks);

> > -		offset -= BUFSIZ;

> > +		offset -= BUF_SIZE;


> Here the old calculation could produce negative offset if
> BUFSIZ > BLOCKSIZE and (float)max_block/data_blocks is close to 1.
> BUFSIZ is defined in libc headers so the actual value can be different
> on different systems.
BTW BUFSIZ == BLOCKSIZE for glibc (BUFSIZ is 8192; long time ago was 1024. And
it's 1024 for musl and bionic).


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
