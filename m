Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A258038C58A
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 13:18:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D9803C5DBF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 May 2021 13:18:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 618843C2F65
 for <ltp@lists.linux.it>; Fri, 21 May 2021 13:18:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 73EFE1A014F9
 for <ltp@lists.linux.it>; Fri, 21 May 2021 13:18:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83DE5AAA6;
 Fri, 21 May 2021 11:18:56 +0000 (UTC)
Date: Fri, 21 May 2021 13:18:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YKeXHtPOexQr8Iic@pevik>
References: <20210519084655.52780-1-xieziyao@huawei.com>
 <20210519084655.52780-3-xieziyao@huawei.com>
 <YKbbCLUlaICqSIK5@pevik>
 <88d2297a-58f1-2ee3-0db4-6686ffbf4de2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88d2297a-58f1-2ee3-0db4-6686ffbf4de2@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sendfile: Convert sendfile09 to the
 new API
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

Hi Ziyao,

> > > +++ b/testcases/kernel/syscalls/sendfile/sendfile09.c
> > ...
> > > + * Copyright (c) International Business Machines  Corp., 2014
> > Again, missing copyright.
> I wonder if I should add copyright without changing the code logic.
IMHO yes. You significantly changed the code. At least we do that.

...
> > > -static void cleanup(void);
> > > -static void setup(void);
> > > +#ifndef OFF_T
> > > +#define OFF_T off_t
> > > +#endif
> > I wonder where OFF_T comes from and if we can just simply use off_t.
> Not sure about this.
@metan any idea?

It looks like nothing needs it:
https://travis-ci.org/github/pevik/ltp/builds/771843061

> > > +	for (int i = 1; i <= (4 * 1024); ++i) {
> > This will lead to error in old compilers:
> > error: 'for' loop initial declarations are only allowed in C99 mode
> > https://travis-ci.org/github/pevik/ltp/jobs/771837120
> > https://travis-ci.org/github/pevik/ltp/jobs/771837126

> > It must be:

> > int i;

> > ...
> > for (i = 1; i <= (4 * 1024); ++i) {

> > Thus probably better to declare fd before as well.

> > int i, fd;
> I'll pay attention next time. Thanks.
np, you obviously not work on legacy distro. Travis CI would tell you, but we
don't expect users to run Travis CI on their LTP fork to catch the failures
before sending it to ML (but of course feel free to set it up).

> Hi, Petr,

> Not sure whether to remove OFF_T, the other modifications worked fine for
> me.
Thanks for info, we sort out OFF_T and I'll push it fixed after the release.

> Thanks for your review.
yw, thanks a lot for your work!

Kind regards,
Petr

> Kind regards,
> Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
