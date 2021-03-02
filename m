Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C106329A93
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:42:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E90703C56F4
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:42:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 908953C56B4
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:42:27 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4580C6011C4
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:42:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9AE80AE88;
 Tue,  2 Mar 2021 10:42:26 +0000 (UTC)
Date: Tue, 2 Mar 2021 11:43:59 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YD4W7+BRQsnspQcj@yuki.lan>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40387BFA9@dggeml511-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40387BFA9@dggeml511-mbs.china.huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_supported_fs_types.c: Add tmpfs to
 filesystem whitelist
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > But there is another problem there, since the code still mounts tmpfs on
> > tmpdir for a short while, which is temporary directory used by all LTP tests,
> > which may potentially break tests that runs in parallel.
> 
> 	In general, when all_filesystems has been set to 1,  the needs_tmpdir would be set to 1 and the mntpoint must has been set to some path, so the test run in /tmp/tmpxxxxxx/mntpoint and
> 	other LTP tests would run in another tmpdir. So it has no problem for running in parallel.
> 
> 	I don't know if I understand it right.

The has_kernel_support() uses TMPDIR as the mount point, which is the
parent directory for all LTP tests, moreover it often points to just
"/tmp". If you mount anything over that directory, even for a short
while, the whole system will get different and empty "/tmp" which will
possibly break many things.

We may get over this with using "." instead, in a case that testcase has
created temporary directory and changed the PWD to it, but it's not that
simple either, since tst_test.c is not the only place that calls
has_kernel_support().

We have testcases/lib/tst_supported_fs.c helper as well that is used by
shell tests. This is a standalone binary that does not create a
temporary directory and should work even without TMPDIR being set, which
is the reason we have the if (!tmpdir) tmpdir = "/tmp"; check in the
has_kernel_support() function to begin with.

So all in all I guess that safest option would be to create a unique
temporary directory under TMPDIR and use it as a mount point in the
has_kernel_support() function.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
