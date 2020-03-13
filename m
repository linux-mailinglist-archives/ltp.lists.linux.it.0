Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43356184004
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:24:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6C073C5ECC
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 05:24:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A5E183C5E69
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:24:16 +0100 (CET)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9F2A81A0115E
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 05:24:15 +0100 (CET)
Received: by mail-pl1-x644.google.com with SMTP id f8so3605111plt.10
 for <ltp@lists.linux.it>; Thu, 12 Mar 2020 21:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h3FdhXccWgvmsxNdunEHx1/kQK2aFeF7eeHf0NRSiCU=;
 b=qe8MoKUYJNE2UHr0lz/50VQPc1lZBi7OEY0SwKmZ12s0ukwF+ZDiDrt+dzjizaYo4h
 w3B32woV/UBrh1KRbhlLvLzHRr4DnBw6uP7D2dNvQN/LNsTNgDonYBXj3vVE4qc7zvR9
 2eTLmjMVq/pz2BiOIU58p7Ze+7mckPRe8qanz72EOko5K6DTV1L56bO39NYyZ0CJ6qdb
 Ti2yugclbi8kYiIxnhPI52VdUkOABwky82/Rmc4FyGGYkyufYmngpfv3l66KGj6DnlWU
 XwgmAvobcYKRFqNe5hz3tvgkJBQv5hBDpb1MJ8a1+a+jSytyst2rFbKqktJmNQ3Cgbx/
 Q6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h3FdhXccWgvmsxNdunEHx1/kQK2aFeF7eeHf0NRSiCU=;
 b=ZhQn7ruNmSPiQUiZUH1LCIkG6HbMN3PiArhZAq6HK5boN99kVTErFG6GPOuD9dmE3Z
 acJfipbuWqPDjESHp7jAom0BBcxfiR8JEBJZ7jlP5xHXFt56moKe5So86smTZXadkHBu
 1RERd8cUc71RAYdbgHNexBA82rRxgrlCS//D2rrbdw7GvLPRhrABxynXqN2bSJqJEJ6v
 JV0A//ZVTlhSgWaWk69XF7qhN6NxO6vDSxEN3UBUarQcUGjiGe+O6ogmpDpoDFs8xBAV
 dOFr6mvBC0IdGLr6KQtJHyirFHjfdQYbBoyWWUkQFP1R3QPJLwmZ8L96SgWlb0NGuZGG
 ZpCg==
X-Gm-Message-State: ANhLgQ2fJUdmPplHA9e9nccg2lsODweWJ0Ue+FKh36y+Bi9PWwzKKS30
 F7EeosgUVSsa96il2hHjPTSYTQ==
X-Google-Smtp-Source: ADFU+vtRE0L1BIB1KNHd7TyouVfu/vxMWtt0wGNBqcHE7OXLdReiMGLpLuxxc1ZcfWVyGTkVMgbJfQ==
X-Received: by 2002:a17:90a:21ac:: with SMTP id
 q41mr7862986pjc.41.1584073453918; 
 Thu, 12 Mar 2020 21:24:13 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id h198sm10815907pfe.76.2020.03.12.21.24.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Mar 2020 21:24:13 -0700 (PDT)
Date: Fri, 13 Mar 2020 09:54:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200313042411.rfscl67p6lq3xve2@vireshk-i7>
References: <6b3d4c2c92b4a4e6eeef708ac181b57cf7affda4.1583233870.git.viresh.kumar@linaro.org>
 <20200306144603.GA31015@rei.lan>
 <20200311070845.wx5w7cxftzx5m2sx@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311070845.wx5w7cxftzx5m2sx@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls/openat2: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11-03-20, 12:38, Viresh Kumar wrote:
