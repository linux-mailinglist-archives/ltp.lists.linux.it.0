Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id C4BCA163FAB
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:50:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A43FC3C25F0
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:50:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id CC3153C0BA3
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:50:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 211466002F9
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:50:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 61EF0ABE7;
 Wed, 19 Feb 2020 08:50:20 +0000 (UTC)
Date: Wed, 19 Feb 2020 09:50:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200219085018.GB21099@dell5510>
References: <cover.1581680021.git.viresh.kumar@linaro.org>
 <e4955c8edfb29c1d0f74a8cd24b1dcc68f3b6814.1581680021.git.viresh.kumar@linaro.org>
 <CAEemH2emOw=Abnvk-3EOVFyCoY=c6HtC_1o0gih5n+aL-WfXLw@mail.gmail.com>
 <20200217133638.GB14410@rei>
 <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2caDii5LcOX7fbOcrJNY9=TL6RfEi6Y0ajybxMKNgw7ag@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fsopen: New tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>,
 Vikas.Kumar2@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> On Mon, Feb 17, 2020 at 9:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> > ...
> > > > +static struct tst_test test = {
> > > > +       .min_kver = "5.2",


> > > I suggest removing .min_kver check in all of the tests to let they can be
> > > running on many distributions(which backport the features).

> > If we do that we have to explicitely check for ENOSYS errno in each
> > test, quite possibly with a dummy call to the tested syscall in test
> > setup, because once these calls gets libc wrappers we will no longer
> > call the tst_syscall() that checks for it.


> +1 add dummy call to the tested syscall in the setup.
> Agree, thanks for point out this.
Could anybody add it to fsmount/fsmount01.c instead?


If anybody don't mind, I'll rename fsopen02.c to fsopen01.c,
remove .min_kver = "5.2" and replace tst_brk with tst_res + return, and merge it:

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
 *
 * Description:
 * Basic fsopen() failure tests.
 */

#include "tst_test.h"
#include "lapi/fsmount.h"

const char *invalid_fs = "invalid";
const char *valid_fs;

static struct tcase {
	char *name;
	const char **fs;
	unsigned int flags;
	int exp_errno;
} tcases[] = {
	{"invalid-fs", &invalid_fs, 0, ENODEV},
	{"invalid-flags", &valid_fs, 0x10, EINVAL},
};

static void setup(void)
{
	valid_fs = tst_device->fs_type;
}

static void run(unsigned int n)
{
	struct tcase *tc = &tcases[n];

	TEST(fsopen(*tc->fs, tc->flags));

	if (TST_RET != -1) {
		SAFE_CLOSE(TST_RET);
		tst_res(TFAIL, "%s: fsopen() succeeded unexpectedly (index: %d)",
			tc->name, n);
		return;
	}

	if (tc->exp_errno != TST_ERR) {
		tst_res(TFAIL | TTERRNO, "%s: fsopen() should fail with %s",
			tc->name, tst_strerrno(tc->exp_errno));
		return;
	}

	tst_res(TPASS | TTERRNO, "%s: fsopen() failed as expected", tc->name);
}

static struct tst_test test = {
	.tcnt = ARRAY_SIZE(tcases),
	.test = run,
	.setup = setup,
	.needs_root = 1,
	.needs_device = 1,
};

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
