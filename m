Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7A146B12
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:20:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CC6643C24E2
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:20:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 568113C0516
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:20:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 967486010DC
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:20:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78AD1B190;
 Thu, 23 Jan 2020 14:20:23 +0000 (UTC)
Date: Thu, 23 Jan 2020 15:20:22 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200123142022.GA10501@rei.lan>
References: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
 <6aae63a2e362a0f09cf35fff058e7741f0987208.1579755655.git.viresh.kumar@linaro.org>
 <104918104.3505581.1579789066988.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <104918104.3505581.1579789066988.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/io_pgetevents
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +#ifdef HAVE_LIBAIO
> > +#include <libaio.h>
> > +
> > +#ifndef HAVE_IO_SETUP
> > +int io_setup(int nr, io_context_t *ctxp)
> > +{
> > +	return syscall(__NR_io_setup, nr, ctxp);
> > +}
> > +#endif /* HAVE_IO_SETUP */
> > +
> > +#ifndef HAVE_IO_DESTROY
> > +int io_destroy(io_context_t ctx)
> > +{
> > +	return syscall(__NR_io_destroy, ctx);
> > +}
> > +#endif /* HAVE_IO_DESTROY */
> > +
> > +#ifndef HAVE_IO_SUBMIT
> > +int io_submit(io_context_t ctx, long nr, struct iocb **iocbpp)
> > +{
> > +	return syscall(__NR_io_submit, ctx, nr, iocbpp);
> 
> Can functions above also use ltp_syscall?

tst_syscall(), ltp_syscall() is old API.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
