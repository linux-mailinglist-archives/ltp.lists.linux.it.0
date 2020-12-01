Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EF2CA26C
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:16:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07AA13C4D33
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 13:16:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id D76373C2C0D
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:16:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 37A6B60096D
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 13:16:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54EE5ACC0;
 Tue,  1 Dec 2020 12:16:29 +0000 (UTC)
Date: Tue, 1 Dec 2020 13:17:21 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20201201121721.GA27684@yuki.lan>
References: <20201127163150.22903-3-chrubis@suse.cz>
 <0f8ede1f55d67b7ff4fd17c38f9bfc6a835b43a3.1606813521.git.jstancek@redhat.com>
 <20201201092040.GB20076@yuki.lan>
 <738639647.26717511.1606819632601.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <738639647.26717511.1606819632601.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] lib: Add test library design document
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
> > > +## High-level picture
> > > +
> > > +    library process
> > > +    +----------------------------+
> > > +    | main                       |
> > > +    |  tst_run_tcases            |
> > > +    |   do_setup                 |
> > > +    |   for_each_variant         |
> > > +    |    for_each_filesystem     |   test process
> > > +    |     fork_testrun
> > > ------------->+--------------------------------------------+
> > > +    |      waitpid               |   | testrun
> > > |
> > > +    |                            |   |  do_test_setup
> > > |
> > > +    |                            |   |   tst_test->setup
> > > |
> > > +    |                            |   |  run_tests
> > > |
> > > +    |                            |   |   tst_test->test(i) or
> > > tst_test->test_all  |
> > > +    |                            |   |  do_test_cleanup
> > > |
> > > +    |                            |   |   tst_test->cleanup
> > > |
> > > +    |                            |   |  exit(0)
> > > |
> > > +    |   do_exit                  |
> > > +--------------------------------------------+
> > > +    |    do_cleanup              |
> > > +    |     exit(ret)              |
> > > +    +----------------------------+
> > 
> > Shouldn't we wrap this to ``` so that it renders nicely on the web?
> 
> I thought the 4 spaces prefix will already do that. I was testing
> it online on dillinger.io and stackedit.io. But I'm fine with adding ```,
> if that's better for github.

My bad, four spaces should work here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
