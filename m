Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F19CC2AF7DB
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 19:26:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 865443C602E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 19:26:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0727D3C2639
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 19:26:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9EC631400070
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 19:25:59 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF8DADC5;
 Wed, 11 Nov 2020 18:25:58 +0000 (UTC)
Date: Wed, 11 Nov 2020 19:25:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201111182557.GA22242@pevik>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
 <20201107165518.GB10159@pevik> <5FA8BE07.4040201@cn.fujitsu.com>
 <20201109124233.GA9991@yuki.lan>
 <260dd94635a3dead2e946b2c40096061aa18d25b.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <260dd94635a3dead2e946b2c40096061aa18d25b.camel@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/sync01: Remove it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> On Mon, 2020-11-09 at 13:42 +0100, Cyril Hrubis wrote:
> > Hi!
> > > 1) open(2) will return -1 if an error occur.
> > >      Is it necessary to check invalid return value(except -1) if
> > > an 
> > > error occur?

> > Well if there are values that are never supposed to be returned it
> > makes
> > sense to catch these and return a TBROK or TFAIL.

> > If we are expecially testing a syscall() I would say that we should
> > check for all kinds of errors including the values that shall not be
> > returned e.g.:

> > 	TEST(open(...));

> > 	if (TST_RET == -1) {
> > 		tst_ret(TFAIL | TTERRNO, "open() failed");
> > 		return;
> > 	}

> > 	if (TST_RET < 0) {
> > 		tst_ret(TFAIL | TTERRNO, "Invalid open() retval %ld",
> > TST_RET);
> > 		return;
> > 	}

> > 	...

> I see no downside in checking for this unexpected negative value,
> except copy/pasting this test condition in every syscall testcase.

> I don't know the LTP codebase well enough yet, but what would you say
> is a good way to have this somewhere in the library. A TEST_SYSCALL
> macro, or something else, which fails if the return value is < -1?
LGTM. I was thinking about adding it directly into TEST() and define _TEST()
which would not do that and be used in that few cases which ret < -1 is valid,
but that would be ugly.

Another candidate is macro for new API tst_syscall() defined in
include/lapi/syscalls.h (generated in include/lapi/syscalls/regen.sh).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
