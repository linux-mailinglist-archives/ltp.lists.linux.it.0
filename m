Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 153682EADD9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 16:03:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE8023C54A9
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 16:03:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9CCD23C25F1
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 16:03:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E02CD1000A85
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 16:03:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39704AE63;
 Tue,  5 Jan 2021 15:03:00 +0000 (UTC)
Date: Tue, 5 Jan 2021 16:03:53 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "yangx.jy" <yangx.jy@cn.fujitsu.com>
Message-ID: <X/R/2VVe1dJxGhHN@yuki.lan>
References: <20210104125423.19183-1-yangx.jy@cn.fujitsu.com>
 <20210104125423.19183-2-yangx.jy@cn.fujitsu.com>
 <X/Rre6xb0cAg1Emw@yuki.lan> <5FF47A04.4030908@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FF47A04.4030908@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 2/2] include/tst_test_macros.h: Report TINFO
 when TST_EXP_FD() succeeded
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
> > What exactly is the problem of having TPASS generated for each open()
> > that produces a valid file descriptor in the open testcases?
> >
> > These macros are especially tailored to generate TPASS/TFAIL messages so
> > that the caller does not have to. So even if having two TPASS per run()
> > function in open01 was a problem, which I do not think is the case, we
> > should just use SAFE_OPEN() there instead.
> Hi Cyril,
> 
> I perfer to report one TPASS message when finishing one subtest instead 
> of one step.
>      because of two reasons:
>     a) It seems clearer for user to know how many subtests were run 
> sucessfully.

This depends on a definition of subtest which, as far as I can tell, is
not that well defined.

If you want to make the output easier to read in the case of a test
function that is called more than once we should change the test library
to insert empty lines between the iterations or something along these
lines, so that the output would look like:

./open01
tst_test.c:1261: TINFO: Timeout per run is 0h 05m 00s

open01.c:48: TPASS: open() with sticky bit returned fd 3
open01.c:56: TPASS: sticky bit is set as expected

open01.c:48: TPASS: open() with sirectory bit returned fd 3
open01.c:56: TPASS: sirectory bit is set as expected

Summary:
passed   4
failed   0
broken   0
skipped  0
warnings 0

Which is way better than imposing any rules on how many TPASS/TFAIL
messages should be printed per iteration.

>     b) There are too many TPASS/TFAIL messages when a testcase(e.g. 
> open11) contains many subtests or multiple TST_EXP_* macros.

There are 28 testcases in open11 and we print 28 messages TPASS/TFAIL
messages, we just use different EXP macro for different testcases. I do
not think that silencing the output would make things any better.

> Could we make TST_EXP_* macros do common check and generate only TFAIL 
> messages? (Make testcases report TPASS message by themself)

The whole idea of having the TST_EXP_* macros is that they replace code
that looks like:

	if (condition)
		tst_res(TPASS, "...");
	else
		tst_res(TFAIL, "...");

And that they actually unify how these messages are formatted.

If you think that there are places where we use these macros where
SAFE_MACRO() would be better we can talk about changing these.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
