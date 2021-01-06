Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805F2EBD1A
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 12:23:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BABF3C6E3B
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 12:23:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DE8243C06F0
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 12:23:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6402910006BE
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 12:23:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C967AA35
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 11:23:06 +0000 (UTC)
Date: Wed, 6 Jan 2021 12:23:05 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <X/WdmfIFbH/85wVO@pevik>
References: <20201208132814.16497-1-pvorel@suse.cz> <X9DO3uytgBaTrVwi@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9DO3uytgBaTrVwi@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
OK, I'll loop over ARRAY_SIZE(tcase) in the setup().
But the original code first set NUMA node (setup_node()), then did the
preparation (SAFE_MMAP() and mbind()) and then call set_mempolicy().

Do you suggest instead of testing just take "safe" approach - tst_brk(TBROK)
on any failure as it's in the setup?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
