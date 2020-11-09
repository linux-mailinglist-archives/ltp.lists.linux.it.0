Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E042AB872
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:41:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34AA23C2F81
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 13:41:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 2CD803C0888
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:41:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 82E4C1400E65
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 13:41:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BAAA2ABF4;
 Mon,  9 Nov 2020 12:41:47 +0000 (UTC)
Date: Mon, 9 Nov 2020 13:42:33 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20201109124233.GA9991@yuki.lan>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
 <20201107165518.GB10159@pevik> <5FA8BE07.4040201@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FA8BE07.4040201@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> 1) open(2) will return -1 if an error occur.
>      Is it necessary to check invalid return value(except -1) if an 
> error occur?

Well if there are values that are never supposed to be returned it makes
sense to catch these and return a TBROK or TFAIL.

If we are expecially testing a syscall() I would say that we should
check for all kinds of errors including the values that shall not be
returned e.g.:

	TEST(open(...));

	if (TST_RET == -1) {
		tst_ret(TFAIL | TTERRNO, "open() failed");
		return;
	}

	if (TST_RET < 0) {
		tst_ret(TFAIL | TTERRNO, "Invalid open() retval %ld", TST_RET);
		return;
	}

	...


If the syscall is part of the test preparation and there is no safe
macro I would say that it's enough to cover all invalid values in one
condition e.g.:

	fd = open(...);
	if (fd < 0)
		tst_brk(TBROK | TERRNO, "open() failed");


> 2) mmap(2) will return MAP_FAILED if an error occurs.
>      Is it necessary to check invalid value(except MAP_FAILED) if an 
> error occur?

Actually return value from mmap() is pointer, right? And the only value
that is not supposed to be returned is MAP_FAILED or do I miss
something?

> Martin's patches have added a check for invalid return value in many 
> safe macros but a lot of syscall tests(e.g. after doingTEST()) don't add 
> the check for now.
> I am not sure if we need to add the check for all syscall tests. :-)

I would say that at least for newly added test we should make sure that
there is no unexpected value returned.

> BTW: In my opinion, it is hardly to get invalid return value so the 
> check seems unnecessary and redundance.

Well it's not a common case but I've seen this to happen a few times,
once it was because a backported patch applied cleanly but the code was
incorrect and as a result syscall started to return really unexpected
values.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
