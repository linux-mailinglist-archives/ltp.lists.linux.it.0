Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A3222532
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 16:21:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A63483C29BD
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 16:21:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6C6233C1C67
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 16:21:56 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CAFEF10018B9
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 16:21:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDF3BB57E;
 Thu, 16 Jul 2020 14:21:58 +0000 (UTC)
Date: Thu, 16 Jul 2020 16:21:53 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Qais Yousef <qais.yousef@arm.com>
Message-ID: <20200716142153.GA15980@dell5510>
References: <20200714152510.13470-1-qais.yousef@arm.com>
 <20200716060710.GA3812@dell5510>
 <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
 <20200716095738.GA9395@dell5510>
 <20200716101250.vd7nan2u2nydzbnf@e107158-lin.cambridge.arm.com>
 <20200716120852.GA22657@dell5510>
 <20200716134939.tqxswbdd2lcpcwp3@e107158-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716134939.tqxswbdd2lcpcwp3@e107158-lin.cambridge.arm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test.sh: Fix a race condition
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
Cc: Huacai Chen <chenhc@lemote.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Qais,

> > > Let me know what would be the preferred approach.
> > Just please try to send a patch using TST_RETRY_FUNC (thus you need to figure
> > out the verifier), or let us know and we either figure that or just simply use
> > your original patch.

> So I have cooked something quick but I either get

> 	/root/arm64-ltp/testcases/bin/cpuset_hotplug_test.sh: line 159: TST_RETRY_FUNC: command not found
I'm sorry, I have forgotten that the tests haven't been ported to the new API
yet (tst_test.sh). Thus, I'm ok to take the original patch, unless anybody
objects.

Why? Rewriting is going to be bigger task, as shell scripts has interdependencies,
thus turning cpuset_funcs.sh to use new API requires turning the other tests
which use it (it's not acceptable to load both legacy and new API in a test).
Besides new API needs to rename some functions (s/tst_resm/tst_res/, ... that's
easy task), but also works differently, so it's more work that renaming these
functions. Also tests need heavy cleanup (style is not optimal, using full path
like /bin/kill is ugly).

Although this should be done, the bigger problem is that these tests test just
cgroup v1 (and only early implementations, see notes about 2.6.29 in the code),
has other bugs than just one you spotted. There might be similar approach we
took with NUMA tests: shell tests are in maintenance mode and new tests are
written from the scratch in C.

BTW there is some support for cgroup in lib/tst_cgroup.c.

> or

> 	cpuset_hotplug_test 1 TBROK: Test /root/arm64-ltp/testcases/bin/cpuset_hotplug_test.sh must call tst_run!

> Depending whether I impost test.sh or tst_test.sh.

> It seems there's a dependency on the overall test construction depending on
> what file is imported. And one can import one or the other. It seems
> tst_test.sh is the legacy approach?
No, test.sh is the legacy one.
There is a docs for new API (C and shell), if you're interested.
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines

> My WIP patch is attached in case there's somethign obvious to be done here that
> I missed.

> It looks like the current patch is the simplest thing to do otherwise? :-/
yes :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
