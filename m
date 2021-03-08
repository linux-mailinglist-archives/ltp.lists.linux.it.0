Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 279EB33157D
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 19:08:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 82AB53C6557
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Mar 2021 19:08:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0DA1C3C0CC6
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 19:08:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7FC3E200AEB
 for <ltp@lists.linux.it>; Mon,  8 Mar 2021 19:08:10 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C058FAC0C;
 Mon,  8 Mar 2021 18:08:09 +0000 (UTC)
Date: Mon, 8 Mar 2021 19:08:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YEZoCOqGeb4dVnpV@pevik>
References: <20210308154421.2002-1-pvorel@suse.cz> <YEZTd+CT/Gag1ejK@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YEZTd+CT/Gag1ejK@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

thanks for your review!

> I do wonder if this should be replaced with something that includes a
> shell pipe instead. It has been selected here to make sure we pass the
> command line correctly to a shell interpreter.

> Maybe something as:

> shell_test01 echo "SUCCESS" | cat

I guess you mean to add another test to cover shell pipe.
Makes sense to me, but I'd wrap it to a test file, e.g. something like:

cat shell01.sh
#!/bin/sh
TST_TESTFUNC=do_test
TST_NEEDS_CMDS="cat"
. tst_test.sh

do_test()
{
	EXPECT_PASS [ "$(echo 'SUCCESS' | cat)" = "SUCCESS" ]
}

tst_run

> > +++ b/runtest/syscalls
> >  splice01 splice01
> > -splice02 seq 1 20000 | splice02
> > +splice02 splice02 -n 20000

> Don't we default to 20000 in the test anyway? What is the point of
> passing the default value here?
+1

...
> > +static void setup(void)
> > +{
> > +	if (tst_parse_int(narg, &num, 1, INT_MAX))
> > +		tst_brk(TBROK, "invalid number of input '%s'", narg);
>                                         ^
> 					That does not sound english


> Maybe "Invalid number of writes" or "Invalid size" something along these lines.
+1 (before it was invalid number of input lines, but then I removed \n).

...
> > +	SAFE_CLOSE(pipe_fd[1]);
> > +	close(STDIN_FILENO);
> > +	SAFE_DUP2(pipe_fd[0], STDIN_FILENO);

> dup2() closed the newfd, no need to close STDIN_FILENO here.
+1.

...
> > +static void run(void)
> > +{
> > +	int i;
> > +
> > +	SAFE_PIPE(pipe_fd);
> > +
> > +	if (SAFE_FORK())
> > +		do_child();
> > +
> > +	tst_res(TINFO, "writting %d times", num);
> > +
> > +	for (i = 0; i < num; i++)
> > +		SAFE_WRITE(1, pipe_fd[1], "x", 1);
> > +
> > +	TST_CHECKPOINT_WAKE(0);

> I guess that the test will timeout if the -n parameter is greater than
> maximal pipe capacity, since the write would end up blocking.
Yes. I could use fcntl(pipe_fd[1], F_GETPIPE_SZ)
(16 pages, i.e. 65536 on my system).
But with changes you suggest below we don't have to bother about F_GETPIPE_SZ.
And I guess having more for regular test (to block) does not give more test
coverage, right?

> Note that in the original test excess data was simply ignored.
I noticed that as well, considered it as a bug. But probably it was enough
for the original reproducer.

> If we wanted to increase the test coverage we could change the child to
> splice in a loop with a proper offset until all data are written. After
> that no synchronization would be required. Then we could check if we
> ended up with a right file size and if the content is correct as well.
Sounds good, I'll try.

> > +	.options = (struct tst_option[]) {
> > +		{"n:", &narg, "-n x     Number of input"},

> Here as well.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
