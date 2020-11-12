Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1672B02F7
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 11:42:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7659C3C5FEB
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Nov 2020 11:42:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 78B583C263C
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 11:42:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 26B78600682
 for <ltp@lists.linux.it>; Thu, 12 Nov 2020 11:42:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97C5CAC77;
 Thu, 12 Nov 2020 10:42:35 +0000 (UTC)
Date: Thu, 12 Nov 2020 11:43:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201112104323.GE11365@yuki.lan>
References: <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
 <20201107165518.GB10159@pevik> <5FA8BE07.4040201@cn.fujitsu.com>
 <20201109124233.GA9991@yuki.lan>
 <260dd94635a3dead2e946b2c40096061aa18d25b.camel@suse.com>
 <20201111182557.GA22242@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111182557.GA22242@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
> > I see no downside in checking for this unexpected negative value,
> > except copy/pasting this test condition in every syscall testcase.
> 
> > I don't know the LTP codebase well enough yet, but what would you say
> > is a good way to have this somewhere in the library. A TEST_SYSCALL
> > macro, or something else, which fails if the return value is < -1?
> LGTM. I was thinking about adding it directly into TEST() and define _TEST()
> which would not do that and be used in that few cases which ret < -1 is valid,
> but that would be ugly.

Well it would have to be a set of macros at least since:

* There are different classes of functions by return values

* We have possitive and negative testcases

For example we would have to have two macros for functions that return
file descriptors, one for a cases where we expect the function to return
a valid file descriptor and one when we expect the function to fail.

So it would look like:

	TEST_FD(open("/foo/bar", O_RDONLY));

or:
	TEST_FAIL(open((void*)-1, O_RDONLY));


The TEST_FD() macro would fail the test if the return value is < 0

And the TEST_FAIL() will fail the test unless we the return value is set
to -1. Maybe we can even have a version with errno as well something as:

	TEST_FAIL_ERR(open((void*)-1, O_RDONLY), EFAULT);

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