> On 06-03-20, 15:46, Cyril Hrubis wrote:
> > > diff --git a/testcases/kernel/syscalls/openat2/openat202.c b/testcases/kernel/syscalls/openat2/openat202.c
> > > new file mode 100644
> > > index 000000000000..504878277f7e
> > > --- /dev/null
> > > +++ b/testcases/kernel/syscalls/openat2/openat202.c
> > > @@ -0,0 +1,86 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> > > + *
> > > + * openat2() tests with various resolve flags.
> > > + */
> > > +#include "tst_test.h"
> > > +#include "lapi/openat2.h"
> > > +
> > > +#define FOO_SYMLINK "foo_symlink"
> > > +
> > > +static struct open_how *how;
> > > +
> > > +static struct tcase {
> > > +	const char *name;
> > > +	const char *pathname;
> > > +	uint64_t resolve;
> > > +	int exp_errno;
> > > +} tcases[] = {
> > > +	/* Success cases */
> > > +	{"open /proc/version", "/proc/version", 0, 0},
> > > +	{"open magiclinks", "/proc/self/exe", 0, 0},
> > > +	{"open symlinks", FOO_SYMLINK, 0, 0},
> > 
> > Wouldn't it be easier if we added these to the first test and keep this
> > one failures only?
> 
> I thought about that earlier and kept it this way as this file is only
> for testing the resolve flags. Else the success cases could be added
> to openat201.c and failure to openat203.c itself.
> 
> This also helps in understanding (or noticing), that the test only
> changes the value of the resolve flag and we get an error. The first
> test plays with a lot of variables and so it may not be best to do it
> there as it would be a bit less readable.
> 
> > > +	/* Failure cases */
> > > +	{"resolve-no-xdev", "/proc/version", RESOLVE_NO_XDEV, EXDEV},
> > > +	{"resolve-no-magiclinks", "/proc/self/exe", RESOLVE_NO_MAGICLINKS, ELOOP},
> > > +	{"resolve-no-symlinks", FOO_SYMLINK, RESOLVE_NO_SYMLINKS, ELOOP},
> > > +	{"resolve-beneath", "/proc/version", RESOLVE_BENEATH, EXDEV},
> > > +	{"resolve-no-in-root", "/proc/version", RESOLVE_IN_ROOT, ENOENT},
> 
> > > +static struct tcase {
> > > +	const char *name;
> > > +	int dfd;
> > > +	const char *pathname;
> > > +	uint64_t flags;
> > > +	uint64_t mode;
> > > +	uint64_t resolve;
> > > +	struct open_how **how;
> > > +	size_t size;
> > > +	int exp_errno;
> > > +} tcases[] = {
> > > +	{"invalid-dfd", -1, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how), EBADF},
> > > +	{"invalid-pathname", AT_FDCWD, NULL, O_RDONLY | O_CREAT, S_IRUSR, 0, &how, sizeof(*how), EFAULT},
> > > +	{"invalid-flags", AT_FDCWD, TEST_FILE, O_RDONLY, S_IWUSR, 0, &how, sizeof(*how), EINVAL},
> > > +	{"invalid-mode", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, -1, 0, &how, sizeof(*how), EINVAL},
> > > +	{"invalid-resolve", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, -1, &how, sizeof(*how), EINVAL},
> > > +	{"invalid-size-zero", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, 0, EINVAL},
> > > +	{"invalid-size-small", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how) - 1, EINVAL},
> > > +	{"invalid-size-big", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, &how, sizeof(*how) + 1, EFAULT},
> > > +	{"invalid-size-big-with-pad", AT_FDCWD, TEST_FILE, O_RDWR | O_CREAT, S_IRWXU, 0, (struct open_how **)&phow, sizeof(*how) + 1, E2BIG},
> > 
> > Here as well +8.
> 
> I kept this as 1 intentionally despite the fact that pad is 8 bytes
> long. The last 2 tests have size set to (sizeof(*how) + 1) now and the
> only difference is that we have provided pad of X number of bytes in
> one case and no pad in the other case. This gives us different error
> numbers based on difference in the pad available. If I use +8 here,
> then there are two factors which are different, the structure and the
> number of bytes we are sending in size and we can't be certain about
> why we got a different error number.

@Cyril: I am waiting for your response before sending the next version
here. Thanks.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
