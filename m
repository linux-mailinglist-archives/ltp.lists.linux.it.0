Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA52D4D58
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 23:11:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 882693C7529
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Dec 2020 23:11:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D9A503C25D3
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 23:10:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5F9681400188
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 23:10:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5740BACE1
 for <ltp@lists.linux.it>; Wed,  9 Dec 2020 22:10:58 +0000 (UTC)
Date: Wed, 9 Dec 2020 23:10:56 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201209221056.GB69775@pevik>
References: <20201208132814.16497-1-pvorel@suse.cz> <X9DO3uytgBaTrVwi@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9DO3uytgBaTrVwi@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] syscalls/get_mempolicy01: Rewrite to new API
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

Hi Cyril,

...
> > -	if (!is_numa(NULL, NH_MEMS, 1))
> > -		tst_brkm(TCONF, NULL, "requires NUMA with at least 1 node");
> > +	if (get_allowed_nodes(NH_MEMS, 1, &test_node) < 0)
> > +		tst_brk(TBROK | TERRNO, "get_allowed_nodes failed");

> The is_numa() and get_allowed_nodes() is deprecated API, we do have new
> tst_get_nodemap() function that replaces them. See set_mempolicy()
> testcases for reference.
Thanks!

> > -	TEST_PAUSE;
> > -	tst_tmpdir();
> > +	nodemask = numa_allocate_nodemask();
> > +	getnodemask = numa_allocate_nodemask();
> > +	numa_bitmask_setbit(nodemask, test_node);
> >  }

> > -#else
> > -int main(void)
> > +static void do_test(unsigned int i)
> >  {
> > -	tst_brkm(TCONF, NULL, NUMA_ERROR_MSG);
> > +	struct test_case *tc = &tcase[i];
> > +	int policy;
> > +
> > +	tst_res(TINFO, "test #%d: %s", (i+1), tc->desc);
> > +
> > +	setup_node();
> > +
> > +	if (tc->pre_test)
> > +		if (tc->pre_test(i) == -1)
> > +			return;
> > +
> > +	if (tc->test) {
> > +		tc->test(i);
> > +
> > +		if (TST_RET < 0) {
> > +			tst_res(TFAIL | TERRNO, ".test failed");
> > +			return;
> > +		}
> > +	}

> We call test_mbind() here for each iteration which calls mmap()
> and the memory is never freed. Which means that this will fail sooner or
> later with the -i option.

> Why can't we allocate all the blocks with different mempolicy and
> or/bind the memory once in the test setup instead? We can keep the
> callback in-place as they are we just need to loop over them in the
> setup() instead. Also I would rename them to alloc, setup, or something
> like that so that it's clear that they are just preparing the
> environment and not doing the actuall test.
Thanks for catching this. I actually run it more with -i500,
but it looks laptop has enough memory :). Anyway, what you suggest is obviously
much better solution, thanks!

> Also I would pass the struct test_case pointer to these instead of i
> since they convert the i to the testcase pointer as the first thing
> anyways.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
