Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27247175640
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 09:46:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D8CE23C6800
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Mar 2020 09:46:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id B8B353C67EC
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 09:46:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 496F81A01120
 for <ltp@lists.linux.it>; Mon,  2 Mar 2020 09:46:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E77FAC53;
 Mon,  2 Mar 2020 08:46:52 +0000 (UTC)
Date: Mon, 2 Mar 2020 09:46:51 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200302084651.GA4736@rei.lan>
References: <b927e5f2cd36ec2dd57202b492563922b1a94e77.1582886993.git.viresh.kumar@linaro.org>
 <20200228132210.GC8324@rei>
 <20200302063714.claovt5uyi7gxf2o@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302063714.claovt5uyi7gxf2o@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/openat2: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > +static void run(unsigned int n)
> > > +{
> > > +	int fd;
> > > +	struct stat file_stat;
> > > +	struct tcase *tc = &tcases[n];
> > > +	struct open_how how = {
> > > +		.flags = tc->flags | O_CREAT,
> > > +		.mode = tc->mode,
> > > +		.resolve = tc->resolve
> > > +	};
> > 
> > This structure should be allocated tst_buffers, see capget01.c for
> > example.
> 
> This changed few things.
> 
> I am getting a build warning now (same happen if I build bpf stuff as
> well). I don't understand why this warning comes though.
> 
> openat202.c:69:1: warning: missing initializer for field 'caps' of 'struct tst_test' [-Wmissing-field-initializers]
>  };
>  ^
> In file included from openat202.c:7:0:
> ../../../../include/tst_test.h:236:18: note: 'caps' declared here
>   struct tst_cap *caps;

The compiler is confused by different styles of initialization
apparently.

> Also for the failure test where larger size was passed, the error
> reported now is EFAULT as kernel can't access out of bound dynamically
> allocated memory (instead of stack one earlier). In order to get
> E2BIG, I need to add some hacks (allocate more memory and write
> non-zero value to excess memory) and I don't think that would be worth
> it, so my test will expect EFAULT now.

Hmm, I guess that it makes sense to add the pointer to how to the tcase
structure and allocate exact size for the E2BIG case. That should work
fine, right?

> > > +	TEST(fd = openat2(*tc->dfd, tc->pathname, &how, sizeof(how)));
> > > +	if (fd == -1) {
> > > +		tst_res(TFAIL | TTERRNO, "openat2() failed (%d)", n);
> > > +		return;
> > > +	}
> > > +
> > > +	SAFE_FSTAT(fd, &file_stat);
> > > +
> > > +	if (file_stat.st_size == 0)
> > > +		tst_res(TPASS, "openat2() passed (%d)", n);
> > > +	else
> > > +		tst_res(TFAIL, "fstat() didn't work as expected (%d)", n);
> > 
> > So this is very basic test that just checks that openat() can open a
> > file and we would need a few more for each of the newly introduced
> > RESOLVE_* flags.
> 
> Hmm, this file is already testing openat2() with all different type of
> resolve flags. What kind of further tests are you suggesting here ?

Well do not test that the flags actually works, right?

So for example for RESOLVE_BENATH we need to pass paths with ".." or
symlinks pointing upwards in the filesystem and expect openat2() to
fail. And the same for the rest of the flags.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
