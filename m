Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EAF184B73
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 16:46:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35B563C58F5
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 16:46:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E6D333C1410
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 16:46:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4A08B201135
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 16:46:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 917D8AD1E;
 Fri, 13 Mar 2020 15:46:53 +0000 (UTC)
Date: Fri, 13 Mar 2020 16:46:52 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200313154652.GB7318@rei.lan>
References: <6b3d4c2c92b4a4e6eeef708ac181b57cf7affda4.1583233870.git.viresh.kumar@linaro.org>
 <20200306144603.GA31015@rei.lan>
 <20200311070845.wx5w7cxftzx5m2sx@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311070845.wx5w7cxftzx5m2sx@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls/openat2: New tests
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
> > Wouldn't it be easier if we added these to the first test and keep this
> > one failures only?
> 
> I thought about that earlier and kept it this way as this file is only
> for testing the resolve flags. Else the success cases could be added
> to openat201.c and failure to openat203.c itself.
> 
> This also helps in understanding (or noticing), that the test only
> changes the value of the resolve flag and we get an error. The first
> test plays with a lot of variables and so it may not be best to do it
> there as it would be a bit less readable.

Okay then.

> > > +	/* Failure cases */
> > > +	{"resolve-no-xdev", "/proc/version", RESOLVE_NO_XDEV, EXDEV},
> > > +	{"resolve-no-magiclinks", "/proc/self/exe", RESOLVE_NO_MAGICLINKS, ELOOP},
> > > +	{"resolve-no-symlinks", FOO_SYMLINK, RESOLVE_NO_SYMLINKS, ELOOP},
> > > +	{"resolve-beneath", "/proc/version", RESOLVE_BENEATH, EXDEV},
> > > +	{"resolve-no-in-root", "/proc/version", RESOLVE_IN_ROOT, ENOENT},
> 
> > > +static struct tcase {
> > > +	const char *name;
> > > +	int dfd;
> > > +	const char *pathname;
> > > +	uint64_t flags;
> > > +	uint64_t mode;
> > > +	uint64_t resolve;
> > > +	struct open_how **how;
> > > +	size_t size;
> > > +	int exp_errno;
> > > +} tcases[] = {
> > > +	{"invalid-dfd", -1, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how), EBADF},
> > > +	{"invalid-pathname", AT_FDCWD, NULL, O_RDONLY | O_CREAT, S_IRUSR, 0, &how, sizeof(*how), EFAULT},
> > > +	{"invalid-flags", AT_FDCWD, TEST_FILE, O_RDONLY, S_IWUSR, 0, &how, sizeof(*how), EINVAL},
> > > +	{"invalid-mode", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, -1, 0, &how, sizeof(*how), EINVAL},
> > > +	{"invalid-resolve", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, -1, &how, sizeof(*how), EINVAL},
> > > +	{"invalid-size-zero", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, 0, EINVAL},
> > > +	{"invalid-size-small", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how) - 1, EINVAL},
> > > +	{"invalid-size-big", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how) + 1, EFAULT},
> > > +	{"invalid-size-big-with-pad", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, (struct open_how **)&phow, sizeof(*how) + 1, E2BIG},
> > 
> > Here as well +8.
> 
> I kept this as 1 intentionally despite the fact that pad is 8 bytes
> long. The last 2 tests have size set to (sizeof(*how) + 1) now and the
> only difference is that we have provided pad of X number of bytes in
> one case and no pad in the other case. This gives us different error
> numbers based on difference in the pad available. If I use +8 here,
> then there are two factors which are different, the structure and the
> number of bytes we are sending in size and we can't be certain about
> why we got a different error number.

I do not get it, we can pass +8 to the EFAULT case as well, or whatever,
there is a whole page after the data.

What I would like to have here is that the size we pass to the kernel is
exactly the size of the data have have allocate, so that we catch
off-by-one accesses after the structure.



-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
