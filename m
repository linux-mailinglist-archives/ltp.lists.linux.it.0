Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 371B7C9C76
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 12:39:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8A81F3C2382
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 12:39:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5BB4E3C2270
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 12:39:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 717161000B20
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 12:39:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF9ECAE8A;
 Thu,  3 Oct 2019 10:39:45 +0000 (UTC)
Date: Thu, 3 Oct 2019 12:39:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Tim.Bird@sony.com
Message-ID: <20191003103944.GA1858@rei>
References: <20191001070111.31369-1-jcronenberg@suse.de>
 <ECADFF3FD767C149AD96A924E7EA6EAF977BF7B1@USCULXMSG01.am.sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ECADFF3FD767C149AD96A924E7EA6EAF977BF7B1@USCULXMSG01.am.sony.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Convert ptrace01.c to new library
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
> > /**********************************************************
> > - *
> > - *    TEST IDENTIFIER	: ptrace01
> > - *
> > - *    EXECUTED BY	: anyone
> > - *
> > - *    TEST TITLE	: functionality test for ptrace(2)
> > - *
> > - *    TEST CASE TOTAL	: 2
> > - *
> > - *    AUTHOR		: Saji Kumar.V.R <saji.kumar@wipro.com>
> > - *
> > - *    SIGNALS
> > - * 	Uses SIGUSR1 to pause before test if option set.
> > - * 	(See the parse_opts(3) man page).
> > - *
> > - *    DESCRIPTION
> > + * DESCRIPTION
> >   *	This test case tests the functionality of ptrace() for
> >   *	PTRACE_TRACEME & PTRACE_KILL requests.
> >   *	Here, we fork a child & the child does ptrace(PTRACE_TRACEME, ...).
> > @@ -44,243 +21,114 @@
> >   * 		In both cases, child should stop & notify parent on reception
> >   * 		of SIGUSR2
> >   *
> > - * 	Setup:
> > - * 	  Setup signal handling.
> > - *	  Pause for SIGUSR1 if option specified.
> > - *
> > - * 	Test:
> > - *	 Loop if the proper options are given.
> > - *	 setup signal handler for SIGUSR2 signal
> > - *	 fork a child
> > - *
> > - *	 CHILD:
> > - *		setup signal handler for SIGUSR2 signal
> > - *		call ptrace() with PTRACE_TRACEME request
> > - *		send SIGUSR2 signal to self
> > - *	 PARENT:
> > - *		wait() for child.
> > - *		if parent is notified when child gets a signal through wait(),
> > - *		then
> > - *			do  ptrace(PTRACE_KILL, ..) on child
> > - * 			wait() for child to finish,
> > - * 			if child exited abnormaly,
> > - *				TEST passed
> > - * 			else
> > - * 				TEST failed
> > - *		else
> > - *			TEST failed
> > - *
> > - * 	Cleanup:
> > - * 	  Print errno log and/or timing stats if options given
> > - *
> > - * USAGE:  <for command-line>
> > - *  ptrace01 [-c n] [-e] [-i n] [-I x] [-P x] [-t] [-h] [-f] [-p]
> > - *			where,  -c n : Run n copies concurrently.
> > - *				-e   : Turn on errno logging.
> > - *				-h   : Show help screen
> > - *				-f   : Turn off functional testing
> > - *				-i n : Execute test n times.
> > - *				-I x : Execute test for x seconds.
> > - *				-p   : Pause for SIGUSR1 before starting
> > - *				-P x : Pause for x seconds between iterations.
> > - *				-t   : Turn on syscall timing.
> > - *
> > -
> > **********************************************************
> > ******/
> > + */
> 
> It looks like the old comment had some nicely structured meta-data.  I'm not
> familiar with the process for converting to the new library.  Is it intentional to
> eliminate this meta-data?  (This is more of a question for the LTP leaders
> than for Jorik).

Well most of the old data is unfortunatelly garbage, for instance it
lists the USAGE lists flags implemented in the test library, repeating
these in each test is actually doing a harm. So we tend to keep carefuly
selected subset.

I suspect that there was some kind of silly template that had to be
filled up in order to get test accepted in the old days, which resulted
in long and mostly useless comments on the top of the testcases.

> I know that Cyril is working on a new meta-data system.  If this meta-data is eliminated
> now, does it make adding it back into the new system harder?
> 
> Personally, I find it useful to see the pseudo-code outline when I'm debugging a
> test.  So I hate to see those be eliminated.  But maybe those are hard to trust
> as they tend to not be maintained along with the code?

Well in this case the patch actually keeps the test description, which
is the same as the pseudo-code but in a paragraph of a text, so as far
as I can tell it's fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
